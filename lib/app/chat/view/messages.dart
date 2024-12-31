import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'chat_screen.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const ChatScreen(
                      name: 'Abigail',
                      profileUrl:
                          'https://i.cbc.ca/1.6903099.1689089909!/fileImage/httpImage/image.jpg_gen/derivatives/original_780/julia-wright.jpg',
                    );
                  }));
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 25),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundImage: CachedNetworkImageProvider(
                            'https://i.cbc.ca/1.6903099.1689089909!/fileImage/httpImage/image.jpg_gen/derivatives/original_780/julia-wright.jpg'),
                      ),
                      10.horizontalSpace,
                      Expanded(
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Abigail',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 18),
                            ),
                            Text(
                              'I am fine.',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff797C7B)),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        '2 min Ago',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff797C7B)),
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
