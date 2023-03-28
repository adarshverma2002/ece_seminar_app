import 'package:flutter/material.dart';

class eventCard extends StatefulWidget {
  eventCard(
      {Key? key,
      required this.description,
      required this.date,
      required this.speakers,
      required this.time,
      required this.title,
      required this.venue})
      : super(key: key);

  String title;
  String date;
  String description;
  String venue;
  String time;
  String speakers;

  @override
  State<eventCard> createState() => _eventCardState();
}

class _eventCardState extends State<eventCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Column(
        children: [
          Text(
            "${widget.title}",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
