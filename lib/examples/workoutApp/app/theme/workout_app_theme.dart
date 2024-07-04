import 'package:example_ui/examples/workoutApp/app/theme/colors.dart';
import 'package:flutter/material.dart';

class WorkoutAppTheme {
  WorkoutAppTheme._();
  static ThemeData getTheme() {
    return ThemeData(
      colorScheme: const ColorScheme.dark(
        primary: WorkoutAppColors.mainThemeColor,
        onSurface: WorkoutAppColors.primaryTextColor,
      ),
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
      inputDecorationTheme: inputDecorationTheme,
      outlinedButtonTheme: mainButtonTheme,
      bottomNavigationBarTheme: bottomNavigationBarTheme,
      progressIndicatorTheme: const ProgressIndicatorThemeData(color: WorkoutAppColors.mainThemeColor),
      snackBarTheme: const SnackBarThemeData(
        backgroundColor: Color.fromARGB(255, 52, 52, 52),
        contentTextStyle: TextStyle(
          color: WorkoutAppColors.primaryTextColor,
          fontWeight: FontWeight.w600,
        ),
      ),
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
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(
      width: 2,
      color: Colors.red,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(16),
    ),
  ),
);

final mainButtonTheme = OutlinedButtonThemeData(style: mainButtonStyle);
final secondaryButtonTheme = OutlinedButtonThemeData(style: secondaryButtonStyle);
final categoryButtonTheme = OutlinedButtonThemeData(style: categoryButtonStyle);
final deactiveCategoryButtonTheme = OutlinedButtonThemeData(style: deactiveCategoryButtonStyle);

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

final categoryButtonStyle = mainButtonStyle.copyWith(
  padding: resolver(
    const EdgeInsets.symmetric(horizontal: 16),
  ),
  side: resolver(
    const BorderSide(
      width: 2,
      color: WorkoutAppColors.mainThemeColor,
    ),
  ),
  shape: resolver(
    const StadiumBorder(),
  ),
  backgroundColor: resolver(
    Colors.black,
  ),
  textStyle: resolver(
    TextStyle(
      foreground: Paint()..color = WorkoutAppColors.mainThemeColor,
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
  ),
);

final deactiveCategoryButtonStyle = mainButtonStyle.copyWith(
  padding: resolver(
    const EdgeInsets.symmetric(horizontal: 16),
  ),
  side: resolver(
    const BorderSide(
      width: 2,
      color: Color(0xff272641),
    ),
  ),
  shape: resolver(
    const StadiumBorder(),
  ),
  backgroundColor: resolver(
    Colors.black,
  ),
  textStyle: resolver(
    TextStyle(
      foreground: Paint()..color = const Color(0xff9B9BC2),
      fontSize: 14,
      fontWeight: FontWeight.w500,
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
