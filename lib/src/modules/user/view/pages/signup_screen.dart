import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/src/modules/user/model/user_model.dart';
import 'package:my_store/src/modules/user/view/bloc/user_bloc.dart';
import 'package:my_store/src/modules/user/view/bloc/user_state.dart';
import 'package:my_store/src/ui/appBar/appbar_simple.dart';
import 'package:my_store/src/ui/buttons/app_button_widget.dart';
import 'package:my_store/src/ui/dialogs/dialogs.dart';
import 'package:my_store/src/ui/form/app_text_field_widget.dart';
import 'package:my_store/src/utils/style/styles.dart';
import 'package:my_store/src/utils/utils.dart';
import 'package:my_store/src/utils/validator.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passController = TextEditingController();
  final _newPassController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<UserBloc>(context);

    return Scaffold(
      appBar: AppBarSimple(
        title: 'Cadastrar',
      ),
      body: BlocConsumer<UserBloc, UserState>(
        listenWhen: (previous, current) => previous != current,
        listener: (context, state) {
          if (state.status == UserStatus.success) {
            Dialogs.showModalSuccessMessage(
              context,
              message: state.message!,
            ).then(
              (_) => Navigator.pop(context),
            );
          } else if (state.status == UserStatus.error) {
            Dialogs.showModalErrorMessage(context, message: state.message!);
          }
        },
        builder: (context, state) => ColoredBox(
          color: Styles.primatySecondary,
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              height: Utils.heightSize(context) * 0.89,
              decoration: BoxDecoration(
                color: Styles.tertiary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Flex(
                direction: Axis.vertical,
                children: [
                  Expanded(
                    flex: 9,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          AppTextFieldWidget(
                            controller: _nameController,
                            prefixIcon: Icons.person,
                            hintText: 'Informe seu nome',
                            labelText: 'Nome',
                            validator: (value) => Validator.validateField(
                              value,
                              'Informe seu nome',
                            ),
                          ),
                          AppTextFieldWidget(
                            controller: _emailController,
                            prefixIcon: Icons.email,
                            hintText: 'Informe seu e-mail',
                            labelText: 'E-mail',
                            validator: (value) => Validator.validateField(
                              value,
                              'Informe seu email',
                            ),
                          ),
                          AppTextFieldWidget(
                            controller: _phoneController,
                            prefixIcon: Icons.email,
                            hintText: 'Informe seu telefone',
                            labelText: 'Telefone',
                            validator: (value) => Validator.validateField(
                              value,
                              'Informe seu telefone',
                            ),
                            textInputType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              TelefoneInputFormatter(),
                            ],
                          ),
                          AppTextFieldWidget(
                            controller: _passController,
                            prefixIcon: Icons.lock,
                            isShowIconPassword: true,
                            hintText: 'Informe sua senha',
                            labelText: 'Senha',
                            validator: (value) => Validator.validateField(
                              value,
                              'Por favor, informe sua senha',
                            ),
                          ),
                          AppTextFieldWidget(
                            controller: _newPassController,
                            prefixIcon: Icons.lock,
                            isShowIconPassword: true,
                            hintText: 'Confirme sua nova senha',
                            labelText: 'Confirme a senha',
                            validator: (value) => Validator.validateField(
                              value,
                              'Por favor, confirme sua nova senha',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: AppButtonWidget(
                        titleButton: 'Confirmar',
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            bloc.signUp(
                              UserModel(
                                email: _emailController.text,
                                nome: _nameController.text,
                                telefone: _phoneController.text,
                              ),
                              _newPassController.text,
                            );
                          }
                        },
                        isLoading: state.status == UserStatus.loading,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
