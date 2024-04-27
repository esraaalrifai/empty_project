import 'package:bot_toast/bot_toast.dart';
import 'package:darrebni/core/enums/operation_type.dart';
import 'package:darrebni/core/enums/request_status.dart';
import 'package:darrebni/ui/shared/utils.dart';
import 'package:get/get.dart';

import 'package:bot_toast/bot_toast.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  var requestStatus = RequestStatus.DEFAULT.obs;
  var opertionType = OpertionType.NONE.obs;

  set setRequestStatus(RequestStatus value) {
    requestStatus.value = value;
  }

  set setOpertionType(OpertionType value) {
    opertionType.value = value;
  }
}
