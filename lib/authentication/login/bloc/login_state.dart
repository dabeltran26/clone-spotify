class LoginState {
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;

  bool get isFormValid => isEmailValid && isPasswordValid;

  LoginState(
      {required this.isEmailValid,
        required this.isPasswordValid,
        required this.isSubmitting,
        required this.isSuccess,
        required this.isFailure});

  factory LoginState.empty() {
    return LoginState(
        isEmailValid: true,
        isPasswordValid: true,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false);
  }

  factory LoginState.loading() {
    return LoginState(
        isEmailValid: true,
        isPasswordValid: true,
        isSubmitting: true,
        isSuccess: false,
        isFailure: false);
  }

  factory LoginState.failure() {
    return LoginState(
        isEmailValid: true,
        isPasswordValid: true,
        isSubmitting: false,
        isSuccess: false,
        isFailure: true);
  }

  factory LoginState.success() {
    return LoginState(
        isEmailValid: true,
        isPasswordValid: true,
        isSubmitting: false,
        isSuccess: true,
        isFailure: true);
  }

  LoginState copyWidh(
      {bool? isEmailValid,
        bool? isPasswordValid,
        bool? isSubmitting,
        bool? isSuccess,
        bool? isFailure}) {
    return LoginState(
        isEmailValid: isEmailValid ?? this.isEmailValid,
        isPasswordValid: isPasswordValid ?? this.isPasswordValid,
        isSubmitting: isSubmitting ?? this.isSubmitting,
        isSuccess: isSuccess ?? this.isSuccess,
        isFailure: isFailure ?? this.isFailure);
  }

  LoginState update({bool? isEmailValid, bool? isPasswordValid}) {
    return copyWidh(
        isEmailValid:  isEmailValid,
        isPasswordValid: isPasswordValid,
        isSubmitting: false,
        isSuccess: false
    );
  }
}
