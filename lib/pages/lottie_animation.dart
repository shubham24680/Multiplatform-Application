import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:realm/app_bar.dart';

class Page6 extends StatelessWidget {
  const Page6({Key? key}) : super(key: key);

  static const name = "Lottie Animation";
  static const color = Colors.purpleAccent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildPageAppBar(name, color, context),
      body: const LottiePage(),
    );
  }
}

class LottiePage extends StatefulWidget {
  const LottiePage({Key? key}) : super(key: key);

  @override
  State<LottiePage> createState() => _LottiePageState();
}

class _LottiePageState extends State<LottiePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.network(
              'https://assets1.lottiefiles.com/private_files/lf30_QLsD8M.json',
              height: 200.0,
              repeat: true,
              reverse: true,
              animate: true,
            ),
            Lottie.network(
              'https://assets1.lottiefiles.com/private_files/lf30_yQtj4O.json',
              repeat: true,
              reverse: true,
              animate: true,
            )
          ],
        ),
      ),
    );
  }
}
