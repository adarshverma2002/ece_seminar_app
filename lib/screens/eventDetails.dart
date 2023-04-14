import 'package:ece_seminar_app/screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class eventDetailScreen extends StatefulWidget {
  eventDetailScreen(
      {Key? key,
      required this.selectedEventDetails,
      required this.venue,
      required this.time,
      required this.mode,
      required this.title,
      required this.speakers,
      required this.date,
      required this.description,
      required this.link})
      : super(key: key);

  String selectedEventDetails;
  String title;
  String date;
  String description;
  String venue;
  String time;
  String speakers;
  String mode;
  String link;

  @override
  State<eventDetailScreen> createState() => _eventDetailScreenState();
}

class _eventDetailScreenState extends State<eventDetailScreen> {
  String selectedEventDetails = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF143f40),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  SizedBox(height: 4),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 1,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => homePage()));
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            size: 28,
                          ),
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Event Details',
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'Righteous'),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${widget.title}',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 55,
                      fontFamily: 'Lilita',
                      fontWeight: FontWeight.w300),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 32,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.person,
                      size: 28,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Text(
                      '${widget.speakers}',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.white,
                      size: 28,
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Text(
                      '${widget.venue}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_month_outlined,
                      color: Colors.white,
                      size: 28,
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Text('${widget.date}',
                        style: TextStyle(color: Colors.white))
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.access_time_filled,
                      size: 28,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Text(
                      '${widget.time}',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.wifi,
                      color: Colors.white,
                      size: 28,
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Text(
                      '${widget.mode}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (await canLaunch("${widget.link}")) {
                        await launch('${widget.link}');
                      }
                      // if (await canLaunchUrl(Uri.parse('${widget.link}'))) {
                      //   await launchUrl(Uri.parse('${widget.link}'));
                      // }
                    },
                    // async {
                    //   if (await canLaunchUrl(url)){
                    //     await launchUrl(url)
                    //   }
                    // },
                    child: Text('Tap to join Online'),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFe0bb68)),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
