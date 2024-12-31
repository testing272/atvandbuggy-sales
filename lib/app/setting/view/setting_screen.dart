import 'package:atvandbuggy_sales_app/app/authentication/controller/auth_controller.dart';
import 'package:atvandbuggy_sales_app/app/authentication/view/login_screen.dart';
import 'package:atvandbuggy_sales_app/app/referral/controller/refer_by_controller.dart';
import 'package:atvandbuggy_sales_app/app/setting/controller/user_data_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../theme/app_theme.dart';
import '../../chat/view/messages.dart';
import '../../component/profile_button.dart';
import '../../component/profile_header.dart';
import '../../referral/view/referred_by_screen.dart';
import 'edit_profile_screen.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppTheme>(builder: (context, theme, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Settings',
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Consumer<UserDataController>(
                    builder: (context, profile, child) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xffF7F8F9),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                    child: Row(
                      children: [
                        ProfileHeader(),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return EditProfileScreen();
                            }));
                          },
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: theme.primaryColor,
                            ),
                            child: Icon(
                              Icons.mode_edit_outlined,
                              color: Colors.black.withOpacity(0.5),
                              size: 15,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }),
                20.verticalSpace,
                Consumer<UserDataController>(
                    builder: (context, profile, child) {
                  if (profile.userDataModel.level != 1) {
                    return ProfileButton(
                      onTap: () async {
                        await Provider.of<ReferByController>(context,
                                listen: false)
                            .getReferByUserFromFirebase(context);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ReferredByScreen();
                        }));
                      },
                      title: 'Referred by',
                      prefixIconPath: 'assets/icons/referred_user.png',
                    );
                  }
                  return SizedBox.shrink();
                }),
                20.verticalSpace,
                ProfileButton(
                  title: 'Messages',
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Messages();
                    }));
                  },
                ),
                20.verticalSpace,
                Divider(
                  color: Colors.grey.withOpacity(0.2),
                ),
                20.verticalSpace,
                ProfileButton(
                  title: 'Privacy policy',
                  onTap: () {},
                ),
                20.verticalSpace,
                ProfileButton(
                  title: 'Terms of service',
                  onTap: () {},
                ),
                20.verticalSpace,
                ProfileButton(
                  title: 'Send feedback',
                  onTap: () {},
                ),
                20.verticalSpace,
                ProfileButton(
                  title: 'Contact customer service',
                  onTap: () {},
                ),
                20.verticalSpace,
                ProfileButton(
                  title: 'Log out',
                  prefixIconPath: 'assets/icons/logout.png',
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return CupertinoAlertDialog(
                            title: Text('Log out'),
                            content: Text('Do you want to log out?'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    AuthController().logOut();
                                    Navigator.pushAndRemoveUntil(context,
                                        MaterialPageRoute(builder: (context) {
                                      return LoginScreen();
                                    }), (route) => false);
                                  },
                                  child: Text('Yes')),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Cancel')),
                            ],
                          );
                        });
                  },
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
