import 'package:flutter/material.dart';

class AnimatedPage extends StatefulWidget {
  const AnimatedPage({Key? key}) : super(key: key);
  
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
        title: const Text('Animation'),
      ),
      body: Center(
        child: Stack(alignment: Alignment.center, children: [
          AnimatedOpacity(
              duration: const Duration(seconds: 1),
              opacity: index == 0 ? 1 : 0,
              child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                  ))),
          AnimatedOpacity(
              duration: const Duration(seconds: 1),
              opacity: index == 1 ? 1 : 0,
              child: ClipPath(
                clipper: Hexagon(),
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                  ),
                ),
              )),
          AnimatedOpacity(
              duration: const Duration(seconds: 1),
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
        child: const Icon(Icons.switch_left),
      ),
    );
  }
}

class Hexagon extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    double w = size.width;
    double h = size.height;
    
    // Create a proper hexagon
    path.moveTo(w * 0.5, 0); // Top center
    path.lineTo(w * 0.875, h * 0.25); // Top right
    path.lineTo(w * 0.875, h * 0.75); // Bottom right
    path.lineTo(w * 0.5, h); // Bottom center
    path.lineTo(w * 0.125, h * 0.75); // Bottom left
    path.lineTo(w * 0.125, h * 0.25); // Top left
    path.close();
    
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
