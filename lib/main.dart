import 'package:flutter/material.dart';
import 'FoodMenu.dart';
import 'MoneyBox.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
      home: MyHomePage(),
      theme: ThemeData(primarySwatch: Colors.green),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int number = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('call initState');
  }

// แสดงผลข้อมูล
  @override
  Widget build(BuildContext context) {
    print('call build');

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'บัญชีของฉัน',
          style: TextStyle(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Text(
            'Message${number.toString()}',
            style: TextStyle(fontSize: 30),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            number++;
          });
        },
      ),
    );
  }
}
