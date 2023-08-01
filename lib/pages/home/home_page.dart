import 'package:camp/models/user_model/user_model.dart';
import 'package:camp/services/api.dart';
import 'package:camp/shared/app_colors.dart';
import 'package:camp/shared/app_settings.dart';
import 'package:camp/widgets/card.dart';
import 'package:camp/widgets/features.dart';
import 'package:camp/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:camp/shared/app_images.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserModel? user;

  @override
  void initState() {
    super.initState();
    fetch();
  }

  fetch() async {
    user = await ApiApp.fetchUser(3);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return user == null
        ? const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          )
        : Scaffold(
            drawer: const Drawer(),
            appBar: AppBar(
              backgroundColor: AppColors.red,
              foregroundColor: Colors.white,
              title: Center(
                child: SvgPicture.asset(
                  AppImages.logo,
                  height: 24,
                ),
              ),
              actions: [
                Container(
                  margin: EdgeInsets.only(right: 8),
                  child: SvgPicture.asset(
                    AppImages.notification,
                    height: 24,
                  ),
                ),
              ],
            ),
            body: Column(children: [
              HeaderWidget(
                user: user!,
              ),
              FeaturesWidget(features: user!.features!),
              SizedBox(
                height: 10,
              ),
              CardWidget(card: user!.card!)
            ]),
          );
  }
}