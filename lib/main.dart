// void main() async {
//   print(await loginUser());
//   print('work task');
// }

// Future<String> loginUser() async {
//   // import Data
//   var user = await getUserFromDatabase();
//   return user;
// }

// // ข้อมูลที่จะได้ ใน อนาคต ต้องรอ 10 วิ
// Future<String> getUserFromDatabase() {
//   // get Data
//   return Future.delayed(Duration(seconds: 10), () => 'Weerayooth');
// }

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:http/http.dart' as http;
import 'FoodMenu.dart';
import 'MoneyBox.dart';
import 'ExchangeRate.dart';

Future main() async {
  await DotEnv.load();
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
  ExchangeRate _dataFromAPI;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('call initState');
    getExchangeRate();
  }

  //* ใช้ Future builder เพิ่มรับข้อมูล/ widget ที่ได้จาก future ออกมาใช้
  Future<ExchangeRate> getExchangeRate() async {
    try {
      Uri url = Uri.parse(
          'http://api.exchangeratesapi.io/v1/latest?access_key=${DotEnv.env['EXCHANGE_ACCESS_TOKEN']}');
      var response = await http.get(url);

      //* null ??"" Coalescing ใช้กำหนดค่าเริ่มต้นมาแทน แต่จะทำงานแค่ครั้งเดียว ถ้าไปใช้ที่อื่น จะยังเป็น null อยู่
      //* null ??="" Coalescing Assignment กำหนดค่าใหม่ให้ไปเลย หลังจากนี้ ค่า  null จะเป็นค่่าที่กำหนดให้ตลอด
      //* null ?.   Null Condition
      if (response.statusCode == 200) {
        _dataFromAPI = exchangeRateFromJson(response.body);
        print(response.body);
        return _dataFromAPI; // convert json to dart object
      }
    } catch (e) {
      print(e);
      throw e;
    }
  }

  //* แสดงผลข้อมูล
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Exchange Rate',
            style: TextStyle(
                fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: false,
        ),
        body: FutureBuilder(
          future: getExchangeRate(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            //* snapshot คือ สถานะของ state
            // ดึงข้อมูล มาครบ
            if (snapshot.connectionState == ConnectionState.done) {
              var result = snapshot.data;
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    MoneyBox('สกุลเงิน (EUR)', 1, Colors.lightBlue, 150),
                    SizedBox(height: 5),
                    MoneyBox('THB', result.rates['THB'], Colors.green, 120),
                    SizedBox(height: 5),
                    MoneyBox('USD', result.rates['USD'], Colors.orange, 120),
                  ],
                ),
              );
            }
            return LinearProgressIndicator();
          },
        ));
  }
}
