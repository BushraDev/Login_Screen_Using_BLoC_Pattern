import 'dart:async';

import 'package:rxdart/rxdart.dart';

import '../blocs/validation_mixin.dart';

class LoginBloc extends Object with ValidationMixin
{
  final _emailController=BehaviorSubject<String>();
  final _passowrdController=BehaviorSubject<String>();

  //Add data to stream
  Stream<String> get email=>_emailController.stream.transform(validateEmail);
  Stream<String> get passowrd=>_passowrdController.stream.transform(validatePassword);
  Stream<bool> get submitValid=>CombineLatestStream.combine2(email, passowrd, (e,p)=>true);

  //change data
  Function(String) get changeEmail=>_emailController.sink.add;
  Function(String) get changePassowrd=>_passowrdController.sink.add;

  //submit data
  submit()
  {
    final validEmail= _emailController.value;
    final validPassword= _passowrdController.value;
    print("valid email is $validEmail");
    print("valid password is $validPassword");
  }

  dispose()
  {
    _emailController.close();
    _passowrdController.close();
  }
}
