import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Калькулятор'),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final t = List.filled(11, []);
  var num;
  var text;
  var text2;
  var char;

  @override
  initState() {
    super.initState();
     num = '';
     text = '';
     text2 = '';
     char = '';
  }

  void _Plus() {  //Сложение
    var y = '0';
    List<String> x = text.split('');
    for (var i = 0; i < x.length; i++) {
      if (x[i] == '+' || x[i] == '^' || x[i] == '/' || (x[i] == '-' && x[0] != '-') || x[i] == '*')
        y = '1';
    }
    if (text != '' && y != '1')
      this.char = '+';
    else if (text != '') {
      this.text = text2;
      this.char = "+";
      this.text2 = '';
    }
  }

  void _Minus() {  //Вычитание
    var y = '0';
    List<String> x = text.split('');
    for (var i = 0; i < x.length; i++) {
      if (x[i] == '+' || x[i] == '^' || x[i] == '/' || (x[i] == '-' && x[0] != '-') || x[i] == '*')
        y = '1';
    }
    if (text != '' && y != '1')
      this.char = '-';
    else if (text != '') {
      this.text = text2;
      this.char = "-";
      this.text2 = '';
    }
  }

  void _Divide() {  //Деление
    var y = '0';
    List<String> x = text.split('');
    for (var i = 0; i < x.length; i++) {
      if (x[i] == '+' || x[i] == '^' || x[i] == '/' || (x[i] == '-' && x[0] != '-') || x[i] == '*')
        y = '1';
    }
    if (text != '' && y != '1')
      this.char = '/';
    else if (text != '') {
      this.text = text2;
      this.char = "/";
      this.text2 = '';
    }
  }

  void _Multiplication() { //Умножение
    var y = '0';
    List<String> x = text.split('');
    for (var i = 0; i < x.length; i++) {
      if (x[i] == '+' || x[i] == '^' || x[i] == '/' || (x[i] == '-' && x[0] != '-') || x[i] == '*')
        y = '1';
    }
    if (text != '' && y != '1')
      this.char = '*';
    else if (text != '') {
      this.text = text2;
      this.char = "*";
      this.text2 = '';
    }
  }

  void _Sign() {  //Смена знака
    var y ='0';
    List<String> x = text.split('');
    for (var i = 1; i < x.length; i++) {
      if (x[i] == '+' || x[i] == '^' || x[i] == '/' || x[i] == '-' ||
          x[i] == '*')
        y = '1';
    }
      if (text != '' && char == '' && y != '1') {
        List<String> x = text.split('');
        if (x[0] == '-') {
          x.remove(x[0]);
          this.text = x.join('');
        }
        else
          this.text = '-' + text;
      }
      else if (text2 != '' && char != '') {
        List<String> x = text2.split('');
        if (x[0] == '-') {
          x.remove(x[0]);
          this.text2 = x.join('');
        }
        else
          this.text2 = '-' + text2;
      }
  }

  void _Degree() {  //Возведение в степень
    var y = '0';
    List<String> x = text.split('');
    for (var i = 0; i < x.length; i++) {
      if (x[i] == '+' || x[i] == '^' || x[i] == '/' || (x[i] == '-' && x[0] != '-') || x[i] == '*')
        y = '1';
    }
    if (text != '' && y != '1')
      this.char = '^';
    else if (text != '') {
      this.text = text2;
      this.char = "^";
      this.text2 = '';
    }
  }

  void _Clear() {  //Очистка поля
    this.text = '';
    this.text2 = '';
    this.char = '';
  }

  void _Equals() {  //Вычисление
    var num1;
    var num2;
    if (text != '' && char != '' && text2 != '') {
      this.text = this.text + this.char + this.text2;
      List<String> x = text.split('');
      if (x[0] != '-') {
        for (var i = 0; i < x.length; i++) {
          if (x[i] == '+') {
            List<String> y = text.split('+');
            num1 = double.parse(y[0]);
            num2 = double.parse(y[1]);
            this.text2 = (num1 + num2).toString();
            break;
          }
          if (x[i] == '^') {
            List<String> y = text.split('^');
            num1 = double.parse(y[0]);
            num2 = double.parse(y[1]);
            this.text2 = pow(num1, num2).toString();
            break;
          }
          if (x[i] == '/') {
            List<String> y = text.split('/');
            num1 = double.parse(y[0]);
            num2 = double.parse(y[1]);
            this.text2 = (num1 / num2).toString();
            break;
          }
          if (x[i] == '*') {
            List<String> y = text.split('*');
            num1 = double.parse(y[0]);
            num2 = double.parse(y[1]);
            this.text2 = (num1 * num2).toString();
            break;
          }
          if (x[i] == '-') {
            List<String> y = text.split('-');
            num1 = double.parse(y[0]);
            num2 = double.parse(y[1]);
            this.text2 = (num1 - num2).toString();
          }
        }
      }
      else if (x[0] == '-'){
        for (var i = 1; i < x.length; i++) {
          if (x[i] == '+') {
            List<String> y = text.split('+');
            num1 = double.parse(y[0]);
            num2 = double.parse(y[1]);
            this.text2 = (num1 + num2).toString();
            break;
          }
          if (x[i] == '^') {
            List<String> y = text.split('^');
            num1 = double.parse(y[0]);
            num2 = double.parse(y[1]);
            this.text2 = pow(num1, num2).toString();
            break;
          }
          if (x[i] == '/') {
            List<String> y = text.split('/');
            num1 = double.parse(y[0]);
            num2 = double.parse(y[1]);
            this.text2 = (num1 / num2).toString();
            break;
          }
          if (x[i] == '*') {
            List<String> y = text.split('*');
            num1 = double.parse(y[0]);
            num2 = double.parse(y[1]);
            this.text2 = (num1 * num2).toString();
            break;
          }
          if (x[i] == '-') {
            List<String> y = text.split('-');
            num1 = double.parse(y[0]);
            num2 = double.parse(y[1]);
            this.text2 = (num1 - num2).toString();
          }
        }
      }
      if (text2 == '-0.0')
        text2 = '0';
      List<String> a = text2.split('.');
      if (a[1] == '0')
        this.text2 = a[0];
      if (text2.length > 11) {
        this.text2 = text2.substring(0, 11);
      }
      this.char = '';
    }
  }

  void _Point() {
    var z = '0';
    if (text != '' && text.length !<= 9 && char == '') {
      List<String> x = text.split('');
      for (var i = 0; i < x.length; i++) {
        if (x[i] == '.')
          z = '1';
      }
      if (z == '0' && text2 == '')
        this.text += '.';
    }
    if (text2 != '' && text2.length !<= 9 && char != '') {
      List<String> y = text2.split('');
      for (var i = 0; i < y.length; i++) {
        if (y[i] == '.')
          z = '1';
      }
      if (z == '0')
        this.text2 += '.';
    }
  }

  void _Number() {
    var y = '0';
    List<String> x = text.split('');
    for (var i = 1; i < x.length; i++) {
      if (x[i] == '+' || x[i] == '-' || x[i] == '/' || x[i] == '*' || x[i] == '^') {
        y = '1';
        break;
      }
    }
    if (y == '1') {
      this.text = '';
      this.text2 = '';
      this.char = '';
      this.text += num;
    }
    if (y == '0') {
      if (this.char == '' && text.length != 10) {
        if (x.length > 1)
          if ((x[0] == '0' && x[1] != '.') || (x[0] == '-' && x[1] == '0' && x[2] != '.') && num == '0')
          this.text = text;
        this.text += num;
      }
      else if (this.char != '' && text2.length != 10)
        this.text2 += num;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      backgroundColor: Colors.cyanAccent, //цвет фона
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Expanded(  // Для первого числа
              flex: 500,
                child: Container(
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 34,
                    ),
                  ),
                ),
            ),
            Expanded(   // Для знака
              flex: 500,
                child: Container(
                  child: Text(
                    char,
                    style: TextStyle(
                      fontSize: 32,
                    ),
                  ),
              ),
            ),
            Expanded(  // Для второго числа
              flex: 500,
                child: Container(
                  child: Text(
                    text2,
                    style: TextStyle(
                      fontSize: 34,
                    ),
                  ),
            ),
            ),
            Expanded(
              flex: 1000,
              child: Container(
                child: Row(
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () => {setState(() => _Clear())},
                      child: Text('C'),
                      style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(
                          fontSize: 34,
                        ),
                        primary: Colors.black,
                        minimumSize: Size(MediaQuery.of(context).size.width * 0.5,MediaQuery.of(context).size.height * 0.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => {setState(() => _Degree())},
                      child: Text('^'),
                      style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(
                          fontSize: 34,
                        ),
                        primary: Colors.red,
                        minimumSize: Size(MediaQuery.of(context).size.width * 0.25,MediaQuery.of(context).size.height * 0.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => {setState(() => _Divide())},
                      child: Text('/'),
                      style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(
                          fontSize: 34,
                        ),
                        primary: Colors.red,
                        minimumSize: Size(MediaQuery.of(context).size.width * 0.25,MediaQuery.of(context).size.height * 0.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ),
            Expanded(
              flex: 1000,
              child: Container(
                child: Row(
                  children: <Widget>[
                  ElevatedButton(
                  onPressed: () {
                    setState(() => this.num = '7');
                    setState(() => _Number());
                  },
                  child: Text('7'),
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(
                      fontSize: 34,
                    ),
                    primary: Colors.blue,
                    minimumSize: Size(MediaQuery.of(context).size.width * 0.25,MediaQuery.of(context).size.height * 0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() => this.num = '8');
                    setState(() => _Number());
                  },
                  child: Text('8'),
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(
                      fontSize: 34,
                    ),
                    primary: Colors.blue,
                    minimumSize: Size(MediaQuery.of(context).size.width * 0.25,MediaQuery.of(context).size.height * 0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() => this.num = '9');
                    setState(() => _Number());
                  },
                  child: Text('9'),
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(
                      fontSize: 34,
                    ),
                    primary: Colors.blue,
                    minimumSize: Size(MediaQuery.of(context).size.width * 0.25,MediaQuery.of(context).size.height * 0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => {setState(() => _Multiplication())},
                  child: Text('*'),
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(
                      fontSize: 34,
                    ),
                    primary: Colors.red,
                    minimumSize: Size(MediaQuery.of(context).size.width * 0.25,MediaQuery.of(context).size.height * 0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                  ),
                ),
                ],
              ),
            ),
            ),
            Expanded(
              flex: 1000,
              child: Container(
                child: Row(
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        setState(() => this.num = '4');
                        setState(() => _Number());
                      },
                      child: Text('4'),
                      style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(
                          fontSize: 34,
                        ),
                        primary: Colors.blue,
                        minimumSize: Size(MediaQuery.of(context).size.width * 0.25,MediaQuery.of(context).size.height * 0.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() => this.num = '5');
                        setState(() => _Number());
                      },
                      child: Text('5'),
                      style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(
                          fontSize: 34,
                        ),
                        primary: Colors.blue,
                        minimumSize: Size(MediaQuery.of(context).size.width * 0.25,MediaQuery.of(context).size.height * 0.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() => this.num = '6');
                        setState(() => _Number());
                      },
                      child: Text('6'),
                      style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(
                          fontSize: 34,
                        ),
                        primary: Colors.blue,
                        minimumSize: Size(MediaQuery.of(context).size.width * 0.25,MediaQuery.of(context).size.height * 0.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => {setState(() => _Minus())},
                      child: Text('-'),
                      style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(
                          fontSize: 34,
                        ),
                        primary: Colors.red,
                        minimumSize: Size(MediaQuery.of(context).size.width * 0.25,MediaQuery.of(context).size.height * 0.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                      ),
                    ),
                  ],
                ),
            ),
            ),
            Expanded(
              flex: 1000,
              child: Container(
                child: Row(
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        setState(() => this.num = '1');
                        setState(() => _Number());
                      },
                      child: Text('1'),
                      style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(
                          fontSize: 34,
                        ),
                        primary: Colors.blue,
                        minimumSize: Size(MediaQuery.of(context).size.width * 0.25,MediaQuery.of(context).size.height * 0.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() => this.num = '2');
                        setState(() => _Number());
                      },
                      child: Text('2'),
                      style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(
                          fontSize: 34,
                        ),
                        primary: Colors.blue,
                        minimumSize: Size(MediaQuery.of(context).size.width * 0.25,MediaQuery.of(context).size.height * 0.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() => this.num = '3');
                        setState(() => _Number());
                      },
                      child: Text('3'),
                      style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(
                          fontSize: 34,
                        ),
                        primary: Colors.blue,
                        minimumSize: Size(MediaQuery.of(context).size.width * 0.25,MediaQuery.of(context).size.height * 0.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => {setState(() => _Plus())},
                      child: Text('+'),
                      style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(
                          fontSize: 34,
                        ),
                        primary: Colors.red,
                        minimumSize: Size(MediaQuery.of(context).size.width * 0.25,MediaQuery.of(context).size.height * 0.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1000,
                child: Container(
                  child: Row(
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () => {setState(() => _Sign())},
                        child: Text('-/+'),
                        style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(
                            fontSize: 34,
                          ),
                          primary: Colors.red,
                          minimumSize: Size(MediaQuery.of(context).size.width * 0.25,MediaQuery.of(context).size.height * 0.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: ()  {
                          setState(() => this.num = '0');
                          setState(() => _Number());
                        },
                        child: Text('0'),
                        style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(
                            fontSize: 34,
                          ),
                          primary: Colors.blue,
                          minimumSize: Size(MediaQuery.of(context).size.width * 0.25,MediaQuery.of(context).size.height * 0.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => {setState(() => _Point())},
                        child: Text('.'),
                        style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(
                            fontSize: 34,
                          ),
                          primary: Colors.red,
                          minimumSize: Size(MediaQuery.of(context).size.width * 0.25,MediaQuery.of(context).size.height * 0.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => {setState(() => _Equals())},
                        child: Text('='),
                        style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(
                            fontSize: 34,
                          ),
                          primary: Colors.red,
                          minimumSize: Size(MediaQuery.of(context).size.width * 0.25,MediaQuery.of(context).size.height * 0.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ),
          ]
      )
    );
  }
}
