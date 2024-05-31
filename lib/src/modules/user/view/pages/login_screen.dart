import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/src/modules/user/model/auth_model.dart';
import 'package:my_store/src/modules/user/view/bloc/user_bloc.dart';
import 'package:my_store/src/modules/user/view/bloc/user_state.dart';
<<<<<<< HEAD
import 'package:my_store/src/modules/user/view/pages/signup_screen.dart';
import 'package:my_store/src/modules/user/view/widgets/login_banner_widget.dart';
import 'package:my_store/src/modules/user/view/widgets/login_title_widget.dart';
import 'package:my_store/src/ui/buttons/app_button_widget.dart';
import 'package:my_store/src/ui/dialogs/dialogs.dart';
import 'package:my_store/src/ui/form/app_text_field_widget.dart';
import 'package:my_store/src/ui/text/app_text_version.dart';
=======
import 'package:my_store/src/modules/user/view/widgets/login_banner_widget.dart';
import 'package:my_store/src/modules/user/view/widgets/login_button_widget.dart';
import 'package:my_store/src/modules/user/view/widgets/login_title_widget.dart';
import 'package:my_store/src/ui/dialogs/dialogs.dart';
import 'package:my_store/src/ui/form/app_text_field_widget.dart';
>>>>>>> 1db866af64af248d274dabceb92a1877ec081436
import 'package:my_store/src/utils/validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passController;
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _emailController = TextEditingController();
    _passController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<UserBloc>(context);

    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: BlocConsumer<UserBloc, UserState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.status == UserStatus.success) {
              log('Logado');
            } else if (state.status == UserStatus.error) {
              Dialogs.showModalErrorMessage(context, message: state.message!);
            }
          },
          builder: (context, state) {
            return Scaffold(
              key: _scaffoldKey,
              backgroundColor: Colors.white,
              body: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Flex(
                        direction: Axis.vertical,
                        children: [
                          const LoginBannerWidget(),
                          const LoginTitleWidget(),
                          Container(
                            padding: const EdgeInsets.only(
                              top: 25,
                              left: 12,
                              right: 12,
                            ),
<<<<<<< HEAD
                            height: 250,
=======
                            height: 300,
>>>>>>> 1db866af64af248d274dabceb92a1877ec081436
                            child: Column(
                              children: [
                                AppTextFieldWidget(
                                  hintText: 'Informe o e-mail',
                                  controller: _emailController,
                                  labelText: 'E-mail',
                                  prefixIcon: Icons.person,
                                  validator: (value) => Validator.validateField(
                                      value, 'Informe um e-mail válido'),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                AppTextFieldWidget(
                                  hintText: 'Informe a senha',
                                  validator: (value) => Validator.validateField(
                                    value,
                                    'Por favor, informe a senha',
                                  ),
                                  labelText: 'Senha',
                                  controller: _passController,
                                  prefixIcon: Icons.lock,
                                  isShowIconPassword: true,
                                ),
                              ],
                            ),
                          ),
<<<<<<< HEAD
                          AppButtonWidget(
                            titleButton: 'Entrar',
                            isLoading: state.status == UserStatus.loading,
=======
                          LoginButtonWidget(
>>>>>>> 1db866af64af248d274dabceb92a1877ec081436
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                bloc.signIn(
                                  AuthModel(
                                    email: _emailController.text,
                                    senha: _passController.text,
                                  ),
                                );
                              }
                            },
<<<<<<< HEAD
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          AppButtonWidget(
                            titleButton: 'Cadastrar',
                            isLoading: false,
                            onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (_) => const SignUpScreen())),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const AppTextVersion(),
=======
                            isLoading: state.status == UserStatus.loading,
                          ),
>>>>>>> 1db866af64af248d274dabceb92a1877ec081436
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
