import 'package:flutter/material.dart';
import 'Items.dart';

void main() => runApp(MyApp());
var secondColor = Color(0xff18ffff);
var firstColor = Color(0xff6a1b9a);
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(
        primaryColor: Color(0xff6a1b9a),
        bottomAppBarColor: Colors.white,
        textTheme: Theme.of(context).textTheme.copyWith(title: TextStyle(color:Colors.black87 /*Color(0xff6a1b9a)*/, fontSize: 16,fontWeight: FontWeight.bold , fontFamily: 'Montserrat'),
            subtitle: TextStyle(color: Colors.grey[400], fontSize:14, fontFamily: 'Montserrat'  ),
        ),

      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  List<Widget> chosedPage = <Widget>[
    FirstPage(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: chosedPage[index]),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 16,
        onTap: (ind) {
          setState(() {
            index = ind;
          });
        },
        currentIndex: index,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.monetization_on), title: Text('donations')),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), title: Text('account'))
        ],
      ),
    );
  }
}

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  List<Announce> announceList = <Announce>[
    Announce(
        title: 'Helping orphans during Ramadan',
        date: 10,
        description:
            'Phasellus id rhoncus purus. Morbi lobortis vitae nulla dapibus tincidunt. Aliquam sed tortor elit. Ut a justo egestas, dignissim nisl sit amet, maximus ex. Ut fringilla dictum nisl, sit amet congue enim blandit in. Donec eleifend eu ex in mattis. Maecenas congue sem eu suscipit pretium. Integer efficitur ut felis non interdum. Donec aliquam felis lectus, non rhoncus tellus laoreet eu. Sed mattis libero eu maximus vestibulum. Aenean convallis dolor a massa hendrerit eleifend. Aenean sit amet erat scelerisque elit tincidunt luctus nec sit amet tortor. Vivamus eros enim, dictum at justo efficitur, fringilla rutrum neque. Nam posuere sagittis vehicula. Sed non justo orci.',
        image: 'assets/img/anes-sabitovic-286668-unsplash.jpg',
        collectedSum: 15000,
        neededSum: 120000,
        owner: 'Dir lKhir'),
    Announce(
        title: 'Funding operations for homeless people',
        date: 20,
        description:
            'Donec eleifend eu ex in mattis. Maecenas congue sem eu suscipit pretium. Integer efficitur ut felis non interdum. Donec aliquam felis lectus, non rhoncus tellus laoreet eu. Sed mattis libero eu maximus vestibulum. Aenean convallis dolor a massa hendrerit eleifend. Aenean sit amet erat scelerisque elit tincidunt luctus nec sit amet tortor. Vivamus eros enim, dictum at justo efficitur, fringilla rutrum neque. Nam posuere sagittis vehicula. Sed non justo orci.',
        image: 'assets/img/kat-yukawa-754726-unsplash.jpg',
        collectedSum: 6200,
        neededSum: 12800,
        owner: 'Dir lKhir'),
    Announce(
        title: 'building a mosque',
        date: 15,
        description:
            'Vivamus eros enim, dictum at justo efficitur, fringilla rutrum neque. Nam posuere sagittis vehicula. Sed non justo orci.',
        image: 'assets/img/perry-grone-732606-unsplash.jpg',
        collectedSum: 481000,
        neededSum: 555800,
        owner: 'Dir lKhir')
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(top: 20),
      itemBuilder: (context, ind) {
        return OneItem(announceList[ind],context);
      },
      itemCount: announceList.length,
      itemExtent: 250,
    );
  }
}
