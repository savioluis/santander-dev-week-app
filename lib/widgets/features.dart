import 'package:camp/models/user_model/feature.dart';
import 'package:camp/shared/app_colors.dart';
import 'package:camp/shared/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FeaturesWidget extends StatelessWidget {
  final List<Feature> features;
  const FeaturesWidget({super.key, required this.features});

  Widget getFeature(String icon, String description) {
    return Card(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12))
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        width: 140,
        height: 125,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.network(
              icon,
              // semanticsLabel: description,
              colorFilter: ColorFilter.mode(AppColors.red, BlendMode.srcIn),
              width: 36,
              height: 36,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              description,
              style: TextStyle(fontSize: 16, color: AppColors.grayLight),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 130,
      width: AppSettings.screenWidth,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: features
            .map((e) => getFeature(e.icon!, e.description!))
            .toList(),
      ),
    );
  }
}
