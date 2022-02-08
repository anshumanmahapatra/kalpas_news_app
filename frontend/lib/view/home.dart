import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../widget/news_body.dart';

import '../services/hive_news_db.dart';

import '../model/news_model.dart';
import '../model/hive_news_model.dart';

import '../controller/controller.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Controller controller = Get.put(Controller());

  @override
  void initState() {
    super.initState();
    debugPrint("Calling data");
    controller.getNewsDetails();
  }

  @override
  Widget build(BuildContext context) {
    NewsBody newsBody = Get.put(NewsBody());
    double height = Get.mediaQuery.size.height;
    double width = Get.mediaQuery.size.width;
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              //News Body
              SizedBox(
                width: width,
                child: FutureBuilder<List<NewsModel>>(
                  future: controller.newsData,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.active ||
                        snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasError) {
                        debugPrint("Got error");
                        debugPrint(snapshot.error.toString());
                        return const Center(child: Text("Failed to load news"));
                      } else {
                        debugPrint("Got data");
                        return newsBody.getNewsBody(true, snapshot: snapshot);
                      }
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      debugPrint("Loading data");
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      debugPrint("Got nothing to show");
                      return Container();
                    }
                  },
                ),
              ),
              //Favs Body
              SizedBox(
                width: width,
                child: ValueListenableBuilder<Box<HiveNewsModel>>(
                  valueListenable: Boxes.getNews().listenable(),
                  builder: (context, box, _) {
                    final news = box.values.toList().cast<HiveNewsModel>();
                    return newsBody.getNewsBody(false, data: news);
                  },
                ),
              ),
            ],
          ),
          Positioned(
            top: height * 0.94,
            child: Obx(() {
              return Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.changeHomePage(0);
                    },
                    child: Container(
                      height: height * 0.06,
                      width: width / 2 - (width * 0.005),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                        ),
                        color: controller.newsBgColor.value,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.list_rounded,
                            size: 35,
                            color: controller.newsColor.value,
                          ),
                          SizedBox(
                            width: width * 0.03,
                          ),
                          Text(
                            "News",
                            style: TextStyle(
                                fontSize: 20,
                                color: controller.newsColor.value,
                                fontWeight: controller.newsFontWeight.value),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.01,
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.changeHomePage(1);
                    },
                    child: Container(
                      height: height * 0.06,
                      width: width / 2 - (width * 0.005),
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5),
                          ),
                          color: controller.favsBgColors.value),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.favorite,
                            size: 30,
                            color: controller.heartColor.value,
                          ),
                          SizedBox(
                            width: width * 0.03,
                          ),
                          Text(
                            "Favs",
                            style: TextStyle(
                                fontSize: 20,
                                color: controller.favsColor.value,
                                fontWeight: controller.favsFontWeight.value),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
