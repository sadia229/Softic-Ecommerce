import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:softic_ecommerce/apps/profile/repository/profile_repository.dart';
import '../model/profile_model.dart';

class ViewProfileController extends GetxController {
  late final ProfileRepository _repository;
  final RxBool _isLoading = false.obs;
  final RxBool _hasError = false.obs;
  final RxInt count = 0.obs;

  bool get isLoading => _isLoading.value;

  bool get hasError => _hasError.value;

  ProfileModel? profileModel;

  @override
  onInit() {
    super.onInit();
    _repository = ProfileRepository();
    fetchProfileData();
  }

  Future<void> fetchProfileData() async {
    _isLoading(true);
    var user = await _repository.getProfile();
    if (user.runtimeType != bool) {
      try {
        profileModel = user;
      } catch (e, stackTrace) {
        log(e.toString());
        log(stackTrace.toString());
        _hasError(true);
      }
    } else {
      _hasError(true);
    }
    _isLoading(false);
  }
}
