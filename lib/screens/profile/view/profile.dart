import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:vakilyar/module/button.dart';
import 'package:vakilyar/router/app_routes.dart';
import 'package:vakilyar/screens/profile/controller/profile_controller.dart';

import '../../../module/constans.dart';

class ProfilePage extends GetView {
  @override

  Widget build(BuildContext context) {

    ProfileController controller = Get.put(ProfileController());
    controller.fetchData();
    return GetBuilder<ProfileController>(builder: (controller){
      if(controller.loading==true){
        return Center(
          child:   SpinKitFadingCircle(color: bl),

        );
      }else{

        return DefaultTabController(
            length: 2,
            initialIndex: 1,
            child: Scaffold(
              appBar: AppBar(
                actions: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed('/messages');
                      },
                      child: Icon(Icons.message),
                    ),
                  )
                ],
                title: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                  child: Text(
                    controller.profileData.value['full_name'].toString(),
                    style: Get.textTheme.headline3,
                  ),
                ),
                backgroundColor: bg,
                centerTitle: false,
              ),
              body: PageView(
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'مانده بدهی',
                                      style: Get.textTheme.headline2!
                                          .copyWith(fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      controller.profileData.value['debt'].toString(),
                                      style: Get.textTheme.subtitle1,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'اشخاص',
                                      style: Get.textTheme.headline2!
                                          .copyWith(fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      controller.profileData.value['customers'].toString(),
                                      style: Get.textTheme.subtitle1,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    )
                                  ],
                                )
                              ],
                            ),
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                AvatarGlow(
                                  endRadius: 60,
                                  repeat: true,
                                  showTwoGlows: true,
                                  glowColor: white,
                                  repeatPauseDuration: Duration(milliseconds: 5),
                                  child: Material(
                                    elevation: 20,
                                    shape: CircleBorder(),
                                    child: CircleAvatar(
                                      radius: 35,
                                      backgroundColor: borderTextFeild,
                                      child: Text(
                                        controller.profileData.value['username'].toString().toUpperCase()[0],
                                        style: Get.textTheme.headline2,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                    right: -40,
                                    left: 0,
                                    bottom: 20,
                                    child: GestureDetector(
                                      onTap: () {
                                        print(Get.height * .4);
                                      },
                                      child: Icon(
                                        Icons.add_circle,
                                        color: bl,
                                      ),
                                    ))
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () =>Get.toNamed(Routes.editeprofile),
                          child: Btn(
                            hasBorder: true,
                            title: 'ویرایش پروفایل',

                            customHeightSize: Get.height * .05,
                            customHeight: true,
                            color: bg,
                            customColor: true,
                            customeTextStyle: Get.textTheme.subtitle1!.copyWith(color: white),
                            iconBtn: true,
                            itemIcon: Icon(Icons.edit,color: white,),
                            customWidth: true,
                            customWidthtSize: Get.width,

                          ),
                        ),
                        SizedBox(height: 20,),
                        TabBar(tabs: _buildTab(),
                          automaticIndicatorColorAdjustment: true,
                          indicatorColor: bl,
                          labelColor: bl,
                          unselectedLabelColor: itemTextFeild,
                        ),
                        SizedBox(height: 25,),
                        Expanded(
                          child: TabBarView(children: [userItem(),messageItem()]),
                        ),

                      ],
                    ),
                  )
                ],
              ),
            ));
      }
    });
  }
  List<Widget> _buildTab(){
    return<Widget>[
      Tab(
        child: Icon(Icons.people),
      ),
      Tab(
        child: Icon(Icons.message),
      )
    ];
  }
  messageItem(){
    return Container(
      child: ListView.builder(
          itemCount:20,
          itemBuilder:( BuildContext contex,int index){
            return ListTile(
              // shape:  RoundedRectangleBorder(
              //   side: BorderSide(
              //     color: Colors.green.shade300,
              //   ),),
              style: ListTileStyle.drawer,
              title: Text('کارآموز',
              style: Get.textTheme.headline2,),
              iconColor: white,
              leading: Icon(Icons.circle),
              subtitle: Text(
                'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد، کتابهای زیادی در شصت و سه درصد گذشته حال و آینده، شناخت فراوان جامعه و متخصصان را می طلبد، تا با نرم ',
                style: Get.textTheme.subtitle1,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 5),
              trailing: Text('12:11',
              style: Get.textTheme.subtitle1,),
            );
          }
      ),
    );
  }
  userItem(){
    return Container(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ListView.builder(
            itemCount: 20,
              itemBuilder:( BuildContext context,int index){
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
                ]
                ),
                endActionPane: const ActionPane(
                    motion: ScrollMotion(),
                    children: [
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
                child:ListTile(
                style: ListTileStyle.drawer,
                title: Text(
                  'امیرحسین عباسیان',
                  style: Get.textTheme.headline2,
                ),
                iconColor: white,
                leading: Icon(
                  Icons.circle,
                  color: itemTextFeild,
                ),
                trailing: Text(
                  'کارآموز',
                  style: Get.textTheme.subtitle1,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 5),
              ),);
              }),
          SizedBox(height: 20),
          // GestureDetector(
          //   onTap: () =>Get.toNamed(Routes.editeprofile),
          //   child: Btn(
          //     hasBorder: true,
          //     title: 'افزودن کاربر',
          //
          //     customHeightSize: Get.height * .05,
          //     customHeight: true,
          //     color: bg,
          //     customColor: true,
          //     customeTextStyle: Get.textTheme.subtitle1!.copyWith(color: white),
          //     iconBtn: true,
          //     itemIcon: Icon(Icons.person_add,color: white,),
          //     customWidth: true,
          //     customWidthtSize: Get.width,
          //
          //   ),
          // ),

        ],
      ),
    );

  }
}
