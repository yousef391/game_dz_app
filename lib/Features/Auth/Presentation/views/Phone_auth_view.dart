import 'package:flutter/material.dart';
import 'package:game_dz_app/Features/Auth/Presentation/views/Otp_view.dart';

import 'widgets/custom_button.dart';

class PhoneVerificationScreen extends StatelessWidget {
  const PhoneVerificationScreen({super.key});
  static const routename = 'phone_auth';

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenPadding = MediaQuery.of(context).padding;
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      body: Stack(
        children: [
          // Background SVG
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: screenSize.height * 0.05),
                          _HeaderSection(),
                          SizedBox(height: screenSize.height * 0.05),
                          _PhoneIllustration(screenSize: screenSize),
                          SizedBox(height: screenSize.height * 0.08),
                          _PhoneInputSection(),
                        ],
                      ),
                      const GetCodeButton(
                        routename: OtpVerificationScreen.routename,
                      ),
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
          'Enter your\nphone number',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                height: 1.2,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          'We will send you an One Time Password(OTP)\non this mobile number.',
          style: TextStyle(
            fontSize: 14,
            color: Colors.white.withOpacity(0.7),
          ),
        ),
      ],
    );
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

class _PhoneInputSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Enter your phone number',
          style: TextStyle(
              fontSize: 13, color: Colors.white, fontWeight: FontWeight.w900),
        ),
        const SizedBox(
          height: 10,
        ),
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment:
                CrossAxisAlignment.stretch, // Ensures matching heights
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white.withOpacity(0.1),
                ),
                child: Row(
                  children: [
                    const Text(
                      '+213',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Image.asset(
                      'assets/images/dz.png',
                      height:
                          24, // Adjust the height of the image to fit nicely
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: TextFormField(
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: '067882443287',
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.3)),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.1),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical:
                          12, // Match the vertical padding of the container
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
