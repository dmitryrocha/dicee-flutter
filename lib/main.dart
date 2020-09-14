import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  @override
  Widget build(BuildContext context) {

    int changeNumber(){
      return Random().nextInt(6)+1;
    }


    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: FlatButton(
                  color: Colors.white,
                      textColor: Colors.red,
                      padding: EdgeInsets.all(8.0),
                      splashColor: Colors.redAccent,
                      onPressed: () {
                        setState(() {
                          leftDiceNumber = changeNumber();
                          rightDiceNumber = changeNumber();
                        });
                      },
                  child: Text(
                    "Rodar ambos os dados simutaneamente",
                    style: TextStyle(fontSize: 20.0),
                  )
                  ),
                )
            ],
          ),
          Row(
            children: [
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
          Row(
            children:<Widget> [
              Expanded(
                child: FlatButton(
                    onPressed: (){
                      setState(() {
                        leftDiceNumber = changeNumber();
                      });
                    },
                    child: Image.asset('images/dice$leftDiceNumber.png')
                ),
              ),
              Expanded(
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      rightDiceNumber = changeNumber();
                    });
                  },
                    child: Image.asset('images/dice$rightDiceNumber.png')
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

