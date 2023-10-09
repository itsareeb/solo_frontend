import 'package:flutter/services.dart';
// import 'package:trial_project_1/navigation.dart';
import 'app-colors.dart' as AppColor;
import 'package:flutter/material.dart';
import 'Navigation.dart';

void main() {
  // await SystemChrome.setPreferredOrientations(
  // [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return Scaffold(
      body: Container(
        height: double.infinity,
        // margin: EdgeInsets.only(left: 10),
        // color: AppColor.primary,

        decoration: const BoxDecoration(
            color: Color.fromARGB(146, 0, 0, 0),
            image: DecorationImage(
              image: AssetImage('assets/img/new map lines.png'),
              fit: BoxFit.fill,
              opacity: 0.8,
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 400,
                // child: Positioned(
                //     top: 0,
                //     left: 0,
                //     right: 0,
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    // Positioned(
                    // height: 400,
                    // left: 10,
                    // child:
                    Container(
                      height: 400,
                      width: double.infinity,
                      // margin: const EdgeInsets.only(left: 55),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/img/SOLO-LOGO.png'),

                          // fit: BoxFit.cover,
                          fit: BoxFit.contain,
                          // opacity: 0.9
                          // opacity: 1,
                        ),
                      ),
                      // child: const Center(
                      //   child: Text(
                      //     '',
                      //     style: TextStyle(
                      //         color: Color.fromARGB(185, 251, 250, 250),
                      //         fontSize: 100,
                      //         fontWeight: FontWeight.w700),
                      //   ),
                      // ),
                    ),
                    // )
                  ],
                )),

            // left: 10,
            // right: 10,
            // top: 10,
            Container(
              margin: const EdgeInsets.only(left: 25, right: 25),
              height: 350,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColor.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Title(
                      color: AppColor.text,
                      child: const Text(
                        'Make Your Trip Easy Without Pollution',
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.w800),
                        textAlign: TextAlign.center,
                      )),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, right: 16, top: 0),
                        child: Text(
                          'Make Your Trip Healthier And More Enjoyable Without Pollution With',
                          style: TextStyle(
                              color: AppColor.subtext,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Text(
                        'Solo',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: AppColor.subtext),
                      ),
                    ],
                  ),
                  // Container(
                  //   height: 50,
                  //   width: double.infinity,
                  //   margin: const EdgeInsets.only(left: 30, right: 30),
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(15),
                  //     color: AppColor.text,
                  //   ),
                  //   child: TextButton(
                  //     child: Text(
                  //       'Get Started',
                  //       style: TextStyle(color: AppColor.white),
                  //     ),
                  //     onPressed: () {
                  //       Navigator.pushReplacement(context,
                  //           MaterialPageRoute(builder: (context) => Nav()));
                  //     },
                  //   ),
                  // )
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        fixedSize: Size(MediaQuery.of(context).size.width * 0.8,
                            MediaQuery.of(context).size.height * 0.06),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Nav()));
                    },
                    child: Text("Get Started"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      // backgroundColor: AppColor.primary,
    );
  }
}
