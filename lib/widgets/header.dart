import 'package:camp/models/user_model/user_model.dart';
import 'package:camp/shared/app_colors.dart';
import 'package:camp/shared/app_settings.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatefulWidget {
  final UserModel user;
  const HeaderWidget({super.key, required this.user});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      height: AppSettings.screenHeight / 5,
      width: AppSettings.screenWidth,
      color: AppColors.red,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Ola, ${widget.user.name}",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        Text(
          "Ag ${widget.user.account!.agency!} Cc ${widget.user.account!.number!}",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
        )
      ]),
    );
  }
}
