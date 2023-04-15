import 'dart:async';
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ece_seminar_app/screens/committeePage.dart';
import 'package:ece_seminar_app/screens/conferencePage.dart';
import 'package:ece_seminar_app/screens/loginScreen.dart';
import 'package:ece_seminar_app/screens/speakerScreen.dart';
import 'package:ece_seminar_app/screens/srmPage.dart';
import 'package:ece_seminar_app/services/firebase_auth.dart';
import 'package:ece_seminar_app/services/realtimeData.dart';
import 'package:ece_seminar_app/widgets/dayCard.dart';
import 'package:ece_seminar_app/widgets/eventcard.dart';
import 'package:ece_seminar_app/widgets/paperCard.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

final List<String> imgList = [
  'assets/arch.png',
  'assets/conferenceimage.JPG',
  'assets/committee2.png'
];

final List<String> imgText = [
  'About SRM',
  'About Conference',
  'About Committee'
];

class homePage extends StatefulWidget {
  homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  late Map day1;
  late Map day2;
  late Map day3;
  late StreamSubscription<DatabaseEvent> sd1;
  late StreamSubscription<DatabaseEvent> sd2;
  late StreamSubscription<DatabaseEvent> sd3;
  bool selectedD1 = true;
  bool selectedD2 = false;
  bool selectedD3 = false;
  PageController pageController = PageController(
    initialPage: 0,
  );

  void _navigateToScreen(int index) {
    switch (index) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => aboutSRM()));
        break;
      case 1:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => aboutConference()));
        break;
      case 2:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => aboutCommittee()));
    }
  }

  int _currentIndex = 0;

  // Query dbRef1 = FirebaseDatabase.instance.ref().child('event');

  @override
  void initState() {
    super.initState();
    sd1 = refd1.onValue.listen((DatabaseEvent event) {
      day1 = (event.snapshot.value) as Map;
      setState(() {});
    });
    sd2 = refd2.onValue.listen((DatabaseEvent event) {
      day2 = (event.snapshot.value) as Map;
      setState(() {});
    });
    sd3 = refd3.onValue.listen((DatabaseEvent event) {
      day3 = (event.snapshot.value) as Map;
      setState(() {});
    });
  }

  @override
  void dispose() {
    sd1.cancel();
    sd2.cancel();
    sd3.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    FirebaseAuthMethods methods = context.read<FirebaseAuthMethods>();

    transition() {
      Navigator.of(context).push(PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => loginPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = Offset(1.0, 0.0);
            var end = Offset.zero;
            var curve = Curves.ease;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          }));
    }

    print(day1.values);
    DateTime dateTime = DateTime.now();
    var formatter = DateFormat('dd MMMM yyyy');
    String formattedDate = formatter.format(dateTime);
    print(formattedDate);
    return Scaffold(
      backgroundColor: Color(0xFF143f40),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Container(
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            DateFormat('EEEE').format(dateTime).toString(),
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontFamily: "Righteous"),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            formattedDate.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'Righteous'),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(
                        Icons.logout,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () {
                        methods.signOut(context);
                        transition();
                        // Navigator.of(context).push(PageRouteBuilder(
                        //     pageBuilder:
                        //         (context, animation, secondaryAnimation) =>
                        //             loginPage(),
                        //     transitionsBuilder: (context, animation,
                        //         secondaryAnimation, child) {
                        //       var begin = Offset(1.0, 0.0);
                        //       var end = Offset.zero;
                        //       var curve = Curves.ease;
                        //
                        //       var tween = Tween(begin: begin, end: end)
                        //           .chain(CurveTween(curve: curve));
                        //
                        //       return SlideTransition(
                        //         position: animation.drive(tween),
                        //         child: child,
                        //       );
                        //     }));
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Divider(
                  color: Colors.white,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.19,
                  child: CarouselSlider.builder(
                      itemCount: imgList.length,
                      itemBuilder:
                          (BuildContext context, int index, int realIndes) {
                        final image = AssetImage('${imgList[index]}');
                        final text = imgText[index];
                        return Builder(builder: (BuildContext context) {
                          return InkWell(
                            onTap: () {
                              _navigateToScreen(index);
                              print("Image was tapped");
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Image(
                                    image: image,
                                    fit: BoxFit.fill,
                                  ),
                                  ClipRRect(
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                        sigmaY: 5,
                                        sigmaX: 5,
                                      ),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        color: Colors.grey.withOpacity(0.2),
                                        alignment: Alignment.center,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              text,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                  // Image(
                                  //   image: image,
                                  //   fit: BoxFit.cover,
                                  // ),
                                  // Center(
                                  //   child:
                                  // Container(
                                  //   width: MediaQuery.of(context).size.width,
                                  //   decoration: BoxDecoration(
                                  //     color: Colors.white.withOpacity(0.5),
                                  //   ),
                                  //   child: Padding(
                                  //     padding: EdgeInsets.all(8),
                                  //     child: Text(
                                  //       text,
                                  //       style: TextStyle(fontSize: 20),
                                  //       textAlign: TextAlign.center,
                                  //     ),
                                  //   ),
                                  // ),
                                  // )
                                ],
                              ),
                            ),
                          );
                        });
                      },
                      options: CarouselOptions(
                          height: MediaQuery.of(context).size.height * 0.25,
                          viewportFraction: 1,
                          aspectRatio: 16 / 9,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          enableInfiniteScroll: true,
                          autoPlayInterval: Duration(seconds: 6))),
                ),
                Divider(
                  color: Colors.white,
                ),
                Row(
                  children: [
                    const Text(
                      "List of our speakers",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Righteous',
                          fontSize: 22),
                    ),
                    // SizedBox(
                    //   width: 60,
                    // ),
                    Spacer(),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10)),
                      child: IconButton(
                          onPressed: () {
                            Navigator.of(context).push(PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        speakerList(),
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  var begin = Offset(1.0, 0.0);
                                  var end = Offset.zero;
                                  var curve = Curves.ease;

                                  var tween = Tween(begin: begin, end: end)
                                      .chain(CurveTween(curve: curve));

                                  return SlideTransition(
                                    position: animation.drive(tween),
                                    child: child,
                                  );
                                }));

                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => speakerList()));
                          },
                          icon: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 30,
                          )),
                    )
                  ],
                ),
                Divider(
                  color: Colors.white,
                ),
                Text(
                  "Events by Dates",
                  style: TextStyle(
                      fontFamily: 'Righteous',
                      fontSize: 22,
                      // fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          selectedD1 = true;
                          selectedD2 = false;
                          selectedD3 = false;
                          setState(() {});
                          pageController.animateToPage(
                            0,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                        child: dayCard(
                          number: '1',
                          id: 1,
                          selected: selectedD1,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          selectedD2 = true;
                          selectedD1 = false;
                          selectedD3 = false;
                          setState(() {});
                          pageController.animateToPage(
                            1,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                        child: dayCard(
                          number: '2',
                          id: 2,
                          selected: selectedD2,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          selectedD3 = true;
                          selectedD1 = false;
                          selectedD2 = false;
                          setState(() {});
                          pageController.animateToPage(
                            2,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                        child: dayCard(
                          number: '3',
                          id: 3,
                          selected: selectedD3,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: MediaQuery.of(context).size.width,
                  child: PageView(
                    onPageChanged: (value) {
                      if (value == 0) {
                        selectedD2 = false;
                        selectedD3 = false;
                        selectedD1 = true;
                        setState(() {});
                      }
                      if (value == 1) {
                        selectedD2 = true;
                        selectedD3 = false;
                        selectedD1 = false;
                        setState(() {});
                      }
                      if (value == 2) {
                        selectedD2 = false;
                        selectedD3 = true;
                        selectedD1 = false;
                        setState(() {});
                      }
                    },
                    scrollDirection: Axis.horizontal,
                    controller: pageController,
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            eventCard(
                              description: 'something',
                              eventDetails: 'Someone was here1',
                              date: '12-25',
                              speakers: day1['event1']['chair'].toString(),
                              time: day1['event1']['time'].toString(),
                              title: day1['event1']['title'].toString(),
                              venue: day1['event1']['location'].toString(),
                              mode: day1['event1']['mode'].toString(),
                              link: day1['event1']['meetLink'].toString(),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.95,
                              height: MediaQuery.of(context).size.height * 0.2,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(22),
                                  image: DecorationImage(
                                      image: AssetImage('assets/lunch.jpg'),
                                      fit: BoxFit.fill)),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  ClipRRect(
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                        sigmaY: 10,
                                        sigmaX: 10,
                                      ),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.08,
                                        color: Colors.grey.withOpacity(0.2),
                                        alignment: Alignment.center,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Tea Break",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                            Text(
                                              day1['teaBreak']['time'],
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // child: Stack(
                              //   alignment: Alignment.center,
                              //   children: [
                              //     ClipRRect(
                              //       child: BackdropFilter(
                              //         filter: ImageFilter.blur(
                              //             sigmaY: 10, sigmaX: 10),
                              //         child: Container(
                              //           color: Colors.grey.withOpacity(0.2),
                              //           alignment: Alignment.center,
                              //           child: Column(
                              //             mainAxisAlignment:
                              //                 MainAxisAlignment.center,
                              //             children: [
                              //               Text(
                              //                 'Lunch Break',
                              //                 style: TextStyle(
                              //                     fontSize: 25,
                              //                     color: Colors.white),
                              //               ),
                              //               SizedBox(
                              //                 height: 7,
                              //               ),
                              //               Text(
                              //                 day1['lunchBreak']['time']
                              //                     .toString(),
                              //                 style: TextStyle(
                              //                     color: Colors.white,
                              //                     fontSize: 20),
                              //               )
                              //             ],
                              //           ),
                              //         ),
                              //       ),
                              //     ),
                              //     // Column(
                              //     //   children: [
                              //     //     Text("Lunch Break"),
                              //     //     Text(day1['lunchBreak']['time'])
                              //     //   ],
                              //     // )
                              //   ],
                              // ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            eventCard(
                              description: 'something',
                              eventDetails: 'Someone was here2',
                              date: '12 - 25',
                              speakers: day1['event2']['chair'].toString(),
                              time: day1['event2']['time'].toString(),
                              title: day1['event2']['title'].toString(),
                              venue: day1['event2']['location'].toString(),
                              mode: day1['event2']['mode'].toString(),
                              link: day1['event2']['meetLink'].toString(),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.95,
                              height: MediaQuery.of(context).size.height * 0.2,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(22),
                                  image: DecorationImage(
                                      image: AssetImage('assets/lunch.jpg'),
                                      fit: BoxFit.fill)),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  ClipRRect(
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                        sigmaY: 10,
                                        sigmaX: 10,
                                      ),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.08,
                                        color: Colors.grey.withOpacity(0.2),
                                        alignment: Alignment.center,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Lunch Break",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                            Text(
                                              day1['lunchBreak']['time'],
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // child: Stack(
                              //   alignment: Alignment.center,
                              //   children: [
                              //     ClipRRect(
                              //       child: BackdropFilter(
                              //         filter: ImageFilter.blur(
                              //             sigmaY: 10, sigmaX: 10),
                              //         child: Container(
                              //           color: Colors.grey.withOpacity(0.2),
                              //           alignment: Alignment.center,
                              //           child: Column(
                              //             mainAxisAlignment:
                              //                 MainAxisAlignment.center,
                              //             children: [
                              //               Text(
                              //                 'Lunch Break',
                              //                 style: TextStyle(
                              //                     fontSize: 25,
                              //                     color: Colors.white),
                              //               ),
                              //               SizedBox(
                              //                 height: 7,
                              //               ),
                              //               Text(
                              //                 day1['lunchBreak']['time']
                              //                     .toString(),
                              //                 style: TextStyle(
                              //                     color: Colors.white,
                              //                     fontSize: 20),
                              //               )
                              //             ],
                              //           ),
                              //         ),
                              //       ),
                              //     ),
                              //     // Column(
                              //     //   children: [
                              //     //     Text("Lunch Break"),
                              //     //     Text(day1['lunchBreak']['time'])
                              //     //   ],
                              //     // )
                              //   ],
                              // ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            eventCard(
                              description: 'something',
                              eventDetails: 'Someone was here2',
                              date: '12 - 25',
                              speakers: day1['event3']['chair'].toString(),
                              time: day1['event3']['time'].toString(),
                              title: day1['event3']['title'].toString(),
                              venue: day1['event3']['location'].toString(),
                              mode: day1['event3']['mode'].toString(),
                              link: day1['event3']['meetLink'].toString(),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            eventCard(
                              description: 'something',
                              eventDetails: 'Someone was here2',
                              date: '12 - 25',
                              speakers: day1['event4']['chair'].toString(),
                              time: day1['event4']['time'].toString(),
                              title: day1['event4']['title'].toString(),
                              venue: day1['event4']['location'].toString(),
                              mode: day1['event4']['mode'].toString(),
                              link: day1['event4']['meetLink'].toString(),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            eventCard(
                              description: 'something',
                              eventDetails: 'Someone was here2',
                              date: '12 - 25',
                              speakers: day1['event5']['chair'].toString(),
                              time: day1['event5']['time'].toString(),
                              title: day1['event5']['title'].toString(),
                              venue: day1['event5']['location'].toString(),
                              mode: day1['event5']['mode'].toString(),
                              link: day1['event5']['meetLink'].toString(),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            paperCard(
                              description: 'something',
                              eventDetails: 'Someone was here2',
                              date: '12 - 25',
                              speakers: day1['event6']['chair'].toString(),
                              time: day1['event6']['time'].toString(),
                              title: day1['event6']['title'].toString(),
                              venue: day1['event6']['location'].toString(),
                              mode: day1['event6']['mode'].toString(),
                              link: day1['event6']['meetLink'].toString(),
                              paperID: day1['event6']['paperID'],
                              category: day1['event6']['category'],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            paperCard(
                              description: 'something',
                              eventDetails: 'Someone was here2',
                              date: '12 - 25',
                              speakers: day1['event7']['chair'].toString(),
                              time: day1['event7']['time'].toString(),
                              title: day1['event7']['title'].toString(),
                              venue: day1['event7']['location'].toString(),
                              mode: day1['event7']['mode'].toString(),
                              link: day1['event7']['meetLink'].toString(),
                              paperID: day1['event7']['paperID'].toString(),
                              category: day1['event7']['category'].toString(),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            paperCard(
                              description: 'something',
                              eventDetails: 'Someone was here2',
                              date: '12 - 25',
                              speakers: day1['event8']['chair'].toString(),
                              time: day1['event8']['time'].toString(),
                              title: day1['event8']['title'].toString(),
                              venue: day1['event8']['location'].toString(),
                              mode: day1['event8']['mode'].toString(),
                              link: day1['event8']['meetLink'].toString(),
                              paperID: day1['event8']['paperID'].toString(),
                              category: day1['event8']['category'].toString(),
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            eventCard(
                              description: 'something',
                              eventDetails: 'Someone was here1',
                              date: 'Some Date',
                              speakers: day2['event1']['chair'].toString(),
                              time: day2['event1']['time'].toString(),
                              title: day2['event1']['title'].toString(),
                              venue: day2['event1']['location'].toString(),
                              mode: day2['event1']['mode'].toString(),
                              link: day2['event1']['meetLink'].toString(),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            eventCard(
                              description: 'something',
                              eventDetails: 'Someone was here2',
                              date: day2['event2']['date'].toString(),
                              speakers: day2['event2']['chair'].toString(),
                              time: day2['event2']['time'].toString(),
                              title: day2['event2']['title'].toString(),
                              venue: day2['event2']['location'].toString(),
                              mode: day2['event2']['offline'].toString(),
                              link: day2['event2']['meetLink'].toString(),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            eventCard(
                              description: 'something',
                              date: day2['event3']['date'].toString(),
                              speakers: day2['event3']['chair'].toString(),
                              time: day2['event3']['time'].toString(),
                              title: day2['event3']['title'].toString(),
                              venue: day2['event3']['location'].toString(),
                              mode: day2['event3']['mode'].toString(),
                              eventDetails: 'Adarsh Verma is here',
                              link: day2['event3']['meetLink'].toString(),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            eventCard(
                              description: 'something',
                              eventDetails: 'Someone was here',
                              date: day2['event4']['date'].toString(),
                              speakers: day2['event4']['chair'].toString(),
                              time: day2['event4']['time'].toString(),
                              title: day2['event4']['title'].toString(),
                              venue: day2['event4']['location'].toString(),
                              mode: day2['event4']['mode'].toString(),
                              link: day2['event4']['meetLink'].toString(),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            eventCard(
                              description: 'something',
                              eventDetails: 'Someone was here',
                              date: day2['event5']['date'].toString(),
                              speakers: day2['event5']['chair'].toString(),
                              time: day2['event5']['time'].toString(),
                              title: day2['event5']['title'].toString(),
                              venue: day2['event5']['location'].toString(),
                              mode: day2['event5']['mode'].toString(),
                              link: day2['event5']['meetLink'].toString(),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.95,
                              height: MediaQuery.of(context).size.height * 0.2,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(22),
                                  image: DecorationImage(
                                      image: AssetImage('assets/lunch.jpg'),
                                      fit: BoxFit.fill)),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  ClipRRect(
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                        sigmaY: 10,
                                        sigmaX: 10,
                                      ),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.08,
                                        color: Colors.grey.withOpacity(0.2),
                                        alignment: Alignment.center,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Lunch Break",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                            Text(
                                              day2['lunchBreak']['time'],
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // child: Stack(
                              //   alignment: Alignment.center,
                              //   children: [
                              //     ClipRRect(
                              //       child: BackdropFilter(
                              //         filter: ImageFilter.blur(
                              //             sigmaY: 10, sigmaX: 10),
                              //         child: Container(
                              //           color: Colors.grey.withOpacity(0.2),
                              //           alignment: Alignment.center,
                              //           child: Column(
                              //             mainAxisAlignment:
                              //                 MainAxisAlignment.center,
                              //             children: [
                              //               Text(
                              //                 'Lunch Break',
                              //                 style: TextStyle(
                              //                     fontSize: 25,
                              //                     color: Colors.white),
                              //               ),
                              //               SizedBox(
                              //                 height: 7,
                              //               ),
                              //               Text(
                              //                 day1['lunchBreak']['time']
                              //                     .toString(),
                              //                 style: TextStyle(
                              //                     color: Colors.white,
                              //                     fontSize: 20),
                              //               )
                              //             ],
                              //           ),
                              //         ),
                              //       ),
                              //     ),
                              //     // Column(
                              //     //   children: [
                              //     //     Text("Lunch Break"),
                              //     //     Text(day1['lunchBreak']['time'])
                              //     //   ],
                              //     // )
                              //   ],
                              // ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            eventCard(
                              description: 'something',
                              eventDetails: 'Someone was here',
                              date: day2['event8']['date'].toString(),
                              speakers: day2['event8']['chair'].toString(),
                              time: day2['event8']['time'].toString(),
                              title: day2['event8']['title'].toString(),
                              venue: day2['event8']['location'].toString(),
                              mode: day2['event8']['mode'].toString(),
                              link: day2['event8']['meetLink'].toString(),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            eventCard(
                              description: 'something',
                              eventDetails: 'Someone was here',
                              date: day2['event9']['date'].toString(),
                              speakers: day2['event9']['chair'].toString(),
                              time: day2['event9']['time'].toString(),
                              title: day2['event9']['title'].toString(),
                              venue: day2['event9']['location'].toString(),
                              mode: day2['event9']['mode'].toString(),
                              link: day2['event9']['meetLink'].toString(),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            eventCard(
                                description: 'soemthing',
                                date: day2['event10']['date'].toString(),
                                speakers: day2['event10']['cahir'].toString(),
                                time: day2['event10']['time'].toString(),
                                title: day2['event10']['title'].toString(),
                                venue: day2['event10']['location'].toString(),
                                mode: day2['event10']['mode'].toString(),
                                link: day2['event10']['meetLink'].toString(),
                                eventDetails: 'Some Details'),
                            SizedBox(
                              height: 10,
                            ),
                            eventCard(
                                description: 'something',
                                date: day2['event11']['date'].toString(),
                                speakers: day2['event11']['chair'].toString(),
                                time: day2['event11']['time'].toString(),
                                title: day2['event11']['title'].toString(),
                                venue: day2['event11']['location'].toString(),
                                mode: day2['event11']['mode'].toString(),
                                link: day2['event11']['meetLink'].toString(),
                                eventDetails: 'soemthing'),
                            SizedBox(
                              height: 10,
                            ),
                            eventCard(
                                description: "something",
                                date: day2['event12']['date'].toString(),
                                speakers: day2['event12']['chair'].toString(),
                                time: day2['event12']['time'].toString(),
                                title: day2['event12']['title'].toString(),
                                venue: day2['event12']['location'].toString(),
                                mode: day2['event12']['mode'].toString(),
                                link: day2['event12']['meetLink'].toString(),
                                eventDetails: 'something'),
                            SizedBox(
                              height: 10,
                            ),
                            eventCard(
                                description: 'ription',
                                date: day2['event13']['date'].toString(),
                                speakers: day2['event13']['chair'].toString(),
                                time: day2['event13']['time'].toString(),
                                title: day2['event13']['title'].toString(),
                                venue: day2['event13']['location'].toString(),
                                mode: day2['event13']['mode'].toString(),
                                link: day2['event13']['meetLink'].toString(),
                                eventDetails: 'something'),
                            SizedBox(
                              height: 10,
                            ),
                            paperCard(
                              description: 'description',
                              date: day2['event14']['date'].toString(),
                              speakers: day2['event14']['chair'].toString(),
                              time: day2['event14']['time'].toString(),
                              title: day2['event14']['title'].toString(),
                              venue: day2['event14']['location'].toString(),
                              mode: day2['event14']['mode'].toString(),
                              link: day2['event14']['meetLink'].toString(),
                              eventDetails: 'eventDetails',
                              paperID: day2['event14']['paperID'].toString(),
                              category: day2['event14']['category'].toString(),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            paperCard(
                              description: 'description',
                              date: day2['event15']['date'].toString(),
                              speakers: day2['event15']['chair'].toString(),
                              time: day2['event15']['time'].toString(),
                              title: day2['event15']['title'].toString(),
                              venue: day2['event15']['venue'].toString(),
                              mode: day2['event15']['mode'].toString(),
                              link: day2['event15']['meetLink'].toString(),
                              eventDetails: 'eventDetails',
                              paperID: day2['event15']['paperID'].toString(),
                              category: day2['event15']['category'].toString(),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            paperCard(
                              description: 'description',
                              date: day2['event16']['date'].toString(),
                              speakers: day2['event16']['chair'].toString(),
                              time: day2['event16']['time'].toString(),
                              title: day2['event16']['title'].toString(),
                              venue: day2['event16']['location'].toString(),
                              mode: day2['event16']['mode'].toString(),
                              link: day2['event16']['meetLink'].toString(),
                              eventDetails: 'eventDetails',
                              paperID: day2['event16']['paperID'].toString(),
                              category: day2['event16']['category'].toString(),
                            ),
                            SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            eventCard(
                              description: 'something',
                              eventDetails: 'Someone was here1',
                              date: day3['event1']['date'].toString(),
                              speakers: day3['event1']['chair'].toString(),
                              time: day3['event1']['time'].toString(),
                              title: day3['event1']['title'].toString(),
                              venue: day3['event1']['location'].toString(),
                              mode: day3['event1']['mode'].toString(),
                              link: day3['event1']['meetLink'].toString(),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            eventCard(
                              description: 'something',
                              eventDetails: 'Someone was here2',
                              date: day3['event2']['date'].toString(),
                              speakers: day3['event2']['chair'].toString(),
                              time: day3['event2']['time'].toString(),
                              title: day3['event2']['title'].toString(),
                              venue: day3['event2']['location'].toString(),
                              mode: day3['event2']['mode'].toString(),
                              link: day3['event2']['meetLink'].toString(),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            eventCard(
                              description: 'something',
                              date: day3['event3']['date'].toString(),
                              speakers: day3['event3']['chair'].toString(),
                              time: day3['event3']['time'].toString(),
                              title: day3['event3']['title'].toString(),
                              venue: day3['event3']['location'].toString(),
                              mode: day3['event3']['mode'].toString(),
                              eventDetails: 'Adarsh Verma is here',
                              link: day3['event3']['meetLink'].toString(),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            eventCard(
                              description: 'something',
                              eventDetails: 'Someone was here',
                              date: day3['event4']['date'].toString(),
                              speakers: day3['event4']['chair'].toString(),
                              time: day3['event4']['time'].toString(),
                              title: day3['event4']['title'].toString(),
                              venue: day3['event4']['location'].toString(),
                              mode: day3['event4']['mode'].toString(),
                              link: day3['event4']['meetLink'].toString(),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            paperCard(
                                description: 'something',
                                date: day3['event5']['date'].toString(),
                                speakers: day3['event5']['chair'].toString(),
                                time: day3['event5']['time'].toString(),
                                title: day3['event5']['title'].toString(),
                                venue: day3['event5']['location'].toString(),
                                mode: day3['event5']['mode'].toString(),
                                link: day3['event5']['link'].toString(),
                                paperID: day3['event5']['paperID'].toString(),
                                category: day3['event5']['category'].toString(),
                                eventDetails: 'eventDetails'),
                            SizedBox(
                              height: 10,
                            ),
                            paperCard(
                                description: 'description',
                                date: day3['event6']['date'].toString(),
                                speakers: day3['event6']['chair'].toString(),
                                time: day3['event6']['time'].toString(),
                                title: day3['event6']['title'].toString(),
                                venue: day3['event6']['location'].toString(),
                                mode: day3['event6']['mode'].toString(),
                                link: day3['event6']['meetLink'].toString(),
                                paperID: day3['event6']['paperID'].toString(),
                                category: day3['event6']['category'].toString(),
                                eventDetails: 'eventDetails'),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
