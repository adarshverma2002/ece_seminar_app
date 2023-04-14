import 'package:firebase_database/firebase_database.dart';

FirebaseDatabase database = FirebaseDatabase.instance;
DatabaseReference refd1 = database.ref("event/day1");
DatabaseReference refd2 = database.ref("event/day2");
DatabaseReference refd3 = database.ref("event/day3");

Stream<DatabaseEvent> streamd1 = refd1.onValue;
Stream<DatabaseEvent> streamd2 = refd2.onValue;
Stream<DatabaseEvent> streamd3 = refd3.onValue;
