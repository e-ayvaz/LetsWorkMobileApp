import 'package:flutter/material.dart';
import 'package:work/screens/forgetpw.dart';
import 'package:work/screens/register.dart';
import 'package:work/model/user.dart';
import 'package:work/screens/homepage.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  _ForgetState createState() => _ForgetState();
}

class _ForgetState extends State<ForgetPassword> {
  final _formKey = GlobalKey<FormState>();
  Future save() async {
    var res = await http.post(Uri.parse("http://localhost:3000/signin"),
        headers: <String, String>{
          'Context-Type': 'application/json;charSet=UTF-8'
        },
        body: <String, String>{
          'email': user.email,
          'password': user.password
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
          context, MaterialPageRoute(builder: (context) => const Home()));
    }
  }

  User user = User(
      id: "",
      name: "",
      email: "",
      password: "",
      confirmPassword: "",
      university: "",
      department: "");
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          alignment: Alignment.center,
          child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 150,
                    ),
                    Text(
                      "Haydi Toplanalım",
                      style: GoogleFonts.pacifico(
                          fontWeight: FontWeight.normal,
                          fontSize: 45,
                          color: Colors.blue),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    // Input Email field start
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        controller: TextEditingController(text: user.email),
                        onChanged: (value) {
                          user.email = value;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter something';
                          } else if (RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                            return null;
                          } else {
                            return 'Enter valid email';
                          }
                        },
                        decoration: InputDecoration(
                            icon: const Icon(
                              Icons.email,
                              color: Colors.blue,
                            ),
                            hintText: 'Email ',
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
                    ), // Input Email field end
                    // Input Password field start
                
                    
                    // Login button start
                    Padding(
                      padding: const EdgeInsets.fromLTRB(55, 16, 16, 0),
                      child: SizedBox(
                        width: 150,
                        height: 50,
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                  child: Stack(children: <Widget>[
                                Container(
                                  
                                  width: 150  ,
                                  height: 50,
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(16)),
                                    gradient: LinearGradient(
                                      colors: <Color>[
                                        Color(0xFF0D47A1),
                                        Color(0xFF1976D2),
                                        Color(0xFF42A5F5),
                                      ],
                                    ),
                                  ),
                                ),
                                TextButton(
                                
                                  style: TextButton.styleFrom(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.all(16.0),
                                      primary: Colors.white,
                                      textStyle: const TextStyle(fontSize: 18)),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      save();
                                    } else {
                                      print("not ok");
                                    }
                                  },
                                  child: const Text(
                                    "Şifremi Yenile",
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ]))
                              
                            ],
                          )),
                    ), // Login button end
                    // dont have account start
                   
                  ],
                ),
              )),
        )
      ],
    ));
  }
}
