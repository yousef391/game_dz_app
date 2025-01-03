import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

class Otpfield extends StatelessWidget {
  const Otpfield({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OTPTextField(
      length: 6,
      width: MediaQuery.of(context).size.width,
      fieldWidth: 45,
      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            color: Colors.white,
          ),
      textFieldAlignment: MainAxisAlignment.spaceAround,
      fieldStyle: FieldStyle.box,
      otpFieldStyle: OtpFieldStyle(
        backgroundColor: Colors.transparent,
        borderColor: Colors.white.withOpacity(0.3),
        focusBorderColor: Colors.white,
        enabledBorderColor: Colors.white.withOpacity(0.3),
      ),
      outlineBorderRadius: 8,
      onCompleted: (pin) {
        // Handle OTP completion
        print("Completed: $pin");
      },
      onChanged: (pin) {
        // Handle OTP changes
        print("Changed: $pin");
      },
    );
  }
}
