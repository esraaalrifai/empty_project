import 'package:bot_toast/bot_toast.dart';
import 'package:darrebni/core/utils/general_utils.dart';
import 'package:darrebni/ui/views/homework_screen/homework_screen.dart';
import 'package:flutter/material.dart';

import 'package:darrebni/core/translation/app_translation.dart';
import 'package:darrebni/ui/shared/utils.dart';

import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        textDirection: languageService.getLocale() == Locale('ar', 'SA')
            ? TextDirection.rtl
            : TextDirection.ltr,
        defaultTransition: Transition.circularReveal,
        transitionDuration: Duration(milliseconds: 12),
        title: 'Flutter Demo',
        builder: BotToastInit(),
        locale: languageService.getLocale(),
        fallbackLocale: languageService.getLocale(),
        translations: AppTranslation(),
        navigatorObservers: [BotToastNavigatorObserver()],
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeWorkScreeen());
  }
}

Locale getLocal() {
  if (storage.getAppLanguage() == 'ar') {
    return Locale('ar', 'SA');
  } else if (storage.getAppLanguage() == 'tr') {
    return Locale('tr', 'TR');
  } else {
    return Locale('en', 'US');
  }
}
