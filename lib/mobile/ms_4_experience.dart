import 'package:flutter/material.dart';

import '../statics/data_values.dart';
import '../statics/key_holders.dart';
import '../theme/app_theme.dart';
import '../widgets/container_card.dart';
import '../widgets/container_banner.dart';
import '../widgets/frame_title.dart';

class MS4Experience extends StatelessWidget {
  const MS4Experience({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: KeyHolders.experienceKey,
      color: AppThemeData.backgroundGrey,
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FrameTitle(
              title: DataValues.experienceTitle,
              description: DataValues.experienceDescription,
            ),
            const SizedBox(height: 30.0),
            ContainerCard().type3(
              image: 'dollop',
              title: DataValues.experienceOrg2Title,
              role: DataValues.experienceOrg2Role,
              years: 'June 2022 - Dec 2024',
              values: DataValues.experienceOrg2Vales,
              message: DataValues.companyURL.toString(),
              url: DataValues.companyURL,
              isButtonEnabled: true,
            ),
            const SizedBox(height: 20.0),
            ContainerCard().type3(
              image: 'narma_logo',
              title: 'Narma.dev',
              role: DataValues.experienceOrg1Role,
              years: DataValues.experienceOrg1Years,
              values: DataValues.experienceOrg1Vales,
              message: DataValues.linkedinURL.toString(),
              url: Uri.parse('https://narma.dev'),
              isButtonEnabled: true,
            ),
          ],
        ),
      ),
    );
  }
}
