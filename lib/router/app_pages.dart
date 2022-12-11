
import 'package:get/get.dart';
import 'package:vakilyar/screens/archive/view/archive.dart';
import 'package:vakilyar/screens/login/view/Login.dart';
import 'package:vakilyar/screens/profile/view/messages.dart';
import 'package:vakilyar/screens/splash/view/splash.dart';
import 'package:vakilyar/screens/profile/view/profile.dart';

import '../add_not/view/addnotes.dart';
import '../module/menu.dart';
import '../screens/addperson/view/addperson.dart';
import '../screens/apperience/view/apperience.dart';
import '../screens/documents/view/dates.dart';
import '../screens/documents/view/document.dart';
import '../screens/documents/view/notes.dart';
import '../screens/documents/view/pdf_documents.dart';
import '../screens/documents/view/predictions.dart';
import '../screens/documents/view/word_documents.dart';
import '../screens/guidence/view/guidence.dart';
import '../screens/notifications/view/notifications.dart';
import '../screens/profile/view/adduser.dart';
import '../screens/profile/view/editeprofile.dart';
import '../screens/setting/view/setting.dart';
import '../screens/signup/view/signup.dart';
import '../screens/updates/view/updates.dart';
import 'app_routes.dart';

abstract class AppPages{
  static final pages=<GetPage>[
    GetPage(name: Routes.login, page: ()=>LoginPage()),
    GetPage(name:Routes.initial , page: ()=>Splash()),
    GetPage(name: Routes.menu, page: ()=>Menu()),
    GetPage(name: Routes.profile, page: ()=>ProfilePage()),
    GetPage(name: Routes.message, page: ()=>Message()),
    GetPage(name: Routes.message, page: ()=>AddUser()),
    GetPage(name: Routes.editeprofile, page: ()=>EditeProfile()),
    GetPage(name: Routes.signup, page: ()=>SignUpPage()),
    GetPage(name: Routes.setting, page: ()=>SettingPage()),
    GetPage(name:Routes.archive, page:  ()=>Archive()),
    GetPage(name:Routes.addpersone, page:  ()=>AddPersonPage()),
    GetPage(name:Routes.ducuments, page:  ()=>MyDocumentPage()),
    GetPage(name:Routes.theme, page:  ()=>Theme(),),
    GetPage(name:Routes.updates, page:  ()=>Updates()),
    GetPage(name:Routes.notifications, page:  ()=>Notifications()),
    GetPage(name:Routes.guidence, page:  ()=>Guidence()),
    GetPage(name:Routes.addnotes, page:  ()=>Addnotes()),
    GetPage(name:Routes.notedocuments, page:  ()=>Notesdocument()),
    GetPage(name:Routes.pdfdocuments, page:  ()=>Pdfdocuments()),
    GetPage(name:Routes.predictions, page:  ()=>Predictions()),
    GetPage(name:Routes.worddocuments, page:  ()=>Worddocuments()),
    GetPage(name:Routes.dates, page:  ()=>Dates()),




  ];
}