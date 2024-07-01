class UserModel {
  String? id;
  String? fullName;
  String? email;
  String? password;
  UserModel({
    this.id,
    this.fullName,
    this.email,
    this.password,
  });

  @override
  String toString() {
    return 'UserModel(id: $id, fullName: $fullName, email: $email, password: $password)';
  }
}
