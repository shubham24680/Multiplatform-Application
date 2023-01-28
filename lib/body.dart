import 'package:flutter/material.dart';
import 'pages/animationAlign.dart';
import 'pages/aboutDialog.dart';
import 'pages/absorbPointer.dart';
import 'pages/themes.dart';
import 'pages/expansionTileCard.dart';
import 'pages/url.dart';
import 'pages/skeletonText.dart';
import 'pages/indicatorAndDialog.dart';
import 'pages/lazyLoader.dart';
import 'pages/lottieAnimation.dart';
import 'pages/hingeAnimation.dart';
import 'pages/heroAnimation.dart';
import 'pages/physicsAnimation.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TabBarView(children: [
      Collections(1),
      Collections(2),
      Collections(3),
    ]);
  }
}

class Collections extends StatelessWidget {
  const Collections(this.id, {Key? key}) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    switch (id) {
      case 1:
        return OrientationBuilder(builder: ((context, orientation) {
          return GridView.count(
            crossAxisCount: orientation == Orientation.portrait ? 2 : 5,
            children: [
              button(context, 1, Colors.lightBlueAccent, 'Themes'),
              button(context, 2, Colors.pinkAccent, 'Expansion Tile Card'),
              button(context, 10, Colors.black54, "URL"),
              button(context, 12, Colors.deepOrange, "Absorb Pointer"),
            ],
          );
        }));
      case 2:
        return OrientationBuilder(builder: ((context, orientation) {
          return GridView.count(
            crossAxisCount: orientation == Orientation.portrait ? 2 : 5,
            children: [
              button(context, 3, Colors.greenAccent, 'Skeleton Text'),
              button(context, 4, Colors.amberAccent,
                  'Circular & Linear Progress Indicator With Alert Dialog '),
              button(context, 5, Colors.teal, 'Lazy Loader'),
              button(context, 11, Colors.blue, 'About Dialog')
            ],
          );
        }));
    }
    return OrientationBuilder(builder: ((context, orientation) {
      return GridView.count(
        crossAxisCount: orientation == Orientation.portrait ? 2 : 5,
        children: [
          button(context, 6, Colors.purpleAccent, 'Lottie Animation'),
          button(context, 7, Colors.lightGreenAccent, 'Hinge Animation'),
          button(context, 8, Colors.cyanAccent, 'Radial Hero Animation'),
          button(
              context, 9, Colors.redAccent, 'Physics Simulation in Animation'),
          button(context, 13, Colors.grey, 'Animation Align'),
        ],
      );
    }));
  }

  Padding button(context, id, color, title) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            switch (id) {
              case 1:
                return const Page1();
              case 2:
                return const Page2();
              case 3:
                return const Page3();
              case 4:
                return const Page4();
              case 5:
                return const Page5();
              case 6:
                return const Page6();
              case 7:
                return const Page7();
              case 8:
                return const Page8();
              case 9:
                return const Page9();
              case 10:
                return const URL();
              case 11:
                return const AboutDialogScreen();
              case 12:
                return const AbsorbPointerScreen();
            }
            return const AnimationAlign();
          }));
        },
        style: ElevatedButton.styleFrom(backgroundColor: color, elevation: 5.0),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'DynaPuff',
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
