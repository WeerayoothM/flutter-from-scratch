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
// แสดงผลข้อมูล
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'บัญชีของฉัน',
          style: TextStyle(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(children: [
            MoneyBox('ยอดคงเหลือ', 32000, Colors.blue, 120),
            SizedBox(
              height: 10,
            ),
            MoneyBox('รายรับ', 12000, Colors.lightGreen, 100),
            SizedBox(
              height: 10,
            ),
            MoneyBox('รายจ่าย', 15000, Colors.red, 100),
            SizedBox(
              height: 10,
            ),
            MoneyBox('ค้างชำระ', 2000, Colors.pink, 100),
          ])),
    );
  }
}
