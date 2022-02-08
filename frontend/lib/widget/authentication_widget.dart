import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/controller.dart';

import '../view/home.dart';

import '../widget/custom_text_field.dart';

class AuthenticationWidget {
  Container getAuthenticationWidget(bool isSignIn) {
    Home home = Get.put(const Home());
    CustomTextField customTextField = Get.put(CustomTextField());
    Controller controller = Get.put(Controller());

    double height = Get.mediaQuery.size.height;
    double width = Get.mediaQuery.size.width;

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('asset/images/main_bg.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            SizedBox(
              height: height,
              width: width,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 7.5, sigmaY: 7.5),
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),
            Positioned(
              top: height * 0.15,
              left: width * 0.1,
              child: const Text(
                "Welcome!!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            DraggableScrollableSheet(
                initialChildSize: 0.6,
                minChildSize: 0.6,
                maxChildSize: 0.6,
                builder: (context, scrollController) {
                  return Container(
                    width: width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                      color: Colors.white,
                    ),
                    child: ListView.builder(
                        shrinkWrap: true,
                        controller: scrollController,
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Text(
                                isSignIn == true ? 'Sign in' : 'Sign Up',
                                style: TextStyle(
                                  color: Colors.blue.shade800,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: height * 0.04,
                              ),
                              customTextField.getCustomTextField('Email:'),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              customTextField.getCustomTextField('Password:'),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              isSignIn == true
                                  ? Container(
                                      padding:
                                          EdgeInsets.only(left: width * 0.45),
                                      child: const Text(
                                        "Forgot password?",
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 16,
                                            decoration:
                                                TextDecoration.underline),
                                      ),
                                    )
                                  : customTextField
                                      .getCustomTextField('Re-enter Password:'),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Get.to(() => home);
                                },
                                child: Text(
                                  isSignIn == true ? "Sign in" : "Sign Up",
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 40),
                                  primary: Colors.lightBlue.shade200,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.03,
                              ),
                              SizedBox(
                                width: width * 0.85,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Divider(
                                        thickness: 2,
                                        color: Colors.grey.shade200,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        isSignIn == true
                                            ? "Or Sign In With"
                                            : "Or Sign Up With",
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Expanded(
                                      child: Divider(
                                        thickness: 2,
                                        color: Colors.grey.shade200,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('asset/icons/google_icon.png'),
                                  SizedBox(
                                    width: width * 0.05,
                                  ),
                                  Image.asset('asset/icons/fb_icon.png'),
                                ],
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: isSignIn == true
                                      ? "Don't have an account? "
                                      : "Have an account? ",
                                  style: const TextStyle(color: Colors.black),
                                  children: [
                                    TextSpan(
                                      text: isSignIn == true
                                          ? "Sign up"
                                          : "Sign in",
                                      style:
                                          const TextStyle(color: Colors.orange),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          if (isSignIn) {
                                            controller
                                                .changeAuthenticationPage(1);
                                          } else {
                                            controller
                                                .changeAuthenticationPage(0);
                                          }
                                        },
                                    ),
                                  ],
                                ),
                              )
                            ],
                          );
                        }),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
