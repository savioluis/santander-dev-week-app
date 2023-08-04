import 'package:camp/models/user_model/user_model.dart';
import 'package:camp/shared/app_colors.dart';
import 'package:camp/shared/app_settings.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final UserModel user;
  const HeaderWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      height: AppSettings.screenHeight / 5,
      width: AppSettings.screenWidth,
      color: AppColors.red,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Ola, ${user.name}",
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        Text(
          "Ag ${user.account!.agency!} Cc ${user.account!.number!}",
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
        )
      ]),
    );
  }
}
