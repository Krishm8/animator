import 'package:flutter/material.dart';

class PlanetDetailPage extends StatefulWidget {
  final Map<String, String> planet;

  const PlanetDetailPage({Key? key, required this.planet}) : super(key: key);

  @override
  State<PlanetDetailPage> createState() => _PlanetDetailPageState();
}

class _PlanetDetailPageState extends State<PlanetDetailPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _imageScaleAnimation;
  late Animation<double> _textFadeAnimation;
  late Animation<double> _buttonScaleAnimation;
  late Animation<double> _rotationAnimation;
  ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _imageScaleAnimation = Tween<double>(begin: 0.8, end: 1.0)
        .chain(CurveTween(curve: Curves.easeInOutQuint))
        .animate(_controller);

    _textFadeAnimation = Tween<double>(begin: 0, end: 1)
        .chain(CurveTween(curve: Curves.easeIn))
        .animate(_controller);

    _buttonScaleAnimation = Tween<double>(begin: 0.8, end: 1.0)
        .chain(CurveTween(curve: Curves.elasticOut))
        .animate(_controller);

    _rotationAnimation = Tween<double>(begin: 0, end: 1)
        .chain(CurveTween(curve: Curves.easeInOut))
        .animate(_controller);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          Image.asset(
            "assets/images/bg.jpg",
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          SingleChildScrollView(
            controller: controller,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Center(
                    child: RotationTransition(
                      turns: _rotationAnimation,
                      child: ScaleTransition(
                        scale: _imageScaleAnimation,
                        child: Container(
                          height: 300,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              widget.planet['image']!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return FadeTransition(
                        opacity: _textFadeAnimation,
                        child: Transform.translate(
                          offset:
                          Offset(0, (1 - _textFadeAnimation.value) * 20),
                          child: Center(
                            child: Text(
                              widget.planet['name']!,
                              style: TextStyle(
                                fontSize: 40,
                                color: Colors.white,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 20),
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return FadeTransition(
                        opacity: _textFadeAnimation,
                        child: Transform.translate(
                          offset:
                          Offset(0, (1 - _textFadeAnimation.value) * 20),
                          child: Container(
                            padding: EdgeInsets.all(15),
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.white12,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: Text(
                                widget.planet['description']!,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white70,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 60),
                  Center(
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        return Transform(
                          transform: Matrix4.rotationX(
                              2 * 3.14159 * _rotationAnimation.value),
                          child: ElevatedButton(
                            onPressed: () {
                              controller.animateTo(
                                950,
                                duration: Duration(seconds: 3),
                                curve: Curves.bounceInOut,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blueAccent,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 15),
                                foregroundColor: Colors.white),
                            child: Text(
                              'Explore More',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 150, top: 250),
                    child: RotationTransition(
                      turns: _rotationAnimation,
                      child: ScaleTransition(
                        scale: _imageScaleAnimation,
                        child: Image.asset(
                          widget.planet['img']!,
                          fit: BoxFit.cover,
                          height: 300,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Center(
                          child: Text(
                            'More about ${widget.planet['name']}',
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.white12!,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            "${widget.planet['newDescription']!}",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white70,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            controller.animateTo(-900,
                                duration: Duration(seconds: 3),
                                curve: Curves.bounceIn);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 15,
                            ),
                          ),
                          child: Text(
                            'Go Back',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 70),
            child: InkWell(
              onTap: () {
                print("hello");
                Navigator.pushReplacementNamed(context, "home");
              },
              child: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 70),
            child: InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(context, "home");
              },
              child: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
