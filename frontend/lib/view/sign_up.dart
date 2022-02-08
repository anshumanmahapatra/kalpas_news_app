import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/authentication_widget.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthenticationWidget authenticationWidget = Get.put(AuthenticationWidget());
    return authenticationWidget.getAuthenticationWidget(false);
  }
}
