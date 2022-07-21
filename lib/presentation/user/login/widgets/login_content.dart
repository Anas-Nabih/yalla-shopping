import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:yalla_shopping/common_utils/res/dimens.dart';

class LoginContent extends StatelessWidget {
    LoginContent({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top:Dimens.d10.h),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(

            ),
          ),
        ),
      ),
    );
  }
}
