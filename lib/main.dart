import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
      home: MyHomePage(),
      theme: ThemeData(primarySwatch: Colors.pink),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int number = 0; // create state

// แสดงผลข้อมูล
  @override
  Widget build(BuildContext context) {
    List<Widget> data = [];
    data.add(Text(
      'กดปุ่มเพื่อเพิ่มตัวเลข',
      style: TextStyle(fontSize: 20),
    ));
    data.add(Text(
      number.toString(),
      style: TextStyle(fontSize: 60),
    ));
    for (var i = 0; i < 10; i++) {
      data.add(Text('รายการที่ ${i + 1}'));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter & Dart'),
        centerTitle: false,
      ),
      body: Center(
        child: ListView(
          children: getData(25),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNumber,
        child: Icon(Icons.add),
      ),
    );
  }

  void addNumber() {
    setState(() {
      number = number + 1;
    });
  }

  void decreaseNumber() {
    if (number > 0) {
      setState(() {
        number = number - 1;
      });
    }
  }

// เตรียมข้อมูล return type
  List<Widget> getData(int count) {
    List<Widget> data = [];
    for (var i = 0; i < count; i++) {
      if (i == count - 1) {
        data.add(Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextButton(
                    child: Icon(Icons.add),
                    onPressed: addNumber,
                  ),
                ),
                Text(
                  number.toString(),
                  style: TextStyle(fontSize: 40),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: TextButton(
                    child: Icon(Icons.delete),
                    onPressed: decreaseNumber,
                  ),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            Text(
              'Hello',
              style: TextStyle(fontSize: 20),
            ),
            TextButton(
              child: Text(
                'สวัสดีครับ',
                style: TextStyle(color: Colors.amber, fontSize: 30),
              ),
              onPressed: () => print('button'),
            ),
            Image(
                image: NetworkImage(
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Gatto_europeo4.jpg/250px-Gatto_europeo4.jpg'))
          ],
        ));
        break;
      }
      var menu = ListTile(
        title: Text(
          'เมนูที่ ${i + 1}',
        ),
        subtitle: Text('หัวข้อย่อยที่ ${i + 1}'),
      );

      data.add(menu);
    }
    return data;
  }
}
