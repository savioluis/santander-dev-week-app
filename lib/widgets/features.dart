import 'package:camp/models/user_model/feature.dart';
import 'package:camp/pages/checking_account/checking_account_page.dart';
import 'package:camp/pages/credit_cards/credit_cards_page.dart';
import 'package:camp/pages/payment/payment_page.dart';
import 'package:camp/pages/pix/pix_page.dart';
import 'package:camp/pages/transfer/transfer_page.dart';
import 'package:camp/shared/app_colors.dart';
import 'package:camp/shared/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FeaturesWidget extends StatelessWidget {
  final List<Feature> features;
  const FeaturesWidget({super.key, required this.features});


  void goToPage(BuildContext context, String description) {
    if (description == "Pagar") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const PaymentPage(),
        ),
      );
    } else if (description == "Transferir") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const TransferPage(),
        ),
      );
    } else if (description == "Conta Corrente") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CheckingAccountPage(),
        ),
      );
    } else if (description == "CartÃµes") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CreditCardsPage(),
        ),
      );
    } else if (description == "PIX") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const PixPage(),
        ),
      );
    }
  }

  Widget getFeature(BuildContext context, String icon, String description) {
    return InkWell(
      onTap: () => goToPage(context, description),
      child: Card(
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12))),
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
            .map((e) => getFeature(context, e.icon!, e.description!))
            .toList(),
      ),
    );
  }
}
