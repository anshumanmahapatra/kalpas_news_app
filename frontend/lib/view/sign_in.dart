import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/authentication_widget.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthenticationWidget authenticationWidget = Get.put(AuthenticationWidget());
    return authenticationWidget.getAuthenticationWidget(true);
  }
}
