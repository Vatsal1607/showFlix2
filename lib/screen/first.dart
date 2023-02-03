import 'package:update_showflix/screen/login.dart';
import 'package:update_showflix/wudget/imageList.dart';
import 'package:flutter/material.dart';

class First extends StatelessWidget {
  const First({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
                child: ShaderMask(
              blendMode: BlendMode.dstOut,
              shaderCallback: (rect) {
                return LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.transparent,
                      Colors.black.withOpacity(0.9),
                      Colors.black.withOpacity(0.8),
                      Colors.black
                    ],
                    stops: [
                      0,
                      0.20,
                      0.67,
                      0.85,
                      1
                    ]).createShader(rect);
              },
              child: SingleChildScrollView(
                child: Column(
                  children: const <Widget>[
                    SizedBox(height: 10),
                    ImageList(
                      startingIndex: 1,
                      duration: 65,
                    ),
                    SizedBox(height: 10),
                    ImageList(
                      startingIndex: 1,
                      duration: 20,
                    ),
                    SizedBox(height: 10),
                    ImageList(
                      startingIndex: 1,
                      duration: 70,
                    ),
                    SizedBox(height: 10),
                    ImageList(
                      startingIndex: 1,
                      duration: 70,
                    ),
                    SizedBox(height: 10),
                    ImageList(
                      startingIndex: 1,
                      duration: 10,
                    ),
                  ],
                ),
              ),
            )),
            Positioned(
                bottom: 100,
                left: 24,
                right: 24,
                child: Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome To ShowFlix",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Entertainment is Life to Live",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(height: 30),
                    SizedBox(
                      width: 360.0,
                      height: 50,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.amber)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const login()),
                          );
                        },
                        child: Text(
                          "Get Started",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                )))
          ],
        ),
      ),
    );
  }
}
