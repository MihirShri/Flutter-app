//@dart=2.9
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:confetti/confetti.dart';
import 'dart:math';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:kat_mi/homescreen.dart';
import 'dart:async';

// ignore: camel_case_types
class startingScreen extends StatefulWidget {
  @override
  _startingScreenState createState() => _startingScreenState();
}

// ignore: camel_case_types
class _startingScreenState extends State<startingScreen> {
  ConfettiController _controllerCenterRight;
  ConfettiController _controllerCenterLeft;
  Timer _timer;
  int _start = 5;
  void startTimer() {
    const oneSec = const Duration(seconds: 3);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            _controllerCenterRight.play();
            _controllerCenterLeft.play();
            timer.cancel();
            setState(() {});
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  @override
  void initState() {
    _controllerCenterRight =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerCenterLeft =
        ConfettiController(duration: const Duration(seconds: 10));
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    _controllerCenterRight.dispose();
    _controllerCenterLeft.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          height: 50,
          child: BottomAppBar(
            shape: CircularNotchedRectangle(),
            color: Colors.pinkAccent,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (_start == 0)
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ));
          },
          child: Icon(
            FlutterIcons.play_circle_faw5,
            color: Colors.white,
          ),
          backgroundColor: Color(0xff13195b),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Column(
          children: <Widget>[
            ClipPath(
              clipper: WaveClipperTwo(),
              child: Container(
                height: 350,
                //  color: Colors.pinkAccent,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("image/kat1.jpg"), fit: BoxFit.cover),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "$_start",
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                  )),
            ),
            Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerRight,
                  child: ConfettiWidget(
                    confettiController: _controllerCenterRight,
                    blastDirection: pi, // radial value - LEFT
                    particleDrag: 0.05, // apply drag to the confetti
                    emissionFrequency: 0.05, // how often it should emit
                    numberOfParticles: 20, // number of particles to emit
                    gravity: 0.05, // gravity - or fall speed
                    shouldLoop: false,
                    colors: const [
                      Colors.green,
                      Colors.blue,
                      Colors.pink
                    ], // manually specify the colors to be used
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: ConfettiWidget(
                    confettiController: _controllerCenterLeft,
                    blastDirection: 0, // radial value - RIGHT
                    emissionFrequency: 0.6,
                    minimumSize: const Size(10,
                        10), // set the minimum potential size for the confetti (width, height)
                    maximumSize: const Size(50,
                        50), // set the maximum potential size for the confetti (width, height)
                    numberOfParticles: 1,
                    gravity: 0.1,
                  ),
                ),
                Column(
                  children: [
                    if (_start == 0)
                      Align(
                        alignment: Alignment.center,
                        child: AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                              'Happy\nBirthday',
                              textStyle: TextStyle(
                                fontFamily: 'acme',
                                fontSize: 72,
                                color: Colors.pink,
                              ),
                              speed: Duration(milliseconds: 150),
                              textAlign: TextAlign.center,
                            ),
                          ],
                          repeatForever: true,
                          displayFullTextOnTap: true,
                        ),
                      )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
