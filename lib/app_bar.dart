import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'body.dart';
import 'drawer.dart';

class AppBarScreen extends StatelessWidget {
  const AppBarScreen({Key? key}) : super(key: key);

  static const name = "Dashboard";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: buildAppBar(),
        body: const Body(),
        drawer: const DrawerScreen(),
      ),
    );
  }
}

AppBar buildAppBar() {
  return AppBar(
    flexibleSpace: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.pink, Colors.purple],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
    ),
    leading: Builder(
      builder: ((context) => IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: SvgPicture.asset(
              "assets/icons/apps.svg",
              color: Colors.white70,
            ),
          )),
    ),
    elevation: 10,
    toolbarHeight: 60,
    toolbarOpacity: 0.8,
    centerTitle: true,
    title: const Text(
      AppBarScreen.name,
      style: TextStyle(
        fontFamily: 'Edu VIC WA NT Beginner',
        fontWeight: FontWeight.bold,
      ),
    ),
    actions: <Widget>[
      IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(
          "assets/icons/search.svg",
          color: Colors.white70,
        ),
      ),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: CircleAvatar(
          backgroundImage: AssetImage("assets/images/125.jpg"),
        ),
      ),
    ],
    bottom: TabBar(
      tabs: [
        Tab(
          icon: SvgPicture.asset(
            "assets/icons/browser.svg",
            color: Colors.white,
          ),
          child: const Text(
            'Pages',
            style: TextStyle(
              fontFamily: 'Edu VIC WA NT Beginner',
            ),
          ),
        ),
        Tab(
          icon: SvgPicture.asset(
            "assets/icons/loading.svg",
            color: Colors.white,
          ),
          child: const Text(
            'Loaders',
            style: TextStyle(
              fontFamily: 'Edu VIC WA NT Beginner',
            ),
          ),
        ),
        Tab(
          icon: SvgPicture.asset(
            "assets/icons/animate.svg",
            color: Colors.white,
          ),
          child: const Text(
            'Animation',
            style: TextStyle(
              fontFamily: 'Edu VIC WA NT Beginner',
            ),
          ),
        )
      ],
      indicatorColor: Colors.white,
      indicatorWeight: 3,
    ),
  );
}

AppBar buildPageAppBar(name, color, context) {
  return AppBar(
    backgroundColor: color,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(25.0),
        bottomRight: Radius.circular(25.0),
      ),
    ),
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      tooltip: 'Back',
      icon: SvgPicture.asset(
        'assets/icons/angle-left.svg',
        color: Colors.white70,
      ),
    ),
    titleSpacing: 0.0,
    centerTitle: true,
    title: Text(
      name,
      style: const TextStyle(fontFamily: 'Edu VIC WA NT Beginner'),
    ),
    actions: <Widget>[
      IconButton(
        onPressed: () {},
        tooltip: 'Like',
        icon: SvgPicture.asset(
          'assets/icons/heart.svg',
          color: Colors.white70,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: IconButton(
          onPressed: () {},
          tooltip: 'Comment',
          icon: SvgPicture.asset(
            'assets/icons/comment-alt.svg',
            color: Colors.white70,
          ),
        ),
      ),
    ],
  );
}
