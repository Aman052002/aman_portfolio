import 'dart:async';
import 'package:aman_portfolio/mobile/ms_6_myskills.dart';
import 'package:flutter/material.dart';
import 'theme/responsive_screen_provider.dart';
import 'theme/app_theme.dart';
import 'widgets/nav_bar.dart';
import 'desktop/ds_1_header.dart';
import 'desktop/ds_2_about_me.dart';
import 'desktop/ds_3_education.dart';
import 'desktop/ds_4_experience.dart';
import 'desktop/ds_7_contact.dart';
import 'mobile/ms_1_header.dart';
import 'mobile/ms_2_about_me.dart';
import 'mobile/ms_3_education.dart';
import 'mobile/ms_4_experience.dart';
import 'mobile/ms_7_contact.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aman Rathore',
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.darkTheme,
      home: const Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  double imageSize = 500.0; // Initial size of the image

  @override
  void initState() {
    super.initState();
    getImageSize();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: image(h: imageSize, w: imageSize),
      ),
    );
  }
  void getImageSize() {
    const minSize = 0.0;
    const stepSize = 10.0; // Adjust the step size as needed
    const duration = Duration(milliseconds: 100); // Duration for each step

    Timer.periodic(duration, (timer) {
      setState(() {
        if (imageSize > minSize) {
          imageSize -= stepSize; // Decrease the size by stepSize
        } else {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
          );
          timer.cancel(); // Stop the timer when reaching the minimum size
        }
      });
    });
  }

  Widget image({required double h, required double w}) {
    return SizedBox(
      height: h,
      width: w,
      child: Image.asset('assets/images/splash.png', height: double.infinity),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showBackToTopButton = false;
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(
        () {
          setState(
            () {
              if (_scrollController.offset >= 300) {
                _showBackToTopButton = true;
              } else {
                _showBackToTopButton = false;
              }
            },
          );
        },
      );

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget desktopUI() {
      return ListView(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        children: const [
          DS1Header(),
          DS2AboutMe(),
          DS3Education(),
          DS4Experience(),
          DS7Contact(),
        ],
      );
    }

    Widget mobileUI() {
      return ListView(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        children: const [
          MS1Header(),
          MS2AboutMe(),
          MS3Education(),
          MS4Experience(),
          MS6MySkills(),
          MS7Contact(),
        ],
      );
    }

    return Scaffold(
      appBar: ResponsiveScreenProvider.isDesktopScreen(context)
          ? AppBar(elevation: 0.0)
          : AppBar(elevation: 0.0),
      drawer: ResponsiveScreenProvider.isDesktopScreen(context)
          ? DesktopDrawer().desktopDrawer(context: context)
          : NavBar().mobileNavBar(context: context),
      body: SingleChildScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        child: Container(
          color: AppThemeData.backgroundGrey,
          child: ResponsiveScreenProvider.isDesktopScreen(context)
              ? desktopUI()
              : mobileUI(),
        ),
      ),
      floatingActionButton: _showBackToTopButton == false
          ? null
          : FloatingActionButton(
              onPressed: _scrollToTop,
              tooltip: 'Go to top',
              backgroundColor: AppThemeData.buttonPrimary,
              foregroundColor: AppThemeData.iconSecondary,
              child: const Icon(
                Icons.arrow_upward_rounded,
              ),
            ),
    );
  }
}


