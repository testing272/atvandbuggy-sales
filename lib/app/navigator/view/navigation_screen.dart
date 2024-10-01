import 'package:atvandbuggy_sales_app/app/setting/controller/user_data_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constant/app_strings.dart';
import '../../../constant/asset_paths.dart';
import '../../../theme/app_theme.dart';
import '../../home/view/home_screen.dart';
import '../../money/view/withdraw_money.dart';
import '../../referral/view/refer_your_friend.dart';
import '../../referral/view/referrals_screen.dart';
import '../../setting/view/setting_screen.dart';

class NavigationScreen extends StatefulWidget {
  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = <Widget>[
    HomeScreen(),
    ReferralsScreen(),
    ReferYourFriend(),
    WithdrawMoney(),
    SettingScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    Provider.of<UserDataController>(context, listen: false)
        .getUserDataFromFirebase();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppTheme>(builder: (context, theme, child) {
      return Scaffold(
        body: Center(
          child: _screens.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: SizedBox(
          height: 90,
          child: BottomNavigationBar(
            items: List.generate(titles.length, (index) {
              return BottomNavigationBarItem(
                icon: Image.asset(
                  iconPaths[index],
                  width: 22,
                  height: 22,
                  color: _selectedIndex == index
                      ? theme.primaryColor
                      : theme.unselectedColor,
                ),
                label: titles[index],
              );
            }),
            currentIndex: _selectedIndex,
            selectedItemColor: theme.primaryColor,
            unselectedItemColor: theme.unselectedColor,
            selectedFontSize: 12,
            unselectedFontSize: 10,
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed, // Ensures all items are shown
          ),
        ),
      );
    });
  }
}
