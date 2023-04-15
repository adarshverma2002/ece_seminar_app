import 'package:flutter/material.dart';

import 'homeScreen.dart';

class aboutConference extends StatelessWidget {
  const aboutConference({Key? key}) : super(key: key);

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
                      'About Conference',
                      style: TextStyle(
                          fontFamily: 'Righteous',
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.white,
                  thickness: 1,
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        'RAEEUCCI-2.0',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            letterSpacing: 2,
                            fontFamily: 'Righteous'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'There has been rapid research and development in technologies related to Electrical, Electronics, Communication, Computation and its allied areas during the past few years and the way it impacted human lives. The scope for further development always exists and this conference would provide the opportunity to discuss state-of-the-art research contributions and to explore the avenues for future work. This conference is aimed to bring researchers, practicing engineers, faculty members and students from across the globe to a common platform to share their research ideas that would pave way to attain solution to various real time problems. Many eminent researchers from different countries are expected to participate and interact with the young students and budding researchers of various institutions who are expected to be a part of this conference. The conference will be held in hybrid mode. This platform will provide an insight into recent advancements and techniques to kindle your research interest to aid future developments.',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Divider(
                        color: Colors.white,
                      ),
                      Text(
                        'Paper Submission Guidelines',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            letterSpacing: 2,
                            fontFamily: 'Righteous'),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'The submission Link is: https://cmt3.research.microsoft.com/RAEEUCCI2023 Papers should be 4 to 5 pages long and in the IEEE conference paper template. The templates are available at the link: https://www.ieee.org/conferences/publishing/templates.html. The paper selection will follow a double-blind review process, meaning that both the authors and reviewers will remain anonymous during the paper selection process. Do NOT include any authors’ information such as name, affiliation, e-mail, etc. in the initial manuscript. All accepted and registered papers will be published in proceedings (Abstract Book) of RAEEUCCI 2023. The presented full-length papers will be submitted to IEEE Xplore Digital Library. The final decision for publishing an article is subject to meeting the quality requirement of IEEE. Plagiarism level (Similarity Index) of the manuscript must be less than 10% at any stage; otherwise, the articles will be rejected outright by the publisher. As a general rule we would advise that an author does not submit more than two articles to a conference. This includes papers that they have coauthored. There is no extra charge for publications.',
                        style: TextStyle(color: Colors.white, fontSize: 16),
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
