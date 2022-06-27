import 'package:flutter/material.dart';
import 'package:work/dbHelper/mongodb_work.dart';
import 'package:work/model/work.dart';
import 'package:work/screens/messagePage.dart';
import 'package:http/http.dart' as http;

class NavBarModel {
  String title;
  String icon;
  String color;
  NavBarModel({required this.title, required this.icon, required this.color});
}

class MongoDBInsert extends StatefulWidget {
  const MongoDBInsert({Key? key}) : super(key: key);

  @override
  State<MongoDBInsert> createState() => _MongoDBInsertState();
}

class _MongoDBInsertState extends State<MongoDBInsert> {
  
  String title = "Katılma isteği Gönder";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }

  Widget displayCard(Work work) {
    String title = "Katılma isteği Gönder";
    return Card(
      margin: const EdgeInsets.all(20),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      elevation: 5,
      child: SizedBox(
        //image
        height: 170.0,
        child: Row(children: <Widget>[
          Container(
            alignment: Alignment.center,
            height: 70.0,
            width: 70.0,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    topLeft: Radius.circular(5)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/people-2.png"),
                )),
          ),
          //text: date , time, place, description, textBox: university, department, class name
          SizedBox(
              height: 170,
              child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(10, 2, 0, 0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          work.workName,
                          style: const TextStyle(fontSize: 10),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              const WidgetSpan(
                                child: Icon(Icons.date_range, size: 14),
                              ),
                              TextSpan(
                                text: work.date.toString(),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              ),
                              const WidgetSpan(
                                child: Icon(Icons.access_time, size: 14),
                              ),
                              TextSpan(
                                text: work.time,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 3, 0, 3),
                          child: Row(
                            children: [
                              Container(
                                width: 70,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.teal),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(30))),
                                child: Text(
                                  work.university,
                                  style: const TextStyle(
                                      fontSize: 10,
                                      color: Color.fromARGB(255, 9, 58, 104)),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                width: 50,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.teal),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(30))),
                                child: Text(
                                  work.className,
                                  style: const TextStyle(
                                      fontSize: 10,
                                      color: Color.fromARGB(255, 9, 58, 104)),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(
                                width: 1,
                              ),
                              Container(
                                width: 80,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.teal),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(30))),
                                child: Text(
                                  work.department,
                                  style: const TextStyle(
                                      fontSize: 10,
                                      color: Color.fromARGB(255, 9, 58, 104)),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 5, 0, 2),
                          child: SizedBox(
                            width: 250,
                            child: Text(
                              work.description,
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 48, 48, 54)),
                            ),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.fromLTRB(0, 3, 0, 3),
                            child: Row(children: <Widget>[
                              Container(
                                height: 30,
                                width: 120,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.teal),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(30))),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const viewMessageIcon()));
                                  },
                                  child: const Text(
                                    "Mesaj Gönder",
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Color.fromARGB(255, 48, 48, 54)),
                                  ),
                                ),
                              ),
                              Container(
                                height: 30,
                                width: 120,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.teal),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(30))),
                                child: TextButton(
                                  onPressed: changeText,
                                  child: Text(
                                    title,
                                    style: const TextStyle(
                                        fontSize: 10,
                                        color: Color.fromARGB(255, 48, 48, 54)),
                                  ),
                                ),
                              ),
                            ])),
                        const SizedBox(
                          width: 10,
                        ),
                      ])))
        ]),
      ),
    );
  }

  void changeText() {
    setState(() {
      title = "İstek Gönderildi";
    });
  }
}
