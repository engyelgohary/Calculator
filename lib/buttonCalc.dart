import 'package:flutter/material.dart';

class ButtonCalc extends StatelessWidget {
  String num ;
  Function clickButton;
  ButtonCalc({required this.num,required this.clickButton});
  @override
  Widget build(BuildContext context) {
    return   Expanded(
      child: Container(
        margin: EdgeInsets.all(1),
        child: ElevatedButton(onPressed:(){
          clickButton(num);
        },
          child: Text(num,style: TextStyle(fontSize:30,color: Colors.white,),textAlign: TextAlign.center,),
        ),
      ),
    );
  }

}