import 'package:pixabay/features/home/data/repositories/home_repository_impl.dart';
import 'package:pixabay/features/home/domain/repositories/get_home_data_repository.dart';
import 'package:pixabay/features/profile/data/models/profile_model.dart';
import 'package:pixabay/features/profile/domain/repositories/save_profile_repository.dart';

class ProfileUseCases{
  final SaveProfileRepository profileRepository;

  ProfileUseCases({required this.profileRepository});

  Future<dynamic> saveProfile(ProfileModel profileModel) {
    return profileRepository.saveProfile(profileModel);
  }
}