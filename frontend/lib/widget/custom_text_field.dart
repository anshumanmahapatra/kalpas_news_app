import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextField {
  double height = Get.mediaQuery.size.height;
  double width = Get.mediaQuery.size.width;
  Container getCustomTextField(String hintText) {
    return Container(
      height: height * 0.05,
      width: width * 0.85,
      decoration: BoxDecoration(
        color: Colors.brown.shade200,
        borderRadius: BorderRadius.circular(15),
      ),
      alignment: Alignment.center,
      child: TextField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
        ),
      ),
    );
  }
}
