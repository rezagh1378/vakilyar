import 'package:vakilyar/router/app_routes.dart';

import '../../../module/constans.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constans.dart';
var name = ("وکیل یار");

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _selected = true;

    return Drawer(
      child: Container(
        decoration: BoxDecoration(gradient:
        LinearGradient(colors:[Colors.black45,Colors.black38, Colors.black26])),
        child: ListView(

          children: [
            UserAccountsDrawerHeader(

              accountName: Text("پلن طلایی",style: Get.textTheme.headline3),
              accountEmail: null,
              currentAccountPicture: CircleAvatar(

                child: Text(name,style: Get.textTheme.headline1!.copyWith(color: bg,fontSize: 24),),
                backgroundColor: bl,
              ),
              decoration: BoxDecoration(
                gradient:
                LinearGradient(colors: [Colors.black26,Colors.black12, Colors.white12]),
              ),
            ),
            ListTile(
              onTap: () => navigate(0),
              selectedTileColor: Get.currentRoute == '/archive' ? bl : null,
              selectedColor: bl,
              selected: _selected,
              title: Text(
                'بایگانی',
                style:
                    Get.textTheme.headline3!.copyWith(shadows: [], fontSize: 18),
              ),
              leading: Icon(
                Icons.archive_outlined,
                color: bl,
              ),
            ),
            ListTile(
              selectedTileColor: Get.currentRoute == '/links' ? bl : null,
              selected: _selected,
              onTap: () => navigate(1),
              title: Text(
                'لینک های مفید',
                style:
                    Get.textTheme.headline3!.copyWith(shadows: [], fontSize: 18),
              ),
              leading: Icon(
                Icons.link,
                color: bl,
              ),
            ),
            ListTile(
              selectedTileColor: Get.currentRoute == '/textEditor' ? bl : null,
              selected: _selected,
              onTap: () => navigate(2),
              title: Text(
                'سندنگار',
                style:
                    Get.textTheme.headline3!.copyWith(shadows: [], fontSize: 18),
              ),
              leading: Icon(
                Icons.text_snippet,
                color: bl,
              ),
            ),
            ListTile(
              selected: _selected,
              onTap: () => navigate(3),
              selectedTileColor: Get.currentRoute == '/setting' ? bl : null,
              title: Text(
                'تنظیمات',
                style:
                    Get.textTheme.headline3!.copyWith(shadows: [], fontSize: 18),
              ),
              leading: Icon(
                Icons.settings,
                color: bl,
              ),
            ),
            ListTile(
              selected: _selected,
              onTap: () => navigate(4),
              selectedTileColor:
                  Get.currentRoute == '/accountBalance' ? bl : null,
              title: Text(
                'وضعیت حساب',
                style:
                    Get.textTheme.headline3!.copyWith(shadows: [], fontSize: 18),
              ),
              leading: Icon(
                Icons.account_balance,
                color: bl,
              ),
            ),
          ],
        ),
      ),
    );
  }

  navigate(int index) {
    switch (index) {
      case 0:
        {
          Get.toNamed(Routes.archive);
        }
        break;
      case 1:
        {
          Get.offAllNamed('/links');
        }
        break;
      case 2:
        {
          Get.offAllNamed('/textEditor');
        }
        break;
      case 3:
        {
          Get.toNamed(Routes.setting);
        }
        break;
      case 4:
        {
          Get.offAllNamed('/accountBalance');
        }

        break;
    }
  }
}
