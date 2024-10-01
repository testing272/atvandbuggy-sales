import 'package:atvandbuggy_sales_app/app/referral/controller/refer_by_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../component/custom_text_field.dart';

class ReferredByScreen extends StatefulWidget {
  const ReferredByScreen({super.key});

  @override
  State<ReferredByScreen> createState() => _ReferredByScreenState();
}

class _ReferredByScreenState extends State<ReferredByScreen> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late ReferByController referByController;

  @override
  void initState() {
    super.initState();
    getReferBy();
  }

  getReferBy() async {
    referByController = Provider.of<ReferByController>(context, listen: false);
    nameController = TextEditingController(
        text: referByController.referByUserDataModel.name);
    emailController = TextEditingController(
        text: referByController.referByUserDataModel.email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Referred By',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 55,
              backgroundImage: CachedNetworkImageProvider(
                  '${referByController.referByUserDataModel.profileUrl}'),
            ),
            30.verticalSpace,
            CustomTextField(
              controller: nameController,
              hint: 'Name',
              readOnly: true,
            ),
            15.verticalSpace,
            CustomTextField(
              controller: emailController,
              hint: 'Email',
              readOnly: true,
            )
          ],
        ),
      ),
    );
  }
}
