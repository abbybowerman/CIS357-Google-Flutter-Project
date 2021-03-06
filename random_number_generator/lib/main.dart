import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CIS 357 Project',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Random Number Generator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final lowController = TextEditingController();
  final highController = TextEditingController();
  final resultText = TextEditingController();

  void _randomNumber() {
    setState(() {
      //Create an instance of Random()
      Random rand = new Random();

      //The strings grab the text from the low and high text fields respectively
      String strMin = lowController.text;
      String strMax = highController.text;

      //This is in a try block in case the user tries to non numeric values
      try{
        //Takes the string values from the text fields and converts them
        //to integers
        //This will catch errors if non numeric values are entered
        int min = int.parse(strMin);
        int max = int.parse(strMax);

        //Checks to make sure max isn't smaller than min
        if(min > max){
          resultText.text = "Maximum must be greater than minimum";
        }else{
          //Computes the random number and stores it
          int result = rand.nextInt(max - min + 1) + min;
          //Sets the result to the text
          resultText.text = result.toString();
        }
      }catch(FormatException){ //catches formatting errors from parsing
        resultText.text = "Invalid inputs";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Random number generator',
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: lowController,
                decoration: InputDecoration(
                  hintText: 'Low'
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: highController,
                decoration: InputDecoration(
                  hintText: 'High'
                ),
              ),
            ),
            FlatButton(
              onPressed: () {
                _randomNumber();
              },
              child: Text(
                'Calculate'
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: resultText
              ),
            ),
          ],
        ),
      ),
    );
  }
}
