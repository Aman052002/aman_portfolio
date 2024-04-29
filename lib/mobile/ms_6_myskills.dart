import 'package:aman_portfolio/my_skills/my_skills.dart';
import 'package:aman_portfolio/statics/data_values.dart';
import 'package:aman_portfolio/widgets/frame_title.dart';
import 'package:flutter/material.dart';
import '../statics/key_holders.dart';
import '../theme/app_theme.dart';

class MS6MySkills extends StatelessWidget {
  const MS6MySkills({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: KeyHolders.mySkillsKey,
      color: AppThemeData.backgroundGrey,
      child:  Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            SelectableText(
              DataValues.mySkillsTitle,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(height: 30.0),
            const MySKills(),
          ],
        ),
      ),
    );
  }
}