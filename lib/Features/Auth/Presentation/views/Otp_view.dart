import 'package:flutter/material.dart';
import 'package:game_dz_app/Features/Auth/Presentation/views/widgets/Countdown.dart';
import 'package:game_dz_app/Features/Auth/Presentation/views/widgets/Otp_field.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});
  static const routename = 'otp_view';
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenPadding = MediaQuery.of(context).padding;
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/bg_1.png',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 24,
                  right: 24,
                  top: 24,
                  bottom: 24 + keyboardHeight,
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: screenSize.height - screenPadding.vertical - 48,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: screenSize.height * 0.05),
                      _HeaderSection(),
                      SizedBox(height: screenSize.height * 0.05),
                      _Timer(),
                      SizedBox(height: screenSize.height * 0.05),
                      _PhoneIllustration(screenSize: screenSize),
                      SizedBox(height: screenSize.height * 0.05),
                      _OtpInputSection(),
                      SizedBox(height: screenSize.height * 0.05),
                      _ResendSection(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'OTP Verification',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                height: 1.2,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          'Enter the code from the sms we sent to',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.white.withOpacity(0.7),
              ),
        ),
        const SizedBox(height: 4),
        Text(
          '+213672443287',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.white.withOpacity(0.7),
              ),
        ),
      ],
    );
  }
}

class _Timer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Align(alignment: Alignment.center, child: countdown());
  }
}

class _PhoneIllustration extends StatelessWidget {
  final Size screenSize;

  const _PhoneIllustration({required this.screenSize});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/images/auth_img.png',
        height: screenSize.height * 0.25,
        width: screenSize.width * 0.6,
      ),
    );
  }
}

class _OtpInputSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8), child: Otpfield());
  }
}

class _ResendSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "You didn't receive any code? ",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.white.withOpacity(0.7),
              ),
        ),
        TextButton(
          onPressed: () {
            // Resend logic here
          },
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            'RESEND',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ],
    );
  }
}
