import 'package:pixabay/features/home/data/datasource/remote/home_remote_datasource.dart';
import 'package:pixabay/features/home/domain/repositories/get_home_data_repository.dart';
import 'package:pixabay/features/profile/data/data_source/profile_data_source.dart';
import 'package:pixabay/features/profile/data/models/profile_model.dart';
import 'package:pixabay/features/profile/domain/repositories/save_profile_repository.dart';

class ProfileRepositoryImpl implements SaveProfileRepository {
  ProfileDataSource profileDataSource = ProfileDataSource();

  @override
  Future saveProfile(ProfileModel profileModel) {
    return profileDataSource.saveProfile(profileModel);
  }
}