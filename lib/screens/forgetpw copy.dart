import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:work/screens/login.dart';
import 'package:work/screens/register.dart';
import 'package:work/screens/forgetpw.dart';
import 'package:work/screens/homepage.dart';

class Forget extends StatefulWidget {
  const Forget({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Forget> createState() => _ForgetState();
}

class _ForgetState extends State<Forget> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  Widget _entryEmailFieled(String title) {
    //email field
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: emailController,
            decoration: const InputDecoration(
              border: InputBorder.none,
              fillColor: Color(0xfff3f3f4),
              filled: true,
            ),
          ),
        ],
      ),
    );
  } //email field

  Widget _submitButton() {
    return Container(
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFF0D47A1),
                    Color(0xFF1976D2),
                    Color(0xFF42A5F5),
                  ],
                ),
              ),
            ),
          ),

          TextButton(
              style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  primary: Colors.white,
                  textStyle: const TextStyle(fontSize: 20)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Login()),
                );
              },
              child: const Text('Şifremi Yenile')),
        ],
      ),
    );
  } //submit button

 
  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text:  TextSpan(
        text: '',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
        children: [
          TextSpan(
            text: 'Haydi Toplanalım',
            style: GoogleFonts.pacifico(
              fontWeight: FontWeight.normal,
              fontSize: 45,
              color: Colors.blue,
            ),  
            
          ),
        ],
      ),
    );
  } //title

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryEmailFieled('Email'),
      ],
    );
  } //email password widget

 
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        height: height,
        child: Stack(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: height * .2,
                    ),
                    _title(),
                    const SizedBox(height: 50),
                    _emailPasswordWidget(),
                    
                     
                    const SizedBox(height: 30),
                    _submitButton(),
                    SizedBox(height: height * .055),
                 
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
