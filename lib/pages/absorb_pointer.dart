import 'package:flutter/material.dart';
import 'package:realm/app_bar.dart';

class AbsorbPointerScreen extends StatelessWidget {
  const AbsorbPointerScreen({super.key});

  static const name = "Absorb Pointer";
  static const color = Colors.deepOrange;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildPageAppBar(name, color, context),
      body: Center(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: <Widget>[
            SizedBox(
              width: 200.0,
              height: 100.0,
              child: ElevatedButton(
                onPressed: () {},
                child: null,
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[700]),
              ),
            ),
            SizedBox(
              width: 100.0,
              height: 200.0,
              child: AbsorbPointer(
                child: ElevatedButton(
                  onPressed: () {},
                  child: null,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
