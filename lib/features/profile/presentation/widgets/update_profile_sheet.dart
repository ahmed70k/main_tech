import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:main_tech/core/utils/app_regex/app_regex.dart';
import 'package:main_tech/core/utils/colors/app_colors.dart';
import 'package:main_tech/core/utils/styles/app_styles.dart';
import 'package:main_tech/core/widgets/app_dialog.dart';
import 'package:main_tech/features/auth/widgets/app_text_form.dart';
import 'package:main_tech/features/profile/domain/entities/profile_entity.dart';
import 'package:main_tech/features/profile/domain/entities/update_profile_params.dart';
import 'package:main_tech/features/profile/presentation/manager/profile_cubit.dart';

class UpdateProfileSheet extends StatefulWidget {
  final ProfileEntity profile;

  const UpdateProfileSheet({super.key, required this.profile});

  static Future<void> show(
    BuildContext context, {
    required ProfileEntity profile,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.cardBackground,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => BlocProvider.value(
        value: context.read<ProfileCubit>(),
        child: UpdateProfileSheet(profile: profile),
      ),
    );
  }

  @override
  State<UpdateProfileSheet> createState() => _UpdateProfileSheetState();
}

class _UpdateProfileSheetState extends State<UpdateProfileSheet> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _fnameController;
  late final TextEditingController _lnameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;
  late final TextEditingController _addressController;
  late final TextEditingController _passwordController;
  late final TextEditingController _passwordConfirmationController;
  final _imagePicker = ImagePicker();
  String? _pickedImagePath;
  bool _obscurePassword = true;
  bool _obscureConfirmation = true;

  @override
  void initState() {
    super.initState();
    _fnameController = TextEditingController(text: widget.profile.fname ?? '');
    _lnameController = TextEditingController(text: widget.profile.lname ?? '');
    _emailController = TextEditingController(text: widget.profile.email ?? '');
    _phoneController = TextEditingController(text: widget.profile.phone ?? '');
    _addressController =
        TextEditingController(text: widget.profile.address ?? '');
    _passwordController = TextEditingController();
    _passwordConfirmationController = TextEditingController();
  }

  @override
  void dispose() {
    _fnameController.dispose();
    _lnameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _passwordController.dispose();
    _passwordConfirmationController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final file = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
    );
    if (file == null) return;
    setState(() => _pickedImagePath = file.path);
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    final password = _passwordController.text.trim();
    final confirmation = _passwordConfirmationController.text.trim();

    AppDialogs.showLoading(context);
    final error = await context.read<ProfileCubit>().updateProfile(
          UpdateProfileParams(
            fname: _fnameController.text.trim(),
            lname: _lnameController.text.trim(),
            phone: _phoneController.text.trim(),
            address: _addressController.text.trim(),
            email: _emailController.text.trim(),
            password: password.isEmpty ? null : password,
            passwordConfirmation: confirmation.isEmpty ? null : confirmation,
            profileImagePath: _pickedImagePath,
          ),
        );
    if (!mounted) return;
    AppDialogs.hideLoading(context);

    if (error != null) {
      await AppDialogs.showError(context, title: 'خطأ', message: error);
      return;
    }

    if (!mounted) return;
    Navigator.pop(context);
    await AppDialogs.showSuccess(context, message: 'تم التحديث');
  }

  ImageProvider? get _avatarImage {
    if (_pickedImagePath != null) {
      return FileImage(File(_pickedImagePath!));
    }
    final url = widget.profile.profileImage;
    if (url != null && url.isNotEmpty) {
      return NetworkImage(url);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.viewInsetsOf(context).bottom;

    return Padding(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 16 + bottomInset),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.cardBorderColor,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text('Edit Profile', style: AppStyles.titleStyle.copyWith(fontSize: 22)),
              const SizedBox(height: 20),
              Center(
                child: GestureDetector(
                  onTap: _pickImage,
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 48,
                        backgroundColor:
                            AppColors.primaryCyan.withValues(alpha: 0.15),
                        backgroundImage: _avatarImage,
                        child: _avatarImage == null
                            ? const Icon(
                                Icons.person,
                                size: 40,
                                color: AppColors.primaryCyan,
                              )
                            : null,
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            color: AppColors.primaryCyan,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.camera_alt,
                            size: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _fieldLabel('First Name'),
              AppTextForm(
                controller: _fnameController,
                validator: (value) =>
                    value == null || value.trim().isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 12),
              _fieldLabel('Last Name'),
              AppTextForm(
                controller: _lnameController,
                validator: (value) =>
                    value == null || value.trim().isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 12),
              _fieldLabel('Email'),
              AppTextForm(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) return 'Required';
                  if (!AppRegex.emailPattern.hasMatch(value.trim())) {
                    return 'Invalid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              _fieldLabel('Phone'),
              AppTextForm(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) return 'Required';
                  if (!AppRegex.phonePattern.hasMatch(value.trim())) {
                    return 'Invalid phone';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              _fieldLabel('Address'),
              AppTextForm(
                controller: _addressController,
                maxLines: 2,
                validator: (value) =>
                    value == null || value.trim().isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 12),
              _fieldLabel('New Password (optional)'),
              AppTextForm(
                controller: _passwordController,
                obscureText: _obscurePassword,
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                  ),
                  onPressed: () =>
                      setState(() => _obscurePassword = !_obscurePassword),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return null;
                  if (!AppRegex.passwordPattern.hasMatch(value)) {
                    return 'Min 6 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              _fieldLabel('Confirm Password'),
              AppTextForm(
                controller: _passwordConfirmationController,
                obscureText: _obscureConfirmation,
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureConfirmation
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                  ),
                  onPressed: () => setState(
                    () => _obscureConfirmation = !_obscureConfirmation,
                  ),
                ),
                validator: (value) {
                  final password = _passwordController.text;
                  if (password.isEmpty) return null;
                  if (value != password) return 'Passwords do not match';
                  return null;
                },
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryCyan,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    'Save Changes',
                    style: AppStyles.nextButtonStyle.copyWith(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  Widget _fieldLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(text, style: AppStyles.inputLabelStyle),
    );
  }
}
