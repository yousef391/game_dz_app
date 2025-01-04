import 'package:flutter/material.dart';
import 'package:game_dz_app/Features/Auth/Presentation/views/Otp_view.dart';
import 'package:game_dz_app/Features/Auth/Presentation/views/Phone_auth_view.dart';
import 'package:game_dz_app/Features/Auth/Presentation/views/user_info_screen.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case PhoneVerificationScreen.routename:
      return MaterialPageRoute(
          builder: (context) => const PhoneVerificationScreen());
    case OtpVerificationScreen.routename:
      return MaterialPageRoute(
          builder: (context) => const OtpVerificationScreen());
    case UserInfoScreen.routename:
      return MaterialPageRoute(builder: (context) => const UserInfoScreen());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
