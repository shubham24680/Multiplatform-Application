// ignore_for_file: file_names
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:realm/app_bar.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  static const name = "Expansion Tile Card";
  static const color = Colors.pinkAccent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildPageAppBar(name, color, context),
      body: BuildPage(),
    );
  }
}

class BuildPage extends StatelessWidget {
  BuildPage({Key? key}) : super(key: key);

  final GlobalKey<ExpansionTileCardState> cardA = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
        child: ExpansionTileCard(
            key: cardA,
            expandedTextColor: Colors.pinkAccent,
            leading: const CircleAvatar(
              backgroundImage: AssetImage(
                  'assets/images/alita-battle-angel-movie-uhdpaper.com-4K-14.jpg'),
            ),
            title: const Text(
              'ALITA',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontFamily: 'DynaPuff'),
            ),
            subtitle: const Text(
              'Battle Angle',
              style: TextStyle(fontSize: 10.0),
            ),
            children: [
              const Divider(thickness: 1.0, height: 1.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Image.asset('assets/images/1791137.jpg'),
                ),
              )
            ]),
      ),
      // Container(
      //   margin: const EdgeInsets.symmetric(vertical: 20.0),
      //   height: double.infinity,
      //   child: ListView(
      //     scrollDirection: Axis.horizontal,
      //     children: <Widget>[
      //       Container(
      //         width: 1080.0,
      //         decoration: const BoxDecoration(
      //           image: DecorationImage(
      //             image: AssetImage('assets/images/164293.jpg'),
      //             fit: BoxFit.fill,
      //           ),
      //           shape: BoxShape.rectangle,
      //         ),
      //         child: const Text(
      //           'Home Page',
      //           style: TextStyle(fontSize: 28, color: Colors.white),
      //         ),
      //       ),
      //       Container(
      //         width: 1080.0,
      //         decoration: const BoxDecoration(
      //           image: DecorationImage(
      //             image: AssetImage('assets/images/1791137.jpg'),
      //             fit: BoxFit.fill,
      //           ),
      //           shape: BoxShape.rectangle,
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    ]);
  }
}
