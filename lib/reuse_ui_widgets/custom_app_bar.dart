import 'package:flutter/material.dart';
import 'package:zyptopulse/theme/app_theme.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(5),
        child: CircleAvatar(
          radius: 25,
          backgroundColor: Theme.of(context).cardColor,
          backgroundImage: const AssetImage("assets/images/appImg/profile.jpg"),
        ),
      ),

      actions: const [

        Padding(
          padding: EdgeInsets.all(8),
          child: CircleAvatar(
            backgroundColor: AppColors.cardDark,
            backgroundImage: AssetImage("assets/images/appLogo/search.png"),
          ),
        ),

        Padding(
          padding: EdgeInsets.all(8),
          child: CircleAvatar(
            backgroundColor: AppColors.cardDark,
            backgroundImage: AssetImage("assets/images/appLogo/scan.png"),
          ),
        ),

        Padding(
          padding: EdgeInsets.all(8),
          child: CircleAvatar(
            backgroundColor: AppColors.cardDark,
            backgroundImage:
                AssetImage("assets/images/appLogo/notification.png"),
          ),
        ),
      ],
    );
  }
}
