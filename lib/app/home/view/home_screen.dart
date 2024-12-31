import 'dart:io';

import 'package:atvandbuggy_sales_app/app/component/profile_header.dart';
import 'package:atvandbuggy_sales_app/app/home/view/card_back.dart';
import 'package:atvandbuggy_sales_app/app/home/view/card_front.dart';
import 'package:atvandbuggy_sales_app/app/home/view/sale_section.dart';
import 'package:atvandbuggy_sales_app/app/setting/controller/user_data_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../../constant/app_strings.dart';
import '../../../theme/app_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> card = [
    cardFront(),
    cardBack(),
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<AppTheme>(builder: (context, theme, child) {
      return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ProfileHeader(),
                  20.verticalSpace,
                  SaleSection(),
                  30.verticalSpace,
                  InkWell(
                    onTap: () async {
                      UserDataController user = Provider.of<UserDataController>(
                          context,
                          listen: false);
                      final pdf = pw.Document();
                      final image = await rootBundle
                          .load('assets/icons/influencer_card.png');
                      final back_image =
                          await rootBundle.load('assets/icons/card_back.png');
                      final phone =
                          await rootBundle.load('assets/icons/phone_icon.png');
                      final email =
                          await rootBundle.load('assets/icons/email_icon.png');
                      final web =
                          await rootBundle.load('assets/icons/web_icon.png');
                      // Add both sides of the card in a column layout
                      pdf.addPage(
                        pw.Page(
                          build: (pw.Context context) {
                            return pw.Column(
                              children: [
                                pw.Container(
                                    height: 150,
                                    width: 280,
                                    decoration: pw.BoxDecoration(
                                      borderRadius:
                                          pw.BorderRadius.circular(10),
                                      image: pw.DecorationImage(
                                        image: pw.MemoryImage(
                                          image.buffer.asUint8List(),
                                        ),
                                        fit: pw.BoxFit.cover,
                                      ),
                                    ),
                                    child: pw.Column(
                                        mainAxisAlignment:
                                            pw.MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            pw.CrossAxisAlignment.center,
                                        children: [
                                          pw.SizedBox(height: 35),
                                          pw.BarcodeWidget(
                                            padding: pw.EdgeInsets.all(3),
                                            backgroundColor: PdfColors.white,
                                            width: 70,
                                            height: 70,
                                            barcode: pw.Barcode.qrCode(),
                                            data:
                                                'https://dev-v2.atvandbuggy.com/?q=${user.userDataModel.referredCode}',
                                          ),
                                          pw.Spacer(),
                                          pw.Text('www.atvandbuggy.com',
                                              style: pw.TextStyle(
                                                  color: PdfColors.white,
                                                  fontSize: 7,
                                                  fontWeight:
                                                      pw.FontWeight.bold)),
                                          pw.SizedBox(height: 10)
                                        ])),
                                pw.SizedBox(height: 20),
                                pw.Container(
                                  height: 150,
                                  width: 280,
                                  decoration: pw.BoxDecoration(
                                    // border: pw.Border.all(color: PdfColors.grey, width: 0.5),
                                    image: pw.DecorationImage(
                                      image: pw.MemoryImage(
                                        back_image.buffer.asUint8List(),
                                      ),
                                      fit: pw.BoxFit.cover,
                                    ),
                                    borderRadius: pw.BorderRadius.circular(10),
                                  ),
                                  child: pw.Padding(
                                      padding: const pw.EdgeInsets.all(15),
                                      child: pw.Row(children: [
                                        pw.Padding(
                                          padding:
                                              const pw.EdgeInsets.symmetric(
                                                  horizontal: 5),
                                          child: pw.Column(
                                            crossAxisAlignment:
                                                pw.CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                pw.MainAxisAlignment.center,
                                            children: [
                                              pw.Text(
                                                  '${user.userDataModel.name}',
                                                  style: pw.TextStyle(
                                                      color: PdfColor.fromInt(
                                                          0xFF212332),
                                                      fontSize: 11,
                                                      fontWeight:
                                                          pw.FontWeight.bold)),
                                              pw.Text('profession',
                                                  style: pw.TextStyle(
                                                      fontSize: 6,
                                                      color: PdfColor.fromInt(
                                                          0xFF212332))),
                                            ],
                                          ),
                                        ),
                                        pw.Spacer(),
                                        pw.Padding(
                                          padding: pw.EdgeInsets.symmetric(
                                              vertical: 20),
                                          child: pw.VerticalDivider(
                                              color:
                                                  PdfColor.fromInt(0xFF212332)),
                                        ),
                                        pw.Spacer(),
                                        pw.Column(
                                          crossAxisAlignment:
                                              pw.CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              pw.MainAxisAlignment.center,
                                          children: [
                                            pw.SizedBox(
                                              width: 145,
                                              child: pw.Row(
                                                children: [
                                                  pw.Image(
                                                      pw.MemoryImage(
                                                        phone.buffer
                                                            .asUint8List(),
                                                      ),
                                                      width: 15,
                                                      height: 15),
                                                  pw.SizedBox(width: 3),
                                                  pw.Text('+923423234324',
                                                      style: pw.TextStyle(
                                                          fontSize: 6)),
                                                ],
                                              ),
                                            ),
                                            pw.SizedBox(height: 5),
                                            pw.SizedBox(
                                              width: 145,
                                              child: pw.Row(
                                                children: [
                                                  pw.Image(
                                                      pw.MemoryImage(
                                                        email.buffer
                                                            .asUint8List(),
                                                      ),
                                                      width: 15,
                                                      height: 15),
                                                  pw.SizedBox(width: 3),
                                                  pw.Text(
                                                      '${user.userDataModel..email}',
                                                      style: pw.TextStyle(
                                                          fontSize: 6)),
                                                ],
                                              ),
                                            ),
                                            pw.SizedBox(height: 5),
                                            pw.SizedBox(
                                              width: 145,
                                              child: pw.Row(
                                                children: [
                                                  pw.Image(
                                                      pw.MemoryImage(
                                                        web.buffer
                                                            .asUint8List(),
                                                      ),
                                                      width: 15,
                                                      height: 15),
                                                  pw.SizedBox(width: 3),
                                                  pw.Text('www.atvandbuggy.com',
                                                      style: pw.TextStyle(
                                                          fontSize: 6)),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ])),
                                )
                              ],
                            );
                          },
                        ),
                      );

                      // Save the PDF to a temporary file
                      Uint8List bytes = await pdf.save();
                      final directory = await getTemporaryDirectory();
                      final path = '${directory.path}/influencer_card.pdf';
                      final file = File(path);
                      await file.writeAsBytes(bytes);

                      // Share the PDF file
                      await Share.shareXFiles([XFile(path)],
                          text: 'Look what I made!');
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        children: [
                          Text(
                            'Share your Card',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w800),
                          ),
                          Spacer(),
                          Image.asset(
                            'assets/icons/share.png',
                            height: 26,
                          ),
                        ],
                      ),
                    ),
                  ),
                  15.verticalSpace,
                  Container(
                    height: 200.h,
                    width: double.infinity,
                    child: PageView.builder(
                      onPageChanged: (index) {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      itemCount: card.length,
                      itemBuilder: (context, index) {
                        return card[index];
                      },
                    ),
                  ),
                  15.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(cardBg.length, (index) {
                      return Container(
                        height: 10,
                        width: 10,
                        margin: EdgeInsets.only(left: 5),
                        decoration: BoxDecoration(
                            color: selectedIndex == index
                                ? theme.primaryColor
                                : Colors.grey.withOpacity(0.5),
                            shape: BoxShape.circle),
                      );
                    }),
                  ),
                  30.verticalSpace,
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
