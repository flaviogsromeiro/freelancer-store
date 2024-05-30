// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:my_store/src/modules/user/model/auth_model.dart';

enum UserStatus { initial, loading, success, error }

class UserState {
  final UserStatus status;
  final String? message;
  final AuthModel model;

  UserState({
    required this.status,
    this.message,
    required this.model,
  });

  factory UserState.initial() => UserState(
        status: UserStatus.initial,
        model: AuthModel.instance(),
      );

  UserState copyWith({
    UserStatus? status,
    String? message,
    AuthModel? model,
  }) {
    return UserState(
      status: status ?? this.status,
      message: message ?? this.message,
      model: model ?? this.model,
    );
  }
}
