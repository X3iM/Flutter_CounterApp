import 'package:flutter/material.dart';
import 'package:flutter_counter/presentation/screens/counter_screen/widgets/animated_circle.dart';
import 'package:flutter_counter/presentation/screens/counter_screen/widgets/counter_value.dart';
import 'widgets/counter_slider.dart';
import 'widgets/plasma_background.dart';

class CounterScreen extends StatelessWidget {
  CounterScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(alignment: Alignment.center, children: [
        PlasmaBackground(),
        Positioned(
          top: 48,
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedCircle(),
              CounterValue(),
            ],
          ),
        ),
        Positioned(
          bottom: 48,
          child: CounterSlider(),
        ),
      ]),
    );
  }
}
