import 'package:flutter/material.dart';
import 'package:realm/app_bar.dart';
import 'package:url_launcher/url_launcher.dart';

_launchURLBrowser() async {
  var url = Uri.parse('https://www.geeksforgeeks.org/urls-in-flutter/?ref=lbp');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw "Could not launch $url";
  }
}

_launchURLApp() async {
  var url = Uri.parse('https://www.geeksforgeeks.org/urls-in-flutter/?ref=lbp');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw "Could not launch $url";
  }
}

class URL extends StatelessWidget {
  const URL({Key? key}) : super(key: key);

  static const name = "URL";
  static const color = Colors.black54;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: buildPageAppBar(name, color, context),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Geeks for Geeks URL",
                style: TextStyle(fontFamily: 'DynaPuff'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: ElevatedButton(
                  onPressed: () => _launchURLBrowser(),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black54),
                  child: const Text("Browser"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: ElevatedButton(
                  onPressed: () => _launchURLApp(),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black54),
                  child: const Text("App"),
                ),
              ),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
