import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:yalla_shopping/common_utils/res/CONST.dart';
import 'package:yalla_shopping/common_utils/res/assets_manager.dart';
import 'package:yalla_shopping/common_utils/res/dimens.dart';
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

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  _bindViewWithViewModel() {
    /// tell view model to start it's job
    loginViewModel.start();
    _emailController
        .addListener(() => loginViewModel.setEmail(_emailController.text));
    _passwordController
        .addListener(() => loginViewModel.setEmail(_passwordController.text));
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
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: Dimens.d10.h),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const  Center(child:  Image(image:  AssetImage(AssetsManager.splashLogo),),),
                SizedBox(height: Dimens.d10.h,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Dimens.d10.h),
                  child: StreamBuilder<bool>(
                    stream: loginViewModel.outIsEmailValid,
                    builder: (context, snapshot) => TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: Const.email,hintText: Const.email,
                        errorText: (snapshot.data ?? true) ? null : Const.emailError
                      ),
                    ),
                  ),
                ),
                SizedBox(height: Dimens.d2.h,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Dimens.d10.h),
                  child: StreamBuilder<bool>(
                    stream: loginViewModel.outIsPasswordValid,
                    builder: (context, snapshot) => TextFormField(
                      controller: _passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        labelText: Const.password,hintText: Const.password,
                        errorText: (snapshot.data ?? true) ? null : Const.passwordError
                      ),
                    ),
                  ),
                ),
                SizedBox(height: Dimens.d5.h,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Dimens.d10.h),
                  child: ElevatedButton(
                    onPressed: ()=>loginViewModel.login(),child: const Text(Const.login),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
