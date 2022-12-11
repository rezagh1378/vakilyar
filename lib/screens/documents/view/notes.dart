import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../module/constans.dart';
import '../../../module/textfeilds.dart';
import '../../../router/app_routes.dart';

class Notesdocument extends GetView {
  const Notesdocument({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "یادداشت ها",
          style: Get.textTheme.headline2,
        ),
        centerTitle: true,
      ),
      body:

      Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          const SizedBox(height: 15),
      const TxtFeild(
        obscureText: false,
        labelText: "جستجو",
        prefixIcon: Icons.search,
        auttoFocus: false,
      ),
          Expanded(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {

                  return Slidable(
                    key: const ValueKey(0),
                    startActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        dismissible: DismissiblePane(onDismissed: () {}),
                        children: const [
                          SlidableAction(
                            onPressed: null,
                            backgroundColor: Color(0xFFFE4A49),
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'حذف',
                          ),
                        ]),
                    endActionPane:
                        const ActionPane(motion: ScrollMotion(), children: [
                      SlidableAction(
                        // An action can be bigger than the others.
                        flex: 2,
                        onPressed: null,
                        backgroundColor: Color(0xFF13DA9E),
                        foregroundColor: Colors.white,
                        icon: Icons.edit_rounded,
                        label: 'ویرایش',
                      ),
                    ]),
                    child: ListTile(
                      style: ListTileStyle.drawer,
                      title: Text(
                        'یادداشت',
                        style: Get.textTheme.headline2,
                      ),
                      iconColor: white,
                      leading: Icon(
                        Icons.circle,
                        color: itemTextFeild,
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 5),
                    ),
                  );
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: bl,
        elevation: 20,
        splashColor: white,
        child: Icon(Icons.add),
        onPressed: () => Get.toNamed(Routes.addnotes),
      ),
    );
  }
}
