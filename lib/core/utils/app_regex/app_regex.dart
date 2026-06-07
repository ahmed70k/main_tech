class AppRegex {
  static final emailPattern = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  static final phonePattern = RegExp(r'^(01\d{9}|05\d{8}|5\d{8})$');
  static final passwordPattern = RegExp(
      r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
}
