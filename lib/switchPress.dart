import 'package:flutter/material.dart';

class SwitchPress extends StatelessWidget {
  final int index;
  final Function flipSwitches;
  final List<Map> switchProperties;

  SwitchPress({this.index, this.flipSwitches, this.switchProperties});

  @override
  Widget build(BuildContext context) {
    if (switchProperties[index]['switchStatus'] == 'On')
      return Container(
        padding: EdgeInsets.all(10),
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(18.0),
          ),
          onPressed: () => flipSwitches(index, switchProperties),
          color: Colors.blue,
          textColor: Colors.white,
          child: Text(
            switchProperties[index]['switchId'].toString(),
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
      );
    else {
      return Container(
        padding: EdgeInsets.all(10),
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(36.0),
          ),
          onPressed: () => flipSwitches(index, switchProperties),
          color: Colors.red,
          textColor: Colors.black,
          child: Text(
            switchProperties[index]['switchId'].toString(),
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
      );
    }
  }
}
