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
                        link: 'https://chermingtan.org/',
                      ),
                      speakerContainer(
                        name: 'Dr. Mohamed Elmaghrbi',
                        college: 'University of Nottingham',
                        image: 'assets/mohamed.png',
                        location: 'United Kingdom',
                        link:
                            'https://www.nottingham.ac.uk/ engineering/departments/foundationyear /people/mohamed.elmaghrbi',
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
                        link:
                            'https://www.metropolitan.ac.rs/profesori/nemanja-zdravkovic/',
                      ),
                      speakerContainer(
                        name: 'Dr. Lee Yee Hui',
                        college: 'Nanyang Technological University',
                        image: 'assets/lee.png',
                        location: 'Singapore',
                        link:
                            'https://www.ntu.edu.sg/erian/about-us/our-people/cluster-directors/lee-yee-hui',
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
                        link:
                            'https://www.metropolitan.ac.rs/profesori/miroslava-raspopovic-milic/',
                      ),
                      speakerContainer(
                        location: 'Taiwan',
                        name: 'Dr. Cheng-TeLi',
                        college: 'National Cheng Kung University',
                        image: 'assets/cheng.png',
                        link: 'http://graphics.csie.ncku.edu.tw/Tony/tony.htm',
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
                        college: 'University of California',
                        link:
                            'https://engineering.sfsu.edu/faculty-profile-vidhyacharan-bhaskar',
                      ),
                      speakerContainer(
                        location: 'Taiwan',
                        image: 'assets/poming.png',
                        name: 'Prof. Po-Ming Lee',
                        college: 'Southern Taiwan University',
                        link: 'NUll',
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
                        location: 'Taiwan',
                        image: 'assets/nasimuddin.png',
                        name: 'Dr. Nasimuddin',
                        college: 'Scientist, A*STAR',
                        link:
                            'https://www.linkedin.com/in/dr-nasimuddin-31469720?originalSubdomain=sg',
                      ),
                      speakerContainer(
                        location: 'United States of America',
                        image: 'assets/prabha.png',
                        name: 'Dr. Prabha Sundaravadivel',
                        college: 'The University of Texas at Tyler',
                        link:
                            'https://www.uttyler.edu/directory/ee/sundaravadivel.php',
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
                        location: 'Taiwan',
                        image: 'assets/chun.png',
                        name: 'Prof. Chun -Yi Lee',
                        college: 'National Tsing Hua University',
                        link: 'NUll',
                      ),
                      speakerContainer(
                        location: 'Malaysia',
                        image: 'assets/enghock.png',
                        name: 'Dr. Eng-Hock Lim',
                        college: 'Universiti Tunku Abdul Rahman',
                        link:
                            'https://scholar.google.com/citations?user=8Rt3gp8AAAAJ&hl=en',
                      ),
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
