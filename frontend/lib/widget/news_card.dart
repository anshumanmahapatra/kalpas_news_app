import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../services/hive_news_db.dart';

import '../model/hive_news_model.dart';
import '../model/news_model.dart';

class NewsCard {
  Card getNewsCard(bool isNews,
      {NewsModel? newsModel, HiveNewsModel? hiveNewsModel}) {
    double height = Get.mediaQuery.size.height;
    double width = Get.mediaQuery.size.width;

    HiveNewsDb hiveNewsDb = Get.put(HiveNewsDb());

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      child: Container(
        width: width * 0.95,
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: SizedBox(
                child: ValueListenableBuilder<Box<HiveNewsModel>>(
                   valueListenable: Boxes.getNews().listenable(),
                  builder: (context, box, _) {
                    return GestureDetector(
                      onTap: () {
                        if (isNews) {
                          if (box.containsKey('${newsModel!.id}')) {
                            hiveNewsDb.deleteNews(box.get('${newsModel.id}')!);
                          } else {
                            hiveNewsDb.addNews(newsModel.title, newsModel.summary,
                                newsModel.published, newsModel.id);
                          }
                        } else {
                          hiveNewsDb.deleteNews(hiveNewsModel!);
                        }
                      },
                      child: Icon(
                        isNews == true
                            ? (box.containsKey('${newsModel!.id}') == true
                                ? Icons.favorite
                                : Icons.favorite_outline_rounded)
                            : (Icons.favorite),
                        size: 40,
                        color: isNews == true
                            ? (box.containsKey('${newsModel!.id}') == true
                                ? Colors.red
                                : Colors.black54)
                            : (Colors.red),
                      ),
                    );
                  }
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isNews == true ? newsModel!.title : hiveNewsModel!.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: height * 0.015,
                    ),
                    Text(
                      isNews == true
                          ? newsModel!.summary
                          : hiveNewsModel!.summary,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: height * 0.015,
                    ),
                    Text(
                      isNews == true
                          ? newsModel!.published
                          : hiveNewsModel!.published,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey.shade400),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
