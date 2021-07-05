import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_monkey/app_colors.dart';
import 'package:pandabar/main.view.dart';
import 'package:pandabar/model.dart';
import 'home_page.dart';

class PandaBar2 extends StatefulWidget {
  @override
  _PandaBarState createState() => _PandaBarState();
}

class _PandaBarState extends State<PandaBar2> {
  String page = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: PandaBar(
        buttonColor: Colors.grey,
        buttonSelectedColor: Colors.deepOrange,
        fabColors: [AppColors.orange, AppColors.orange],
        buttonData: [
          PandaBarButtonData(
            id: 'Blue',
            icon: Icons.menu,
            title: 'Menu',
          ),
          PandaBarButtonData(
              id: 'Green', icon: Icons.local_offer, title: 'Offers'),
          PandaBarButtonData(
              id: 'Red', icon: Icons.account_balance_wallet, title: 'Profile'),
          PandaBarButtonData(
              id: 'Yellow', icon: Icons.more_horiz, title: 'More'),
        ],
        onChange: (id) {
          setState(() {
            page = id;
          });
        },
        fabIcon: Icon(
          Icons.home,
          color: AppColors.white,
          size: 50,
        ),
        backgroundColor: AppColors.white,
        onFabButtonPressed: () {
          return Container(color: Colors.blue.shade900);
          // showCupertinoDialog(
          //     context: context,
          //     builder: (context) {
          //       return CupertinoAlertDialog(
          //         content: Text('Fab Button Pressed!'),
          //         actions: <Widget>[
          //           CupertinoDialogAction(
          //             child: Text('Close'),
          //             isDestructiveAction: true,
          //             onPressed: () {
          //               Navigator.pop(context);
          //             },
          //           )
          //         ],
          //       );
          //     }
          // );
        },
      ),
      body: Builder(
        builder: (context) {
          switch (page) {
            case 'Green':
              return HomePage();
            case 'Blue':
              return Container(color: Colors.blue.shade900);
            case 'Red':
              return Container(color: Colors.red.shade900);
            case 'Yellow':
              return Container(color: Colors.yellow.shade700);
            default:
              return Container();
          }
        },
      ),
    );
  }
}
