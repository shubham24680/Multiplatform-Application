import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:realm/app_bar.dart';

class Page5 extends StatelessWidget {
  const Page5({Key? key}) : super(key: key);

  static const name = "Lazy Loader";
  static const color = Colors.teal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildPageAppBar(name, color, context),
      body: const UpdatePage(title: name),
    );
  }
}

class UpdatePage extends StatefulWidget {
  const UpdatePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  List<int> data = [];
  int currentLength = 0;

  final int increment = 5;
  bool isLoading = false;

  @override
  void initState() {
    _loadMore();
    super.initState();
  }

  Future _loadMore() async {
    setState(() {
      isLoading = true;
    });

    for (var i = currentLength; i <= currentLength + increment; i++) {
      data.add(i);
    }
    setState(() {
      isLoading = false;
      currentLength = data.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LazyLoadScrollView(
        isLoading: isLoading,
        onEndOfPage: () => _loadMore(),
        child: ListView.builder(itemBuilder: (context, position) {
          return DemoItem(position);
        }),
      ),
    );
  }
}

class DemoItem extends StatelessWidget {
  const DemoItem(this.position, {Key? key}) : super(key: key);
  final int position;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  color: Colors.blue,
                  height: 40.0,
                  width: 40.0,
                ),
                const SizedBox(width: 8.0),
                Text("Item $position"),
              ],
            ),
            const Text(
              "GeeksforGeeks.org was created with a goal "
              "in mind to provide well written, well "
              "thought and well explained solutions for selected"
              " questions. The core team of five super geeks"
              " constituting of technology lovers and computer"
              " science enthusiasts have been constantly working"
              " in this direction .",
            ),
          ],
        ),
      ),
    );
  }
}
