import 'package:pixabay/features/profile/data/models/profile_model.dart';

abstract class SaveProfileRepository {
  Future<dynamic> saveProfile(ProfileModel profileModel);
}