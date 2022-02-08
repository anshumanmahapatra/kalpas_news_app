import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/news_api.dart';

import '../model/news_model.dart';

class Controller extends GetxController {
  PageController pageController = PageController();
  RxInt pageNumber = 0.obs;
  PageController authenticationPageController = PageController();
  int authenticationPageNumber = 0;

  final newsColor = Rx<Color>(Colors.white);
  final newsBgColor = Rx<Color>(Colors.blue.shade700);

  final heartColor = Rx<Color>(Colors.red);

  final favsColor = Rx<Color>(Colors.black);
  final favsBgColors = Rx<Color>(Colors.white);

  final newsFontWeight = Rx<FontWeight>(FontWeight.w500);
  final favsFontWeight = Rx<FontWeight>(FontWeight.w900);

  Future<List<NewsModel>>? newsData;

  changeHomePage(int pageNo) {
    pageNumber.value = pageNo;
    if (pageNumber.value == 1) {
      newsColor.value = Colors.black;
      newsBgColor.value = Colors.white;
      heartColor.value = Colors.white;
      favsColor.value = Colors.white;
      favsBgColors.value = Colors.blue.shade700;
      newsFontWeight.value = FontWeight.w900;
      favsFontWeight.value = FontWeight.w500;
    } else {
      newsColor.value = Colors.white;
      newsBgColor.value = Colors.blue.shade700;
      heartColor.value = Colors.red;
      favsColor.value = Colors.black;
      favsBgColors.value = Colors.white;
      newsFontWeight.value = FontWeight.w500;
      favsFontWeight.value = FontWeight.w900;
    }
    pageController.animateToPage(pageNumber.value,
        duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  changeAuthenticationPage(int pageNo) {
    authenticationPageNumber = pageNo;
    authenticationPageController.animateToPage(authenticationPageNumber,
        duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  getNewsDetails() {
    newsData = NewsApi().getNews();
  }
}
