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
                        name: 'Dr. Xing Zhou',
                        college: 'Nanyang Technological University',
                        image: 'assets/xing.jpg',
                        location: 'Singapore',
                        link: 'https://dr.ntu.edu.sg/cris/rp/rp00798',
                      ),
                      speakerContainer(
                        name: 'Dr. Seunghyup Yoo',
                        college:
                            'Korea Advanced Institute of Science and Technology',
                        image: 'assets/seung.jpg',
                        location: 'South Koreaa',
                        link: 'https://ee.kaist.ac.kr/en/professor/12225/',
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
                        image: 'assets/nemanja.jpg',
                        location: 'Serbia',
                        link:
                            'https://www.metropolitan.ac.rs/profesori/nemanja-zdravkovic/',
                      ),
                      speakerContainer(
                        name: 'Mr. Ratnakar Rao',
                        college: 'Samsung R&D Institute',
                        image: 'assets/ratnakar.jpg',
                        location: 'Bangalore',
                        link: '',
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
                        name: 'Dr. Akash Kumar',
                        college: 'Tohoku University',
                        image: 'assets/akash.png',
                        location: 'Japan',
                        link:
                            'https://scholar.google.co.in/citations?user=4U426k4AAAAJ&hl=en',
                      ),
                      speakerContainer(
                        location: 'Malaysia',
                        name: 'Dr. Pang Wai Leong',
                        college: 'Taylor’s University',
                        image: 'assets/pang.jpg',
                        link: 'https://expert.taylors.edu.my/cv/waileong.pang',
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
                        location: 'India',
                        image: 'assets/manish.jpg',
                        name: 'Dr. Manish Pandey',
                        college: 'IIT Bhilai',
                        link:
                            'https://scholar.google.co.in/citations?user=J4HHDIcAAAAJ&hl=en',
                      ),
                      speakerContainer(
                        location: 'Taiwan',
                        image: 'assets/shu.png',
                        name: 'Prof. Kuei-Shu Chang-Liao',
                        college: 'National Tsing Hua University',
                        link:
                            'https://nes.site.nthu.edu.tw/p/412-1356-10562.php?Lang=en',
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
                        location: 'Singapore',
                        image: 'assets/nasimuddin.png',
                        name: 'Dr. Nasimuddin',
                        college: 'Scientist, A*STAR',
                        link:
                            'https://scholar.google.com/citations?user=bHoBK3QAAAAJ&hl=en',
                      ),
                      speakerContainer(
                        location: 'Israel',
                        image: 'assets/david.png',
                        name: 'Prof. David Cahen',
                        college: 'Weizmann Institute of Science',
                        link: 'https://www.weizmann.ac.il/materials/Cahen/home',
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
                        location: 'India',
                        image: 'assets/deepak.png',
                        name: 'Prof. Deepak Gupta',
                        college: 'IIT Kanpur',
                        link: 'https://www.iitk.ac.in/new/deepak-gupta',
                      ),
                      speakerContainer(
                        location: 'Ireland',
                        image: 'assets/gerard.png',
                        name: 'Prof. Gerard Dooly',
                        college: 'University of Limerick',
                        link:
                            'https://www.researchgate.net/profile/Gerard-Dooly',
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
