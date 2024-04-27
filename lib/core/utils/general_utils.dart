import 'package:darrebni/core/data/reposotories/shared_preferences_repository.dart';
import 'package:darrebni/ui/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/language_service.dart';

SharedPreferencesRepository get storage =>
    Get.find<SharedPreferencesRepository>();

LanguageService get languageService => Get.find<LanguageService>();
