import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class Archive extends GetView{
  const Archive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text("بایگانی",style: TextStyle(color: Colors.white),),
       centerTitle: true,
     ),
   );
  }
}