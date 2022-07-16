import 'dart:async';
import 'package:yalla_shopping/domain/use_cases/login_use_case.dart';
import 'package:yalla_shopping/presentation/base/base_view_model.dart';
import 'package:yalla_shopping/presentation/comman/freezed_data_classes.dart';

class LoginViewModel extends BaseViewModel
    with LoginViewModelInputs, LoginViewModelOutputs {

  LoginViewModel(this._loginUseCase);

  final StreamController _emailStreamController =
  StreamController<String>.broadcast();
  final StreamController _passwordStreamController =
  StreamController<String>.broadcast();


  var loginObject = LoginObject("", "");
  final LoginUseCase _loginUseCase;

  /// inputs
  @override
  void dispose() {
    _emailStreamController.close();
    _passwordStreamController.close();
  }

  @override
  void start() {
    // TODO: implement start
  }

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputEmail => _emailStreamController.sink;

  @override
  setPassword(String password) {
    inputPassword.add(password);
    loginObject = loginObject.copyWith(password: password);
  }

  @override
  setEmail(String email) {
    inputEmail.add(email);
    loginObject = loginObject.copyWith(email: email);
  }

  @override
  login() async {
    (await _loginUseCase.execute(LoginUseCaseInput(
        email: loginObject.email, password: loginObject.password))).fold((
        failure) => {
          /// failure
    }, (data) => {
          /// success (data)
     });
  }

  /// outPuts
  @override
  // TODO: implement outIsPassword
  Stream<bool> get outIsPasswordValid =>
      _passwordStreamController.stream
          .map((password) => _isPasswordValid(password));

  @override
  // TODO: implement outIsUserNameValid
  Stream<bool> get outIsEmailValid =>
      _emailStreamController.stream.map((email) => _isEmailISValid(email));

  bool _isPasswordValid(String password) {
    if (password.isEmpty || password.length < 6) {
      return false;
    } else {
      return true;
    }
  }

  bool _isEmailISValid(String email) {
    if (email.isEmpty) {
      return false;
    } else {
      return true;
    }
  }
}

abstract class LoginViewModelInputs {
  setEmail(String email);

  setPassword(String password);

  login();

  Sink get inputEmail;

  Sink get inputPassword;
}

abstract class LoginViewModelOutputs {
  Stream<bool> get outIsEmailValid;

  Stream<bool> get outIsPasswordValid;
}
