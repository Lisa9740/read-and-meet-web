import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:read_and_meet_web/core/services/provider.service.dart';
import 'package:read_and_meet_web/view/screens/auth/login.screen.dart';
import 'package:read_and_meet_web/view/screens/home/home.screen.dart';

import 'core/providers/api/auth.provider.dart';
import 'core/theme/app.theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProvidersService.providerList(),
      child: Consumer<AuthApiProvider>(
          builder: (ctx, authData, child) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: AppTheme.appTheme(),
              initialRoute: '/',
              routes: {
                HomeScreen.routeName: (ctx) => HomeScreen(),
                LoginScreen.routeName: (ctx) => const LoginScreen(),
              },
            );
          }),

    );
  }
}


