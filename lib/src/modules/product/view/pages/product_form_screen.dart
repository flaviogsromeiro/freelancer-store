// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:brasil_fields/brasil_fields.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_store/src/core/di/dependency_assembly.dart' as di;
import 'package:my_store/src/core/extensions/parser_extension_object.dart';
import 'package:my_store/src/modules/product/model/product_model.dart';
import 'package:my_store/src/modules/product/view/bloc/form/product_form_bloc.dart';
import 'package:my_store/src/modules/product/view/bloc/form/product_form_state.dart';
import 'package:my_store/src/modules/product/view/pages/image_product_screen.dart';
import 'package:my_store/src/ui/appBar/appbar_simple.dart';
import 'package:my_store/src/ui/buttons/app_button_widget.dart';
import 'package:my_store/src/ui/dialogs/dialogs.dart';
import 'package:my_store/src/ui/form/app_dropdown_options.dart';
import 'package:my_store/src/ui/form/app_observation_field.dart';
import 'package:my_store/src/ui/form/app_text_form_field.dart';
import 'package:my_store/src/ui/informatives/app_conditional_widget.dart';
import 'package:my_store/src/utils/images_network_path.dart';
import 'package:my_store/src/utils/style/styles.dart';
import 'package:my_store/src/utils/utils.dart';
import 'package:my_store/src/utils/validator.dart';

class ProductFormScreen extends StatefulWidget {
  const ProductFormScreen({
    super.key,
    this.id,
  });

  final String? id;

  @override
  State<ProductFormScreen> createState() => _ProductFormScreenState();
}

class _ProductFormScreenState extends State<ProductFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late final ProductFormBloc bloc;
  String? imagePath;
  // imagePath = null;

  @override
  void initState() {
    bloc = di.dependencyAssembly<ProductFormBloc>();
    bloc.get(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: Scaffold(
        appBar: AppBarSimple(
          title: 'Criar Produto',
          // isPop: state.hasChanged,
        ),
        body: BlocConsumer<ProductFormBloc, ProductFormState>(
          listener: (context, state) {
            if (state.status == ProductFormStatus.created) {
              Dialogs.showModalSuccessMessage(context, message: state.message!)
                  .then((value) {
                Navigator.pop(context);
              });
            }
          },
          builder: (context, state) {
            if (state.status == ProductFormStatus.initial ||
                state.status == ProductFormStatus.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            final codeImage = state.typeProduct ?? 'Camisetas';

            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                ColoredBox(
                  color: Styles.primatySecondary,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: Utils.heightSize(context) * 0.02,
                      vertical: Utils.heightSize(context) * 0.02,
                    ),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.95,
                    decoration: BoxDecoration(
                      color: Styles.tertiary,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Form(
                        canPop: !state.hasChanged,
                        onPopInvoked: (didPop) async {
                          if (!didPop) {
                            await Dialogs.showDialogAction(
                              context: context,
                              title: 'Sair sem salvar',
                              titleAction: 'Sim',
                              onPressed: () => Navigator.pop(context),
                            );
                          }
                        },
                        key: _formKey,
                        child: Column(
                          children: [
                            AppTextFormField(
                              action: (value) => bloc.setTitle(value),
                              label: 'Título',
                              enable: true,
                              onlyRead: false,
                              text: state.title,
                              onValidator: (value) => Validator.validateField(
                                  value, 'Informe uma título válido'),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            AppObservationField(
                              enable: true,
                              text: state.description,
                              action: (value) => bloc.setDescription(value),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            AppTextFormField(
                                action: (text) => bloc.setPrice(text),
                                label: 'Preço',
                                textInputType: TextInputType.number,
                                enable: true,
                                onlyRead: false,
                                text: state.price,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  CentavosInputFormatter(moeda: true),
                                ],
                                onValidator: (value) => Validator.validateField(
                                    value, 'Informe uma título válido')),
                            const SizedBox(
                              height: 15,
                            ),
                            AppDropDownOptions(
                              onSelected: (typeProduct) => bloc.setTypeProduct(
                                  _getCodeFromTypeProduct(typeProduct!)),
                              list: const [
                                'Camiseta',
                                'Calça',
                                'Bermuda',
                                'Saia',
                              ],
                              onValidator: (value) => Validator.validateField(
                                  value, 'Informe o tipo do produto'),
                              enable: true,
                              labelText: 'Tipo do produto',
                              hint: 'Selecione o tipo do produto',
                              // value: state.typeExpense?.title,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            DottedBorder(
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(20),
                              color: Colors.grey,
                              dashPattern: const [
                                2,
                              ],
                              strokeWidth: 2,
                              child: GestureDetector(
                                onTap: () async {
                                  Navigator.of(context).push(
                                    MaterialPageRoute<String>(
                                      builder: (context) {
                                        return ImageProductScreen(
                                          listOfImages: ImagesNetworkPath
                                                  .mapImagesProducts[codeImage]
                                              as List<String>,
                                        );
                                      },
                                    ),
                                  ).then(
                                    (value) => bloc.setImage(value),
                                  );
                                },
                                child: Container(
                                  height: Utils.widthSize(context) * 0.45,
                                  width: double.infinity,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  decoration: BoxDecoration(
                                    color: Styles.tertiary,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: AppConditionalWidget(
                                    condition: state.url != null &&
                                        state.url!.isNotEmpty,
                                    firstChild:
                                        _cardPhoto(context, state.url ?? ''),
                                    secondChild: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        const Text(
                                          'Toque para adicionar a imagem do produto',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 109, 109, 109),
                                          ),
                                        ),
                                        FaIcon(
                                          Icons.camera_alt_outlined,
                                          size: Utils.widthSize(context) * 0.08,
                                          color: const Color.fromARGB(
                                            255,
                                            164,
                                            164,
                                            164,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: AppButtonWidget(
                    titleButton: 'Salvar',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (widget.id.isNull()) {
                          bloc.create(
                            ProductModel(
                              title: state.title!,
                              description: state.description!,
                              type: state.typeProduct!,
                              urlImage: state.url!,
                              price: state.price!,
                            ),
                          );
                        } else {
                          bloc.update(
                            ProductModel(
                              title: state.title!,
                              description: state.description!,
                              type: state.typeProduct!,
                              urlImage: state.url!,
                              price: state.price!,
                            ),
                          );
                        }
                      } else {
                        Dialogs.showSnackBarMessage(
                          context,
                          message: 'Verifique os campos',
                          color: Colors.red,
                        );
                      }
                    },
                    isLoading: state.status == ProductFormStatus.loading,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _cardPhoto(BuildContext context, String urlImage) {
    final isLoading = ValueNotifier<bool>(false);

    return ValueListenableBuilder<bool>(
      valueListenable: isLoading,
      builder: (context, value, child) => Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            urlImage,
            filterQuality: FilterQuality.high,
            frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (frame == null) {
                  isLoading.value = false;
                } else {
                  isLoading.value = true;
                }
              });

              if (frame == null) {
                return Center(
                  child: SizedBox(
                    width: Utils.widthSize(context) * 0.08,
                    height: Utils.heightSize(context) * 0.036,
                    child: CircularProgressIndicator(
                      color: Styles.primary,
                      strokeWidth: 3,
                    ),
                  ),
                );
              }

              return AnimatedOpacity(
                opacity: 1,
                duration: const Duration(seconds: 2),
                curve: Curves.easeOut,
                child: child,
              );
            },
          ),
        ),
      ),
    );
  }

  int _getCodeFromTypeProduct(String value) {
    switch (value) {
      case 'Camiseta':
        return 1;
      case 'Calça':
        return 2;
      case 'Bermuda':
        return 3;
      default:
        return 4;
    }
  }
}
