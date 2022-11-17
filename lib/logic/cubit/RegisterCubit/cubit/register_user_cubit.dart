import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaselogin/services/auth.dart';

part 'register_user_state.dart';

class SignupCubit extends Cubit<SignUpState> {
  SignupCubit() : super(const SignUpState(status: Status2.initial));

  final AuthService _auth = AuthService();
  bool get isLoading => Status2.loading == state.status;
  void registerUser({
    required String email,
    required String password,
  }) async {
    if (isLoading) return;

    emit(const SignUpState(status: Status2.loading));

    try {
      await _auth.registerwithemailandPassword(email, password);
      emit(const SignUpState(status: Status2.success));
      log('successfully');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(const SignUpState(status: Status2.weakpassword));
      } else if (e.code == 'email-already-in-use') {
        emit(const SignUpState(status: Status2.userexist));
      }
    }
  }
}
