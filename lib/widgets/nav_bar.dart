import 'package:aman_portfolio/theme/responsive_screen_provider.dart';
import 'package:flutter/material.dart';
import '../statics/data_values.dart';
import '../statics/key_holders.dart';
import '../theme/app_theme.dart';
import 'button_rectangle.dart';
import 'button_text.dart';

class NavBar {
  Widget desktopNavBar({required BuildContext context}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ButtonTextLarge(
          text: DataValues.navBarAboutMe,
          onPressed: () => Scrollable.ensureVisible(
            KeyHolders.aboutKey.currentContext!,
            duration: const Duration(milliseconds: 1000),
          ),
          message: 'Go to ${DataValues.navBarAboutMe} section',
        ),
        const SizedBox(width: 10.0),
        ButtonTextLarge(
          text: DataValues.navBarEducation,
          onPressed: () => Scrollable.ensureVisible(
            KeyHolders.educationKey.currentContext!,
            duration: const Duration(milliseconds: 1000),
          ),
          message: 'Go to ${DataValues.navBarEducation} section',
        ),
        const SizedBox(width: 10.0),
        ButtonTextLarge(
          text: DataValues.navBarExperience,
          onPressed: () => Scrollable.ensureVisible(
            KeyHolders.experienceKey.currentContext!,
            duration: const Duration(milliseconds: 1000),
          ),
          message: 'Go to ${DataValues.navBarExperience} section',
        ),
        const SizedBox(width: 10.0),
        /*ButtonTextLarge(
          text: DataValues.navBarResume,
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MyCV(),
              ),
            );
          },
          message: 'Go to ${DataValues.navBarResume} section',
        ),
        const SizedBox(width: 10.0),*/
        ButtonRectangle(
            name: DataValues.navBarContactMe,
            onPressed: () => Scrollable.ensureVisible(
                  KeyHolders.contactKey.currentContext!,
                  duration: const Duration(milliseconds: 1000),
                ),
            color: AppThemeData.buttonPrimary,
            message: 'Go to ${DataValues.navBarContactMe} section'),
      ],
    );
  }


  Widget mobileNavBar({required BuildContext context}) {
    Widget miniHeader() {
      return Column(
        children: [
          Container(
            width: 130,
            height: 130,
            decoration: const BoxDecoration(
              color: AppThemeData.backgroundBlack,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(55),
                child: Image.asset('assets/images/logo.png', height: 110.0, width: 110.0),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          SelectableText(
            DataValues.headerName,
            style: TextStyle(
              color: AppThemeData.textPrimary,
              fontSize: AppThemeData.darkTheme.textTheme.titleLarge?.fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          SelectableText(
            DataValues.headerTitle,
            style: AppThemeData.darkTheme.textTheme.titleLarge?.copyWith(fontSize: 16,fontWeight: FontWeight.w600),
          ),
        ],
      );
    }

    return Drawer(
      backgroundColor: AppThemeData.backgroundBlack,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        children: [
          const SizedBox(height: 60.0),
          miniHeader(),
          const SizedBox(height: 40.0),
          ButtonTextLarge(
            text: DataValues.navBarAboutMe,
            onPressed: () {
               Navigator.pop(context);
              Scrollable.ensureVisible(
                KeyHolders.aboutKey.currentContext!,
                duration: const Duration(milliseconds: 1000),
              );
            },
            message: 'Go to ${DataValues.navBarAboutMe} section',
          ),
          const SizedBox(height: 10.0),
          ButtonTextLarge(
            text: DataValues.navBarEducation,
            onPressed: () {
               Navigator.pop(context);
              Scrollable.ensureVisible(
                KeyHolders.educationKey.currentContext!,
                duration: const Duration(milliseconds: 1000),
              );
            },
            message: 'Go to ${DataValues.navBarEducation} section',
          ),
          const SizedBox(height: 10.0),
          ButtonTextLarge(
            text: DataValues.navBarExperience,
            onPressed: () {
               Navigator.pop(context);
              Scrollable.ensureVisible(
                KeyHolders.experienceKey.currentContext!,
                duration: const Duration(milliseconds: 1000),
              );
            },
            message: 'Go to ${DataValues.navBarExperience} section',
          ),
          /*const SizedBox(height: 10.0),
          ButtonTextLarge(
            text: DataValues.navBarResume,
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyCV(),
                ),
              );
            },
            message: 'Go to ${DataValues.navBarResume} section',
          ),*/
          const SizedBox(height: 25.0),
          ButtonRectangle(
              name: DataValues.navBarContactMe,
              onPressed: () {
                if(ResponsiveScreenProvider.isMobileScreen(context)){
                  Navigator.pop(context);
                }
                Scrollable.ensureVisible(
                  KeyHolders.contactKey.currentContext!,
                  duration: const Duration(milliseconds: 1000),
                );
              },
              color: AppThemeData.buttonPrimary,
              message: 'Go to ${DataValues.navBarContactMe} section'),
        ],
      ),
    );
  }
}
