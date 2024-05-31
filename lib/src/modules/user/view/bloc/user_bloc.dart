// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:my_store/src/modules/user/controller/user_controller.dart';
import 'package:my_store/src/modules/user/model/auth_model.dart';
import 'package:my_store/src/modules/user/model/user_model.dart';
import 'package:my_store/src/modules/user/view/bloc/user_state.dart';

class UserBloc extends Cubit<UserState> {
  final UserController authController;

  UserBloc(
    this.authController,
  ) : super(UserState.initial());

  Future<void> signIn(AuthModel model) async {
    emit(state.copyWith(status: UserStatus.loading));

    final isLoggin = await authController.signIn(model);

    if (isLoggin) {
      emit(state.copyWith(status: UserStatus.success));
    } else {
      emit(state.copyWith(
        status: UserStatus.error,
        message: 'Acesso negado',
      ));
    }
  }

  Future<void> signUp(UserModel model, String password) async {
    emit(state.copyWith(status: UserStatus.loading));

    final isSignUp = await authController.signUp(model, password);

    if (isSignUp) {
<<<<<<< HEAD
      emit(state.copyWith(
          status: UserStatus.success,
          message: 'Cadastro realizado com sucesso'));
=======
      emit(state.copyWith(status: UserStatus.success));
>>>>>>> 1db866af64af248d274dabceb92a1877ec081436
    } else {
      emit(state.copyWith(
        status: UserStatus.error,
        message: 'Houve um erro ao cadastrar',
      ));
    }
  }
}
