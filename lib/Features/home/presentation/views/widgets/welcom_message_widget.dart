import 'package:flutter/material.dart';
import 'package:mnjz_store/core/themes/styles.dart';
import 'package:mnjz_store/core/utils/app_strings.dart';

class WelcomeMessageWidget extends StatelessWidget {
  const WelcomeMessageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      AppStrings.welcomeMessage,
      style: AppStyles.textStyle15,
    );
  }
}
