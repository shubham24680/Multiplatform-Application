import 'package:flutter/material.dart';
import 'package:realm/app_bar.dart';
import 'dart:math' as math;

class AnimeBuilder extends StatelessWidget {
  const AnimeBuilder({super.key});

  static const name = "Animation Builder";
  static const color = Colors.amber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildPageAppBar(name, color, context),
      body: const Anime(),
    );
  }
}

class Anime extends StatefulWidget {
  const Anime({super.key});

  @override
  State<Anime> createState() => _AnimeState();
}

class _AnimeState extends State<Anime> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 10),
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        child: FlutterLogo(
          size: 100,
        ),
        builder: ((context, child) => Transform.rotate(
              angle: _controller.value * 2.0 * math.pi,
              child: child,
            )),
      ),
    );
  }
}
