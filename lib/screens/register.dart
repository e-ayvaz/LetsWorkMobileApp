import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:work/screens/login.dart';
import 'package:work/model/user.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
   
  final _formKey = GlobalKey<FormState>();
  Future save() async {
    var res = await http.post(Uri.parse("http://localhost:3000/signup"),
        headers: <String, String>{
          'Context-Type': 'application/json;charSet=UTF-8'
        },
        body: <String, String>{
          'name': user.name,
          'email': user.email,
          'password': user.password,
          'university': user.university,
          'department': user.department
        });
    print(res.body);
    Navigator.push(
        context, new MaterialPageRoute(builder: (context) => const Login()));
  }

  User user = User(
    id: "",
    name: "",
    email: "",
    password: "",
    confirmPassword: "",
    university: "",
    department: "",
  );
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
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
                  //title
                  Text(
                    "Haydi Toplanalım",
                    style: GoogleFonts.pacifico(
                        fontWeight: FontWeight.normal,
                        fontSize: 45,
                        color: Colors.blue),
                  ),
                  const SizedBox(height: 25),

                  //name field start
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      controller: TextEditingController(text: user.name),
                      onChanged: (value) {
                        user.name = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter something';
                        } else if (RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]")
                            .hasMatch(value)) {
                          return null;
                        } else {
                          return 'Adınızı Soyadınız Doğru giriniz';
                        }
                      },
                      decoration: InputDecoration(
                          icon: const Icon(
                            Icons.group,
                            color: Colors.blue,
                          ),
                          hintText: 'Adınız Soyadınız',
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(color: Colors.blue)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(color: Colors.blue)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(color: Colors.red)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(color: Colors.red))),
                    ),
                  ), //name field end
                  //university field start
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      controller: TextEditingController(text: user.university),
                      onChanged: (value) {
                        user.university = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter something';
                        } else if (RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]")
                            .hasMatch(value)) {
                          return null;
                        } else {
                          return 'Universitenizi Doğru giriniz';
                        }
                      },
                      decoration: InputDecoration(
                          icon: const Icon(
                            Icons.school,
                            color: Colors.blue,
                          ),
                          hintText: 'Üniversiteniz',
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(color: Colors.blue)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(color: Colors.blue)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(color: Colors.red)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(color: Colors.red))),
                    ),
                  ), //university field end
                  //department field start
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      controller: TextEditingController(text: user.department),
                      onChanged: (value) {
                        user.department = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter something';
                        } else if (RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]")
                            .hasMatch(value)) {
                          return null;
                        } else {
                          return 'Universitenizi Doğru giriniz';
                        }
                      },
                      decoration: InputDecoration(
                          icon: const Icon(
                            Icons.collections_bookmark,
                            color: Colors.blue,
                          ),
                          hintText: 'Bölümünüz',
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(color: Colors.blue)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(color: Colors.blue)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(color: Colors.red)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(color: Colors.red))),
                    ),
                  ), //department field end
                  //email field start
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      controller: TextEditingController(text: user.email),
                      onChanged: (value) {
                        user.email = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Adınızı Soyadınızı Doğru giriniz';
                        } else if (RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                          return null;
                        } else {
                          return 'Eposta Adresinizi Doğru Giriniz';
                        }
                      },
                      decoration: InputDecoration(
                          icon: const Icon(
                            Icons.email,
                            color: Colors.blue,
                          ),
                          hintText: 'Email adresinizi giriniz',
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(color: Colors.blue)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(color: Colors.blue)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(color: Colors.red)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(color: Colors.red))),
                    ),
                  ), //email field end
                  //password field start
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      controller: TextEditingController(text: user.password),
                      onChanged: (value) {
                        user.password = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email Adresiniz';
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          icon: const Icon(
                            Icons.vpn_key,
                            color: Colors.blue,
                          ),
                          hintText: 'Şifrenizi Giriniz',
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(color: Colors.blue)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(color: Colors.blue)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(color: Colors.red)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(color: Colors.red))),
                    ),
                  ), //password field end
                  //confirm password field start
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      controller:
                          TextEditingController(text: user.confirmPassword),
                      onChanged: (value) {
                        user.confirmPassword = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Şifrenizi Doğrulayınız';
                        } else if (value != user.password) {
                          return 'Şifreler Uyuşmuyor';
                        } else {
                          return null;
                        }
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          icon: const Icon(
                            Icons.vpn_key,
                            color: Colors.blue,
                          ),
                          hintText: 'Şifrenizi Doğrulayınız',
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(color: Colors.blue)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(color: Colors.blue)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(color: Colors.red)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(color: Colors.red))),
                    ),
                  ), //confirm password field end
                  //RegisterButton field start
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            save();
                          } else {
                            print("not ok");
                          }
                        },
                        child: Container(
                          width: 150,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xff00A86B),
                          ),
                          child: const Center(
                            child:  Text(
                                    "Hesap Oluştur",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Login()));
                        },
                        child:Container(
                          width:  150,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue,
                          ),
                        child: const Center(
                          child: Text("Zaten Hesabınız Var mı ? ",
                            style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),) ,
                      ),))
                    ],
                  )
                ],

                //RegisterButton field start
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
