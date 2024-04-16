import 'package:ece_seminar_app/screens/homeScreen.dart';
import 'package:flutter/material.dart';

class aboutCommittee extends StatelessWidget {
  const aboutCommittee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF143f40),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
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
                      'About Committee',
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
                Text(
                  'Chief Patrons',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      letterSpacing: 2,
                      fontFamily: 'Righteous'),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  """Dr. T. R. Paarivendhar, Chancellor, SRMIST
Dr. Ravi Pachamoothoo, Pro Chancellor (Administration), SRMIST
Dr. P. Sathyanarayanan,Pro Chancellor (Academics), SRMIST
Dr. S. Niranjan, Vice President, SRMIST""",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Patrons',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      letterSpacing: 2,
                      fontFamily: 'Righteous'),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  """Dr. C. Muthamizhchelvan,Vice Chancellor, SRMIST
Dr. S. Ponnusamy, Registrar, SRMIST
Dr. T. V. Gopal, Dean (CET),SRMIST
Dr. B. Neppolian, Dean (Research), SRMIST
""",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Convenver',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      letterSpacing: 2,
                      fontFamily: 'Righteous'),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  """Dr. Shanthi Prince, Professor & Head, Dept. of Electronics and Communication Engineering, SRMIST""",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Coordinators',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      letterSpacing: 2,
                      fontFamily: 'Righteous'),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  """Dr. M. Sangeetha,Professor, SRMIST
Dr. A. RuhanBevi, Assoc. Professor, SRMIST
Dr. J K Kasthuri Bha, , Asst. Professor, SRMIST
Dr. K. FerentsKoni Jiavana, Asst. Professor, SRMIST
Dr. Bandaru Ramakrishna, Research Asst. Professor, SRMIST
Dr. Damodar Panigrahy,Asst. Professor, SRMIST
""",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
