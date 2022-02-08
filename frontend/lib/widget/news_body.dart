import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/news_card.dart';

import '../model/hive_news_model.dart';
import '../model/news_model.dart';

class NewsBody {
  double height = Get.mediaQuery.size.height;
  NewsCard newsCard = Get.put(NewsCard());
  ListView getNewsBody(bool isNews,
      {AsyncSnapshot<List<NewsModel>>? snapshot, List<HiveNewsModel>? data}) {
    return ListView.builder(
      itemCount: isNews == true ? snapshot!.data!.length : data!.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Column(
          children: [
            index == 0
                ? SizedBox(
                    height: height * 0.01,
                  )
                : Container(),
            isNews == true
                ? newsCard.getNewsCard(isNews,
                    newsModel: snapshot!.data![index])
                : newsCard.getNewsCard(isNews, hiveNewsModel: data![index]),
            isNews == true
                ? (index == (snapshot!.data!.length - 1)
                    ? SizedBox(height: height * 0.07)
                    : SizedBox(
                        height: height * 0.005,
                      ))
                : (index == (data!.length - 1)
                    ? SizedBox(height: height * 0.07)
                    : SizedBox(
                        height: height * 0.005,
                      )),
          ],
        );
      },
    );
  }
}
