// import 'dart:ffi';

import 'package:flutter/material.dart';

// var name = "123456789";
// var bb = name.substring(0,name.length-2);
var result = "";
var value = "0";
int Fno = 0;
int Sno = 0;
var op;
var doubleF = 0.0;
var doubleS = 0.0;
var history = "0";
// var one = "";
class MyCalculator extends StatefulWidget {
  const MyCalculator({ Key? key }) : super(key: key);

  @override
  State<MyCalculator> createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
  Widget btn (String btntext,btncolor,textcolor,){
    return Container(
      color: Colors.black,
      child: RaisedButton(onPressed: () => _click(btntext),
      color: btncolor,
      shape: CircleBorder(),
      child: Text(btntext,textAlign:TextAlign.center ,style: TextStyle(
        fontSize: 35,
        color: textcolor,
        
      ),),
      
      padding: EdgeInsets.all(20),
      )
    );
  }
  _click(String btntext){
    // print(val);
    setState(() {
      // print (bb);
    
        if (btntext == "AC") {
          print(btntext);
        value = "0";
        history = "0";
        int Fno = 0;
        int Sno = 0;
        doubleF = 0.0;
        doubleS = 0.0;
        result = "";
        op = "";
      }
      else if(btntext == "⌫"){
          value = value.substring(0,value.length-1);
          history = history.substring(0,history.length-1);
          if (history == "") {
            history = "0";
          }
          print(value);
          if(value == ""){
            value ="0";
          }
      }
      else if(btntext == "+" || btntext == "-" || btntext == "%" ||btntext == "x" || btntext == "/"){
        history += btntext;
        op = btntext;
        // print(value == double.parse(value).toString());
          Fno = int.parse(value);
            
         value = "";
          
        print(Fno);
        }

      else if(btntext == "="){
        Sno = int.parse(value);
        value = "";
        print(Sno);
        if (op == "+") {
          value = (Fno+Sno).toString();
        }
        if (op == "-") {
          value = (Fno-Sno).toString();
        }
        if (op == "%") {
          value = (Fno%Sno).toStringAsFixed(4);
          // history =  Fno.toStringAsFixed(4)) +op.toString()+ Sno.toString();
        }
        if (op == "x") {
          value = (Fno*Sno).toString();
          result = value;

          // history =  Fno.toString() +op.toString()+ Sno.toString();
        }
        if (op == "/") {
          value = (Fno/Sno).toStringAsFixed(4);
          result = value;
          // history =  Fno.toString() +op.toString()+ Sno.toString();
        }
        // print(value);
      }

      else{
        if (value== "0") {
          value = btntext;
          history = btntext;
          // print(value);
        } else {
          value = value + btntext;
          history = history.toString()+btntext.toString();
         
          // print(value);
        }
      }
      } 
      
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row( 
              mainAxisAlignment: MainAxisAlignment.end, 
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("$history",
                    style: TextStyle(fontSize: 50,color: Colors.white,),
                    
                    ),
                  ),
                )
            ],),
             Row( 
              mainAxisAlignment: MainAxisAlignment.end, 
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("$value",
                    style: TextStyle(fontSize: 50,color: Colors.white,),
                    
                    ),
                  ),
                )
                       ],),
            Row( mainAxisAlignment: MainAxisAlignment.end, children: [
              btn("AC", Colors.blue,Colors.black),
              SizedBox(width: 0,),
            btn("( )", Colors.grey,Colors.black),
              SizedBox(width: 0,),
            btn("%", Colors.grey,Colors.black),
              SizedBox(width: 0,),
            btn("/", Colors.grey,Colors.black),   
            ],),
            SizedBox(height: 5,),
            Row( mainAxisAlignment: MainAxisAlignment.end, children: [
              btn("7", Colors.white24,Colors.white),
              SizedBox(width: 0,),
            btn("8", Colors.white24,Colors.white),
              SizedBox(width: 0,),
            btn("9", Colors.white24,Colors.white),
              SizedBox(width: 0,),
            btn("x", Colors.grey,Colors.black),
            ],),
            SizedBox(height: 5,),
            Row( mainAxisAlignment: MainAxisAlignment.end, children: [
              btn("4", Colors.white24,Colors.white),
              SizedBox(width: 0,),
            btn("5", Colors.white24,Colors.white),
              SizedBox(width: 0,),
            btn("6", Colors.white24,Colors.white),
              SizedBox(width: 0,),
            btn("-", Colors.grey,Colors.black),
            ],),
            SizedBox(height: 5,),
            Row( mainAxisAlignment: MainAxisAlignment.end, children: [
              btn("1", Colors.white24,Colors.white,),
              SizedBox(width: 0,),
            btn("2", Colors.white24,Colors.white,),
              SizedBox(width: 0,),
            btn("3", Colors.white24,Colors.white,),
              SizedBox(width: 0,),
            btn("+", Colors.grey,Colors.black,),
            ],),
            SizedBox(height: 5,),
            Row( mainAxisAlignment: MainAxisAlignment.end, children: [
              btn("0", Colors.white24,Colors.white),
              SizedBox(width: 0,),
            btn(".", Colors.white24,Colors.white),
              SizedBox(width: 0,),
            btn("⌫", Colors.white24,Colors.white),
              SizedBox(width: 0,),
            btn("=", Colors.lightGreen,Colors.black),
            ],),
            
          ],
        ),
      ),
    );
  }
}