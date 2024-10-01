import 'package:flutter/material.dart';

class AppTheme extends ChangeNotifier {
  Color primaryColor = Color(0xffFBBC05);
  Color unselectedColor = Color(0xFFA4A4A4);
  Color yellowLight = Color(0xFFFFD353);

  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Manrope',
    brightness: Brightness.light,
    primaryColor: const Color(0xFFDC6B28), // Button color

    colorScheme: const ColorScheme.light(
      primary: Color(0xFFDC6B28), // Buttons, active elements
      onPrimary: Colors.white, // Text color on primary color
      secondary: Color(0xFF1B201E), // Text fields text color
      onSecondary: Colors.white,
      surface: Colors.white,
      onSurface: Colors.black,
    ),

    textTheme: const TextTheme(
      bodyLarge: TextStyle(
          color: Color(
              0xFF1B201E)), // Text color in text fields (equivalent to bodyText1)
      bodyMedium: TextStyle(
          color: Color(
              0xff323A46)), // Hint text and icons inside text fields (equivalent to bodyText2)
      labelLarge: TextStyle(
          color: Colors.white), // Button text color (equivalent to button)
    ),

    inputDecorationTheme: InputDecorationTheme(
      hintStyle: const TextStyle(color: Color(0xFFA0ABBB)), // Hint color
      iconColor: const Color(0xFFA0ABBB), // Icons inside text fields
      labelStyle: const TextStyle(color: Color(0xFF1B201E)), // Label text color
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFFDC6B28)),
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),

    buttonTheme: const ButtonThemeData(
      buttonColor: Color(0xFFDC6B28), // Button color
      textTheme: ButtonTextTheme.primary,
    ),
  );
}
