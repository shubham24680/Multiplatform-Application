import 'package:flutter/material.dart';
import 'package:realm/app_bar.dart';

class AboutDialogScreen extends StatelessWidget {
  const AboutDialogScreen({super.key});

  static const name = "About Dialog";
  static const color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildPageAppBar(name, color, context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => const AboutDialog(
                        applicationIcon: FlutterLogo(),
                        applicationLegalese: 'legalese',
                        applicationName: "Realm",
                        applicationVersion: 'version 2.2.0',
                        children: [Text("Click View Licenses for More.")],
                      ));
            },
            child: const Text("Show About Dialog"),
          ),
          const AboutListTile(
            icon: Icon(Icons.info),
            applicationIcon: FlutterLogo(),
            applicationLegalese: 'legalese',
            applicationName: 'Realm',
            applicationVersion: '2.4.6',
            aboutBoxChildren: [Text('Click to meet again')],
          )
        ],
      ),
    );
  }
}
