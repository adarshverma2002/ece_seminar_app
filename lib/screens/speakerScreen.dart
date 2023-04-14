import 'package:ece_seminar_app/screens/homeScreen.dart';
import 'package:ece_seminar_app/widgets/speakerCard.dart';
import 'package:flutter/material.dart';

class speakerList extends StatelessWidget {
  const speakerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF143f40),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).push(PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      homePage(),
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
                          //         builder: (context) => homePage()));
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 28,
                        )),
                    const Text(
                      'List of Speakers',
                      style: TextStyle(
                          fontFamily: 'Righteous',
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
                Divider(color: Colors.white),
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      speakerContainer(
                        name: 'Prof. Cher-Ming Tan',
                        college: 'Chang Gung University',
                        image: 'assets/cher.png',
                        location: 'Taiwan',
                      ),
                      speakerContainer(
                        name: 'Dr. Mohamed Elmaghrbi',
                        college: 'University of Nottingham',
                        image: 'assets/mohamed.png',
                        location: 'United Kingdom',
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      speakerContainer(
                        name: 'Dr Nemanja Zdravković',
                        college: 'Metropolitan University',
                        image: 'assets/nemanja.png',
                        location: 'Serbia',
                      ),
                      speakerContainer(
                        name: 'Dr. Lee Yee Hui',
                        college: 'Nanyang Technological University',
                        image: 'assets/lee.png',
                        location: 'Singapore',
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      speakerContainer(
                        name: 'Dr. Miroslava Raspopovic Milic',
                        college: 'Belgrade Metropolitan University',
                        image: 'assets/miroslava.png',
                        location: 'Serbia',
                      ),
                      speakerContainer(
                        location: 'Taiwan',
                        name: 'Dr. Cheng-TeLi',
                        college: 'National Cheng Kung University',
                        image: 'assets/cheng.png',
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      speakerContainer(
                          location: 'United States of America',
                          image: 'assets/bhaskar.png',
                          name: 'Dr. Vidhyacharan Bhaskar',
                          college: 'University of California'),
                      speakerContainer(
                          location: 'Taiwan',
                          image: 'assets/poming.png',
                          name: 'Prof. Po-Ming Lee',
                          college: 'Southern Taiwan University'),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      speakerContainer(
                          location: 'Taiwan',
                          image: 'assets/nasimuddin.png',
                          name: 'Dr. Nasimuddin',
                          college: 'Scientist, A*STAR'),
                      speakerContainer(
                          location: 'United States of America',
                          image: 'assets/prabha.png',
                          name: 'Dr. Prabha Sundaravadivel',
                          college: 'The University of Texas at Tyler'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
