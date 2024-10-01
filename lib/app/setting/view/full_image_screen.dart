import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FullImageScreen extends StatelessWidget {
  FullImageScreen({required this.path, super.key});
  String path;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: CachedNetworkImageProvider(path),
                  fit: BoxFit.cover,
                  opacity: 0.2)),
          child: Center(
            child: Container(
              height: height * 0.80,
              width: width * 0.85,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(path),
                    fit: BoxFit.cover,
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
