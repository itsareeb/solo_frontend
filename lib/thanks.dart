import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'bookingChoice.dart';
import 'navigation.dart';

class thanks extends StatefulWidget {
  const thanks({super.key});

  @override
  State<thanks> createState() => _thanksState();
}

class _thanksState extends State<thanks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 219, 217, 217),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
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
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 19, 19, 19),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromARGB(73, 0, 0, 0),
                        spreadRadius: 1.7,
                        blurRadius: 5.0,
                        offset: Offset(3.0, 4.0))
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Text(
                    'Thank You For Riding With',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    'SOLO',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 44),
                  )
                ],
              )),
          Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  child: const Text(
                    'Home',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Nav()));
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  child: const Text(
                    'Book Again',
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => booking()));
                  },
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}
