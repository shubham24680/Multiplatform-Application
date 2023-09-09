import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:realm/app_bar.dart';

Route page4Route() {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const Page4(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      });
}

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  static const name = "Indicators";
  static const color = Colors.amberAccent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildPageAppBar(name, color, context),
      body: const BuildPage(),
    );
  }
}

class BuildPage extends StatelessWidget {
  const BuildPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Indicator(),
          SizedBox(height: 110),
          CircularProgressIndicator(
            color: Colors.yellow,
            strokeWidth: 2,
          ),
          SizedBox(height: 15),
          LinearProgressIndicator(
            backgroundColor: Colors.orange,
            valueColor: AlwaysStoppedAnimation(Colors.red),
            minHeight: 3,
          ),
        ],
      ),
    );
  }
}

class Indicator extends StatefulWidget {
  const Indicator({super.key});

  @override
  State<Indicator> createState() => _IndicatorState();
}

class _IndicatorState extends State<Indicator> {
  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 100,
      lineWidth: 10,
      percent: 0.9,
      backgroundColor: Colors.grey.shade200,
      progressColor: Colors.yellow.shade700,
      circularStrokeCap: CircularStrokeCap.round,
      animation: true,
      animationDuration: 2000,
      center: Icon(
        Icons.stacked_bar_chart,
        size: 40,
        color: Colors.yellow.shade700,
      ),
    );
  }
}
