import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_count_down.dart';

class countdown extends StatelessWidget {
  const countdown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Countdown(
      seconds: 60,
      build: (BuildContext context, double time) => Text(
          time.toString().substring(0, 2),
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: const Color(0xFFFF3B30),
              fontWeight: FontWeight.w600,
              fontSize: 24)),
      interval: const Duration(seconds: 1),
      onFinished: () {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('try again')));
      },
    );
  }
}
