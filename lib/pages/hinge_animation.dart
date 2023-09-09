import 'package:flutter/material.dart';
import 'package:realm/app_bar.dart';

class Page7 extends StatelessWidget {
  const Page7({Key? key}) : super(key: key);

  static const name = "Hinge Animation";
  static const color = Colors.lightGreenAccent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildPageAppBar(name, color, context),
      body: const HingeAnimation(),
    );
  }
}

class HingeAnimation extends StatefulWidget {
  const HingeAnimation({Key? key}) : super(key: key);

  @override
  State<HingeAnimation> createState() => _HingeAnimationState();
}

class _HingeAnimationState extends State<HingeAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  late Animation<double> _slideAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    _rotationAnimation = Tween(end: 0.15, begin: 0.0).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(
        0.0,
        0.5,
        curve: Curves.bounceInOut,
      ),
    ));

    _slideAnimation = Tween(begin: 100.0, end: 600.0).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(
        0.5,
        1.0,
        curve: Curves.fastOutSlowIn,
      ),
    ));

    _opacityAnimation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(
        0.5,
        1.0,
        curve: Curves.fastOutSlowIn,
      ),
    ));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _slideAnimation,
        builder: (context, child) => Container(
          width: 200,
          height: 150,
          padding: const EdgeInsets.all(0),
          margin: EdgeInsets.only(
            left: 100,
            top: _slideAnimation.value,
          ),
          child: RotationTransition(
            turns: _rotationAnimation,
            child: Center(
              child: Text(
                'RAGNAROK',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(300, 150, 500, _opacityAnimation.value),
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green[300],
        onPressed: () {
          _controller.forward();
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
