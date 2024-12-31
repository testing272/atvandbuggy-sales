import 'package:atvandbuggy_sales_app/app/setting/controller/user_data_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget cardBack() {
  return Consumer<UserDataController>(builder: (context, profile, child) {
    try {
      return Card(
        elevation: 3,
        shadowColor: Colors.white,
        clipBehavior: Clip.antiAlias,
        child: Container(
          height: 150,
          width: 280,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/icons/card_back.png',
                  ),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${profile.userDataModel.name}',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF212332),
                              fontSize: 13),
                        ),
                        Text(
                          '',
                          style:
                              TextStyle(color: Color(0xFF212332), fontSize: 6),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: VerticalDivider(
                      thickness: 0.5,
                      color: Color(0xFF212332),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 130,
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/icons/email_icon.png',
                                color: Color(0xFF27293D),
                                height: 20,
                                width: 20,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Text(
                                  '${profile.userDataModel.email}',
                                  style: TextStyle(
                                      color: Color(0xFF27293D), fontSize: 7),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 130,
                          child: Row(
                            children: [
                              Image.asset('assets/icons/phone_icon.png',
                                  color: Color(0xFF27293D),
                                  height: 20,
                                  width: 20),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '+923055260095',
                                style: TextStyle(
                                    color: Color(0xFF27293D), fontSize: 7),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 130,
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/icons/web_icon.png',
                                color: Color(0xFF27293D),
                                height: 20,
                                width: 20,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'www.atvandbuggy.com',
                                style: TextStyle(
                                    color: Color(0xFF27293D), fontSize: 7),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    } catch (e) {
      return SizedBox.shrink();
    }
  });
}
