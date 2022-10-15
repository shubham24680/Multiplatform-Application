import 'package:flutter/material.dart';
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

  static const name = "CLP Indicator With Alert Dialog";
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
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const CircularProgressIndicator(
          backgroundColor: Colors.lightGreenAccent,
          valueColor: AlwaysStoppedAnimation(Colors.greenAccent),
          strokeWidth: 3,
        ),
        const SizedBox(height: 15),
        const LinearProgressIndicator(
          backgroundColor: Colors.lightGreenAccent,
          valueColor: AlwaysStoppedAnimation(Colors.greenAccent),
          minHeight: 3,
        ),
        AlertDialog(
          title: const Text('Welcome'),
          content: const Text('Do or Die'),
          actions: [
            TextButton(onPressed: () {}, child: const Text('CANCEL')),
            TextButton(onPressed: () {}, child: const Text('ACCEPT'))
          ],
        )
      ]),
    );
  }
}
