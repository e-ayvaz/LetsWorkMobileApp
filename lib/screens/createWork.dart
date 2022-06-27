import 'package:flutter/material.dart';
import 'package:work/screens/homepage1.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../model/work.dart';
import 'package:date_format/date_format.dart';

class CreateWork extends StatefulWidget {
  const CreateWork({Key? key}) : super(key: key);

  @override
  _CreateWorkState createState() => _CreateWorkState();
}

class _CreateWorkState extends State<CreateWork> {
  late double _height;
  late double _width;
  late String _hour, _minute, _time;
  late DateTime _dateTime = DateTime(2022, 06, 28,12,00);
  late TimeOfDay _timeOfDay = TimeOfDay(hour: 12, minute: 30);
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Future save() async {
    var res = await http.post(Uri.parse("http://localhost:3000/createWork"),
        headers: <String, String>{
          'Context-Type': 'application/json;charSet=UTF-8'
        },
        body: <String, String>{
          'className': work.className,
          'description': work.description,
          'date': work.date,
          'time': work.time,
          'place': work.place
        });

    print(res.body + " " + res.statusCode.toString());
    // if (res.body == "success") {
    if (res.body == "null") {
      print("error");
      AlertDialog alert = AlertDialog(
        title: const Text("Hata"),
        content: const Text("Kullanıcı adı veya şifre hatalı"),
        actions: <Widget>[
          TextButton(
            child: const Text("Tamam"),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      );
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomeWork()));
    }
  }

  Work work = Work(
      id: "",
      workName: "",
      className: "",
      date: "",
      time: "",
      place: "",
      description: "",
      university: "",
      department: "",
      v: 0);

  @override
  void initState() {
    _dateController.text = DateFormat.yMd().format(DateTime.now());
    work.date = _dateController.text;
    _timeController.text = formatDate(
        DateTime(2019, 08, 1, DateTime.now().hour, DateTime.now().minute),
        [hh, ':', nn, " ", am]).toString();
    work.time = _timeController.text;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    final hours= _dateTime.hour.toString().padLeft(2, '0');
    final minutes= _dateTime.minute.toString().padLeft(2, '0');
    return Scaffold(
        appBar: AppBar(
          title: const Text("Yeni Çalışma"),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Container(
              width: _width,
              height: _height,
              alignment: Alignment.center,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    // ClassName field start
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        controller: TextEditingController(text: work.className),
                        onChanged: (value) {
                          work.className = value;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ders Adını Giriniz';
                          } else if (RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]")
                              .hasMatch(value)) {
                            return null;
                          } else {
                            return 'Ders';
                          }
                        },
                        decoration: InputDecoration(
                            icon: const Icon(
                              Icons.science,
                              color: Colors.blue,
                            ),
                            hintText: 'Ders ',
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide:
                                    const BorderSide(color: Colors.blue)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide:
                                    const BorderSide(color: Colors.blue)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide:
                                    const BorderSide(color: Colors.red)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide:
                                    const BorderSide(color: Colors.red))),
                      ),
                    ), // Input DersAdı field end
                    // Description field start
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        controller:
                            TextEditingController(text: work.description),
                        onChanged: (value) {
                          work.description = value;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Boş Bırakmayınız';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            icon: const Icon(
                              Icons.description,
                              color: Colors.blue,
                            ),
                            hintText: 'Açıklama',
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide:
                                    const BorderSide(color: Colors.blue)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide:
                                    const BorderSide(color: Colors.blue)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide:
                                    const BorderSide(color: Colors.red)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide:
                                    const BorderSide(color: Colors.red))),
                      ),
                    ), // Input Açıklama field end
                    // Place field start
                    Padding(
                      //
                      padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        controller: TextEditingController(text: work.place),
                        onChanged: (value) {
                          work.place = value;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Boş Bırakmayınız';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            icon: const Icon(
                              Icons.place,
                              color: Colors.blue,
                            ),
                            hintText: 'Konum',
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide:
                                    const BorderSide(color: Colors.blue)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide:
                                    const BorderSide(color: Colors.blue)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide:
                                    const BorderSide(color: Colors.red)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide:
                                    const BorderSide(color: Colors.red))),
                      ),
                    ), // Input Konum field end
                    // Input Tarih field start
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              const Icon(
                                Icons.date_range,
                                color: Colors.blue,
                              ),
                              const Text(
                                'Tarih:',
                                style: TextStyle(fontSize: 15),
                              ),
                              ElevatedButton(
                                child: Text(
                                  '${_dateTime.day}/${_dateTime.month}/${_dateTime.year}',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () async {
                                  final DateTime? _picked =
                                      await showDatePicker(
                                    context: context,
                                    initialDate: _dateTime,
                                    firstDate: DateTime(2020),
                                    lastDate: DateTime(2025),
                                  );
                                  if (_picked != null && _picked != _dateTime) {
                                    setState(() {
                                      _dateTime = _picked;
                                      work.date = _dateTime.toString();
                                    });
                                  }
                                },
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              const Icon(
                                Icons.access_time,
                                color: Colors.blue,
                              ),
                              const Text(
                                'Saat:',
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.5),
                              ),
                             ElevatedButton(
                                child: Text(
                                  '${_timeOfDay.hour}:${_timeOfDay.minute}',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () async {
                                  final TimeOfDay? _pickedTime =
                                      await showTimePicker(
                                    context: context,
                                    initialTime: _timeOfDay,
                                  );  

                                  if (_pickedTime != null && _pickedTime != _timeOfDay) {
                                    setState(() {
                                      _timeOfDay = _pickedTime;
                                      work.time = _timeOfDay.toString();
                                    });
                                  }
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ), // Input Tarih field end
                    // Input Saat field start

                    // Çalışma Oluştur button start
                    Padding(
                      padding: const EdgeInsets.fromLTRB(55, 16, 16, 0),
                      child: SizedBox(
                        height: 50,
                        width: 400,
                        child: TextButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                save();
                              } else {
                                print("not ok");
                              }
                            },
                            child: const Text(
                              "Çalışma Oluştur",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 20),
                            )),
                      ),
                    ), // Çalışma Oluştur button end
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
