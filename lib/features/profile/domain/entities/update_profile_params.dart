class UpdateProfileParams {
  final String fname;
  final String lname;
  final String phone;
  final String address;
  final String email;
  final String? password;
  final String? passwordConfirmation;
  final String? profileImagePath;

  UpdateProfileParams({
    required this.fname,
    required this.lname,
    required this.phone,
    required this.address,
    required this.email,
    this.password,
    this.passwordConfirmation,
    this.profileImagePath,
  });
}
