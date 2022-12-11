import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:vakilyar/module/button.dart';
import 'package:vakilyar/module/constans.dart';

import 'package:vakilyar/module/drawer_view.dart';
import 'package:tcard/tcard.dart';
import 'package:interactive_chart/interactive_chart.dart';
import 'package:mock_data/mock_data.dart';

import '../controller/homeController.dart';
import '../model/mockdata.dart';

class HomePage extends GetView<HomeController> {
  @override
  List<Widget> cards = List.generate(
    5,
    (index) => Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10.0),


      ),
      child: Center(
        child: Text(
          '$index',
          style: TextStyle(fontSize: 60, color: Colors.black),
        ),
      ),
    ),
  );

  List<CandleData> _data = MockDataTesla.candles;
  bool _darkMode = true;
  bool _showAverage = false;

  Widget build(BuildContext context) {

    HomeController homeController = Get.put(HomeController());
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: Get.height * .10,
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'وکیل یار',
                  style: Get.textTheme.headline1!.copyWith(
                    fontSize: 40,
                    color: itemTextFeild,
                  ),
                ),
              ),
            ),
            backgroundColor: bg,
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'پنجشنبه 14 تیر 1401',
                      style: Get.textTheme.headline2!.copyWith(fontSize: 18,color: itemTextFeild),
                    ),
                    Text(
                      'برنامه های من',
                      style: Get.textTheme.headline2!
                          .copyWith(fontSize: 18, color: bl),
                    ),
                  ],
                ),
                Center(child: Obx(() {
                  if (homeController.card.value == false) {
                    return TCard(
                      cards: cards,
                      size: Size(Get.width / 1.2, Get.height / 3),
                      onEnd: () {
                        homeController.card.value = true;
                        homeController.refresh();
                      },
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Btn(
                      customWidth: true,
                      customWidthtSize: 200.toDouble(),
                      hasBorder: true,
                      title: 'همه موارد را مشاهده کردید',

                    ),
                  );
                  Text(
                    'data',
                    style: Get.textTheme.subtitle1,
                  );
                })),
                Text(
                  'مشاهده همه',
                  style: Get.textTheme.headline2!
                      .copyWith(fontSize: 10, color: bl),
                ),
                SizedBox(
                  height: 20,
                ),
               SizedBox(child: InteractiveChart(
                   candles: _data,
                   ),height: Get.height/2,),
                
                SizedBox(
                  height: 10,
                ),
                Text(
                  'برنامه های فردا',
                  style: Get.textTheme.headline2!
                      .copyWith(fontSize: 18, color: bl),
                ),
                Container(
                    height: 200,
                    child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return Directionality(
                            textDirection: TextDirection.rtl,
                            child: Container(
                              child: Material(
                                color: bg,
                                child: ClipRect(
                                  child: ExpansionTile(
                                    collapsedBackgroundColor: bg,
                                    collapsedIconColor: white,
                                    iconColor: bl,
                                    textColor: bl,
                                    title: Text("نام موکل"),
                                    leading: Icon(Icons.circle),
                                    expandedAlignment: Alignment.centerRight,
                                    collapsedTextColor: white,
                                    children: [
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد، کتابهای زیادی در شصت و سه درصد گذشته حال و آینده، شناخت فراوان جامعه و متخصصان را می طلبد، تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی، و فرهنگ پیشرو در زبان فارسی ایجاد کرد، در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها، و شرایط سخت تایپ به پایان رسد و زمان مورد نیاز شامل حروفچینی دستاوردهای اصلی، و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.',
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
          ),
        ));
  }

  _computeTrendLines() {
    final ma7 = CandleData.computeMA(_data, 7);
    final ma30 = CandleData.computeMA(_data, 30);
    final ma90 = CandleData.computeMA(_data, 90);

    for (int i = 0; i < _data.length; i++) {
      _data[i].trends = [ma7[i], ma30[i], ma90[i]];
    }
  }

  _removeTrendLines() {
    for (final data in _data) {
      data.trends = [];
    }
  }
}

