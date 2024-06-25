import 'package:flutter/material.dart';

class WorkoutAppTheme {
  WorkoutAppTheme._();
  static ThemeData getTheme() {
    return ThemeData(
      // colorScheme: ColorScheme(
      //   brightness: Brightness.dark,
      //   primary: Colors.blue,
      //   onPrimary: Colors.green,
      //   secondary: Colors.red,
      //   onSecondary: Colors.pink,
      //   error: Colors.orange,
      //   onError: Colors.yellow,
      //   surface: Colors.lightBlue,
      //   onSurface: Colors.lightGreen,
      // ),
      colorScheme: const ColorScheme.dark(
        primary: Color(0xff7C4DFF),
      ),
      // scaffoldBackgroundColor: Colors.black,
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: Color(0xff202023),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Color(0xff7C4DFF),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          side: resolver(BorderSide.none),
          shape: resolver(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
          ),
          backgroundColor: resolver(
            const Color(0xff7C4DFF),
          ),
          textStyle: resolver(
            TextStyle(
              foreground: Paint()..color = Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}

WidgetStateProperty<T> resolver<T>(T obj) => WidgetStateProperty.resolveWith((_) => obj);
