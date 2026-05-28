import 'package:equatable/equatable.dart';

enum LoginSubmissionStatus { initial, submitting, success }

final class LoginState extends Equatable {
  const LoginState({
    this.email = '',
    this.password = '',
    this.status = LoginSubmissionStatus.initial,
  });

  final String email;
  final String password;
  final LoginSubmissionStatus status;

  bool get canSubmit => email.trim().isNotEmpty && password.trim().isNotEmpty;
  bool get isSubmitting => status == LoginSubmissionStatus.submitting;

  LoginState copyWith({
    String? email,
    String? password,
    LoginSubmissionStatus? status,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [email, password, status];
}
