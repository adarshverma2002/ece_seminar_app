import 'package:flutter/material.dart';

class speakerContainer extends StatefulWidget {
  speakerContainer(
      {Key? key,
      required this.name,
      required this.college,
      required this.image,
      required this.location})
      : super(key: key);

  String name;
  String college;
  String image;
  String location;

  @override
  State<speakerContainer> createState() => _speakerContainerState();
}

class _speakerContainerState extends State<speakerContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width * 0.42,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 35,
              backgroundImage: AssetImage('${widget.image}'),
            ),
            SizedBox(height: 25),
            Text(
              '${widget.name}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '${widget.college}',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              '${widget.location}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            Expanded(
                child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: ElevatedButton(
                        onPressed: () {}, child: Text('More Info'))))
          ],
        ),
      ),
    );
  }
}
