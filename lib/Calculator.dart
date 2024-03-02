import 'dart:math';
import 'package:calculator/buttonCalc.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget{
  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String resText = '';

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text("Calculator"),
       centerTitle: true,
     ),
     body: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
            Expanded(
                child:Row(
                  children: [
                    Text(resText,style:TextStyle(fontSize: 24,fontWeight:FontWeight.bold),),
                  ],
                )),
         Expanded(
           child: Row(
             crossAxisAlignment: CrossAxisAlignment.stretch,
             children: [
               ButtonCalc(num: "7",clickButton: onDigtbutton),
               ButtonCalc(num: "8" ,clickButton: onDigtbutton),
               ButtonCalc(num: "9",clickButton: onDigtbutton),
               ButtonCalc(num: "*",clickButton: onOperatorClicked),
             ],
           ),
         ),
         Expanded(
           child: Row(
             crossAxisAlignment: CrossAxisAlignment.stretch,
             children: [
               ButtonCalc(num: "4",clickButton: onDigtbutton),
               ButtonCalc(num: "5",clickButton: onDigtbutton),
               ButtonCalc(num: "6",clickButton: onDigtbutton),
               ButtonCalc(num: "/",clickButton: onOperatorClicked),
             ],
           ),
         ),
         Expanded(
           child: Row(
             crossAxisAlignment: CrossAxisAlignment.stretch,
             children: [
               ButtonCalc(num: "1",clickButton: onDigtbutton),
               ButtonCalc(num: "2",clickButton: onDigtbutton),
               ButtonCalc(num: "3",clickButton: onDigtbutton),
               ButtonCalc(num: "+",clickButton: onOperatorClicked),
             ],
           ),
         ),
         Expanded(
           child: Row(
             crossAxisAlignment: CrossAxisAlignment.stretch,
             children: [
               ButtonCalc(num: ".",clickButton: onDigtbutton),
               ButtonCalc(num: "0",clickButton: onDigtbutton),
               ButtonCalc(num: "=",clickButton: onEqualClick),
               ButtonCalc(num: "-",clickButton: onOperatorClicked),
             ],
           ),
         ),
         Expanded(
           child: Row(
             crossAxisAlignment: CrossAxisAlignment.stretch,
             children: [
               ButtonCalc(num: "C" ,clickButton: clear),
               ButtonCalc(num: "Ce",clickButton: ce),
               ButtonCalc(num: "%",clickButton: onOperatorClicked),
               ButtonCalc(num: "sqrt",clickButton: onOperatorClicked),
             ],
           ),
         ),
       ],
     ),
   );
  }

  void onDigtbutton(String num){
    resText+=num;
   setState(() {

   });
  }
  String lhs = '';
  String operator = '';
  void onOperatorClicked (String clickedOperator){
    if (operator.isEmpty){
      lhs = resText;
    }else{
      String rhs = resText;
      claculator( lhs , operator ,rhs);
    }
    operator = clickedOperator;
    resText ='';
    setState(() {

    });
  }

  String claculator(String lhs, String operator, String rhs) {
    double num1 = double.parse(lhs);
    double num2 = double.parse(rhs);
    double res = 0;

    if (operator == '+'){
      res = num1+num2;
    } else if(operator == '-'){
      res = num1-num2;
    }else if(operator == '/'){
      res = num1/num2;
    } else if(operator == '*'){
      res = num1*num2;
    }else if(operator == '%'){
      res = num1 % num2;
    }
    else if(operator == 'sqrt'){
      res = sqrt(num1);
    }
    return res.toString();
  }

  void onEqualClick(String num){
    String rhs = resText;
    resText = claculator(lhs, operator, rhs);
    lhs='';
    operator='';
    setState(() {

    });
  }

  void clear(String num) {
    resText = '';
   setState(() {

   });
  }

  void ce (String num){
    if (resText.isNotEmpty) {
      resText = resText.substring(0, resText.length - 1);
    }
    setState(() {

    });
  }
 
}