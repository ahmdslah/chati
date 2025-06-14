import 'package:chati/Cubits/Login_cubit/login_cubit.dart';
import 'package:chati/Screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const ChatiApp());
}

class ChatiApp extends StatelessWidget {
  const ChatiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => LoginCubit())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
        routes: {'login': (context) => LoginPage()},

        initialRoute: 'login',
      ),
    );
  }
}
