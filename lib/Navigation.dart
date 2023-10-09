// import 'dart:ui';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'bookingChoice.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:flutter_geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart';
import 'dart:async';
// import 'package:location/location.dart';
import 'app-colors.dart' as app_color;

class Nav extends StatefulWidget {
  const Nav({super.key});

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  @override
  final Completer<GoogleMapController> _controller = Completer();

  static const LatLng sourceLocation = LatLng(17.742470, 83.338861);
  List<dynamic> loc = [
    {
      'station': const LatLng(17.783340, 83.374710),
      'distance': 0.0,
      'address': ""
    },
    {
      'station': const LatLng(17.784340, 83.383710),
      'distance': 0.0,
      'address': ""
    },
    {
      'station': const LatLng(17.772470, 83.338861),
      'distance': 0.0,
      'address': ""
    },
    {
      'station': const LatLng(17.774870, 83.360861),
      'distance': 0.0,
      'address': ""
    },
    {
      'station': const LatLng(17.742470, 83.328861),
      'distance': 0.0,
      'address': ""
    },
    {
      'station': const LatLng(17.752470, 83.338861),
      'distance': 0.0,
      'address': ""
    },
    {
      'station': const LatLng(17.732470, 83.338861),
      'distance': 0.0,
      'address': ""
    },
  ];
  double distanceInMeter = 50000.0;
  double closest = 0.0;
  int indices = -1;
  var userloc = sourceLocation;
  var user_address = "";

  Future<Position> getCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      print('error: ' + error.toString());
    });

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future getDistance(pos1) async {
    for (var i = 0; i < loc.length; i++) {
      closest = await Geolocator.distanceBetween(pos1.latitude, pos1.longitude,
          loc[i]['station'].latitude, loc[i]['station'].longitude);
      loc[i]['distance'] = closest;
      if (closest < distanceInMeter) {
        distanceInMeter = closest;
        indices = i;
      }
    }
    setState(() {});
    // stationInfo(indices, distanceInMeter);
  }

  Future address() async {
    for (var i = 0; i < loc.length; i++) {
      var location =
          Coordinates(loc[i]['station'].latitude, loc[i]['station'].longitude);
      var addr = await Geocoder.local.findAddressesFromCoordinates(location);
      var first = addr.first;
      loc[i]['address'] =
          (first.featureName.toString() + first.addressLine.toString());
    }
    var user_loc = Coordinates(userloc.latitude, userloc.longitude);
    var user_addr = await Geocoder.local.findAddressesFromCoordinates(user_loc);
    var user_first = user_addr.first;
    user_address =
        user_first.featureName.toString() + user_first.addressLine.toString();
    setState(() {});
  }

  Future userAddress() async {
    var user_loc = Coordinates(userloc.latitude, userloc.longitude);
    var user_addr = await Geocoder.local.findAddressesFromCoordinates(user_loc);
    var user_first = user_addr.first;
    user_address =
        user_first.featureName.toString() + user_first.addressLine.toString();
    setState(() {});
  }

  void stationInfo(String user, index, bool flag) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return Container(
            height: 600,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 245, 211, 15),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              // border: Border.all(
              //     color: app_color.text, width: 4, style: BorderStyle.solid)),
            ),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    height: 3,
                    width: 70,
                    margin: const EdgeInsets.only(top: 20, bottom: 16),
                    decoration: BoxDecoration(
                        color: app_color.white,
                        borderRadius: BorderRadius.circular(20))),
                (flag)
                    ? UnconstrainedBox(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border:
                                  Border.all(color: Colors.black, width: 1.5),
                              color: const Color.fromARGB(65, 255, 255, 255)),
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text("Nearest Solo Station"),
                          ),
                        ),
                      )
                    : const Text(""),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        // Expanded(
                        Container(
                          height: 40,
                          width: 300,
                          // color: Color.fromARGB(225, 174, 73, 73),
                          child: Row(
                            children: [
                              const Image(
                                image: AssetImage('assets/img/source.png'),
                                height: 20,
                                width: 20,
                              ),
                              Expanded(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      user,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 16,
                                          color: Color.fromARGB(255, 0, 0, 0)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          width: 300,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              height: 2,
                              width: 270,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),

                        Container(
                          height: 40,
                          width: 300,
                          // color: Color.fromARGB(225, 174, 73, 73),
                          child: Row(
                            children: [
                              const Image(
                                image: AssetImage('assets/img/destination.png'),
                                height: 20,
                                width: 20,
                              ),
                              Expanded(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      loc[index]['address'],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 16,
                                          color: Color.fromARGB(255, 0, 0, 0)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        const Image(
                          image: AssetImage('assets/img/distance.png'),
                          height: 30,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${loc[index]['distance'].toInt().toString()}m",
                          style: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  height: 2,
                  width: double.infinity,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                Container(
                  height: 285,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //////////////////////////////////////////////////////////////////////////////
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 18),
                        decoration: BoxDecoration(
                          color: app_color.white,
                          border: Border.all(
                              color: app_color.text,
                              width: 2.2,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromARGB(73, 0, 0, 0),
                                spreadRadius: 0.7,
                                blurRadius: 5.0,
                                offset: Offset(0.0, 4.0)),
                          ],
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(
                              top: 5, bottom: 5, left: 15, right: 15),
                          child: Text(
                            'Ride information',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                      Container(
                        // margin: EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 30, right: 30),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Available Bikes",
                                    style: TextStyle(
                                        color: app_color.text,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.05,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: 10, right: 10),
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    height: 5,
                                    decoration: BoxDecoration(
                                        color: app_color.text,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                  Text(
                                    '25',
                                    style: TextStyle(
                                        color: app_color.text,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.05,
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 30, right: 30),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Average Charge",
                                    style: TextStyle(
                                        color: app_color.text,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.05,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: 10, right: 10),
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    height: 5,
                                    decoration: BoxDecoration(
                                        color: app_color.text,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                  Text(
                                    '95',
                                    style: TextStyle(
                                        color: app_color.text,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.05,
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 245, 211, 15),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                fixedSize: Size(
                                    MediaQuery.of(context).size.width * 0.4,
                                    MediaQuery.of(context).size.width * 0.13)),
                            child: const Text(
                              'Cancel',
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 15,
                                  color: Colors.black),
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  side: const BorderSide(
                                      color: Colors.black,
                                      width: 2,
                                      style: BorderStyle.solid),
                                  backgroundColor:
                                      Color.fromARGB(255, 245, 211, 15),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  fixedSize: Size(
                                      MediaQuery.of(context).size.width * 0.4,
                                      MediaQuery.of(context).size.width *
                                          0.13)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Text(
                                    'Navigate',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 15,
                                        color: Colors.black),
                                  ),
                                  Image.asset(
                                    'assets/img/navigate.png',
                                    height: 27,
                                  )
                                ],
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getCurrentLocation().then((value) async {
      userloc = LatLng(value.latitude, value.longitude);
      setState(() {});
      await getDistance(LatLng(value.latitude, value.longitude));
      await address();
      await userAddress();
      stationInfo(user_address, indices, true);
    });
  }

  int currIndex = 0;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
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
            setState(() {
              currIndex = value;
            });
          },
        ),
        body: SafeArea(
          child: Stack(
            children: [
              GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition:
                    const CameraPosition(target: sourceLocation, zoom: 15),
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                  // getCurrentLocation().then((value) async {
                  //   userloc = LatLng(value.latitude, value.longitude);
                  //   setState(() {});
                  //   await getDistance(LatLng(value.latitude, value.longitude));
                  //   await address();
                  //   await userAddress();
                  //   stationInfo(user_address, indices, true);
                  // });
                },
                myLocationButtonEnabled: true,
                myLocationEnabled: true,
                zoomControlsEnabled: false,
                padding: const EdgeInsets.only(top: 50, right: 20, bottom: 70),
                markers: {
                  Marker(
                      markerId: const MarkerId('user-loc'),
                      position: userloc,
                      icon: BitmapDescriptor.defaultMarkerWithHue(
                          BitmapDescriptor.hueAzure),
                      infoWindow: const InfoWindow(
                          snippet: "Wait 3 seconds to update changes",
                          title: "Hold and Drag to change location"),
                      draggable: true,
                      onDragEnd: (value) async {
                        distanceInMeter = 50000;
                        closest = 50000;
                        userloc = value;
                        await userAddress();
                        await getDistance(userloc);
                        setState(() {});
                      }),
                  Marker(
                    markerId: const MarkerId('station-1'),
                    position: loc[0]['station'],
                    onTap: () {
                      var flag = false;
                      if (indices == 0) {
                        flag = true;
                      }
                      stationInfo(user_address, 0, flag);
                    },
                  ),
                  Marker(
                    markerId: const MarkerId('station-2'),
                    position: loc[1]['station'],
                    onTap: () {
                      var flag = false;
                      if (indices == 1) {
                        flag = true;
                      }

                      stationInfo(user_address, 1, flag);
                    },
                  ),
                  Marker(
                    markerId: const MarkerId('station-3'),
                    position: loc[2]['station'],
                    onTap: () {
                      var flag = false;
                      if (indices == 2) {
                        flag = true;
                      }
                      stationInfo(user_address, 2, flag);
                    },
                  ),
                  Marker(
                    markerId: const MarkerId('station-4'),
                    position: loc[3]['station'],
                    onTap: () {
                      var flag = false;
                      if (indices == 3) {
                        flag = true;
                      }
                      stationInfo(user_address, 3, flag);
                    },
                  ),
                  Marker(
                    markerId: const MarkerId('station-5'),
                    position: loc[4]['station'],
                    onTap: () {
                      var flag = false;
                      if (indices == 4) {
                        flag = true;
                      }
                      stationInfo(user_address, 4, flag);
                    },
                  ),
                  Marker(
                    markerId: const MarkerId('station-6'),
                    position: loc[5]['station'],
                    onTap: () {
                      var flag = false;
                      if (indices == 5) {
                        flag = true;
                      }
                      stationInfo(user_address, 5, flag);
                    },
                  ),
                  Marker(
                    markerId: const MarkerId('station-7'),
                    position: loc[6]['station'],
                    onTap: () {
                      var flag = false;
                      if (indices == 6) {
                        flag = true;
                      }
                      stationInfo(user_address, 6, flag);
                    },
                  ),
                },
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: const EdgeInsets.only(top: 35),
                      width: 300,
                      height: 35,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 245, 211, 15),
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(100),
                              bottomRight: Radius.circular(100)),
                          border: Border.all(
                              color: Color.fromARGB(255, 245, 211, 15),
                              width: 2.0,
                              style: BorderStyle.solid),
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromARGB(100, 0, 0, 0),
                                spreadRadius: 1.0,
                                blurRadius: 5.0,
                                offset: Offset(3.0, 3.0))
                          ]
                          // border: Border(top: )
                          // image: DecorationImage(image: AssetImage('assets/img/info icon.png'),)
                          ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              'assets/img/info icon.png',
                              height: 20,
                            ),
                            const Text(
                              'Select a station to get more details',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 28.0),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => booking()));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 245, 211, 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            fixedSize: Size(
                                MediaQuery.of(context).size.width * 0.4,
                                MediaQuery.of(context).size.width * 0.13)),
                        child: Row(
                          children: [
                            const Text(
                              'Proceed to Book',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Image.asset(
                              'assets/img/next.png',
                              height: 27,
                            )
                          ],
                        )),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
