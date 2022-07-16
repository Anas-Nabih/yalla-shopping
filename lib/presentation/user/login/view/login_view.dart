import 'package:flutter/material.dart';
import 'package:yalla_shopping/presentation/user/login/view_model/login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginViewModel loginViewModel = LoginViewModel(_loginUseCase);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  _bindViewWithViewModel() {
    /// tell view model to start it's job
    loginViewModel.start();
    _emailController.addListener(() => loginViewModel.setEmail(_emailController.text));
    _passwordController.addListener(() => loginViewModel.setEmail(_passwordController.text));
  }

  @override
  void initState() {
    _bindViewWithViewModel();
    super.initState();
  }

  @override
  void dispose() {
    loginViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
