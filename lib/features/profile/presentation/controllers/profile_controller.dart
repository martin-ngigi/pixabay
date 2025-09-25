import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay/features/profile/data/models/profile_model.dart';
import 'package:pixabay/features/profile/data/repositories/home_repository_impl.dart';
import 'package:pixabay/features/profile/domain/use_cases/profile_usecases.dart';

class ProfileController extends Cubit<int> {
  ProfileController(super.initialState);

  String fullName = '';
  String email = '';
  String favoriteCategory = '';
  String password = '';
  String confirmPassword = '';

  // Field-level error messages
  String? fullNameError;
  String? emailError;
  String? categoryError;
  String? passwordError;
  String? confirmPasswordError;

  bool isLoading = false;
  String successMessage = "";
  String errorMessage = "";

  final List<String> categories = ["Nature", "Cars", "Technology", "Animals"];

  void updateFullName(String value) {
    fullName = value;
    fullNameError = null;
    emit(state > 0 ? 0 : 1);
  }

  final ProfileUseCases profileUseCases = ProfileUseCases(profileRepository: ProfileRepositoryImpl());

  void updateEmail(String value) {
    email = value;
    emailError = null;
    emit(state > 0 ? 0 : 1);
  }

  void updateCategory(String value) {
    favoriteCategory = value;
    categoryError = null;
    emit(state > 0 ? 0 : 1);
  }

  void updatePassword(String value) {
    password = value;
    passwordError = null;
    emit(state > 0 ? 0 : 1);
  }

  void updateConfirmPassword(String value) {
    confirmPassword = value;
    confirmPasswordError = null;
    emit(state > 0 ? 0 : 1);
  }

  Future<void> saveProfile() async {
    if (!_validateInputs()) return;

    updateLoading(true);
    await Future.delayed(const Duration(seconds: 2)); // simulate API call
    updateLoading(false);

    successMessage = "Profile saved successfully!";
    emit(state > 0 ? 0 : 1);
  }

  bool _validateInputs() {
    bool isValid = true;

    if (fullName.isEmpty) {
      fullNameError = "Full Name is required";
      isValid = false;
    }

    if (email.isEmpty || !email.contains("@")) {
      emailError = "Enter a valid email";
      isValid = false;
    }

    if (favoriteCategory.isEmpty) {
      categoryError = "Please select a category";
      isValid = false;
    }

    if (password.length < 6) {
      passwordError = "Password must be at least 6 characters";
      isValid = false;
    }

    if (confirmPassword != password) {
      confirmPasswordError = "Passwords do not match";
      isValid = false;
    }

    emit(state > 0 ? 0 : 1);
    return isValid;
  }

  void updateLoading(bool value) {
    isLoading = value;
    emit(state > 0 ? 0 : 1);
  }

  Future<void> saveUserProfile(ProfileModel profileModel) async {
    if (!_validateInputs()) return;

    updateLoading(true);
    successMessage = "";
    errorMessage = "";

    try {
      final response = await profileUseCases.saveProfile(profileModel);

      if(response.statusCode == 200 || response.statusCode == 201) {
        ProfileModel profileModel = ProfileModel.fromJson(response.data);
        successMessage = "User with id ${profileModel.id} saved successfully.";
      }
      else {
        errorMessage = "Failed to fetch data. Please try again.";
      }
      print("Profile data: $response successMessage $successMessage");
    }
    catch (e) {
      print("Error fetching Profile data: $e");
      errorMessage = "Failed to fetch data. Please try again.";
    }

    updateLoading(false);
    emit(state > 0 ? 0 : 1);

  }

}
