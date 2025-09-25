class ProfileModel {
  late int? id;
  late String? fullName;
  late String? email;
  late String? favouriteCategory;
  late String? password;
  late String? confirmPassword;

  ProfileModel(
      {
        this.id,
        required this.fullName,
        required this.email,
        required this.favouriteCategory,
        required this.password,
        required this.confirmPassword});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    email = json['email'];
    favouriteCategory = json['favouriteCategory'];
    password = json['password'];
    confirmPassword = json['confirmPassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.fullName;
    data['fullName'] = this.fullName;
    data['email'] = this.email;
    data['favouriteCategory'] = this.favouriteCategory;
    data['password'] = this.password;
    data['confirmPassword'] = this.confirmPassword;
    return data;
  }
}