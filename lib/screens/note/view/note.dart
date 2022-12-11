import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:vakilyar/module/button.dart';
import 'package:vakilyar/module/constans.dart';
import 'package:vakilyar/module/textfeilds.dart';
import 'package:vakilyar/screens/addperson/view/addperson.dart';
import 'package:vakilyar/screens/note/controller/note_controller.dart';

import '../../../add_not/view/addnotes.dart';

import '../../../router/app_routes.dart';
import '../model/note.dart';

class NotePage extends GetView {
  @override
  Widget build(BuildContext context) {

    NoteController controller =Get.put(NoteController());
    controller.fetchData();
    return GetBuilder<NoteController>(builder: (controller){
      if(controller.loading==true){
        return Center(
         child: SpinKitFadingCircle(color: bl),
        );
      }else{

       return Scaffold(
          appBar: AppBar(
            title: Text('یادداشت ها', style: Get.textTheme.headline3,),
            backgroundColor: bg,
            centerTitle: false,
          ),
          body: Column(
            children: [
              Expanded(child: ListView.builder(
                itemCount: controller.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    Note note=controller.data.value[index];
                    return Container(
                      child: Material(
                        color: bg,
                        child: ClipRect(
                          child: Slidable(
                            key: const ValueKey(0),
                            startActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                dismissible: DismissiblePane(onDismissed: () {
                                  controller.removeItem(index);
                                }),
                                children:  [
                                  SlidableAction(

                                    backgroundColor: Color(0xFFFE4A49),
                                    foregroundColor: Colors.white,
                                    icon: Icons.delete,
                                    label: 'حذف',
                                  onPressed:null

                                  ),
                                ]),
                            child: ExpansionTile(
                              collapsedBackgroundColor: bg,
                              collapsedIconColor: white,
                              iconColor: bl,
                              textColor: bl,
                              title: Text(note.title.toString()),
                              leading: Icon(Icons.circle),
                              expandedAlignment: Alignment.centerRight,
                              collapsedTextColor: white,
                              children: [
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  note.userNote.toString(),
                                  style: Get.textTheme.subtitle1,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }))
            ],
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: bl,
            elevation: 20,
            splashColor: white,
            child:Icon(Icons.add) ,
            onPressed: ()=>Get.toNamed(Routes.addnotes),
          ),
        );
      }
    });
  }
}
