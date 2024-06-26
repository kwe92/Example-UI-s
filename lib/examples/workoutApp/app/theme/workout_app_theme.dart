import 'package:example_ui/examples/workoutApp/app/theme/colors.dart';
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
        primary: WorkoutAppColors.mainThemeColor,
      ),
      // scaffoldBackgroundColor: Colors.black,
      inputDecorationTheme: inputDecorationTheme,
      outlinedButtonTheme: mainButtonTheme,
      bottomNavigationBarTheme: bottomNavigationBarTheme,
    );
  }
}

const inputDecorationTheme = InputDecorationTheme(
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
      color: WorkoutAppColors.mainThemeColor,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(16),
    ),
  ),
);

final mainButtonTheme = OutlinedButtonThemeData(style: mainButtonStyle);
final secondaryButtonTheme = OutlinedButtonThemeData(style: secondaryButtonStyle);

final mainButtonStyle = ButtonStyle(
  side: resolver(BorderSide.none),
  shape: resolver(
    const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(16),
      ),
    ),
  ),
  backgroundColor: resolver(
    WorkoutAppColors.mainThemeColor,
  ),
  textStyle: resolver(
    TextStyle(
      foreground: Paint()..color = Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w700,
    ),
  ),
);
final secondaryButtonStyle = mainButtonStyle.copyWith(
  padding: resolver(EdgeInsets.zero),
  shape: resolver(
    const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(12),
      ),
    ),
  ),
  backgroundColor: resolver(
    Colors.white,
  ),
  textStyle: resolver(
    TextStyle(
      foreground: Paint()..color = WorkoutAppColors.mainThemeColor,
      fontSize: 14,
      fontWeight: FontWeight.w700,
    ),
  ),
);

const bottomNavigationBarTheme = BottomNavigationBarThemeData(
  backgroundColor: WorkoutAppColors.mainThemeColor,
  type: BottomNavigationBarType.fixed,
  showUnselectedLabels: true,
  selectedItemColor: Colors.white,
  unselectedItemColor: Colors.white,
);

WidgetStateProperty<T> resolver<T>(T obj) => WidgetStateProperty.resolveWith((_) => obj);


// BottomNavigationBarType.fixed

//   - fixes BottomNavigationBarItem in places and removes dynamic padding when selecting items
