import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';
import '../../../module/button.dart';
import '../../../module/constans.dart';
import '../../../router/app_routes.dart';

class SettingPage extends GetView {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("تنظیمات",
            style: Get.textTheme.subtitle2!
                .copyWith(color: Colors.white, fontSize: 30)),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: ((BuildContext context, int index) {
                    List name = [
                      'دستورالعمل ها',
                      'اعلان ها',
                      'تم',
                      'بروزرسانی',
                    ];
                    List rout=[
                      Routes.guidence,
                      Routes.notifications,
                      Routes.theme,
                      Routes.updates,
                    ];
                    List icons = <IconData>[
                      Icons.lightbulb,
                      Icons.doorbell_outlined,
                      Icons.color_lens_outlined,
                      Icons.refresh_outlined,
                    ];
                    return Container(
                      child: Material(
                        color: bg,
                        child: ClipRect(
                          child: ListTile(
                            onTap: () {
                              // print(rout[index]);
                              Get.toNamed(rout[index]);
                            },
                            iconColor: bl,
                            textColor: bl,
                            title: Text(name[index],
                                style: Get.textTheme.subtitle2!
                                    .copyWith(fontSize: 20, color: white)),
                            leading: Icon(
                              icons[index],
                              color: bl,
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    );
                  })))
        ],
      ),
    );
  }
}
