import 'package:pixabay/core/utils/constants.dart';
import 'package:pixabay/core/utils/http_util.dart';
import 'package:pixabay/features/profile/data/models/profile_model.dart';

class ProfileDataSource{
  saveProfile( ProfileModel profileModel ){
    var response = HttpUtil().post(
        data: profileModel.toJson(),
        "${Constants.saveProfileURL}"
    );
    return response;
  }
}