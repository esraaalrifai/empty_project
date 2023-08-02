import 'package:darrebni/app/my_app_controller.dart';
import 'package:darrebni/core/data/reposotories/shared_preference.dart';
import 'package:darrebni/core/enums/connectivitystatus.dart';
import 'package:darrebni/core/enums/message_type.dart';
import 'package:darrebni/core/services/connectivityservice.dart';
import 'package:darrebni/core/services/location_service.dart';
import 'package:darrebni/core/services/notification_service.dart';
import 'package:darrebni/ui/shared/custum_widget/customtoast.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

SharedPreferenceRepositry get storage=>Get.find<SharedPreferenceRepositry>();

Future claunchUrl(Uri url) async {
  if (!await launchUrl(url,
      mode: LaunchMode.externalApplication))
  {
    CustumToast.showMessage(message: 'cant launch url',
        messageType: MessageType.REJECTED);
  }
}

//CartService get cartService => Get.find<CartService>();
ConnectivityService get connectivityService => Get.find<ConnectivityService>();
NotificationService get notificationService => Get.find<NotificationService>();


bool get isOnline =>
    Get.find<MyAppController>().connectivityStatus == ConnectivityStatus.ONLINE;

bool get isOffline =>
    Get.find<MyAppController>().connectivityStatus ==
        ConnectivityStatus.OFFLINE;

void checkConnection(Function function) {
  if (isOnline)
    function();
  else
    showNoConnectionMessage();
}

void showNoConnectionMessage() {
  CustumToast.showMessage(
      message: 'Please check internet connection',
      messageType: MessageType.WARNING);
}

LocationService get locationService => Get.find<LocationService>();