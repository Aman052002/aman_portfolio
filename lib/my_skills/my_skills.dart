import 'package:aman_portfolio/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AnimatedLinearProgressIndicator extends StatelessWidget {
  const AnimatedLinearProgressIndicator({super.key, required this.percentage, required this.title, this.image});

  final double percentage;
  final String title;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TweenAnimationBuilder(
        tween: Tween(begin: 0.0, end: percentage),
        duration: const Duration(seconds: 1),
        builder: (context, value, child) {
          return Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    image!,
                    height: 15,
                    width: 15,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    title,
                    style: const TextStyle(color: Colors.white),
                  ),
                  const Spacer(),
                  Text('${(value * 100).toInt().toString()}%'),
                ],
              ),
              const SizedBox(height: 10),
              LinearProgressIndicator(
                value: value,
                backgroundColor: AppThemeData.backgroundBlack ,
                color: AppThemeData.primaryColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
            ],
          );
        },
      ),
    );
  }
}

class MySKills extends StatelessWidget {
  const MySKills({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedLinearProgressIndicator(
          percentage: 0.8,
          title: 'Flutter',
          image: 'assets/icons/flutter.png',
        ),
        AnimatedLinearProgressIndicator(
          percentage: 0.9,
          title: 'Dart',
          image: 'assets/icons/dart.png',
        ),
        AnimatedLinearProgressIndicator(
          percentage: 0.8,
          title: 'Firebase',
          image: 'assets/icons/firebase.png',
        ),
        AnimatedLinearProgressIndicator(
          percentage: 0.95,
          title: 'Sqlite',
          image: 'assets/icons/dart.png',
        ),
        AnimatedLinearProgressIndicator(
          percentage: 0.99,
          title: 'Rest Api Intrigation',
          image: 'assets/icons/rest_api.png',
        ),
        AnimatedLinearProgressIndicator(
          percentage: 0.98,
          title: 'Responsive Design',
          image: 'assets/icons/flutter.png',
        ),
        AnimatedLinearProgressIndicator(
          percentage: 0.94,
          title: 'Clean Architecture',
          image: 'assets/icons/flutter.png',
        ),
        AnimatedLinearProgressIndicator(
          percentage: 0.2,
          title: 'Bloc',
          image: 'assets/icons/bloc.png',
        ),
        AnimatedLinearProgressIndicator(
          percentage: 0.93,
          title: 'GetX',
          image: 'assets/icons/dart.png',
        ),
        AnimatedLinearProgressIndicator(
          percentage: 0.80,
          title: 'Provider',
          image: 'assets/icons/dart.png',
        ),
        AnimatedLinearProgressIndicator(
          percentage: 0.95,
          title: 'GitLab',
          image: 'assets/icons/gitlab.png',
        ),
        AnimatedLinearProgressIndicator(
          percentage: 0.95,
          title: 'GitHub',
          image: 'assets/icons/github.png',
        ),
      ],
    );
  }
}
