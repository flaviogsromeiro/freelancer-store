// import 'package:my_store/src/core/di/dependency_assembly.dart' as di;
// import 'package:my_store/src/modules/gerenciador/presentation/bloc/save_update_find_bloc/bloc/gerenciador_save_update_find_bloc.dart';
// import 'package:flutter/material.dart';

// class Setings {
//   List<String> listrelatorio = [];

//   final blocG = di.dependencyAssembly<GerenciadorSaveUpdateFindBocBloc>();

//   Future<bool> backNoticeDialog({
//     required String titleMessage,
//     required String message,
//     required BuildContext context,
//   }) async {
//     {
//       var isReturn = false;

//       return showDialog<bool>(
//         barrierDismissible: false,
//         context: context,
//         builder: (context) => AlertDialog(
//           shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.all(Radius.circular(15)),
//           ),
//           titlePadding:
//               const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
//           contentPadding: const EdgeInsets.symmetric(horizontal: 40),
//           actionsPadding: const EdgeInsets.only(
//             left: 35,
//             right: 40,
//             bottom: 20,
//             top: 20,
//           ),
//           title: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Flex(
//                 direction: Axis.horizontal,
//                 children: [
//                   Icon(
//                     Icons.info_outline,
//                     size: 35,
//                     color: Theme.of(context).colorScheme.primary,
//                   ),
//                   const SizedBox(
//                     width: 5,
//                   ),
//                   Text(
//                     titleMessage,
//                     style: const TextStyle(
//                       fontSize: 18,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           content: Text(
//             message,
//             style: const TextStyle(color: Colors.grey, fontSize: 15),
//           ),
//           actions: [
//             Flex(
//               direction: Axis.horizontal,
//               children: [
//                 Expanded(
//                   flex: 5,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                     onPressed: () {
//                       isReturn = true;

//                       Navigator.of(context).pop();
//                     },
//                     child: const Text(
//                       'Sim',
//                       style: TextStyle(
//                         fontSize: 18,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 15,
//                 ),
//                 Expanded(
//                   flex: 5,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.white,
//                       side: BorderSide(
//                         color: Theme.of(context).colorScheme.primary,
//                       ),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                     onPressed: () {
//                       isReturn = false;

//                       Navigator.of(context).pop();
//                     },
//                     child: Text(
//                       'Não',
//                       style: TextStyle(
//                         fontSize: 18,
//                         color: Theme.of(context).colorScheme.primary,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ).then(
//         (_) => isReturn,
//       );
//     }
//   }

//   String buscardescdespesa(int cod) {
//     var descicao = '';
//     switch (cod) {
//       case 1:
//         descicao = 'Comunicação';
//       case 2:
//         descicao = 'Hospedagem';
//       case 3:
//         descicao = 'Alimentação 1 (Café)';
//       case 4:
//         descicao = 'Alimentação 2 (Almoço)';
//       case 5:
//         descicao = 'Alimentação 3 (Jantar)';
//       case 6:
//         descicao = 'Quilometragem';
//       case 7:
//         descicao = 'Estacionamento';
//       case 8:
//         descicao = 'Ônibus Municipal';
//       case 9:
//         descicao = 'Ônibus Intermunicipal';
//       case 10:
//         descicao = 'Ônibus Rodoviário';
//       case 11:
//         descicao = 'Metrô/Trem';
//       case 12:
//         descicao = 'Embarcação';
//       case 13:
//         descicao = 'Pedágio';
//       case 14:
//         descicao = 'Táxi Voucher';
//       case 16:
//         descicao = 'Relatório de Atendimento';
//       case 17:
//         descicao = 'Consumo de Aguá';
//       case 18:
//         descicao = 'Lavanderia';
//       default:
//         descicao = 'Lavanderia';
//     }

//     return descicao;
//   }

//   int buscarcoddespesa(String value) {
//     var codigo = 0;
//     switch (value) {
//       case 'Comunicação':
//         codigo = 1;
//       case 'Hospedagem':
//         codigo = 2;
//       case 'Alimentação 1 (Café)':
//         codigo = 3;
//       case 'Alimentação 2 (Almoço)':
//         codigo = 4;
//       case 'Alimentação 3 (Jantar)':
//         codigo = 5;
//       case 'Quilometragem':
//         codigo = 6;
//       case 'Estacionamento':
//         codigo = 7;
//       case 'Ônibus Municipal':
//         codigo = 8;
//       case 'Ônibus Intermunicipal':
//         codigo = 9;
//       case 'Ônibus Rodoviário':
//         codigo = 10;
//       case 'Metrô/Trem':
//         codigo = 11;
//       case 'Embarcação':
//         codigo = 12;
//       case 'Pedágio':
//         codigo = 13;
//       case 'Táxi Voucher':
//         codigo = 14;
//       case 'Relatório de Atendimento':
//         codigo = 16;
//       case 'Consumo de Aguá':
//         codigo = 17;
//       case 'Lavanderia':
//         codigo = 18;
//     }

//     return codigo;
//   }

//   int somatotalkm(int value1, int value2) {
//     final soma = value1 + value2;

//     return soma;
//   }

//   double somaMediakm(
//     int kmini,
//     int kmfin,
//     int kminir,
//     int kmfinr,
//     double vlabast,
//   ) {
//     final totalgeral = kmini + kmfin + kminir + kmfinr;

//     final mediageral = totalgeral / vlabast;

//     return mediageral;
//   }

//   // Future<bool> verificarrelatorios() async {
//   //   var teste = false;
//   //   final bloc = di.dependencyAssembly<RelatorioSaveUpdateFindBocBloc>();
//   //   //String vlitemsoma;
//   //   final helpersomatotal = DatabaseHelper();
//   //   final repositoryHelper = RepositoryHelper(helper: helpersomatotal);
//   //   final localreport = di.dependencyAssembly<RelatorioLocalDataSource>();

//   //   final report = await localreport.getAll(20, 0, {});

//   //   for (var i = 0; i < report.length; i++) {
//   //     final vlitemsoma = await repositoryHelper.selectsum(
//   //       whereValues: report[i].cdrelat,
//   //     );

//   //     try {
//   //       final model = RelatorioModel(
//   //         id: report[i].id,
//   //         cdrelat: report[i].cdrelat,
//   //         cdemp: report[i].cdemp,
//   //         cdjob: report[i].cdemp,
//   //         vlaprovado: vlitemsoma,
//   //       );
//   //       bloc.add(
//   //         RelatorioSaveOrUpdateEvent(
//   //           entity: model,
//   //         ),
//   //       );
//   //       teste = true;
//   //     } catch (e) {
//   //       teste = false;
//   //     }
//   //   }

//   //   return teste;
//   // }

//   // Future<void> buscarlimitedespesas(int cdemp) async {
//   //   final prefs = await SharedPreferences.getInstance();

//   //   final helperRelAtend = DatabaseHelper();

//   //   final repositoryHelper = RepositoryHelper(helper: helperRelAtend);

//   //   const tableName = 'DFLT_DESPESAS';
//   //   const whereParams = 'CDEMP = ?';
//   //   final whereValues = <Object?>[cdemp];

//   //   try {
//   //     final vllimitedespesapadrao = await repositoryHelper.list(
//   //       columns: [],
//   //       limit: 20,
//   //       offset: 0,
//   //       tableName: tableName,
//   //       whereParams: whereParams,
//   //       whereValues: whereValues,
//   //     );

//   //     for (var i = 2; i < 5; i++) {
//   //       final dados = vllimitedespesapadrao[i];
//   //       final valorlimite = dados['VALORLIMITE'];

//   //       switch (i) {
//   //         case 2:
//   //           await prefs.setString('cafe', valorlimite.toString());

//   //         case 3:
//   //           await prefs.setString('almoco', valorlimite.toString());

//   //         case 4:
//   //           await prefs.setString('jantar', valorlimite.toString());

//   //         default:
//   //       }
//   //     }
//   //   } catch (e) {
//   //     log(e.toString());
//   //   }
//   // }
// }
