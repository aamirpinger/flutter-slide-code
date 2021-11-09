import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyBulb();
  }
}

class MyBulb extends StatefulWidget {
  const MyBulb({Key? key}) : super(key: key);

  @override
  _MyBulbState createState() => _MyBulbState();
}

class _MyBulbState extends State<MyBulb> {
  bool isOff = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Bulb App'),
            centerTitle: true,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  isOff ? Icons.lightbulb_outline : Icons.lightbulb,
                  size: 200,
                  color: isOff ? null : Colors.limeAccent,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(
                      () {
                        isOff = !isOff;
                      },
                    );
                  },
                  child: Text(
                    'Turn ${isOff ? 'On' : 'Off'}',
                    style: TextStyle(fontSize: 48),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
