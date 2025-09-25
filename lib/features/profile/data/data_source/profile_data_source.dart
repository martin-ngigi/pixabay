import 'package:pixabay/core/utils/constants.dart';
import 'package:pixabay/core/utils/http_util.dart';
import 'package:pixabay/features/profile/data/models/profile_model.dart';

class ProfileDataSource{
  final profileClient = HttpUtil(Constants.JSON_PLACEHOLDER_BASE_URL);

  saveProfile( ProfileModel profileModel ){
    var response = profileClient.post(
        data: profileModel.toJson(),
        "${Constants.saveProfileURL}"
    );
    return response;
  }
}