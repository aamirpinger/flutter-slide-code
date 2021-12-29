import 'package:flutter/material.dart';
import 'package:my_app/constants/app_strings.dart';
import 'package:my_app/constants/configs.dart';
import 'package:my_app/ui/screens/about_screen.dart';
import 'package:my_app/ui/screens/notice_board_screen.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 30,

      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 15,
                  ),
                ],
              ),
              child: Hero(
                tag: Configs.logoImage,
                child: Image.asset(
                  Configs.logoImage,
                  width: 100,
                  height: 100,
                ),
              ),
            ),
            Divider(
              color: Theme.of(context).colorScheme.secondary,
              thickness: 1,
            ),
            ListTile(
              title: Text(AppStrings.appTitle),
              onTap: () {
                // to modalRoute work, we need to add settings parameter at routes, check route.dart file
                if (ModalRoute.of(context)?.settings.name !=
                    NoticeBoardScreen.routeName) {
                  Navigator.pushNamed(context, NoticeBoardScreen.routeName);
                } else {
                  Navigator.maybePop(context);
                }
              },
            ),
            ListTile(
              title: Text(AppStrings.aboutTitle),
              onTap: () {
                Navigator.pushNamed(context, AboutScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
