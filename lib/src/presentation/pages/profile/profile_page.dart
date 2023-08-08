import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/app/config/app_colors.dart';
import 'package:flutter_clean_architecture/src/app/config/app_text_styles.dart';
import 'package:flutter_clean_architecture/src/presentation/controllers/auth/auth_controller.dart';
import 'package:get/get.dart';

class ProfilePage extends GetView<AuthController> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Profile'),
        ),
        child: controller.isLoggedIn.value ? const SignInView() : const SignUpView()));
  }
}

class SignInView extends GetView<AuthController> {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            _buildItem(
              "Username:",
              Text(
                controller.user?.username ?? "",
                style: AppTextStyles.title,
              ),
            ),
            const SizedBox(height: 16),
            _buildItem(
              "Email:",
              Text(
                controller.user?.email ?? "",
                style: AppTextStyles.title,
              ),
            ),
            const SizedBox(height: 16),
            _buildItem(
              "Mobile:",
              Text(
                controller.user?.mobile ?? "",
                style: AppTextStyles.title,
              ),
            ),
            TextButton(onPressed: controller.logout, child: const Text("Logout")),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(String title, Widget child) => Row(
        children: [
          Text(title, style: AppTextStyles.title),
          const SizedBox(
            width: 10,
          ),
          child
        ],
      );
}

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileNumberController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _userNameController.dispose();
    _emailController.dispose();
    _mobileNumberController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              SizedBox(
                height: 50,
                child: Text(
                  "Register your username",
                  style: AppTextStyles.title,
                ),
              ),
              const SizedBox(height: 50),
              _buildLoginForm(context),
              const SizedBox(height: 50),
              _buildLoginButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    return Column(
      children: [
        _buildUserName(),
        const SizedBox(height: 16),
        _buildEmail(),
        const SizedBox(height: 16),
        _buildMobileNumber(),
        const SizedBox(height: 16),
        _buildPassword()
      ],
    );
  }

  Widget _buildUserName() {
    return SizedBox(
      height: 50,
      child: CupertinoTextField(
        keyboardType: TextInputType.name,
        placeholder: "Enter username",
        controller: _userNameController,
      ),
    );
  }

  Widget _buildEmail() {
    return SizedBox(
      height: 50,
      child: CupertinoTextField(
        keyboardType: TextInputType.emailAddress,
        placeholder: "Enter Email",
        controller: _emailController,
      ),
    );
  }

  Widget _buildMobileNumber() {
    return SizedBox(
      height: 50,
      child: CupertinoTextField(
        keyboardType: TextInputType.number,
        placeholder: "Enter Mobile Number",
        controller: _mobileNumberController,
      ),
    );
  }

  Widget _buildPassword() {
    return SizedBox(
      height: 50,
      child: CupertinoTextField(
        keyboardType: TextInputType.visiblePassword,
        placeholder: "Enter Password",
        controller: _passwordController,
      ),
    );
  }

  Widget _buildLoginButton() {
    return MaterialButton(
      onPressed: () {
        controller.signUp(
            name: _userNameController.text,
            email: _emailController.text,
            mobileNumber: _mobileNumberController.text,
            password: _passwordController.text);
      },
      color: AppColors.primary,
      elevation: 0,
      minWidth: 350,
      height: 55,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Text(
        "Register",
        style: AppTextStyles.body,
      ),
    );
  }
}
