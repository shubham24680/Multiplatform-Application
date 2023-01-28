import 'package:flutter/material.dart';
import 'package:realm/app_bar.dart';

class AnimationAlign extends StatelessWidget {
  const AnimationAlign({super.key});

  static const name = "Animation Align";
  static const color = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildPageAppBar(name, color, context),
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Center(
          child: Container(
        height: 250.0,
        width: double.infinity,
        color: Colors.grey,
        child: AnimatedAlign(
          alignment: selected ? Alignment.bottomLeft : Alignment.topRight,
          duration: const Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          child: const Icon(
            Icons.circle,
            size: 50.0,
          ),
        ),
      )),
    );
  }
}
