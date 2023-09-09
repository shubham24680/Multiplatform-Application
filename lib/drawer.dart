import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildDrawer();
  }
}

Drawer buildDrawer() {
  return Drawer(
    backgroundColor: Colors.transparent,
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      color: Colors.white,
      child: Column(children: [
        Container(
          width: double.infinity,
          height: 200,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.pink, Colors.purple],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircleAvatar(
                  backgroundImage: AssetImage("assets/images/125.jpg"),
                  radius: 40.0,
                ),
                Text(
                  "Shubham Patel",
                  style: TextStyle(
                    fontFamily: 'Edu VIC WA NT Beginner',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  "subhampatel8092@gmail.com",
                  style: TextStyle(
                    fontFamily: 'Edu VIC WA NT Beginner',
                    color: Colors.white,
                    fontSize: 15,
                  ),
                )
              ]),
        ),
        menuItem(Icons.ad_units, "URL"),
        menuItem(Icons.dashboard_rounded, "DashBoard"),
        menuItem(Icons.person, "My Account"),
        menuItem(Icons.book, "My Courses"),
        menuItem(Icons.bookmark, 'Bookmarks'),
        menuItem(Icons.settings, "Settings"),
        const Divider(color: Colors.black45),
        menuItem(Icons.logout, "Log Out"),
      ]),
    ),
  );
}

Widget menuItem(newIcons, name) {
  return ElevatedButton(
    onPressed: () {},
    style:
        ElevatedButton.styleFrom(backgroundColor: Colors.white, elevation: 0.0),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Row(children: [
        Expanded(
          child: Icon(
            newIcons,
            color: Colors.black,
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            name,
            style: const TextStyle(
              color: Colors.black,
              fontFamily: 'DynaPuff',
              fontSize: 16.0,
            ),
          ),
        ),
      ]),
    ),
  );
}

// Drawer buildDrawer() {
//   return Drawer(
//     child: ListView(padding: const EdgeInsets.all(0), children: const [
//       DrawerHeader(
//         decoration: BoxDecoration(color: Colors.purple),
//         child: UserAccountsDrawerHeader(
//           decoration: BoxDecoration(color: Colors.purple),
//           accountName: Text(
//             "Shubham Patel",
//             style: TextStyle(fontSize: 18),
//           ),
//           accountEmail: Text(
//             "pateljiyourfather@gmail.com",
//           ),
//           currentAccountPictureSize: Size.square(50),
//           currentAccountPicture: CircleAvatar(
//             backgroundColor: Colors.blue,
//             child: Text(
//               'S',
//               style: TextStyle(fontSize: 30, color: Colors.purple),
//             ),
//           ),
//         ),
//       ),
//       ListTile(
//         leading: Icon(Icons.person),
//         title: Text('My Account'),
//       ),
//       ListTile(
//         leading: Icon(Icons.book),
//         title: Text('My Course'),
//       ),
//       ListTile(
//         leading: Icon(Icons.workspace_premium),
//         title: Text('Go Premium'),
//       ),
//       ListTile(
//         leading: Icon(Icons.video_label),
//         title: Text('Saved Videos'),
//       ),
//       Divider(
//         color: Colors.black54,
//       ),
//       ListTile(
//         leading: Icon(Icons.edit),
//         title: Text('Edit Profile'),
//       ),
//       ListTile(
//         leading: Icon(Icons.logout),
//         title: Text('LogOut'),
//       ),
//     ]),
//   );
// }
