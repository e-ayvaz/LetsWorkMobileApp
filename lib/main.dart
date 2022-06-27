import 'package:flutter/material.dart';
import 'package:work/screens/login.dart';
import 'package:work/routes.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  // await MongoDatabase.connect();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:const Login(),
      // home:SignIn(title: ""),
      debugShowCheckedModeBanner: false ,
      routes: routes,
    );
    
  }
}
