import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'lista_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  final widgetOptions = [
    new ListPage(),
    Text('Adicionar photo'),
    Text('Favoritos')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Photos'),
      ),
      body: Center(child: widgetOptions.elementAt(selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.local_drink), title: Text('Lista')),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_a_photo), title: Text('Adicionar Photo')),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), title: Text('Photo'))
        ],
        currentIndex: selectedIndex,
        fixedColor: Colors.blueAccent,
        onTap: cliquei,
      ),
    );
  }

  void cliquei(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
