import 'package:flutter/material.dart';
import 'package:game_dz_app/Features/Auth/Presentation/views/Otp_view.dart';

class GetCodeButton extends StatelessWidget {
  const GetCodeButton({super.key, required this.routename});

  final String routename;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, routename);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF6E5DE7),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 0,
        ),
        child: const Text(
          'Get code',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
