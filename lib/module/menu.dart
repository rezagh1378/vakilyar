
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../screens/addperson/view/addperson.dart';
import '../screens/documents/view/document.dart';
import '../screens/history/view/history.dart';
import '../screens/home/view/home.dart';
import '../screens/note/view/note.dart';
import '../screens/profile/view/profile.dart';
import 'constans.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  var _currentIndex = 0;
  TextStyle _textStyle =TextStyle(fontSize: 13,fontFamily: 'vazir');
  final List<Widget> _children = [
    HomePage(),
    MyDocumentPage(),
    AddPersonPage(),
    History(),
    ProfilePage(),
  ];
  void onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: SalomonBottomBar(
          itemPadding: EdgeInsets.all(10),

          margin: EdgeInsets.all(20),
        currentIndex: _currentIndex,
        onTap: (i) {
      setState(
            () => _currentIndex = i,
      );
    },
    items: [
      //home
    SalomonBottomBarItem(
    icon: Icon(Icons.home),
    title: Text('خانه',style: _textStyle,),
    selectedColor: bl,
    unselectedColor: white,
    activeIcon: Icon(Icons.home_filled)),
      //documents
    SalomonBottomBarItem(
        icon: Icon(Icons.my_library_books_outlined),
        title: Text('پرونده های من',style: _textStyle),
      selectedColor: bl,
      unselectedColor: white,
      activeIcon: Icon(Icons.my_library_books_sharp,size: 30,)),
      //add
      SalomonBottomBarItem(
          icon: Icon(Icons.add_circle_outline),
          title: Text('افزودن موکل',style: _textStyle),
        selectedColor: bl,
        unselectedColor: white,
        activeIcon: Icon(Icons.add_circle_outlined)),
      //history
      SalomonBottomBarItem(
          icon: Icon(Icons.history_outlined),
          title: Text('سابقه',style: _textStyle,),
        selectedColor: bl,
        unselectedColor: white,
        activeIcon: Icon(Icons.history_sharp)),
      //profile
      SalomonBottomBarItem(
          icon: Icon(Icons.person_outline),
          title: Text('پروفایل',style: _textStyle,),
        selectedColor: bl,
        unselectedColor: white,
        activeIcon: Icon(Icons.person)),
    ],),
      body:  _children[_currentIndex],


    );
  }
}


