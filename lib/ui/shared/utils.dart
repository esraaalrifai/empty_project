import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:darrebni/app/my_app_controller.dart';
import 'package:darrebni/core/data/reposotories/shared_preference.dart';
import 'package:darrebni/core/enums/connectivitystatus.dart';
import 'package:darrebni/core/enums/file_type.dart';
import 'package:darrebni/core/enums/message_type.dart';
import 'package:darrebni/core/services/cart_service.dart';
import 'package:darrebni/core/services/connectivityservice.dart';
import 'package:darrebni/core/services/location_service.dart';
import 'package:darrebni/core/services/notification_service.dart';
import 'package:darrebni/core/services/notification_service.dart';
import 'package:darrebni/core/services/notification_service.dart';
import 'package:darrebni/core/services/notification_service.dart';
import 'package:darrebni/ui/shared/colors.dart';
import 'package:darrebni/ui/shared/custum_widget/customtoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';


double screenWidth(double percent){
    return Get.size.width/percent;
}
double screenHieght(double percent){
    return Get.size.height/percent;
}


void customLoader()=>BotToast.showCustomLoading(toastBuilder: (context){
    return Container(
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.circular(10),
        ),
        width: screenWidth(4),
        height: screenWidth(4),
        child: SpinKitCircle(
            color: AppColors.mainOrangeColor,
            size: screenWidth(8),
        ),
    );
});
