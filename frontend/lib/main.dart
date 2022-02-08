import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../controller/controller.dart';

import '../model/hive_news_model.dart';

import '../view/sign_in.dart';
import '../view/sign_up.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(HiveNewsModelAdapter());

  await Hive.openBox<HiveNewsModel>('news');

   SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((val) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: PseudoHome().getPageView(),
    );
  }
}

class PseudoHome {
  PageView getPageView() {
    SignIn signIn = Get.put(const SignIn());
    SignUp signUp = Get.put(const SignUp());
    Controller controller = Get.put(Controller());
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: controller.authenticationPageController,
      children: [
        signIn,
        signUp,
      ],
    );
  }
}
