import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:vakilyar/module/constans.dart';
import 'package:vakilyar/module/textfeilds.dart';
import 'package:vakilyar/router/app_routes.dart';
import 'package:vakilyar/screens/documents/controller/documents_controller.dart';

class MyDocumentPage extends GetView {
  get child => null;

  @override
  Widget build(BuildContext context) {
    DocumentController controller = Get.put(DocumentController());
    controller.fetchData();
    return GetBuilder<DocumentController>(builder: (controller) {
      if (controller.loading == true) {
        return (Center(
          child: SpinKitFadingCircle(color: bl),
        ));
      } else {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "پرونده های من",
              style: Get.textTheme.headline3,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 15),
                TxtFeild(
                  obscureText: false,
                  labelText: "جستجو",
                  prefixIcon: Icons.search,
                  auttoFocus: false,
                ),
                SizedBox(
                  height: 15,
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: controller.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          var document = controller.data.value[index];
                          return Container(
                              child: Material(
                            color: bg,
                            child: ExpansionTile(
                              collapsedBackgroundColor: bg,
                              collapsedIconColor: white,
                              iconColor: bl,
                              textColor: bl,
                              title: Text(
                                document.name.toString(),
                                style: Get.textTheme.headline2!
                                    .copyWith(fontWeight: FontWeight.w900),
                              ),
                              leading: const Icon(Icons.arrow_drop_down_circle),
                              trailing: Text("شماره پرونده"),
                              expandedAlignment: Alignment.topLeft,
                              expandedCrossAxisAlignment:
                                  CrossAxisAlignment.start,
                              collapsedTextColor: white,
                              children: [
                                const SizedBox(
                                  height: 15,
                                ),
                                ListTile(
                                  iconColor: white,
                                  textColor: white,
                                  title: Align(
                                      alignment: Alignment.centerRight,
                                      child: TextButton(
                                        child: Text(
                                          'اسناد',
                                          style: Get.textTheme.headline2,
                                        ),
                                        onPressed: () =>
                                            Get.toNamed(Routes.predictions),
                                      )),
                                  leading: Icon(Icons.note_sharp),
                                ),
                                ListTile(
                                  iconColor: white,
                                  textColor: white,
                                  title: Align(
                                      alignment: Alignment.centerRight,
                                      child: TextButton(
                                        child: Text(
                                          'فایل های word',
                                          style: Get.textTheme.headline2,
                                        ),
                                        onPressed: () =>
                                            Get.toNamed(Routes.worddocuments),
                                      )),
                                  leading: const Icon(Icons.note_outlined),
                                ),
                                ListTile(
                                  iconColor: white,
                                  textColor: white,
                                  title: Align(
                                      alignment: Alignment.centerRight,
                                      child: TextButton(
                                        child: Text(
                                          'فایلهای pdf',
                                          style: Get.textTheme.headline2,
                                        ),
                                        onPressed: () =>
                                            Get.toNamed(Routes.pdfdocuments),
                                      )),
                                  leading: Icon(Icons.picture_as_pdf),
                                ),
                                ListTile(
                                  iconColor: white,
                                  textColor: white,
                                  title: Align(
                                      alignment: Alignment.centerRight,
                                      child: TextButton(
                                        child: Text(
                                          ' یادداشت ها ',
                                          style: Get.textTheme.headline2,
                                        ),
                                        onPressed: () =>
                                            Get.toNamed(Routes.notedocuments),
                                      )),
                                  leading: Icon(Icons.notes),
                                ),
                                ListTile(
                                  iconColor: white,
                                  textColor: white,
                                  title: Align(
                                      alignment: Alignment.centerRight,
                                      child: TextButton(
                                        child: Text(
                                          'ثبت  جلسات',
                                          style: Get.textTheme.headline2,
                                        ),
                                        onPressed: () =>
                                            Get.toNamed(Routes.dates),
                                      )),
                                  leading: Icon(Icons.date_range_outlined),
                                )
                              ],
                            ),
                          ));
                        }))
              ],
            ),
          ),
        );
      }
    });
  }
}
