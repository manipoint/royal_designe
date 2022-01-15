import 'package:flutter/material.dart';

class AppThemes {
  AppThemes._();
  static const LinearGradient mainButton = LinearGradient(colors: [
    Color.fromRGBO(236, 60, 3, 1),
    Color.fromRGBO(234, 60, 3, 1),
    Color.fromRGBO(216, 78, 16, 1),
  ], begin: FractionalOffset.topCenter, end: FractionalOffset.bottomCenter);

  static const List<BoxShadow> shadow = [
    BoxShadow(color: Colors.black12, offset: Offset(0, 3), blurRadius: 6)
  ];

  static const Color whiteLilac = Color.fromRGBO(248, 250, 252, 1);
  static const Color blackPearl = Color.fromRGBO(30, 31, 43, 1);

  // static const Color darkPrimary = Color(0xFF442B2D);
  // static const Color ebonyClay = Color(0xFF442B2D);

  static String font1 = "ProductSans";
  static String font2 = "Roboto";
  static Color lightPrimary = const Color(0xFFFEDBD0);
  static Color darkPrimary = const Color(0xFF442B2D);
  static Color lightSecondary = const Color(0xFFFEEAE6);
  static Color darkSecondary = const Color(0xFF7D4F52);
  static Color surfaceWhite = const Color.fromRGBO(248, 250, 252, 1);
  static Color background = const Color.fromRGBO(255, 255, 255, 1);
  static Color errorRed = const Color(0xFFC5032B);
  static Color darkAccent = Colors.red.shade400;
  static Color ratingBG = Colors.yellow.shade700;
  static Color gray = Colors.grey;
  static const defaultLetterSpacing = 0.03;
  // static Color ebonyClay = const Color.fromRGBO(40, 42, 58, 1);
  //constants color range for light theme
  //main color
  static final Color _lightPrimaryColor = lightPrimary;

  //Background Colors
  static  final Color _lightBackgroundColor = lightSecondary;
  static final Color _lightBackgroundAppBarColor = lightSecondary;
  static  final Color _lightBackgroundSecondaryColor = surfaceWhite;
  static const Color _lightBackgroundAlertColor = blackPearl;
  static  final Color _lightBackgroundActionTextColor = surfaceWhite;
  // static const Color _lightBackgroundErrorColor = brinkPink;
  // static const Color _lightBackgroundSuccessColor = juneBud;

  //Text Colors
  static const Color _lightTextColor = Colors.black;
  // static const Color _lightAlertTextColor = Colors.black;
  // static const Color _lightTextSecondaryColor = Colors.black;

  //Border Color
  static final Color _lightBorderColor = darkPrimary;

  //Icon Color
  static final Color _lightIconColor = darkPrimary;

  //form input colors
  //static const Color _lightInputFillColor = _lightBackgroundSecondaryColor;
  static final Color _lightBorderActiveColor = _lightPrimaryColor;
  //static  final Color _lightBorderErrorColor = darkAccent;

  //constants color range for dark theme
  static final Color _darkPrimaryColor = darkPrimary;

  //Background Colors
  static final Color _darkBackgroundColor = darkPrimary;
  static final Color _darkBackgroundAppBarColor = _darkPrimaryColor;
  static const Color _darkBackgroundSecondaryColor =
      Color.fromRGBO(0, 0, 0, .6);
  static const Color _darkBackgroundAlertColor = blackPearl;
  static  final Color _darkBackgroundActionTextColor = surfaceWhite;



  //Text Colors
  static const Color _darkTextColor = Colors.white;


  //Border Color
  static final Color _darkBorderColor = darkPrimary;

  //Icon Color
  static final Color _darkIconColor = darkPrimary;

  static const Color _darkInputFillColor = _darkBackgroundSecondaryColor;
  static final Color _darkBorderActiveColor = _darkPrimaryColor;
  //static Color _darkBorderErrorColor = darkAccent;


  //text theme for light theme
  static final TextTheme _lightTextTheme = TextTheme(
    headline1: const TextStyle(fontSize: 20.0, color: _lightTextColor,),
    bodyText1: const TextStyle(fontSize: 16.0, color: _lightTextColor,fontWeight: FontWeight.bold),
    bodyText2: const TextStyle(fontSize: 14.0, color: Colors.black),
    button: const TextStyle(
        fontSize: 14.0, color: _lightTextColor, fontWeight: FontWeight.w600,
        ),
    headline6: const TextStyle(fontSize: 16.0, color: _lightTextColor),
    subtitle1: const TextStyle(fontSize: 16.0, color: _lightTextColor,fontWeight: FontWeight.bold),
    caption: TextStyle(fontSize: 12.0, color: darkPrimary),
  );

  //the light theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: font1,
    scaffoldBackgroundColor: _lightBackgroundColor,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: _lightPrimaryColor,
    ),
    appBarTheme: AppBarTheme(
      color: _lightBackgroundAppBarColor,
      iconTheme: const IconThemeData(color: _lightTextColor),
      toolbarTextStyle: _lightTextTheme.bodyText2,
      titleTextStyle: _lightTextTheme.headline6,
    ),
    colorScheme: ColorScheme.light(
      primary: _lightPrimaryColor,
      primaryVariant: darkSecondary,
      secondary: lightSecondary,
      onSurface: whiteLilac,
      error: errorRed

      // secondary: _lightSecondaryColor,
    ),
    snackBarTheme:  SnackBarThemeData(
        backgroundColor: _lightBackgroundAlertColor,
        actionTextColor: _lightBackgroundActionTextColor),
    iconTheme: IconThemeData(
      color: _lightIconColor,
    ),
    popupMenuTheme: PopupMenuThemeData(color: _lightBackgroundAppBarColor),
    textTheme: _lightTextTheme,
    buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        buttonColor: darkAccent,
        textTheme: ButtonTextTheme.primary),
    unselectedWidgetColor: _lightPrimaryColor,
    inputDecorationTheme: InputDecorationTheme(
      //prefixStyle: TextStyle(color: _lightIconColor),
      border: const OutlineInputBorder(
          borderSide: BorderSide(width: 1.0),
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          )),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: _lightBorderColor, width: 1.0),
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: _lightBorderActiveColor),
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      ),
      errorBorder:  OutlineInputBorder(
        borderSide: BorderSide(color: errorRed),
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      ),
      focusedErrorBorder:  OutlineInputBorder(
        borderSide: BorderSide(color: errorRed),
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      ),
      fillColor: _lightBackgroundSecondaryColor,
      //focusColor: _lightBorderActiveColor,
    ),
  );


  static final TextTheme _darkTextTheme = TextTheme(
    headline1: const TextStyle(fontSize: 20.0, color: _darkTextColor),
    bodyText1: const TextStyle(fontSize: 16.0, color: _darkTextColor),
    bodyText2: const TextStyle(fontSize: 14.0, color: Colors.grey),
    button: const TextStyle(
        fontSize: 14.0, color: _darkTextColor, fontWeight: FontWeight.w600),
    headline6: const TextStyle(fontSize: 16.0, color: _darkTextColor),
    subtitle1: const TextStyle(fontSize: 16.0, color: _darkTextColor),
    caption: TextStyle(fontSize: 12.0, color: _darkBackgroundAppBarColor),
  );

  //the dark theme
  static final ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark, //prefix icon color form input on focus

      fontFamily: font1,
      scaffoldBackgroundColor: _darkBackgroundColor,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: _darkPrimaryColor,
      ),
      appBarTheme: AppBarTheme(
        color: _darkBackgroundAppBarColor,
        iconTheme: IconThemeData(color: _lightPrimaryColor),
        toolbarTextStyle: _darkTextTheme.bodyText2,
        titleTextStyle: _darkTextTheme.headline6,
      ),
      snackBarTheme:  SnackBarThemeData(
          contentTextStyle: const TextStyle(color: Colors.white),
          backgroundColor: _darkBackgroundAlertColor,
          actionTextColor: _darkBackgroundActionTextColor),
      iconTheme: IconThemeData(
        color: _darkIconColor, //_darkIconColor,
      ),
      popupMenuTheme: PopupMenuThemeData(color: _darkBackgroundAppBarColor),
      textTheme: _darkTextTheme,
      buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          buttonColor:darkAccent,
          textTheme: ButtonTextTheme.primary),
      unselectedWidgetColor: _darkPrimaryColor,
      inputDecorationTheme: InputDecorationTheme(
        prefixStyle: TextStyle(color: _darkIconColor),
        //labelStyle: TextStyle(color: darkPrimary),
        border: const OutlineInputBorder(
            borderSide: BorderSide(width: 1.0),
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            )),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: _darkBorderColor, width: 1.0),
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: _darkBorderActiveColor),
          // ignore: prefer_const_constructors
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        errorBorder:  OutlineInputBorder(
          borderSide: BorderSide(color: errorRed),
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        ),
        focusedErrorBorder:  OutlineInputBorder(
          borderSide: BorderSide(color: errorRed),
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        ),
        fillColor: _darkInputFillColor,
        //focusColor: _darkBorderActiveColor,
      ),
      colorScheme: ColorScheme.dark(
        primary: _darkPrimaryColor,
        primaryVariant: lightPrimary,
        secondary: darkSecondary,
        onSurface: darkSecondary,
        error: errorRed

        // secondary: _darkSecondaryColor,
      ));
}
