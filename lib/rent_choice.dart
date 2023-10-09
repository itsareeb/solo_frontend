import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'payment.dart';

class RentChoice extends StatefulWidget {
  const RentChoice({super.key});

  @override
  State<RentChoice> createState() => _RentChoiceState();
}

int currIndex = 0;

class _RentChoiceState extends State<RentChoice> {
  String? valueChoose;
  List listItem = ['1 Day', '1 Week', '1 Month'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 19, 19, 19),
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
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 150),
            child: Column(
              children: [
                const Center(
                  child: Text(
                    'Choose A Rental Plan.',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
                const SizedBox(
                  height: 90,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 80, right: 80),
                    child: DropdownButton(
                        isExpanded: true,
                        dropdownColor: Colors.black,
                        hint: const Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Choose Your Plan',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        value: valueChoose,
                        onChanged: (newValue) {
                          setState(() {
                            valueChoose = newValue as String;
                          });
                        },
                        items: listItem.map((valueItem) {
                          return DropdownMenuItem(
                            value: valueItem,
                            child: Center(
                              child: Text(
                                valueItem,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          );
                        }).toList()),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(
                      context,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      side: const BorderSide(
                          color: Color.fromARGB(255, 255, 255, 255),
                          width: 2,
                          style: BorderStyle.solid),
                      backgroundColor: Color.fromARGB(0, 255, 255, 255),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      fixedSize: Size(MediaQuery.of(context).size.width * 0.8,
                          MediaQuery.of(context).size.width * 0.13)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text(
                        'Cancel',
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 15,
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) => Pay())));
                    },
                    style: ElevatedButton.styleFrom(
                        side: const BorderSide(
                            color: Color.fromARGB(255, 68, 66, 66),
                            width: 2,
                            style: BorderStyle.solid),
                        backgroundColor: Color.fromARGB(246, 240, 238, 238),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        fixedSize: Size(MediaQuery.of(context).size.width * 0.8,
                            MediaQuery.of(context).size.width * 0.13)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text(
                          'Pay',
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 15,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ],
                    )),
              ),
            ],
          )
        ],
      )),
    );
  }
}
