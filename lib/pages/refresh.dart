import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../app_bar.dart';

class Refresh extends StatelessWidget {
  const Refresh({super.key});

  static const name = "Liquid Pull To Refresh";
  static const color = Colors.red;

  Future<void> _handleRefresh() async {
    return await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildPageAppBar(name, color, context),
      body: liquid(),
    );
  }

  liquid() {
    return LiquidPullToRefresh(
      onRefresh: _handleRefresh,
      backgroundColor: Colors.red,
      springAnimationDurationInMilliseconds: 200,
      color: Colors.transparent,
      showChildOpacityTransition: false,
      child: ListView(
        children: [
          for (int i = 0; i < 5; i++)
            Container(
              margin: const EdgeInsets.all(10),
              height: 300,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(20),
              ),
            )
        ],
      ),
    );
  }
}
