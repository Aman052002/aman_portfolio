import 'package:flutter/material.dart';

import '../statics/data_values.dart';
import '../theme/app_theme.dart';
import '../widgets/social_profiles.dart';

class MS1Header extends StatelessWidget {
  const MS1Header({Key? key}) : super(key: key);

  List<Widget> headerData() {
    return [
      Container(
        width: 230,
        height: 230,
        decoration: const BoxDecoration(
          color: AppThemeData.backgroundGrey,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(
              'assets/images/logo.png',
              height: 200.0,
              width: 200.0,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      const SizedBox(height: 40.0),
      Column(
        children: [
          SelectableText(
            DataValues.headerGreetings,
            style: AppThemeData.darkTheme.textTheme.headlineSmall,
          ),
          SelectableText(
            DataValues.headerName,
            style: AppThemeData.darkTheme.textTheme.displaySmall,
            textAlign: TextAlign.center,
          ),
          SelectableText(
            DataValues.headerTitle,
            style: AppThemeData.darkTheme.textTheme.titleLarge,
          ),
          const SizedBox(height: 20.0),
          const SocialProfiles(),
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 1500),
      color: AppThemeData.backgroundBlack,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 40.0),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: headerData(),
            ),
            const SizedBox(height: 40.0),
          ],
        ),
      ),
    );
  }
}
