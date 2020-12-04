import 'package:flutter/material.dart';

class AnimatedPage extends StatefulWidget {
  @override
  _AnimatedPageState createState() => _AnimatedPageState();
}

class _AnimatedPageState extends State<AnimatedPage> {
  double index = 0;

  void _animateShape() {
    setState(() {
      index = index == 2 ? 0 : index + 1;
    });
    print(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation'),
      ),
      body: Center(
        child: Stack(alignment: Alignment.center, children: [
          AnimatedOpacity(
              duration: Duration(seconds: 1),
              opacity: index == 0 ? 1 : 0,
              child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                  ))),
                  //In this widget, I aimed to make the container take the shape of the child clipPath but I was not able to achieve 
                  //my target on time
          AnimatedOpacity(
              duration: Duration(seconds: 1),
              opacity: index == 1 ? 1 : 0,
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
                child: ClipPath(
                  clipper: Hexagon(),
                ),
              )),
          AnimatedOpacity(
              duration: Duration(seconds: 1),
              opacity: index == 2 ? 1 : 0,
              child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(100),
                  ))),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _animateShape,
        tooltip: 'Animate',
        child: Icon(Icons.switch_left),
      ),
    );
  }
}

class Hexagon extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width * 0.2, 0);
    path.lineTo(size.width * 0.8, 0);
    path.lineTo(size.width, size.height * 0.25);
    path.lineTo(size.width * 0.8, size.height * 0.5);
    path.lineTo(size.width * 0.2, size.height * 0.5);
    path.lineTo(0, size.height * 0.25);
    path.lineTo(size.width * 0.2, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
