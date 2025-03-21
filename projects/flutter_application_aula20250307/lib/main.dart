import 'package:flutter/material.dart';

double side = 80;

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello World'),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          color: Colors.brown,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 600,
                alignment: AlignmentDirectional.center,
                color: Colors.orange,
                height: 40,
                child: Text(
                  'APP',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    color: Colors.blue,
                    width: side,
                    height: side,
                  ),
                  Container(
                    color: Colors.green,
                    width: side,
                    height: side,
                  ),
                  Container(
                    color: Colors.yellow,
                    width: side,
                    height: side,
                  ),
                ],
              ),
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    color: Colors.red,
                    width: side * 2,
                    height: side * 2,
                  ),
                  Container(
                    color: Colors.blue,
                    width: side,
                    height: side,
                  ),
                ]
              ),
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    color: Colors.blue,
                    width: side * 2,
                    height: side * 2,
                  ),
                  Container(
                    color: Colors.red,
                    width: side,
                    height: side,
                  ),
                ]
              ),
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    color: Colors.yellow,
                    width: side * 2,
                    height: side * 2,
                  ),
                  Container(
                    color: Colors.green,
                    width: side,
                    height: side,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    color: Colors.green,
                    width: side,
                    height: side,
                  ),
                  Container(
                    color: Colors.yellow,
                    width: side,
                    height: side,
                  ),
                  Container(
                    color: Colors.blue,
                    width: side,
                    height: side,
                  ),
                ],
              ),
              // TextButton(
              //   style: TextButton.styleFrom(
              //     foregroundColor: Colors.black,
              //     backgroundColor: Colors.white,
              //     minimumSize: Size(side * 2, 40),
              //     // textStyle: TextStyle(fontSize: 20),
              //     // shape: RoundedRectangleBorder(
              //     //   borderRadius: BorderRadius.circular(10),
              //     //   side: BorderSide(color: Colors.red, width: 2),
              //     // ),
              //   ),
              //   child: Text('Botão'),
              //   onPressed: () => print('Button Clicked')
              // ),
              ElevatedButton(
                child: Text("Botão"),
                onPressed: () => print('Button Clicked')
              )
            ],
          ),
        )
      ),
    )
  );
}
