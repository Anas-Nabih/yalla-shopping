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
  final StreamController _areInputsValidStreamController =
  StreamController<void>.broadcast();


  var loginObject = LoginObject("", "");
  final LoginUseCase _loginUseCase;

  /// inputs
  @override
  void dispose() {
    _emailStreamController.close();
    _passwordStreamController.close();
    _areInputsValidStreamController.close();
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
   Sink get inputAreAllInputsValid => _areInputsValidStreamController.sink;

  @override
  setPassword(String password) {
    inputPassword.add(password);
    loginObject = loginObject.copyWith(password: password);
    inputAreAllInputsValid.add(null);
  }

  @override
  setEmail(String email) {
    inputEmail.add(email);
    loginObject = loginObject.copyWith(email: email);
    inputAreAllInputsValid.add(null);
  }

  @override
  login() async {
    (await _loginUseCase.execute(LoginUseCaseInput(
        email: loginObject.email, password: loginObject.password))).fold((
        failure) => {
          /// failure
      print(failure.message)
    }, (data) => {
          /// success (data)
      print(data.customer?.name)
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

  @override
  // TODO: implement outputAreAllInputsValid
  Stream<bool> get outputAreAllInputsValid => _areInputsValidStreamController.stream.map((_) => _areAllInputsAreInvalid());

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

 bool _areAllInputsAreInvalid() {
    return _isEmailISValid(loginObject.email) && _isPasswordValid(loginObject.password);
 }





}


abstract class LoginViewModelInputs {
  setEmail(String email);

  setPassword(String password);

  login();

  Sink get inputEmail;

  Sink get inputPassword;

  Sink get inputAreAllInputsValid;
}

abstract class LoginViewModelOutputs {
  Stream<bool> get outIsEmailValid;

  Stream<bool> get outIsPasswordValid;

  Stream<bool> get outputAreAllInputsValid;
}
