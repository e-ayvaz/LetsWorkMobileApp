import 'package:flutter/material.dart';
import 'package:work/screens/createWork.dart';
import 'package:work/screens/messagePage.dart';
import 'package:work/screens/messages.dart';
import 'package:work/screens/notification.dart';
import '../components/coustom_bottom_nav_bar.dart';
import '../enums.dart';

class HomeWork extends StatelessWidget {
  const HomeWork({Key? key}) : super(key: key);
  static String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar : Title
      appBar: AppBar(
        title: const Text("Haydi Toplanalım"),
      ),
      //body: SwipeList(),=> cardView()
      body: const Center(child: SwipeList()),
      //+ button to create new work
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CreateWork()));
        },
        backgroundColor: const Color.fromARGB(139, 12, 12, 226),
        child: const Icon(Icons.add),
      ),
      //bottomNavBar: view Pages (Home, Messages, Profile,notification)
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}

//SwipeList STF
class SwipeList extends StatefulWidget {
  const SwipeList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ListItemWidget();
  }
}

class ListItemWidget extends State<SwipeList> {
  List items = getDummyList();
  
  static String title= "katıl";
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(items[index]),
            background: Container(
              alignment: AlignmentDirectional.centerEnd,
              color: Colors.red,
              child: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            onDismissed: (direction) {
              setState(() {
                items.removeAt(index);
              });
            },
            secondaryBackground: Container(
              alignment: AlignmentDirectional.centerStart,
              color: Colors.green,
              child: const Icon(
                Icons.check,
                color: Colors.white,
              ),
            ),
            direction: DismissDirection.endToStart,
            child: Card(
              margin: const EdgeInsets.all(20),
              color: Theme.of(context).colorScheme.background,
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
                                    items[index],
                                    style: const TextStyle(fontSize: 10),
                                  ),
                                  RichText(
                                    text: const TextSpan(
                                      children: [
                                        WidgetSpan(
                                          child:
                                              Icon(Icons.date_range, size: 14),
                                        ),
                                        TextSpan(
                                          text: "25.06.2022 ",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        WidgetSpan(
                                          child:
                                              Icon(Icons.access_time, size: 14),
                                        ),
                                        TextSpan(
                                          text: "11:00",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 3, 0, 3),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 70,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.teal),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(30))),
                                          child: const Text(
                                            "Gazi Üniversitesi",
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Color.fromARGB(
                                                    255, 9, 58, 104)),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Container(
                                          width: 50,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.teal),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(30))),
                                          child: const Text(
                                            "Sayısal Tasarım",
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Color.fromARGB(
                                                    255, 9, 58, 104)),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 1,
                                        ),
                                        Container(
                                          width: 80,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.teal),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(30))),
                                          child: const Text(
                                            "Bilgisayar Mühendisliği",
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Color.fromARGB(
                                                    255, 9, 58, 104)),
                                            textAlign: TextAlign.center,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.fromLTRB(0, 5, 0, 2),
                                    child: SizedBox(
                                      width: 250,
                                      child: Text(
                                        "Vize sınavı çalışması gerçekleştireceğim. Katılmak isteyene arkadaşları bekliyorum.",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Color.fromARGB(
                                                255, 48, 48, 54)),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 3, 0, 3),
                                      child: Row(children: <Widget>[
                                        Container(
                                          height: 30,
                                          width: 120,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.teal),
                                              borderRadius:
                                                  const BorderRadius.all(
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
                                                  color: Color.fromARGB(
                                                      255, 48, 48, 54)),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 30,
                                          width: 120,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.teal),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(30))),
                                          
                                          child: TextButton(
                                            
                                            onPressed:changeText,
                                            child: Text(
                                              title,
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: Color.fromARGB(
                                                      255, 48, 48, 54)),
                                            ),
                                          ),
                                        ),
                                      ])),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                ])))
                  ])),
            ),
          );
        });
  }

  static List getDummyList() {
    List list = List.generate(1, (i) {
      return "Enes Ayvaz";
    });
    return list;
  }
  changeText(){
  setState(() {
    title='İstek gönderildi ';
    
  });
}
}
