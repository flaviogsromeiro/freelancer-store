// import 'dart:io';

// import 'package:my_store/src/core/di/dependency_assembly.dart' as di;
// import 'package:my_store/src/modules/despesa_item/data/models/despesa_item_model.dart';
// import 'package:my_store/src/modules/despesa_item/presentation/bloc/save_update_find/bloc/despesa_item_save_update_find_bloc.dart';
// import 'package:my_store/src/modules/quilometragem/data/models/quilometragem_model.dart';
// import 'package:my_store/src/modules/quilometragem/presentation/bloc/save_update_find/bloc/quilometragem_save_update_find_bloc.dart';
// import 'package:my_store/src/modules/transferir_veiculo/presentation/pages/transferir_veiculo_screen.dart';
// import 'package:my_store/src/modules/transferir_veiculo/presentation/widgets/image_transfer.dart';
// import 'package:my_store/src/modules/transferir_veiculo/presentation/widgets/transfer_text_form_field.dart';
// import 'package:my_store/src/ui/dialogs/dialogs.dart';
// import 'package:my_store/src/ui/form/select_image_form_field.dart';
// import 'package:my_store/src/ui/setings/setings.dart';
// import 'package:brasil_fields/brasil_fields.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:intl/intl.dart';
// import 'package:permission_handler/permission_handler.dart';

// // ignore: must_be_immutable
// class EditDespesaItem extends StatefulWidget {
//   EditDespesaItem({
//     required this.cdemp,
//     required this.cdrelat,
//     required this.indice,
//     required this.valor,
//     required this.checkticket,
//     required this.checkcomprovante,
//     required this.observacao,
//     required this.coddespesa,
//     required this.codfunc,
//     required this.dsfoto,
//     required this.removeu,
//     required this.editandofirst,
//     required this.cdkm,
//     required this.cliente,
//     required this.kminiida,
//     required this.kmfinalida,
//     required this.local,
//     required this.mediakm,
//     required this.motorista,
//     required this.stcarro,
//     required this.totalida,
//     required this.totalkm,
//     required this.cdfuncionario,
//     required this.combustivel,
//     required this.dtkm,
//     required this.kminivlt,
//     required this.kmfinalvlt,
//     required this.litros,
//     required this.obs,
//     required this.placa,
//     required this.totalvlt,
//     required this.vlabastecmt,
//     super.key,
//   });

//   int cdemp;
//   int cdrelat;
//   int indice;
//   double valor;
//   bool checkticket;
//   bool checkcomprovante;
//   String observacao;
//   int coddespesa;
//   String codfunc;
//   String dsfoto;
//   bool removeu;
//   bool editandofirst;
//   int cdkm;
//   String cliente;
//   int kminiida;
//   int kmfinalida;
//   String local;
//   double mediakm;
//   String motorista;
//   String stcarro;
//   int totalida;
//   int totalkm;
//   String cdfuncionario;
//   String combustivel;
//   String dtkm;
//   int kminivlt;
//   int kmfinalvlt;
//   double litros;
//   String obs;
//   String placa;
//   int totalvlt;
//   double vlabastecmt;

//   @override
//   State<EditDespesaItem> createState() => _EditDespesaItemState();
// }

// final formKey = GlobalKey<FormState>();
// final valorparametro = TextEditingController();
// final observacaoparametro = TextEditingController();
// final clienteparametro = TextEditingController();
// final localparametro = TextEditingController();
// final controllerTipoveiculo = TextEditingController();
// final controllerCombustivel = TextEditingController();
// final motoristaparametro = TextEditingController();
// final placaparametro = TextEditingController();
// final kminicialidaparametro = TextEditingController();
// final kmfinalidaparametro = TextEditingController();
// final kminicialretorno = TextEditingController();
// final kmfinalretorno = TextEditingController();
// final vlabastecimentoparametro = TextEditingController();
// final litrosparametro = TextEditingController();
// final totalkmparametro = TextEditingController();
// final mediakmparametro = TextEditingController();

// List<String> types = [
//   'alugado',
//   'empresa',
//   'pessoal',
// ]; //Tipo.values.map((e) => e.name.toUpperCase()).toList();

// List<String> typesComb = ['Gasolina', 'Álcool', 'Gás Natural', 'Diesel'];

// RegExp regExp = RegExp(r'^([A-Za-z]{3}\-?[0-9]{1}[0-9A-Za-z]{1}[0-9]{2})$');

// /* */
// String descdespesa = '';
// final ImagePicker _picker = ImagePicker();
// File? imageItens;
// bool isImage = false;
// bool isImagecamera = false;
// List<File> imagesparametro = [];
// /* */
// final bloc = di.dependencyAssembly<DespesaItemSaveUpdateFindBocBloc>();
// final blocQ = di.dependencyAssembly<QuilometragemSaveUpdateFindBocBloc>();

// class _EditDespesaItemState extends State<EditDespesaItem> {
//   @override
//   Widget build(BuildContext context) {
//     if (widget.coddespesa == 6) {
//       return quilometragem(context);
//     } else {
//       return despesaitem(context);
//     }
//   }

//   Widget despesaitem(BuildContext context) {
//     valorparametro.text = widget.valor.toString();

//     if (widget.observacao != '') {
//       observacaoparametro.text = widget.observacao;
//     }

//     descdespesa = Setings().buscardescdespesa(widget.coddespesa);

//     if (widget.removeu == false) {
//       widget.checkcomprovante = true;

//       if (widget.editandofirst == true) {
//         //if (widget.dsfoto == '') {
//         widget.checkcomprovante = false;
//         imagesparametro.clear();
//         //}
//       }
//     } else {
//       widget.checkcomprovante = false;
//       imagesparametro.clear();
//     }

//     localFile(widget.dsfoto);

//     if (imagesparametro.isEmpty) {
//       widget.checkcomprovante = false;
//     }

//     if (widget.dsfoto != '') {
//       isImage = true;
//     }

//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         toolbarHeight: 72,
//         centerTitle: true,
//         title: Column(
//           children: [
//             Row(
//               children: [
//                 RichText(
//                   textAlign: TextAlign.right,
//                   text: TextSpan(
//                     children: [
//                       TextSpan(
//                         text: 'Relatório: ${widget.cdrelat}',
//                         style:
//                             const TextStyle(fontSize: 14, color: Colors.white),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             Row(
//               children: [
//                 RichText(
//                   text: TextSpan(
//                     children: [
//                       TextSpan(
//                         text: 'Despesa: $descdespesa',
//                         style: const TextStyle(fontSize: 14),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//         backgroundColor: const Color(0xff1A4D74),
//       ),
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Color(0xff1A4D74),
//               Color(0xff598AB0),
//             ],
//           ),
//         ),
//         padding: const EdgeInsets.only(bottom: 10, top: 10),
//         child: Form(
//           key: formKey,
//           child: ListView(
//             padding: const EdgeInsets.symmetric(
//               horizontal: 24,
//               vertical: 24,
//             ),
//             children: [
//               const Column(
//                 children: [
//                   Flex(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     direction: Axis.vertical,
//                     children: [
//                       Flex(
//                         direction: Axis.horizontal,
//                         children: [
//                           Expanded(
//                             child: Text(
//                               'Valor:',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                           Text(
//                             'Ticket Alimentação',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Column(
//                 children: [
//                   Flex(
//                     direction: Axis.horizontal,
//                     children: [
//                       Flex(
//                         mainAxisSize: MainAxisSize.min,
//                         direction: Axis.horizontal,
//                         children: [
//                           Container(
//                             height: 48,
//                             width: 140,
//                             margin: const EdgeInsets.only(
//                               right: 30,
//                             ),
//                             decoration: const BoxDecoration(
//                               gradient: LinearGradient(
//                                 begin: Alignment.topCenter,
//                                 end: Alignment.bottomCenter,
//                                 colors: [
//                                   Color.fromARGB(255, 225, 230, 235),
//                                   Color(0xff598AB0),
//                                 ],
//                               ),
//                               borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(10),
//                                 topRight: Radius.circular(10),
//                                 bottomLeft: Radius.circular(10),
//                                 bottomRight: Radius.circular(10),
//                               ),
//                             ),
//                             child: SizedBox(
//                               height: 48,
//                               width: 140,
//                               child: TextFormField(
//                                 controller: valorparametro,
//                                 textAlign: TextAlign.center,
//                                 inputFormatters: [
//                                   FilteringTextInputFormatter.digitsOnly,
//                                   CentavosInputFormatter(),
//                                 ],
//                                 keyboardType:
//                                     const TextInputType.numberWithOptions(
//                                   decimal: true,
//                                 ),
//                                 decoration: const InputDecoration(
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.only(
//                                       topLeft: Radius.circular(10),
//                                       topRight: Radius.circular(10),
//                                       bottomLeft: Radius.circular(10),
//                                       bottomRight: Radius.circular(10),
//                                     ),
//                                   ),
//                                 ),
//                                 validator: validateField,
//                                 autovalidateMode:
//                                     AutovalidateMode.onUserInteraction,
//                               ),
//                             ),
//                           ),
//                           Container(
//                             alignment: Alignment.bottomCenter,
//                             height: 48,
//                             width: 140,
//                             decoration: const BoxDecoration(
//                               gradient: LinearGradient(
//                                 begin: Alignment.topCenter,
//                                 end: Alignment.bottomCenter,
//                                 colors: [
//                                   Color.fromARGB(255, 225, 230, 235),
//                                   Color(0xff598AB0),
//                                 ],
//                               ),
//                               borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(10),
//                                 topRight: Radius.circular(10),
//                                 bottomLeft: Radius.circular(10),
//                                 bottomRight: Radius.circular(10),
//                               ),
//                             ),
//                             child: SizedBox(
//                               child: Checkbox(
//                                 value: widget.checkticket,
//                                 onChanged: (value) {
//                                   switch (widget.coddespesa) {
//                                     case 3:
//                                     case 4:
//                                     case 5:
//                                       setState(() {
//                                         // ignore: use_if_null_to_convert_nulls_to_bools
//                                         if (widget.checkticket == true) {
//                                           widget.checkticket = false;
//                                         } else {
//                                           widget.checkticket = true;
//                                         }
//                                       });

//                                     default:
//                                       widget.checkticket = false;
//                                   }
//                                 },
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 10),
//               Container(
//                 margin: const EdgeInsets.symmetric(vertical: 18),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       'Observação',
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 15,
//                     ),
//                     Container(
//                       width: double.infinity,
//                       height: 200,
//                       decoration: BoxDecoration(
//                         gradient: const LinearGradient(
//                           begin: Alignment.topCenter,
//                           end: Alignment.bottomCenter,
//                           colors: [
//                             Color.fromARGB(255, 225, 230, 235),
//                             Color(0xff598AB0),
//                           ],
//                         ),
//                         border: Border.all(color: Colors.grey),
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(8),
//                         child: TextFormField(
//                           controller: observacaoparametro,
//                           style: const TextStyle(fontSize: 16),
//                           decoration: const InputDecoration(
//                             constraints: BoxConstraints(),
//                             border: InputBorder.none,
//                           ),
//                           maxLines: 13,
//                           maxLength: 500,
//                           validator: validateFieldObs,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Container(
//                 height: 48,
//                 decoration: const BoxDecoration(
//                   gradient: LinearGradient(
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                     colors: [
//                       Color.fromARGB(255, 225, 230, 235),
//                       Color(0xff598AB0),
//                     ],
//                   ),
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(10),
//                     topRight: Radius.circular(10),
//                     bottomLeft: Radius.circular(10),
//                     bottomRight: Radius.circular(10),
//                   ),
//                 ),
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 24,
//                 ),
//                 child: Flex(
//                   direction: Axis.horizontal,
//                   children: [
//                     const Expanded(
//                       child: Text(
//                         'Comprovante',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       child: Checkbox(
//                         value: widget.checkcomprovante,
//                         onChanged: (value) {},
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               // ignore: prefer_is_empty
//               if (imagesparametro.length < 1)
//                 SelectImageFormField(
//                   label: 'Imagem *',
//                   theme: Theme.of(context),
//                   onCamera: camera,
//                   onGaleria: _galeria,
//                   validator: validateFieldimagem,
//                   initialValue: imagesparametro,
//                 )
//               else
//                 const SizedBox.shrink(),
//               if (isImage)
//                 FormField(
//                   autovalidateMode: AutovalidateMode.onUserInteraction,
//                   validator: validateFieldimagem,
//                   builder: (field) => Container(
//                     constraints: const BoxConstraints(),
//                     child: ListView.builder(
//                       shrinkWrap: true,
//                       itemCount: imagesparametro.length,
//                       itemBuilder: (context, index) {
//                         return CustomPlatformImage(
//                           image: imagesparametro[index],
//                           onDelete: onDelete,
//                         );
//                       },
//                     ),
//                   ),
//                 )
//               else
//                 const SizedBox.shrink(),
//               const SizedBox(
//                 height: 50,
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomSheet: BlocConsumer<DespesaItemSaveUpdateFindBocBloc,
//           DespesaItemSaveUpdateFindBocState>(
//         bloc: bloc,
//         listener: (context, state) {
//           if (state.status == DespesaItemSaveUpdateFindStatus.success) {
//             // salvar as imagens

//             Dialogs.showModalSuccessMessage(
//               context,
//               message: 'Alterado com Sucesso!',
//             );

//             Navigator.pop(context, true);
//           }
//         },
//         listenWhen: (previous, current) => previous.status != current.status,
//         buildWhen: (previous, current) => previous.status != current.status,
//         builder: (context, state) {
//           return Container(
//             margin: EdgeInsets.zero,
//             height: 50,
//             width: double.infinity,
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 colors: [
//                   Color.fromRGBO(255, 235, 59, 1),
//                   Color.fromRGBO(255, 235, 59, 1),
//                 ],
//               ),
//               borderRadius: BorderRadius.zero,
//             ),
//             // padding: const EdgeInsets.symmetric(
//             //   horizontal: 24,
//             // ),
//             child: Column(
//               children: [
//                 if (state.status == DespesaItemSaveUpdateFindStatus.error)
//                   Text(state.message),
//                 TextButton.icon(
//                   icon: const Text(
//                     'Salvar',
//                     style: TextStyle(fontSize: 16),
//                     textAlign: TextAlign.end,
//                   ),
//                   label: const Icon(Icons.save, size: 16),
//                   onPressed: () async {
//                     if (await editando(
//                       widget.cdrelat,
//                       'Editar Despesa',
//                       'Deseja realmente editar essa despesa do relatório ',
//                     )) {
//                       await saveDespesaItem();
//                     }
//                   },
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Widget quilometragem(BuildContext context) {
//     if (widget.cliente != '') {
//       clienteparametro.text = widget.cliente;
//     }

//     if (widget.local != '') {
//       localparametro.text = widget.local;
//     }

//     if (widget.stcarro != '') {
//       controllerTipoveiculo.text = widget.stcarro;
//     }

//     if (widget.combustivel != '') {
//       controllerCombustivel.text = widget.combustivel;
//     }

//     if (widget.motorista != '') {
//       motoristaparametro.text = widget.motorista;
//     }
//     if (widget.placa != '') {
//       placaparametro.text = widget.placa;
//     }

//     if (widget.kminiida != 0) {
//       kminicialidaparametro.text = widget.kminiida.toString();
//     }

//     if (widget.kmfinalida != 0) {
//       kmfinalidaparametro.text = widget.kmfinalida.toString();
//     }

//     if (widget.kminivlt != 0) {
//       kminicialretorno.text = widget.kminivlt.toString();
//     }

//     if (widget.kmfinalvlt != 0) {
//       kmfinalretorno.text = widget.kmfinalvlt.toString();
//     }

//     if (widget.vlabastecmt != 0) {
//       vlabastecimentoparametro.text = widget.vlabastecmt.toString();
//     }

//     if (widget.litros != 0) {
//       litrosparametro.text = widget.litros.toString();
//     }

//     if (widget.totalkm != 0) {
//       totalkmparametro.text = widget.totalkm.toString();
//     }

//     if (widget.mediakm != 0) {
//       mediakmparametro.text = widget.mediakm.toString();
//     }

//     if (widget.obs != '') {
//       observacaoparametro.text = widget.obs;
//     }

//     descdespesa = Setings().buscardescdespesa(widget.coddespesa);

//     if (widget.removeu == false) {
//       widget.checkcomprovante = true;
//       // primeira vez limpar e incluir o novo
//       if (isImage == false) {
//         imagesparametro.clear();
//       }
//     }

//     localFile(widget.dsfoto);

//     if (imagesparametro.isEmpty) {
//       widget.checkcomprovante = false;
//     }

//     if (widget.dsfoto != '') {
//       isImage = true;
//     }
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Color(0xff1A4D74),
//               Color(0xff598AB0),
//             ],
//           ),
//         ),
//         child: Form(
//           key: formKey,
//           child: ListView(
//             padding: const EdgeInsets.symmetric(
//               horizontal: 24,
//               vertical: 24,
//             ),
//             children: [
//               const SizedBox(
//                 height: 30,
//               ),
//               const Text(
//                 'Data',
//                 textAlign: TextAlign.left,
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: Colors.white,
//                   fontFamily: 'Montserrat',
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               GestureDetector(
//                 onTap: () async {
//                   // data será preenchida automaticamente
//                 },
//                 child: Container(
//                   height: 48,
//                   decoration: const BoxDecoration(
//                     gradient: LinearGradient(
//                       begin: Alignment.topCenter,
//                       end: Alignment.bottomCenter,
//                       colors: [
//                         Color.fromARGB(255, 225, 230, 235),
//                         Color(0xff598AB0),
//                       ],
//                     ),
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(10),
//                       topRight: Radius.circular(10),
//                       bottomLeft: Radius.circular(10),
//                       bottomRight: Radius.circular(10),
//                     ),
//                   ),
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 24,
//                   ),
//                   child: Flex(
//                     direction: Axis.horizontal,
//                     children: [
//                       Expanded(
//                         child: Text(widget.dtkm),
//                       ),
//                       //const Icon(Icons.date_range),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               const Text(
//                 'Cliente',
//                 textAlign: TextAlign.left,
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: Colors.white,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Container(
//                 height: 60,
//                 decoration: const BoxDecoration(
//                   gradient: LinearGradient(
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                     colors: [
//                       Color.fromARGB(255, 225, 230, 235),
//                       Color(0xff598AB0),
//                     ],
//                   ),
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(10),
//                     topRight: Radius.circular(10),
//                     bottomLeft: Radius.circular(10),
//                     bottomRight: Radius.circular(10),
//                   ),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8),
//                   child: TextFormField(
//                     controller: clienteparametro,
//                     autofocus: true,
//                     textAlign: TextAlign.left,
//                     inputFormatters: [
//                       LengthLimitingTextInputFormatter(
//                         20,
//                       ),
//                     ],
//                     style: const TextStyle(fontSize: 16),
//                     decoration: const InputDecoration(
//                       constraints: BoxConstraints(),
//                       border: InputBorder.none,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               const Text(
//                 'Local',
//                 textAlign: TextAlign.left,
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: Colors.white,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Container(
//                 height: 60,
//                 //width: 240,
//                 decoration: const BoxDecoration(
//                   gradient: LinearGradient(
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                     colors: [
//                       Color.fromARGB(255, 225, 230, 235),
//                       Color(0xff598AB0),
//                     ],
//                   ),
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(10),
//                     topRight: Radius.circular(10),
//                     bottomLeft: Radius.circular(10),
//                     bottomRight: Radius.circular(10),
//                   ),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8),
//                   child: TextFormField(
//                     controller: localparametro,
//                     autofocus: true,
//                     textAlign: TextAlign.left,
//                     inputFormatters: [
//                       LengthLimitingTextInputFormatter(
//                         30,
//                       ),
//                     ],
//                     style: const TextStyle(fontSize: 16),
//                     decoration: const InputDecoration(
//                       constraints: BoxConstraints(),
//                       border: InputBorder.none,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               const Text(
//                 'Motorista',
//                 textAlign: TextAlign.left,
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: Colors.white,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Container(
//                 height: 60,
//                 decoration: const BoxDecoration(
//                   gradient: LinearGradient(
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                     colors: [
//                       Color.fromARGB(255, 225, 230, 235),
//                       Color(0xff598AB0),
//                     ],
//                   ),
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(10),
//                     topRight: Radius.circular(10),
//                     bottomLeft: Radius.circular(10),
//                     bottomRight: Radius.circular(10),
//                   ),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8),
//                   child: TextFormField(
//                     controller: motoristaparametro,
//                     autofocus: true,
//                     textAlign: TextAlign.left,
//                     inputFormatters: [
//                       LengthLimitingTextInputFormatter(
//                         20,
//                       ),
//                     ],
//                     style: const TextStyle(fontSize: 16),
//                     decoration: const InputDecoration(
//                       constraints: BoxConstraints(),
//                       border: InputBorder.none,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               TransferirFormField(
//                 hint: 'Selecione o tipo do veículo',
//                 value: '',
//                 controller: controllerTipoveiculo,
//                 isOnlyRead: true,
//                 title: 'Tipo de Veículo *',
//                 validator: (_) {
//                   if (controllerTipoveiculo.text.isEmpty) {
//                     return 'Selecione o tipo de veículo';
//                   }
//                   return null;
//                 },
//                 save: (_) {},
//                 // save: (_) => veiculo.tipo(_controllerType.text),
//                 onTap: () => _onBottomSheet(0),
//               ),
//               TransferirFormField(
//                 value: '',
//                 controller: placaparametro,
//                 isOnlyRead: false,
//                 icon: Icons.wysiwyg,
//                 title: 'Placa *',
//                 inputFormatters: [
//                   UpperCaseTextFormatter(),
//                   LengthLimitingTextInputFormatter(8),
//                 ],
//                 validator: (_) {
//                   if (!regExp.hasMatch(
//                     placaparametro.text.trim(),
//                   )) {
//                     return 'Placa de veículo inválida';
//                   }
//                   return null;
//                 },
//                 save: (_) {}, //=> veiculo.setPlaca(_controllerPlaca.text),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               const SizedBox(height: 10),
//               const Column(
//                 children: [
//                   Flex(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     direction: Axis.vertical,
//                     children: [
//                       Flex(
//                         direction: Axis.horizontal,
//                         children: [
//                           Expanded(
//                             child: Text(
//                               'Km Inicial Ida *',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 16,
//                               ),
//                             ),
//                           ),
//                           Text(
//                             'Km Final Ida * ',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Column(
//                 children: [
//                   Flex(
//                     direction: Axis.horizontal,
//                     children: [
//                       Flex(
//                         mainAxisSize: MainAxisSize.min,
//                         direction: Axis.horizontal,
//                         children: [
//                           Container(
//                             height: 48,
//                             width: 140,
//                             margin: const EdgeInsets.only(
//                               right: 30,
//                             ),
//                             decoration: const BoxDecoration(
//                               gradient: LinearGradient(
//                                 begin: Alignment.topCenter,
//                                 end: Alignment.bottomCenter,
//                                 colors: [
//                                   Color.fromARGB(255, 225, 230, 235),
//                                   Color(0xff598AB0),
//                                 ],
//                               ),
//                               borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(10),
//                                 topRight: Radius.circular(10),
//                                 bottomLeft: Radius.circular(10),
//                                 bottomRight: Radius.circular(10),
//                               ),
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.all(8),
//                               child: TextFormField(
//                                 controller: kminicialidaparametro,
//                                 textAlign: TextAlign.center,
//                                 inputFormatters: [
//                                   FilteringTextInputFormatter.digitsOnly,
//                                   LengthLimitingTextInputFormatter(
//                                     5,
//                                   ),
//                                 ],
//                                 keyboardType:
//                                     const TextInputType.numberWithOptions(
//                                   decimal: true,
//                                 ),
//                                 style: const TextStyle(fontSize: 16),
//                                 decoration: const InputDecoration(
//                                   constraints: BoxConstraints(),
//                                   border: InputBorder.none,
//                                 ),
//                                 validator: validateField,
//                                 autovalidateMode:
//                                     AutovalidateMode.onUserInteraction,
//                               ),
//                             ),
//                           ),
//                           Container(
//                             alignment: Alignment.topRight,
//                             height: 48,
//                             width: 140,
//                             decoration: const BoxDecoration(
//                               gradient: LinearGradient(
//                                 begin: Alignment.topCenter,
//                                 end: Alignment.bottomCenter,
//                                 colors: [
//                                   Color.fromARGB(255, 225, 230, 235),
//                                   Color(0xff598AB0),
//                                 ],
//                               ),
//                               borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(10),
//                                 topRight: Radius.circular(10),
//                                 bottomLeft: Radius.circular(10),
//                                 bottomRight: Radius.circular(10),
//                               ),
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.all(8),
//                               child: TextFormField(
//                                 onChanged: (value) {
//                                   kmfinalidaparametro.text =
//                                       kmfinalidaparametro.text;
//                                 },
//                                 controller: kmfinalidaparametro,
//                                 textAlign: TextAlign.center,
//                                 inputFormatters: [
//                                   LengthLimitingTextInputFormatter(
//                                     5,
//                                   ),
//                                   FilteringTextInputFormatter.digitsOnly,
//                                 ],
//                                 keyboardType:
//                                     const TextInputType.numberWithOptions(
//                                   decimal: true,
//                                 ),
//                                 style: const TextStyle(fontSize: 16),
//                                 decoration: const InputDecoration(
//                                   constraints: BoxConstraints(),
//                                   border: InputBorder.none,
//                                 ),
//                                 validator: validateField,
//                                 autovalidateMode:
//                                     AutovalidateMode.onUserInteraction,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               const Column(
//                 children: [
//                   Flex(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     direction: Axis.vertical,
//                     children: [
//                       Flex(
//                         direction: Axis.horizontal,
//                         children: [
//                           Expanded(
//                             child: Text(
//                               'Km Inicial Retorno * ',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 14,
//                               ),
//                             ),
//                           ),
//                           Text(
//                             'Km Final Retorno * ',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.w600,
//                               fontSize: 14,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Column(
//                 children: [
//                   Flex(
//                     direction: Axis.horizontal,
//                     children: [
//                       Flex(
//                         mainAxisSize: MainAxisSize.min,
//                         direction: Axis.horizontal,
//                         children: [
//                           Container(
//                             height: 48,
//                             width: 140,
//                             margin: const EdgeInsets.only(
//                               right: 30,
//                             ),
//                             decoration: const BoxDecoration(
//                               gradient: LinearGradient(
//                                 begin: Alignment.topCenter,
//                                 end: Alignment.bottomCenter,
//                                 colors: [
//                                   Color.fromARGB(255, 225, 230, 235),
//                                   Color(0xff598AB0),
//                                 ],
//                               ),
//                               borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(10),
//                                 topRight: Radius.circular(10),
//                                 bottomLeft: Radius.circular(10),
//                                 bottomRight: Radius.circular(10),
//                               ),
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.all(8),
//                               child: TextFormField(
//                                 enabled: false,
//                                 controller: kminicialretorno,
//                                 textAlign: TextAlign.center,
//                                 inputFormatters: [
//                                   LengthLimitingTextInputFormatter(
//                                     5,
//                                   ),
//                                   FilteringTextInputFormatter.digitsOnly,
//                                 ],
//                                 keyboardType:
//                                     const TextInputType.numberWithOptions(
//                                   decimal: true,
//                                 ),
//                                 style: const TextStyle(fontSize: 16),
//                                 decoration: const InputDecoration(
//                                   constraints: BoxConstraints(),
//                                   border: InputBorder.none,
//                                 ),
//                                 validator: validateField,
//                                 autovalidateMode:
//                                     AutovalidateMode.onUserInteraction,
//                               ),
//                             ),
//                           ),
//                           Container(
//                             alignment: Alignment.topRight,
//                             height: 48,
//                             width: 140,
//                             decoration: const BoxDecoration(
//                               gradient: LinearGradient(
//                                 begin: Alignment.topCenter,
//                                 end: Alignment.bottomCenter,
//                                 colors: [
//                                   Color.fromARGB(255, 225, 230, 235),
//                                   Color(0xff598AB0),
//                                 ],
//                               ),
//                               borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(10),
//                                 topRight: Radius.circular(10),
//                                 bottomLeft: Radius.circular(10),
//                                 bottomRight: Radius.circular(10),
//                               ),
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.all(8),
//                               child: TextFormField(
//                                 controller: kmfinalretorno,
//                                 textAlign: TextAlign.center,
//                                 inputFormatters: [
//                                   LengthLimitingTextInputFormatter(
//                                     5,
//                                   ),
//                                   FilteringTextInputFormatter.digitsOnly,
//                                 ],
//                                 keyboardType:
//                                     const TextInputType.numberWithOptions(
//                                   decimal: true,
//                                 ),
//                                 style: const TextStyle(fontSize: 16),
//                                 decoration: const InputDecoration(
//                                   constraints: BoxConstraints(),
//                                   border: InputBorder.none,
//                                 ),
//                                 validator: validateField,
//                                 autovalidateMode:
//                                     AutovalidateMode.onUserInteraction,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               const Text(
//                 'Valor Abastecimento',
//                 textAlign: TextAlign.left,
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: Colors.white,
//                   fontFamily: 'Montserrat',
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Container(
//                 height: 48,
//                 //width: 240,
//                 decoration: const BoxDecoration(
//                   gradient: LinearGradient(
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                     colors: [
//                       Color.fromARGB(255, 225, 230, 235),
//                       Color(0xff598AB0),
//                     ],
//                   ),
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(10),
//                     topRight: Radius.circular(10),
//                     bottomLeft: Radius.circular(10),
//                     bottomRight: Radius.circular(10),
//                   ),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8),
//                   child: TextFormField(
//                     controller: vlabastecimentoparametro,
//                     autofocus: true,
//                     textAlign: TextAlign.center,
//                     inputFormatters: [
//                       LengthLimitingTextInputFormatter(
//                         12,
//                       ),
//                       FilteringTextInputFormatter.digitsOnly,
//                       CentavosInputFormatter(),
//                     ],
//                     keyboardType: const TextInputType.numberWithOptions(
//                       decimal: true,
//                     ),
//                     style: const TextStyle(fontSize: 16),
//                     decoration: const InputDecoration(
//                       constraints: BoxConstraints(),
//                       border: InputBorder.none,
//                     ),
//                     validator: validateField,
//                     autovalidateMode: AutovalidateMode.onUserInteraction,
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               TransferirFormField(
//                 hint: 'Selecione o Combustível',
//                 value: controllerCombustivel.text,
//                 controller: controllerCombustivel,
//                 isOnlyRead: true,
//                 title: 'Combustível',
//                 validator: (_) {
//                   if (controllerCombustivel.text.isEmpty) {
//                     return 'Selecione o Combustível';
//                   }
//                   return null;
//                 },
//                 save: (_) {},
//                 onTap: () => _onBottomSheet(1),
//               ),

//               const Text(
//                 'Litros',
//                 textAlign: TextAlign.left,
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: Colors.white,
//                   fontFamily: 'Montserrat',
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Container(
//                 height: 48,
//                 //width: 240,
//                 decoration: const BoxDecoration(
//                   gradient: LinearGradient(
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                     colors: [
//                       Color.fromARGB(255, 225, 230, 235),
//                       Color(0xff598AB0),
//                     ],
//                   ),
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(10),
//                     topRight: Radius.circular(10),
//                     bottomLeft: Radius.circular(10),
//                     bottomRight: Radius.circular(10),
//                   ),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8),
//                   child: TextFormField(
//                     // onChanged: (value) => widget.controller
//                     //     .validateteste(widget.controller.kminicialida.text),

//                     controller: litrosparametro,
//                     autofocus: true,
//                     textAlign: TextAlign.center,
//                     inputFormatters: [
//                       LengthLimitingTextInputFormatter(
//                         12,
//                       ),
//                       FilteringTextInputFormatter.digitsOnly,
//                       CentavosInputFormatter(),
//                     ],
//                     keyboardType: const TextInputType.numberWithOptions(
//                       decimal: true,
//                     ),

//                     style: const TextStyle(fontSize: 16),
//                     decoration: const InputDecoration(
//                       constraints: BoxConstraints(),
//                       border: InputBorder.none,
//                     ),

//                     validator: validateField,
//                     autovalidateMode: AutovalidateMode.onUserInteraction,
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               const Column(
//                 children: [
//                   Flex(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     direction: Axis.vertical,
//                     children: [
//                       Flex(
//                         direction: Axis.horizontal,
//                         children: [
//                           Expanded(
//                             child: Text(
//                               'Total KM',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 14,
//                               ),
//                             ),
//                           ),
//                           Text(
//                             'Média Km/Litros',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.w600,
//                               fontSize: 14,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 10),
//               Column(
//                 children: [
//                   Flex(
//                     direction: Axis.horizontal,
//                     children: [
//                       Flex(
//                         mainAxisSize: MainAxisSize.min,
//                         direction: Axis.horizontal,
//                         children: [
//                           Container(
//                             height: 48,
//                             width: 140,
//                             margin: const EdgeInsets.only(
//                               right: 30,
//                             ),
//                             decoration: const BoxDecoration(
//                               gradient: LinearGradient(
//                                 begin: Alignment.topCenter,
//                                 end: Alignment.bottomCenter,
//                                 colors: [
//                                   Color.fromARGB(255, 225, 230, 235),
//                                   Color(0xff598AB0),
//                                 ],
//                               ),
//                               borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(10),
//                                 topRight: Radius.circular(10),
//                                 bottomLeft: Radius.circular(10),
//                                 bottomRight: Radius.circular(10),
//                               ),
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.all(8),
//                               child: TextFormField(
//                                 enabled: false,
//                                 controller: totalkmparametro,
//                                 textAlign: TextAlign.center,
//                                 inputFormatters: [
//                                   LengthLimitingTextInputFormatter(
//                                     10,
//                                   ),
//                                   FilteringTextInputFormatter.digitsOnly,
//                                 ],
//                                 keyboardType:
//                                     const TextInputType.numberWithOptions(
//                                   decimal: true,
//                                 ),
//                                 style: const TextStyle(fontSize: 16),
//                                 decoration: const InputDecoration(
//                                   constraints: BoxConstraints(),
//                                   border: InputBorder.none,
//                                 ),
//                                 validator: validateField,
//                                 autovalidateMode:
//                                     AutovalidateMode.onUserInteraction,
//                               ),
//                             ),
//                           ),
//                           Container(
//                             alignment: Alignment.topRight,
//                             height: 48,
//                             width: 140,
//                             decoration: const BoxDecoration(
//                               gradient: LinearGradient(
//                                 begin: Alignment.topCenter,
//                                 end: Alignment.bottomCenter,
//                                 colors: [
//                                   Color.fromARGB(255, 225, 230, 235),
//                                   Color(0xff598AB0),
//                                 ],
//                               ),
//                               borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(10),
//                                 topRight: Radius.circular(10),
//                                 bottomLeft: Radius.circular(10),
//                                 bottomRight: Radius.circular(10),
//                               ),
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.all(8),
//                               child: TextFormField(
//                                 enabled: false,
//                                 controller: mediakmparametro,
//                                 textAlign: TextAlign.center,
//                                 inputFormatters: [
//                                   LengthLimitingTextInputFormatter(
//                                     5,
//                                   ),
//                                   FilteringTextInputFormatter.digitsOnly,
//                                   CentavosInputFormatter(),
//                                 ],
//                                 keyboardType:
//                                     const TextInputType.numberWithOptions(
//                                   decimal: true,
//                                 ),
//                                 style: const TextStyle(fontSize: 16),
//                                 decoration: const InputDecoration(
//                                   constraints: BoxConstraints(),
//                                   border: InputBorder.none,
//                                 ),
//                                 validator: validateField,
//                                 autovalidateMode:
//                                     AutovalidateMode.onUserInteraction,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ],
//               ),

//               const SizedBox(height: 10),
//               Container(
//                 margin: const EdgeInsets.symmetric(vertical: 18),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       'Observação',
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 15,
//                     ),
//                     Container(
//                       width: double.infinity,
//                       height: 150,
//                       decoration: BoxDecoration(
//                         gradient: const LinearGradient(
//                           begin: Alignment.topCenter,
//                           end: Alignment.bottomCenter,
//                           colors: [
//                             Color.fromARGB(255, 225, 230, 235),
//                             Color(0xff598AB0),
//                           ],
//                         ),
//                         border: Border.all(color: Colors.grey),
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(8),
//                         child: TextFormField(
//                           controller: observacaoparametro,
//                           style: const TextStyle(fontSize: 20),
//                           decoration: const InputDecoration(
//                             constraints: BoxConstraints(),
//                             border: InputBorder.none,
//                           ),
//                           maxLines: 13,
//                           maxLength: 200,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               // ignore: prefer_is_empty
//               if (imagesparametro.length < 1)
//                 SelectImageFormField(
//                   label: 'Imagem *',
//                   theme: Theme.of(context),
//                   onCamera: camera,
//                   onGaleria: _galeria,
//                   validator: validateFieldimagem,
//                   initialValue: imagesparametro,
//                 )
//               else
//                 const SizedBox.shrink(),
//               if (isImage)
//                 FormField(
//                   autovalidateMode: AutovalidateMode.onUserInteraction,
//                   validator: validateFieldimagem,
//                   builder: (field) => Container(
//                     constraints: const BoxConstraints(),
//                     child: ListView.builder(
//                       shrinkWrap: true,
//                       itemCount: imagesparametro.length,
//                       itemBuilder: (context, index) {
//                         return CustomPlatformImage(
//                           image: imagesparametro[index],
//                           onDelete: onDelete,
//                         );
//                       },
//                     ),
//                   ),
//                 )
//               else
//                 const SizedBox.shrink(),
//               const SizedBox(
//                 height: 50,
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomSheet: BlocConsumer<QuilometragemSaveUpdateFindBocBloc,
//           QuilometragemSaveUpdateFindBocState>(
//         bloc: blocQ,
//         listener: (context, state) {
//           if (state.status == QuilometragemSaveUpdateFindStatus.success) {
//             Navigator.pop(context, true);
//           }
//         },
//         listenWhen: (previous, current) => previous.status != current.status,
//         buildWhen: (previous, current) => previous.status != current.status,
//         builder: (context, state) {
//           return Container(
//             margin: EdgeInsets.zero,
//             height: 50,
//             width: double.infinity,
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 colors: [
//                   Color.fromRGBO(255, 235, 59, 1),
//                   Color.fromRGBO(255, 235, 59, 1),
//                 ],
//               ),
//               borderRadius: BorderRadius.zero,
//             ),
//             child: Padding(
//               padding: EdgeInsets.zero,
//               child: TextButton.icon(
//                 icon: const Text('Editar'),
//                 label: const Icon(Icons.arrow_forward, size: 16),
//                 onPressed: () async {
//                   if (await editando(
//                     widget.cdrelat,
//                     'Editar Quilometragem',
//                     'Deseja realmente editar essa despesa do relatório ',
//                   )) {
//                     await saveQuilometragem();
//                   }
//                 },
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   String? validateField(String? value) {
//     if (value != null) {
//       if (value.isEmpty) {
//         return 'por favor preencha esse campo';
//       }
//     }
//     return null;
//   }

//   String? validateFieldObs(String? value) {
//     if ((descdespesa == 'Comunicação') || (descdespesa == 'Hospedagem')) {
//       if (value!.isEmpty) {
//         return 'por favor preencha esse campo';
//       }
//     }
//     return null;
//   }

//   Future<void> camera() async {
//     try {
//       final photo = await _picker.pickImage(source: ImageSource.camera);

//       if (photo != null) {
//         // ignore: invalid_use_of_protected_member
//         setState(() {
//           imageItens = File(photo.path);
//           imagesparametro.add(imageItens!);
//           isImage = true;
//           widget
//             ..editandofirst = false
//             ..checkcomprovante = true
//             ..removeu = false;
//         });
//       }
//     } catch (e) {
//       final permission = Permission.camera.status;

//       if (await permission.isDenied || await permission.isPermanentlyDenied) {
//         const snackBar = SnackBar(
//           content: Text('Permissão para acessar a câmera'),
//           action: SnackBarAction(
//             label: 'Settings',
//             onPressed: openAppSettings,
//           ),
//         );
//         // ignore: use_build_context_synchronously
//         ScaffoldMessenger.of(context).showSnackBar(snackBar);
//         // ignore: use_build_context_synchronously
//         Navigator.of(context).pop();
//       }
//     }
//   }

//   Future<void> _galeria() async {
//     if (await verificarpermissaoCamera()) {
//       final photo = await galeria();

//       if (photo != null) {
//         // ignore: invalid_use_of_protected_member
//         setState(() {
//           imageItens = File(photo.path);
//           imagesparametro.add(imageItens!);
//           isImage = true;
//           widget
//             ..editandofirst = false
//             ..checkcomprovante = true
//             ..removeu = false;
//         });
//       }
//     }
//   }

//   Future<bool> verificarpermissaoCamera() async {
//     return true;
//   }

//   Future<XFile?> galeria() async {
//     try {
//       return await _picker.pickImage(source: ImageSource.gallery);
//     } catch (e) {
//       final permission = Permission.photos.status;

//       if (await permission.isDenied || await permission.isPermanentlyDenied) {
//         const snackBar = SnackBar(
//           content: Text('Permissão para acessar a galeria'),
//           action: SnackBarAction(
//             label: 'Settings',
//             onPressed: openAppSettings,
//           ),
//         );
//         // ignore: use_build_context_synchronously
//         ScaffoldMessenger.of(context).showSnackBar(snackBar);
//         // ignore: use_build_context_synchronously
//         Navigator.of(context);
//       }
//       return null;
//     }
//   }

//   String? validateFieldimagem(List<File?>? images) {
//     if (images != null) {
//       if (images.isEmpty) {
//         switch (widget.coddespesa) {
//           case 3:
//           case 4:
//           case 5:
//           case 6:
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(
//                 backgroundColor: Colors.red,
//                 content: Text(
//                   'Campo comprovante não pode ser vazio',
//                 ),
//               ),
//             );

//             return 'Campo comprovante não pode ser vazio';
//         }
//       }
//       return null;
//     }

//     return null;
//   }

//   void localFile(String dsfoto) {
//     if (imagesparametro.isEmpty) {
//       if (widget.removeu != true) {
//         if (dsfoto != '') {
//           imagesparametro
//             ..clear()
//             ..add(File(dsfoto));
//           widget.checkcomprovante = true;
//         }
//       }
//     }
//     //return File(dsfoto);
//   }

//   void onDelete(File img) {
//     // ignore: invalid_use_of_protected_member
//     setState(() {
//       isImagecamera = false;
//       imagesparametro
//         ..remove(img)
//         ..clear();

//       widget
//         ..checkcomprovante = false
//         ..removeu = true;
//     });
//   }

//   Future<void> saveDespesaItem() async {
//     if (formKey.currentState!.validate()) {
//       if (imagesparametro.isEmpty) {
//         await imageItens?.delete();
//       }

//       final model = DespesaItemModel(
//         cddespesa: widget.coddespesa,
//         cdrelat: widget.cdrelat,
//         indice: widget.indice,
//         cdfuncionario: widget.codfunc,
//         dsfoto: imageItens?.path ?? '',
//         dsreprovado: 'N',
//         dtitem: DateFormat('dd-MM-yyyy', 'pt_Br').format(DateTime.now()),
//         obs: observacaoparametro.text,
//         ticket: verificarcomp(widget.checkticket),
//         stcompr: verificarcomp(widget.checkcomprovante),
//         vlitem: double.parse(valorparametro.text.replaceAll(',', '.')),
//       );

//       bloc.add(
//         DespesaItemSaveOrUpdateEvent(
//           entity: model,
//         ),
//       );
//     }
//   }

//   Future<void> saveQuilometragem() async {
//     if (formKey.currentState!.validate()) {
//       String mediaformat;

//       final vlababackup =
//           double.parse(vlabastecimentoparametro.text.replaceAll(',', '.'));
//       final vlaba = vlababackup.toStringAsFixed(2);

//       var mediakm = Setings().somaMediakm(
//         int.parse(kminicialidaparametro.text),
//         int.parse(kmfinalidaparametro.text),
//         int.parse(kminicialretorno.text),
//         int.parse(kmfinalretorno.text),
//         double.parse(vlaba),
//       );

//       mediaformat = mediakm.toStringAsFixed(2);

//       mediakm = double.parse(mediaformat);

//       final totalkmida = Setings().somatotalkm(
//         int.parse(kminicialidaparametro.text),
//         int.parse(kmfinalidaparametro.text),
//       );

//       final totalkmvolta = Setings().somatotalkm(
//         int.parse(kminicialretorno.text),
//         int.parse(kmfinalretorno.text),
//       );

//       final totalkms = totalkmida + totalkmvolta;

//       final model = QuilometragemModel(
//         cdkm: blocQ.state.cdkm,
//         cdrelat: int.parse(
//           widget.cdrelat.toString(),
//         ),
//         cdemp: widget.cdemp,
//         cliente: clienteparametro.text,
//         kminiida: int.parse(kminicialidaparametro.text),
//         kmfinalida: int.parse(kmfinalidaparametro.text),
//         local: localparametro.text,
//         mediakm: mediakm,
//         motorista: motoristaparametro.text,
//         stcarro: controllerTipoveiculo.text,
//         totalida: totalkmida, //  KMINIIDA+KMFINALIDA
//         totalkm: totalkms,
//         cdfuncionario: widget.cdfuncionario,
//         combustivel: controllerCombustivel.text,
//         dtkm: widget.dtkm,
//         kminivlt: int.parse(kminicialretorno.text),
//         kmfinalvlt: int.parse(kmfinalretorno.text),
//         litros: double.parse(litrosparametro.text.replaceAll(',', '.')),
//         obs: observacaoparametro.text,
//         placa: placaparametro.text,
//         totalvlt: totalkmvolta, // KMINIVLT+KMFINALVLT
//         vlabastecmt: double.parse(vlaba),
//       );

//       blocQ.add(
//         QuilometragemSaveOrUpdateEvent(
//           entity: model,
//         ),
//       );
//     }
//   }

//   // ignore: avoid_positional_boolean_parameters
//   String verificarcomp(bool check) {
//     String retorno;

//     retorno = 'N';
//     if (check) {
//       retorno = 'S';
//     }
//     return retorno;
//   }

//   void _onBottomSheet(int i) {
//     var validar = <String>[];
//     switch (i) {
//       case 0:
//         {
//           validar = types;
//           break;
//         }
//       case 1:
//         {
//           validar = typesComb;
//           break;
//         }
//     }

//     // ignore: inference_failure_on_function_invocation
//     showModalBottomSheet(
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(
//           top: Radius.circular(15),
//         ),
//       ),
//       context: context,
//       builder: (context) {
//         return Padding(
//           padding: const EdgeInsets.all(8),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               for (var x = 0; x < validar.length; x++)
//                 ListTile(
//                   title: Text(
//                     validar[x],
//                     style: const TextStyle(fontSize: 16),
//                   ),
//                   onTap: () {
//                     setState(() {
//                       switch (i) {
//                         case 0:
//                           {
//                             controllerTipoveiculo.text = validar[x];
//                             break;
//                           }

//                         case 1:
//                           {
//                             controllerCombustivel.text = validar[x];
//                             break;
//                           }
//                       }
//                       Navigator.pop(context);
//                     });
//                   },
//                 ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   Future<bool> editando(
//     int rel,
//     String titleMessage,
//     String message,
//   ) async {
//     bool? willLeave;

//     await Setings()
//         .backNoticeDialog(
//           context: context,
//           titleMessage: titleMessage,
//           message: '$message $rel ?',
//         )
//         .then((value) => willLeave = value);

//     return willLeave!;
//   }
// }
