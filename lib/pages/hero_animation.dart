import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:realm/app_bar.dart';

class Page8 extends StatelessWidget {
  const Page8({Key? key}) : super(key: key);

  static const name = "Radial Hero Animation";
  static const color = Colors.cyanAccent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildPageAppBar(name, color, context),
      body: const RadialExpansionDemo(),
    );
  }
}

class RadialExpansionDemo extends StatelessWidget {
  static const double kMinRadius = 32.0;
  static const double kMaxRadius = 128.0;
  static const opacityCurve = Interval(0.0, 0.75, curve: Curves.fastOutSlowIn);
  static RectTween _createRectTween(Rect? begin, Rect? end) {
    return MaterialRectArcTween(begin: begin, end: end);
  }

  static Widget _buildPage(
      BuildContext context, String imageName, String description) {
    return Container(
      color: Theme.of(context).canvasColor,
      child: Center(
        child: Card(
          elevation: 8.0,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            SizedBox(
              width: kMaxRadius * 2.0,
              height: kMaxRadius * 2.0,
              child: Hero(
                createRectTween: _createRectTween,
                tag: imageName,
                child: RadialExpansion(
                  maxRadius: kMaxRadius,
                  child: Photo(
                    photo: imageName,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ),
            ),
            Text(
              description,
              style: const TextStyle(fontWeight: FontWeight.bold),
              textScaleFactor: 3.0,
            ),
            const SizedBox(
              height: 20.0,
            ),
          ]),
        ),
      ),
    );
  }

  Widget _buildHero(
      BuildContext context, String imageName, String description) {
    return SizedBox(
      width: kMinRadius * 3.0,
      height: kMinRadius * 3.0,
      child: Hero(
        createRectTween: _createRectTween,
        tag: imageName,
        child: RadialExpansion(
          maxRadius: kMaxRadius,
          child: Photo(
              photo: imageName,
              onTap: () {
                Navigator.of(context).push(PageRouteBuilder<void>(pageBuilder:
                    (BuildContext context, Animation<double> animation,
                        Animation<double> secondaryAnimation) {
                  return AnimatedBuilder(
                      animation: animation,
                      builder: (context, child) {
                        return Opacity(
                          opacity: opacityCurve.transform(animation.value),
                          child: _buildPage(context, imageName, description),
                        );
                      });
                }));
              }),
        ),
      ),
    );
  }

  const RadialExpansionDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    timeDilation = 4.0;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(33.0),
        alignment: FractionalOffset.bottomLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildHero(context, 'assets/images/20200304_020853.jpg', 'Kratos'),
            _buildHero(context, 'assets/images/1791165.jpg', 'Horizon'),
            _buildHero(
                context,
                'assets/images/alita-battle-angel-movie-uhdpaper.com-4K-14.jpg',
                'Alita'),
          ],
        ),
      ),
    );
  }
}

class RadialExpansion extends StatelessWidget {
  const RadialExpansion(
      {Key? key, required this.maxRadius, required this.child})
      : clipRectSize = 2.0 * (maxRadius / math.sqrt2),
        super(key: key);

  final double maxRadius;
  // ignore: prefer_typing_uninitialized_variables
  final clipRectSize;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Center(
        child: SizedBox(
          width: clipRectSize,
          height: clipRectSize,
          child: ClipRect(
            child: child,
          ),
        ),
      ),
    );
  }
}

class Photo extends StatelessWidget {
  const Photo({Key? key, required this.photo, required this.onTap})
      : super(key: key);

  final String photo;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).primaryColor.withOpacity(0.25),
      child: InkWell(
        onTap: onTap,
        child: LayoutBuilder(
          builder: (context, size) {
            return Image.asset(
              photo,
              fit: BoxFit.cover,
            );
          },
        ),
      ),
    );
  }
}
