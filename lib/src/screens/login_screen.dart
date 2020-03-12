
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../blocs/login_bloc_provider.dart';
import '../blocs/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  LoginBloc loginBloc;

  @override
  void didChangeDependencies() {
    loginBloc=LoginBlocProvider.of(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    loginBloc.dispose();
    super.dispose();
      }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Screen Usin Bloc"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            emailField(loginBloc),
            passwordField(loginBloc),
            submitButton(loginBloc)

          ],
        ),
      ),
    );
  }

  Widget emailField(LoginBloc loginBloc)
  {
    return StreamBuilder(
      stream: loginBloc.email,
      builder: (BuildContext context,AsyncSnapshot snapshot)
      {
        return Container(
          margin: EdgeInsets.only(bottom:20.0),
          child: TextFormField(
            onChanged: loginBloc.changeEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                hintText: "you@example.com",
                labelText: "Email",
                border:OutlineInputBorder(),
                errorText: snapshot.error
            ),
          ),
        );

      },
    );
  }

  Widget passwordField(LoginBloc loginBloc)
  {
    return StreamBuilder(
      stream: loginBloc.passowrd,
      builder: (BuildContext context,AsyncSnapshot snapshot)
      {
        return Container(
          margin: EdgeInsets.only(bottom: 20.0),
          child: TextFormField(
            onChanged: loginBloc.changePassowrd,
            obscureText: true,
            decoration: InputDecoration(
                hintText: "password",
                labelText: "Password",
                border:OutlineInputBorder(),
                errorText: snapshot.error
            ),
          ),
        );

      },
    );
  }

  Widget submitButton(LoginBloc loginBloc)
  {
    return StreamBuilder(
      stream: loginBloc.submitValid,
      builder: (BuildContext,AsyncSnapshot<bool> snapshot)
      {
        return RaisedButton(
          child: Text("Log in"),
          color: Colors.blue,
          onPressed: snapshot.hasData ? loginBloc.submit:null,

        );

      },
    );
  }
}



