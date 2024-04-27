import 'dart:io';

import 'package:darrebni/core/enums/filetype.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '';
import '../../../core/data/models/filetype_model.dart';

class HomeController extends GetxController {
  RxString selectedValue = 'الصف الأول'.obs;
  final ImagePicker picker = ImagePicker();
  RxBool isVisible = false.obs;
  late File file;

  // String get selectedValue => _selectedValue.value;

  void onChanged(String value) {
    //_selectedValue.value = value;
    selectedValue.value = value;
    // selectedValue.update((val) {
    //   val = value;
    // });
  }

  Future<FileTypeModel> pickFile(FileType type) async {
    String? path;
    switch (type) {
      case FileType.CAMERA:
        await picker
            .pickImage(source: ImageSource.camera)
            .then((value) => path = value?.path ?? '');
        file = File(path!);
        isVisible.value = true;
        break;
      case FileType.GALLERY:
        await picker
            .pickImage(source: ImageSource.gallery)
            .then((value) => path = value?.path ?? '');
        isVisible.value = true;
        break;
      case FileType.FILE:
        // await FilePicker.platform
        //     .pickFiles()
        //     .then((value) => path = value?.paths[0] ?? '');
        // break;
        await picker
            .pickImage(source: ImageSource.gallery)
            .then((value) => path = value?.path ?? '');
        break;
    }

    return FileTypeModel(type, path ?? '');
  }
}
