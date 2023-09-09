import 'package:flutter/material.dart';
import 'pages/animation_align.dart';
import 'pages/about_dialog.dart';
import 'pages/absorb_pointer.dart';
import 'pages/animation_builder.dart';
import 'pages/heat_map.dart';
import 'pages/refresh.dart';
import 'pages/themes.dart';
import 'pages/expansion_tile_card.dart';
import 'pages/url.dart';
import 'pages/skeleton_text.dart';
import 'pages/indicator_and_dialog.dart';
import 'pages/lazy_loader.dart';
import 'pages/lottie_animation.dart';
import 'pages/hinge_animation.dart';
import 'pages/hero_animation.dart';
import 'pages/physics_animation.dart';

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
            crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
            children: [
              button(context, 1, Colors.lightBlueAccent, 'Themes'),
              button(context, 2, Colors.pinkAccent, 'Expansion Tile Card'),
              button(context, 10, Colors.black54, "URL"),
              button(context, 12, Colors.deepOrange, "Absorb Pointer"),
              button(context, 16, Colors.green, "Heat Map"),
            ],
          );
        }));
      case 2:
        return OrientationBuilder(builder: ((context, orientation) {
          return GridView.count(
            crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
            children: [
              button(context, 3, Colors.greenAccent, 'Skeleton Text'),
              button(context, 4, Colors.amberAccent,
                  'Circular & Linear Progress Indicator With Alert Dialog '),
              button(context, 5, Colors.teal, 'Lazy Loader'),
              button(context, 11, Colors.blue, 'About Dialog'),
              button(context, 15, Colors.red, 'Liquid Pull To Refresh'),
            ],
          );
        }));
    }
    return OrientationBuilder(builder: ((context, orientation) {
      return GridView.count(
        crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
        children: [
          button(context, 6, Colors.purpleAccent, 'Lottie Animation'),
          button(context, 7, Colors.lightGreenAccent, 'Hinge Animation'),
          button(context, 8, Colors.cyanAccent, 'Radial Hero Animation'),
          button(
              context, 9, Colors.redAccent, 'Physics Simulation in Animation'),
          button(context, 13, Colors.grey, 'Animation Align'),
          button(context, 14, Colors.amber, 'Animation Builder'),
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
              case 13:
                return const AnimationAlign();
              case 14:
                return const AnimeBuilder();
              case 15:
                return const Refresh();
            }
            return const MyHeatMap();
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
