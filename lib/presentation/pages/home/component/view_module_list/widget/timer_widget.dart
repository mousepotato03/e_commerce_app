import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../../../core/theme/custom/custom_font_weight.dart';
import '../../../../../../core/theme/custom/custom_theme.dart';

class TimerWidget extends StatefulWidget {
  final DateTime endTime;

  const TimerWidget({super.key, required this.endTime});

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  Timer? _timer;
  late Duration remainTIme;

  @override
  void initState() {
    super.initState();
    remainTIme = widget.endTime.difference(DateTime.now());

    if (remainTIme > Duration.zero) {
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        remainTIme = widget.endTime.difference(DateTime.now());

        if (remainTIme <= Duration.zero) {
          _timer?.cancel();
        }

        setState(() {});
      });
    }
  }

  String _printDuration(Duration duration) {
    if (duration <= Duration.zero) {
      return "TIME OUT";
    }

    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));

    return "${twoDigits(duration.inHours)} : $twoDigitMinutes : $twoDigitSeconds";
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _printDuration(remainTIme),
      style: Theme.of(context)
          .textTheme
          .headlineMedium
          ?.copyWith(
            color: Theme.of(context).colorScheme.contentPrimary,
          )
          .semiBold,
    );
  }
}
