import 'package:flutter/material.dart';
import 'dart:async';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool _visible = true;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() {
        _visible = !_visible;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(108, 22, 21, 21),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 30, bottom: 30),
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  child: Image.asset(
                    "assets/images/image.png",
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width,
                  )),
            ),

            /// ADDED TEXT PART BELOW YOUR IMAGE
            AnimatedOpacity(
              opacity: _visible ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: const Text(
                " You Pick We Deliver!!!",
                style: TextStyle(
                  fontSize: 26,
                  color: Color.fromARGB(255, 31, 199, 176),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 260,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                  color: Colors.amberAccent,
                  borderRadius: BorderRadius.circular(30)),
              child: Row(
                children: [
                  Center(
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "      Next",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 39),
                        )),
                  ),
                  Icon(Icons.arrow_forward)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
