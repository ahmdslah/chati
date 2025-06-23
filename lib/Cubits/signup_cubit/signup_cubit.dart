import 'package:chati/Cubits/Login_cubit/Login_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCubit extends Cubit<LoginStates> {
  SignupCubit() : super(LoginInit());
}
