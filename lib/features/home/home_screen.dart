import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 245, 244, 243),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 210,
              decoration: const BoxDecoration(
                color: Colors.red,
              ),
              padding: const EdgeInsets.only(top: 70, right: 10, left: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Text(
                            "asosa totasefer",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          Icon(
                            Icons.expand_more,
                            color: Colors.white,
                            size: 35,
                          )
                        ],
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                            size: 30,
                          ),
                          SizedBox(width: 20),
                          Icon(
                            Icons.notifications_none,
                            color: Colors.white,
                            size: 30,
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: const Icon(
                        Icons.search,
                        size: 35,
                      ),
                      hintText: 'What would you like to eat?',
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 13, horizontal: 25),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),

            // FIXED ListView.builder
            Container(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4, // Add a count for safety
                itemBuilder: (BuildContext context, int index) {
                  return const Myoffer(); // No index passed since Myoffer has none
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Your Myoffer Widget
class Myoffer extends StatefulWidget {
  const Myoffer({super.key});

  @override
  State<Myoffer> createState() => _MyofferState();
}

class _MyofferState extends State<Myoffer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10),
            height: 130,
            width: 240,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 194, 92, 92),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Column(
                  children: [
                    Text(
                      "   Today's Best\n   Offer",
                      style: TextStyle(fontSize: 23),
                    ),
                    Text(
                      "off up to 75%",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                Image.asset(
                  "assets/images/burger.png",
                  height: 10,
                  width: 10,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
