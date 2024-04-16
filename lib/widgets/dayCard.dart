import 'package:flutter/material.dart';

class dayCard extends StatefulWidget {
  dayCard(
      {Key? key,
      required this.number,
      required this.id,
      required this.selected,
      required this.size})
      : super(key: key);

  String number;
  final int id;
  bool selected;
  var size;

  @override
  State<dayCard> createState() => _dayCardState();
}

class _dayCardState extends State<dayCard> {
  Color _colorContainer = Color(0xFFe0bb68);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: widget.selected ? Color(0xFFe0bb68) : Colors.grey),
      width: 80,
      height: 100,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(
              'Day',
              style: TextStyle(
                  fontSize: widget.size.width * 0.06,
                  color: Colors.black87,
                  fontFamily: 'Righteous'),
            ),
            Text(
              '${widget.number}',
              style: TextStyle(
                  fontSize: widget.size.width * 0.08,
                  color: Colors.black87,
                  fontFamily: 'Righteous'),
            )
          ],
        ),
      ),
      // color: Colors.red,
    );
  }
}
