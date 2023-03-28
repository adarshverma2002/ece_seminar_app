import 'package:carousel_slider/carousel_slider.dart';
import 'package:ece_seminar_app/widgets/eventcard.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final List<String> imgList = [
  'assets/srmimage.jpg',
  'assets/conferenceimage.JPG',
  'assets/committee.jpg'
];

final List<String> imgText = [
  'About SRM',
  'About Conference',
  'About Committee'
];

class homePage extends StatelessWidget {
  homePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.now();
    var formatter = DateFormat('dd MMMM yyyy');
    String formattedDate = formatter.format(dateTime);
    print(formattedDate);
    return Scaffold(
      backgroundColor: Color(0xFF143f40),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              Text(
                DateFormat('EEEE').format(dateTime).toString(),
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                formattedDate.toString(),
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              SizedBox(
                height: 8,
              ),
              Divider(
                color: Colors.white,
              ),
              SizedBox(
                height: 200,
                child: CarouselSlider.builder(
                    itemCount: imgList.length,
                    itemBuilder:
                        (BuildContext context, int index, int realIndes) {
                      final image = AssetImage('${imgList[index]}');
                      final text = imgText[index];
                      return Builder(builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Stack(
                            children: [
                              Image(
                                image: image,
                                fit: BoxFit.fill,
                              ),
                              Center(
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.1),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Text(
                                      text,
                                      style: TextStyle(fontSize: 20),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      });
                    },
                    options: CarouselOptions(
                        height: 400,
                        aspectRatio: 16 / 9,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: true,
                        autoPlayInterval: Duration(seconds: 6))),
              ),
              Divider(
                color: Colors.white,
              ),
              Text(
                "Events by Dates",
                style: TextStyle(
                    fontFamily: 'Righteous',
                    fontSize: 22,
                    // fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFFe0bb68)),
                        width: 80,
                        height: 100,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Text(
                                'Day',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black87,
                                    fontFamily: 'Righteous'),
                              ),
                              Text(
                                '1',
                                style: TextStyle(
                                    fontSize: 44,
                                    color: Colors.black87,
                                    fontFamily: 'Righteous'),
                              )
                            ],
                          ),
                        ),
                        // color: Colors.red,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFFe0bb68)),
                        width: 80,
                        height: 100,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Text(
                                "Day",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black87,
                                    fontFamily: 'Righteous'),
                              ),
                              Text(
                                "2",
                                style: TextStyle(
                                    fontSize: 44,
                                    color: Colors.black87,
                                    fontFamily: 'Righteous'),
                              )
                            ],
                          ),
                        ),
                        // color: Colors.red,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFFe0bb68)),
                        width: 80,
                        height: 100,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Text(
                                "Day",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black87,
                                    fontFamily: 'Righteous'),
                              ),
                              Text(
                                "3",
                                style: TextStyle(
                                    fontSize: 44,
                                    color: Colors.black87,
                                    fontFamily: 'Righteous'),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              eventCard(
                  description: description,
                  date: date,
                  speakers: speakers,
                  time: time,
                  title: title,
                  venue: venue)
            ],
          ),
        ),
      ),
    );
  }
}
