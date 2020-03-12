import 'package:flutter/material.dart';
import 'package:login_using_bloc_pattern/src/screens/login_screen.dart';

import 'blocs/login_bloc_provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoginBlocProvider(child: MaterialApp(
      title: 'Log me in',
      home:LoginScreen(),
    ),);
  }
}
