import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'qrscanner.dart';

int currIndex = 0;

class Pay extends StatefulWidget {
  const Pay({super.key});

  @override
  State<Pay> createState() => _PayState();
}

class _PayState extends State<Pay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 215, 213, 213),
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
          currIndex = value;
          setState(() {});
        },
      ),
      body: SafeArea(
          child: Stack(
        children: [
          const Align(
            alignment: Alignment.center,
            child: Text('Payment Gateway!!'),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: TextButton(
                  child: const Text(
                    'Bypass Payment',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => QRscanner()));
                  },
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
