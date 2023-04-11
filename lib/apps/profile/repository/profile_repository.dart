import 'package:flutter/cupertino.dart';
import 'package:softic_ecommerce/apps/profile/model/profile_model.dart';
import 'package:softic_ecommerce/general/api/base_client.dart';
import 'package:softic_ecommerce/general/constants/urls.dart';
import 'package:dio/dio.dart' as dio;
import '../../../general/helpers/dio_esceptions.dart';

class ProfileRepository {
  ProfileModel? profileModel;

  // Profile
  Future<ProfileModel?> getProfile({context}) async {
    try {
      var response = await BaseClient.get(url: Urls.getProfileUrl);
      if (response.statusCode == 200) {
        debugPrint("response ${response.data}");
        profileModel = ProfileModel.fromJson(response.data);
        return profileModel;
      } else {
        throw Exception("loading error");
      }
    } on dio.DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      debugPrint(errorMessage);
      rethrow;
    }
  }
}
