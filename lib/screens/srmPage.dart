import 'package:flutter/material.dart';

import 'homeScreen.dart';

class aboutSRM extends StatelessWidget {
  const aboutSRM({Key? key}) : super(key: key);

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
                SizedBox(
                  height: 3,
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
                      'About SRM',
                      style: TextStyle(
                          fontFamily: 'Righteous',
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
                Divider(color: Colors.white),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        'SRM Institute of Science and Technology  is one of the top ranking universities in India with over 52,000 full time students and more than 3200 faculty across all the campuses – Kattankulathur, Ramapuram, Vadapalani Campus – all in and around Chennai, Tiruchirappalli (in TN), Modinagar (in UP) & Sonepat (in Haryana) – both of which are located near Delhi NCR, Amaravati (in AP), Gangtok (in Sikkim) – offering a wide range of undergraduate, postgraduate and doctoral programs in six Faculties – Engineering & Technology, Management, Medicine & Health sciences, Science & Humanities, Law and Agricultural Sciences.',
                        style: TextStyle(color: Colors.white, fontSize: 15.5),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Divider(
                        color: Colors.white,
                      ),
                      Text(
                        'Vision',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'To emerge as a World – Class University in creating and disseminating knowledge and providing students a unique learning experience in Science, Technology, Medicine, Management and other areas of Scholarship that will best serve the world and for the betterment of mankind',
                        style: TextStyle(color: Colors.white, fontSize: 15.5),
                        textAlign: TextAlign.justify,
                      ),
                      Divider(
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Text(
                        'Mission',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'MOVE UP through international alliances and collaborative initiatives to achieve global excellence.ACCOMPLISH A PROCESS to advance knowledge in a rigorous academic and research environment.ATTRACT AND BUILD PEOPLE in a rewarding and an inspiring environment by fostering freedom, empowerment, creativity and innovation',
                        style: TextStyle(color: Colors.white, fontSize: 15.5),
                        textAlign: TextAlign.justify,
                      ),
                      Divider(
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Text(
                        'Core Values',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        'Excellence, Integrity and Academic Freedom',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'The University is committed to be a leading player in the academic world through excellence in teaching and research, while placing utmost value on the freedom to conduct academic activities and subject to the highest standards of academic ',
                        style: TextStyle(color: Colors.white, fontSize: 15.5),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Global Vision and Local Commitment',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'The University positions itself as a leading academic institution with a global influence. SRMIST brings together the global thought leaders to make significant contributions to the economic and social development both locally and nationally. In addition, SRMIST encourages its faculty, staff and students to dedicate themselves to serve the local community.',
                        style: TextStyle(color: Colors.white, fontSize: 15.5),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Inclusiveness, Diversity and Respect',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'The University values and respects the differences of individuals, whether they are from different geographies, socio-economic status, cultural background or religion. It strives to embrace these diverse forces to foster an inclusive and caring environment which will allow us to harness the richness of ideas and perspectives for the benefit of the whole community.',
                        style: TextStyle(color: Colors.white, fontSize: 15.5),
                        textAlign: TextAlign.justify,
                      ),
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
