import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  final String title;
  final String? prefixIconPath;
  final VoidCallback onTap;
  const ProfileButton(
      {super.key,
      required this.title,
      this.prefixIconPath,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(0xffF7F8F9),
        ),
        padding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
        child: Row(
          children: [
            if (prefixIconPath != null)
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Image.asset(
                  prefixIconPath!,
                  height: 20,
                ),
              ),
            Text(
              title,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            Spacer(),
            Image.asset(
              'assets/icons/forward.png',
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
