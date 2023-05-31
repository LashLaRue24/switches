import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './switchPress.dart';
import './levels.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class _MyAppState extends State<MyApp> {
  var level = Levels();

  void _flipSwitches(ind, sw) {
    setState(() {
      var counter = 0;
      var switchLocation;

      while (counter < sw[ind]['switchFlip'].length) {
        switchLocation = sw[ind]['switchFlip'][counter];
        if (sw[switchLocation]['switchStatus'] == 'Off')
          sw[switchLocation]['switchStatus'] = 'On';
        else if (sw[switchLocation]['switchStatus'] == 'On')
          sw[switchLocation]['switchStatus'] = 'Off';
        counter = counter + 1;
      }
    });
  }

  String _didWin(List<Map<String, Object>> sw) {
    String phrase = 'You win switches. Good on you, champ.';

    for (var i = 0; i <= 8; i++) {
      if (sw[i]['switchStatus'] == 'Off') {
        phrase = '';
        i = 8;
      }
    }

    return phrase;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Switches'),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(children: <Widget>[
            Text(
              'Turn on all the switches to win.',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              'Blue is on.',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            Text(
              'Red is off.',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                children: List.generate(9, (index) {
                  return SwitchPress(
                    index: index,
                    flipSwitches: _flipSwitches,
                    switchProperties: level.switchProperties,
                  );
                }),
              ),
            ),
            Text(
              _didWin(level.switchProperties),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            FlatButton(
                child: Text('Restart Game?'),
                onPressed: () {
                  setState(
                    () {
                      level = Levels();
                    },
                  );
                }),
          ]),
        ),
      ),
    );
  }
}
