import 'package:flutter/material.dart';

class FloatingButton{
  static floatingButton(BuildContext context){
    return FloatingActionButton(
      onPressed: (){
        Navigator.pop(context);
      },
      child: Icon(
        Icons.home_filled,
        size: 20,
      ),
      backgroundColor: Colors.purple[700],

    );
  }
}