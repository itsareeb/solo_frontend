import 'package:trial_project_1/app-colors.dart';

import 'qrscanner.dart' as qr;
import 'package:flutter/material.dart';
import 'rent_choice.dart';
// import 'bookinging2.dart';

class booking extends StatefulWidget {
  const booking({super.key});

  @override
  State<booking> createState() => _bookingState();
}

int currIndex = 0;

class _bookingState extends State<booking> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
            setState(() {
              currIndex = value;
            });
          },
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Color.fromARGB(255, 250, 249, 249),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromARGB(73, 0, 0, 0),
                      spreadRadius: 0.7,
                      blurRadius: 5.0,
                      offset: Offset(0.0, 4.0)),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Center(
                      child: Text(
                        'Ride With',
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 24),
                      ),
                    ),
                  ),
                  const Text(
                    'SOLO',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        decoration: TextDecoration.none,
                        fontSize: 44,
                        color: Color.fromARGB(255, 245, 211, 15)),
                  ),
                  Container(
                    height: 100,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 245, 211, 15),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(73, 0, 0, 0),
                              spreadRadius: 0.7,
                              blurRadius: 5.0,
                              offset: Offset(1.0, 4.0))
                        ]
                        // image: DecorationImage(
                        //   image: AssetImage('assets/ebike-yelloww.png'),
                        // )
                        ),
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Pay Based On Usage.',
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 15,
                              color: Color.fromARGB(255, 97, 78, 78)),
                        ),
                        Text(
                          'Postpaid Service.',
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 15,
                              color: Color.fromARGB(255, 97, 78, 78)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '*recommended for short usage.',
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 10,
                              fontStyle: FontStyle.italic,
                              color: Color.fromARGB(255, 97, 78, 78)),
                        ),
                      ],
                    )),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => qr.QRscanner()));
                      },
                      style: ElevatedButton.styleFrom(
                          side: const BorderSide(
                              color: Colors.black,
                              width: 1.5,
                              style: BorderStyle.solid),
                          backgroundColor: Color.fromARGB(255, 245, 211, 15),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          fixedSize: Size(
                              MediaQuery.of(context).size.width * 0.6,
                              MediaQuery.of(context).size.width * 0.13)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            'Quick Ride',
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 15,
                                color: Colors.black),
                          ),
                          Image.asset(
                            'assets/img/scanner.png',
                            height: 27,
                          )
                        ],
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 245, 211, 15),
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromARGB(72, 0, 0, 0),
                      spreadRadius: 0.7,
                      blurRadius: 5.0,
                      offset: Offset(0.0, 4.0)),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Center(
                      child: Text(
                        'Ride With',
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Color.fromARGB(255, 13, 13, 13),
                            fontSize: 24),
                      ),
                    ),
                  ),
                  const Text(
                    'SOLO',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        decoration: TextDecoration.none,
                        fontSize: 44,
                        color: Color.fromARGB(255, 250, 249, 249)),
                  ),
                  Container(
                    height: 100,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 250, 249, 249),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(55, 0, 0, 0),
                              spreadRadius: 0.7,
                              blurRadius: 5.0,
                              offset: Offset(0.0, 4.0))
                        ]
                        // image: DecorationImage(
                        //   image: AssetImage('assets/ebike-yelloww.png'),
                        // )
                        ),
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Rental Charges Apply.',
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 15,
                              color: Color.fromARGB(255, 92, 92, 92)),
                        ),
                        Text(
                          'Prepaid Service.',
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 15,
                              color: Color.fromARGB(255, 92, 92, 92)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '*recommended for longer usage.',
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 10,
                              fontStyle: FontStyle.italic,
                              color: Color.fromARGB(255, 92, 92, 92)),
                        ),
                      ],
                    )),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RentChoice()));
                      },
                      style: ElevatedButton.styleFrom(
                          side: const BorderSide(
                              color: Colors.black,
                              width: 1.5,
                              style: BorderStyle.solid),
                          backgroundColor: Color.fromARGB(193, 255, 255, 255),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          fixedSize: Size(
                              MediaQuery.of(context).size.width * 0.6,
                              MediaQuery.of(context).size.width * 0.13)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            'Rent A Ride',
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 15,
                                color: Colors.black),
                          ),
                          Image.asset(
                            'assets/img/ebikeicon.png',
                            height: 27,
                          )
                        ],
                      )),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
