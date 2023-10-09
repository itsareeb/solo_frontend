import 'package:trial_project_1/app-colors.dart';

// import 'qrscanner.dart' as qr;
import 'package:flutter/material.dart';
import 'sride.dart';

class Unlock extends StatefulWidget {
  const Unlock({super.key});

  @override
  State<Unlock> createState() => _UnlockState();
}

int currIndex = 0;

class _UnlockState extends State<Unlock> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currIndex,
          iconSize: 30,
          // selectedFontSize: 20,
          backgroundColor: Color.fromARGB(255, 245, 211, 15),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.money), label: "Money"),
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu")
          ],
          onTap: (value) {
            setState(() {});
          },
        ),
        body: SafeArea(
          child: Container(
            color: const Color.fromARGB(255, 255, 255, 255),
            height: double.infinity,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  // margin: const EdgeInsets.only(top: 20),
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(241, 0, 0, 0),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: Text(
                            'RM Buddie 25',
                            style: TextStyle(
                                color: const Color.fromARGB(192, 254, 252, 252),
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.05,
                                decoration: TextDecoration.none),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: UnconstrainedBox(
                          child: Container(
                            margin: EdgeInsets.only(left: 18),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Color.fromARGB(255, 255, 255, 255)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: Image.asset(
                                      'assets/img/ebikeicon.png',
                                      height: 20,
                                    ),
                                  ),
                                  const Text('75km Range',
                                      style: TextStyle(
                                          color: Color.fromARGB(249, 0, 0, 0),
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal,
                                          decoration: TextDecoration
                                              .none)) // Image.asset('assets/img/ebikeicon.png')
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 18),
                            child: Column(
                              children: const [
                                Text(
                                  'Speed',
                                  style: TextStyle(
                                      color: Color.fromARGB(189, 255, 255, 255),
                                      decoration: TextDecoration.none,
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  '25km/h',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      decoration: TextDecoration.none,
                                      fontSize: 18),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 18),
                            child: Column(
                              children: const [
                                Text(
                                  'Battery',
                                  style: TextStyle(
                                      color: Color.fromARGB(189, 255, 255, 255),
                                      decoration: TextDecoration.none,
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  '87%',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      decoration: TextDecoration.none,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 25, left: 18, right: 18),
                            child: Column(
                              children: const [
                                Text(
                                  'Load Capacity',
                                  style: TextStyle(
                                      color: Color.fromARGB(189, 255, 255, 255),
                                      decoration: TextDecoration.none,
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  '120Kgs',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      decoration: TextDecoration.none,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 18),
                            child: Column(
                              children: const [
                                Text(
                                  'Full Charge',
                                  style: TextStyle(
                                      color: Color.fromARGB(189, 255, 255, 255),
                                      decoration: TextDecoration.none,
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  '2hr 45mins',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      decoration: TextDecoration.none,
                                      fontSize: 18),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 18),
                            child: Column(
                              children: const [
                                Text(
                                  'Weight',
                                  style: TextStyle(
                                      color: Color.fromARGB(189, 255, 255, 255),
                                      decoration: TextDecoration.none,
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  '65Kgs',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      decoration: TextDecoration.none,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.05,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(0, 255, 0, 0),
                    border: Border.all(
                      color: Color.fromARGB(133, 0, 0, 0),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(0),
                    child: TextButton(
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                            color: Color.fromARGB(108, 0, 0, 0), fontSize: 15),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.05,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(0, 255, 0, 0),
                    border: Border.all(
                      color: Color.fromARGB(133, 255, 0, 0),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(0),
                    child: TextButton(
                      child: const Text(
                        'Report',
                        style: TextStyle(
                            color: Color.fromARGB(108, 255, 0, 0),
                            fontSize: 15),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.05,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 0, 0, 0),
                    border: Border.all(
                      color: const Color.fromARGB(133, 0, 0, 0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: TextButton(
                      child: const Text(
                        'Unlock',
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 15),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => startRide()));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
