import 'package:chati/Cubits/login_cubit/login_cubit.dart';
import 'package:chati/Screens/login_page.dart';
import 'package:chati/Screens/signup_otp.dart';
import 'package:chati/Screens/signup_page.dart';
import 'package:chati/const/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ChatiApp());
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
        routes: {
          Routes.login: (context) => LoginPage(),
          Routes.signup: (context) => SignupPage(),
          Routes.signupOtp: (context) => SignupOtp(),
        },

        initialRoute: Routes.signupOtp,
      ),
    );
  }
}
