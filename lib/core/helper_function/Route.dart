import 'package:flutter/material.dart';
import 'package:game_dz_app/Features/Home/Presentation/views/screen.dart';
import 'package:game_dz_app/Features/On_boarding/Presentation/views/on_boarding.dart';
import 'package:game_dz_app/Features/Splash/Presentation/views/splash_screen.dart';
// import 'package:game_dz_app/Features/Auth/Presentation/views/Otp_view.dart';
// import 'package:game_dz_app/Features/Auth/Presentation/views/Phone_auth_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case OnBoardScreen.routename:
      return MaterialPageRoute(
        builder: (context) => const OnBoardScreen(),
      );
    case SplashScreen.routename:
      return MaterialPageRoute(builder: (context) =>  SplashScreen());

    case HomeScreen.routename:
      return MaterialPageRoute(builder: (context) =>  HomeScreen());
    // case PhoneVerificationScreen.routename:
    //   return MaterialPageRoute(
    //       builder: (context) => const PhoneVerificationScreen());
    // case OtpVerificationScreen.routename:
    //   return MaterialPageRoute(
    //       builder: (context) => const OtpVerificationScreen());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}