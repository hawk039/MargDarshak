import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_state.dart';

final class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  void emailChanged(String value) {
    emit(
      state.copyWith(
        email: value,
        status: LoginSubmissionStatus.initial,
      ),
    );
  }

  void passwordChanged(String value) {
    emit(
      state.copyWith(
        password: value,
        status: LoginSubmissionStatus.initial,
      ),
    );
  }

  Future<void> submit() async {
    if (!state.canSubmit || state.isSubmitting) {
      return;
    }

    emit(state.copyWith(status: LoginSubmissionStatus.submitting));
    await Future<void>.delayed(const Duration(milliseconds: 600));
    emit(state.copyWith(status: LoginSubmissionStatus.success));
  }
}
