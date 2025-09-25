import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay/core/components/app_input_field.dart';
import 'package:pixabay/features/profile/data/models/profile_model.dart';
import 'package:pixabay/features/profile/presentation/controllers/profile_controller.dart';
import 'package:pixabay/core/components/loading_view.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late ProfileController profileController;

  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _confirmPasswordCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    profileController = BlocProvider.of<ProfileController>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileController, int>( builder: (context, _) {
        return Scaffold(
          body: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500), // reasonable width
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch, // buttons full-width
                    children: [

                      InputField(
                        label: "Full Name",
                        controller: _nameCtrl,
                        onChanged: profileController.updateFullName,
                        errorText: profileController.fullNameError,
                      ),

                      const SizedBox(height: 12),

                      InputField(
                        label: "Email",
                        controller: _emailCtrl,
                        onChanged: profileController.updateEmail,
                        errorText: profileController.emailError,
                      ),

                      const SizedBox(height: 12),

                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: "Favorite Category",
                          errorText: profileController.categoryError,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        value: profileController.favoriteCategory.isEmpty
                            ? null
                            : profileController.favoriteCategory,
                        items: profileController.categories
                            .map((c) => DropdownMenuItem(
                          value: c,
                          child: Text(c),
                        ))
                            .toList(),
                        onChanged: (value) {
                          if (value != null) {
                            profileController.updateCategory(value);
                          }
                        },
                      ),

                      const SizedBox(height: 12),

                      InputField(
                        label: "Password",
                        controller: _passwordCtrl,
                        obscureText: true,
                        onChanged: profileController.updatePassword,
                        errorText: profileController.passwordError,
                      ),

                      const SizedBox(height: 12),

                      InputField(
                        label: "Confirm Password",
                        controller: _confirmPasswordCtrl,
                        obscureText: true,
                        onChanged: profileController.updateConfirmPassword,
                        errorText: profileController.confirmPasswordError,
                      ),

                      const SizedBox(height: 20),

                      profileController.isLoading ?
                      LoadingView(message: "Saving profile...") :
                      ElevatedButton(
                        onPressed: (){
                          profileController.saveUserProfile(
                            ProfileModel(
                               fullName:  _nameCtrl.text,
                                email: _emailCtrl.text,
                                favouriteCategory: profileController.favoriteCategory,
                                password: _passwordCtrl.text,
                                confirmPassword: _confirmPasswordCtrl.text
                            )
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text("Save"),
                      ),

                      if (profileController.successMessage.isNotEmpty || profileController.errorMessage.isNotEmpty) ...[

                        const SizedBox(height: 20),

                        Text(
                          profileController.successMessage,
                          style: TextStyle(color: profileController.successMessage.isNotEmpty ? Colors.green : Colors.red),
                          textAlign: TextAlign.center,
                        ),

                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
