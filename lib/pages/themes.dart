import 'package:flutter/material.dart';
import 'package:realm/app_bar.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  static const name = "Themes";
  static const color = Colors.lightBlueAccent;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
        fontFamily: 'DynaPuff',
        backgroundColor: Colors.lightBlueAccent[100],
      ),
      home: Scaffold(
        appBar: buildPageAppBar(name, color, context),
        body: const BuildPage(),
        floatingActionButton: Theme(
          data: Theme.of(context).copyWith(
              colorScheme: Theme.of(context)
                  .colorScheme
                  .copyWith(secondary: Colors.lightBlueAccent)),
          child: const FloatButton(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          fixedColor: Colors.lightBlueAccent,
          items: const [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: "Search",
              icon: Icon(Icons.search),
            ),
            BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(Icons.account_circle),
            ),
          ],
          onTap: (int indexOfItem) {},
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BuildPage extends StatelessWidget {
  const BuildPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: Column(children: [
        Container(
          height: 30.0,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(
            child: Text(
              "Horizon Zero Dawn",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ),
        ),
        Container(
          height: 150.0,
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          margin: const EdgeInsets.only(top: 10.0),
          decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              borderRadius: BorderRadius.circular(10.0)),
          child: Center(
            child: Text(
              "Horizon Zero Dawn is a 2017 action role-playing game developed by Guerrilla Games and published by Sony Interactive Entertainment. The plot follows Aloy, a young hunter in a world overrun by machines, who sets out to uncover her past.",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                fontFamily: 'Edu VIC WA NT Beginner',
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Container(
          height: 30.0,
          width: double.maxFinite,
          margin: const EdgeInsets.only(top: 10.0),
          decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              borderRadius: BorderRadius.circular(10.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: const [
                  Icon(
                    Icons.star_rounded,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.star_rounded,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.star_rounded,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.star_rounded,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.star_rounded,
                    color: Colors.white60,
                  ),
                ],
              ),
              Text(
                "170 Reviews",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 100.0,
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          margin: const EdgeInsets.only(top: 10.0),
          decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              borderRadius: BorderRadius.circular(10.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (int i = 0; i < 3; i++)
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    Text(
                      "Time",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontFamily: 'Edu VIC WA NT Beginner',
                      ),
                    ),
                    Text(
                      "10 Hr.",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontFamily: 'Edu VIC WA NT Beginner',
                      ),
                    ),
                  ],
                )
            ],
          ),
        ),
        Expanded(
          child: Container(
              height: 50,
              // width: double.maxFinite,
              margin: const EdgeInsets.only(top: 10.0),
              child: Expanded(
                child: Image.asset(
                  'assets/images/1791165.jpg',
                  fit: BoxFit.cover,
                ),
              )),
        ),
      ]),
    );
  }
}

class FloatButton extends StatefulWidget {
  const FloatButton({super.key});

  @override
  State<FloatButton> createState() => _FloatButtonState();
}

class _FloatButtonState extends State<FloatButton> {
  int _count = 0;

  void _increment() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: _increment,
      tooltip: 'Balance',
      child: Text(
        "$_count",
        style: const TextStyle(fontSize: 20.0),
      ),
    );
  }
}
