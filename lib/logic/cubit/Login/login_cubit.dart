import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebaselogin/services/auth.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState(status: Status.initial));

  final AuthService _auth = AuthService();
  bool get isLoading => Status.loading == state.status;
  void loginUser({
    required String email,
    required String password,
  }) async {
    if (isLoading) return;

    emit(const LoginState(status: Status.loading));
    try {
      dynamic authresult =
          await _auth.signInwithemailandPassword(email, password);
      if (authresult == null) {
        emit(const LoginState(status: Status.error));
      } else {
        emit(const LoginState(status: Status.loaded));
      }
    } on SocketException catch (_) {
      emit(const LoginState(status: Status.error));
    }
  }
}
