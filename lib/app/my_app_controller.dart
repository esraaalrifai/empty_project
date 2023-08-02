



import 'package:darrebni/core/enums/connectivitystatus.dart';
import 'package:darrebni/core/services/base_controller.dart';
import 'package:darrebni/core/utils/general_util.dart';
import 'package:darrebni/ui/shared/utils.dart';

class MyAppController extends BaseController {
  ConnectivityStatus connectivityStatus = ConnectivityStatus.ONLINE;

  set setConnectivityStatus(ConnectivityStatus value) {
    connectivityStatus = value;
  }

  void listenForConnectivityStatus() {
    connectivityService.connectivityStatusController.stream.listen((event) {
      setConnectivityStatus = event;
    });
  }

  @override
  void onInit() {
    listenForConnectivityStatus();
    super.onInit();
  }
}