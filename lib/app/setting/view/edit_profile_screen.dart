import 'package:atvandbuggy_sales_app/app/setting/controller/user_data_controller.dart';
import 'package:atvandbuggy_sales_app/constant/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../theme/app_theme.dart';
import '../../authentication/controller/auth_controller.dart';
import '../../component/custom_button.dart';
import '../../component/custom_text_field.dart';
import 'full_image_screen.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late UserDataController profile;

  @override
  void initState() {
    super.initState();
    profile = Provider.of<UserDataController>(context, listen: false);
    nameController = TextEditingController(text: profile.userDataModel.name);
    emailController = TextEditingController(text: profile.userDataModel.email);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppTheme>(builder: (context, theme, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Setting',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext customContext) {
                        return AlertDialog(
                          title: Text('Profile Picture'),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                if (profile.userDataModel.profileUrl != null &&
                                    profile.userDataModel.profileUrl != '')
                                  ListTile(
                                    leading: Icon(Icons.image),
                                    title: Text('See profile picture'),
                                    onTap: () {
                                      Navigator.pop(customContext);
                                      Navigator.push(customContext,
                                          MaterialPageRoute(builder: (context) {
                                        return FullImageScreen(
                                            path: profile
                                                .userDataModel.profileUrl!);
                                      }));
                                    },
                                  ),
                                ListTile(
                                  leading: Icon(Icons.photo_library_rounded),
                                  title: Text('Select from gallery'),
                                  onTap: () {
                                    Navigator.pop(customContext);
                                    AuthController()
                                        .changeProfilePhoto(context, false);
                                  },
                                ),
                                ListTile(
                                  leading: Icon(Icons.camera_alt),
                                  title: Text('Capture from camera'),
                                  onTap: () {
                                    Navigator.pop(customContext);
                                    AuthController()
                                        .changeProfilePhoto(context, true);
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 55,
                        backgroundImage:
                            NetworkImage('${profile.userDataModel.profileUrl}'),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            'assets/icons/change_profile.png',
                            height: 15,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                30.verticalSpace,
                CustomTextField(controller: nameController, hint: 'Name'),
                15.verticalSpace,
                CustomTextField(
                  onTap: () {
                    showCustomToast(context, 'Your email cannot be changed.');
                  },
                  controller: emailController,
                  hint: 'Email',
                  readOnly: true,
                ),
                20.verticalSpace,
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          offset: Offset(1, 2),
                          blurRadius: 20,
                          spreadRadius: 2,
                        )
                      ],
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Your custom invitation link',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 14),
                      ),
                      20.verticalSpace,
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xffE7EAEE),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Row(
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'https://www.atvandbuggy.com/referal/',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  'JUDYGMVAW',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            Spacer(),
                            Container(
                              decoration: BoxDecoration(
                                color: theme.primaryColor,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 13, vertical: 2),
                              child: const Text(
                                'Copy',
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w700),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                150.verticalSpace,
                CustomButton(
                    onTap: () {
                      if (nameController.text.trim() != '') {
                        profile.updateUserNameLocallyAndInDB(
                            nameController.text.trim());
                        showCustomToast(
                            context, 'Profile updated successfully');
                        Navigator.pop(context);
                      } else {
                        showCustomToast(context, 'User name can not be empty');
                      }
                    },
                    title: 'Update'),
              ],
            ),
          ),
        ),
      );
    });
  }
}
