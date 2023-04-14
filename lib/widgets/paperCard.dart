import 'package:flutter/material.dart';

import '../screens/paperDetails.dart';

class paperCard extends StatefulWidget {
  paperCard(
      {Key? key,
      required this.description,
      required this.date,
      required this.speakers,
      required this.time,
      required this.title,
      required this.venue,
      required this.mode,
      required this.link,
      required this.paperID,
      required this.category,
      required this.eventDetails})
      : super(key: key);

  String title;
  String category;
  String paperID;
  String eventDetails;
  String date;
  String description;
  String venue;
  String time;
  String speakers;
  String mode;
  String link;

  @override
  State<paperCard> createState() => _paperCardState();
}

class _paperCardState extends State<paperCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.95,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22), color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Column(
          children: [
            Text(
              "${widget.title}",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Righteous'),
            ),
            SizedBox(
              height: 5,
            ),
            Divider(color: Colors.black87),
            Row(
              children: [
                Icon(
                  Icons.person,
                  size: 25,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '${widget.speakers}',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Icon(
                  Icons.access_time_filled,
                  size: 25,
                ),
                SizedBox(
                  width: 11,
                ),
                Text(
                  '${widget.time}',
                  style: TextStyle(fontSize: 15),
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),

            Row(
              children: [
                Icon(
                  Icons.book_rounded,
                  size: 25,
                ),
                SizedBox(
                  width: 11,
                ),
                Text(
                  '${widget.category}',
                  style: TextStyle(fontSize: 15),
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            // Row(
            //   children: [
            //     Text(
            //       "Mode:",
            //       style: TextStyle(fontSize: 15),
            //     ),
            //     SizedBox(
            //       width: 10,
            //     ),
            //     Text(
            //       "${widget.mode}",
            //       style: TextStyle(fontSize: 15),
            //     )
            //   ],
            // ),
            // SizedBox(
            //   height: 8,
            // ),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  size: 25,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '${widget.venue}',
                  style: TextStyle(fontSize: 15),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              color: Colors.black87,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {});

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => paperDetailScreen(
                                selectedEventDetails: '${widget.eventDetails}',
                                venue: '${widget.venue}',
                                time: '${widget.time}',
                                mode: '${widget.mode}',
                                title: '${widget.title}',
                                speakers: '${widget.speakers}',
                                date: '${widget.date}',
                                description: '${widget.description}',
                                link: '${widget.link}',
                                paperID: '${widget.paperID}, ',
                                category: '${widget.category}',
                              )));
                },
                child: Text(
                  "More Info",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(primary: Color(0xFFe0bb68)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
