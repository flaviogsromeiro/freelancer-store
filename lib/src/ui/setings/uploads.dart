// import 'package:my_store/src/core/database/database_helper.dart';
// import 'package:my_store/src/core/database/database_service.dart';
// import 'package:my_store/src/modules/quilometragem/data/models/quilometragem_model.dart';

// class Uploads {
//   bool gravarquilometragem = false;
//   bool upload = false;
//   QuilometragemModel? entity;
//   late String msgdespesas;
//   //late BuildContext context;

//   // Future<bool> executarUploadDB({
//   //   required int cdrelat,
//   //   required int cdemp,
//   //   required String email,
//   //   required BuildContext context,
//   // }) async {
//   //   // ignore: no_leading_underscores_for_local_identifiers, unused_element
//   //   void _updateMessage(String message, int cor) {
//   //     Color showcolor = Colors.blue;
//   //     var tempo = 1;

//   //     switch (cor) {
//   //       case 1:
//   //         showcolor = Colors.blue;
//   //         tempo = 1;
//   //       case 2:
//   //         showcolor = Colors.green;
//   //         tempo = 3;
//   //       case 3:
//   //         showcolor = Colors.red;
//   //         tempo = 3;
//   //       default:
//   //         showcolor = Colors.blue;
//   //     }

//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       SnackBar(
//   //         duration: Duration(seconds: tempo),
//   //         //behavior: SnackBarBehavior.floating,
//   //         backgroundColor: showcolor,
//   //         content: Text(
//   //           message,
//   //         ),
//   //       ),
//   //     );
//   //   }

//   //   _updateMessage('Recuperando dados do relatório', 1);

//   //   if (await existFotoRelAtendimento(cdrelat)) {
//   //     final localreport = di.dependencyAssembly<RelatorioLocalDataSource>();

//   //     final localitemreport =
//   //         di.dependencyAssembly<DespesaItemLocalDataSource>();

//   //     if (await existQuilometragem(cdrelat, cdemp)) {
//   //       gravarquilometragem = true;
//   //     }

//   //     if (gravarquilometragem) {
//   //       final localquilometragemreport =
//   //           di.dependencyAssembly<QuilometragemLocalDataSource>();

//   //       final quilometragem = await localquilometragemreport.find(cdrelat);

//   //       entity = QuilometragemModel(
//   //         cdkm: quilometragem.cdkm,
//   //         cdrelat: quilometragem.cdrelat,
//   //         cdfuncionario: quilometragem.cdfuncionario,
//   //         combustivel: quilometragem.combustivel,
//   //         dtkm: quilometragem.dtkm,
//   //         litros: quilometragem.litros,
//   //         obs: quilometragem.obs,
//   //         placa: quilometragem.placa,
//   //         totalvlt: quilometragem.totalvlt,
//   //         vlabastecmt: quilometragem.vlabastecmt,
//   //         cdemp: quilometragem.cdemp,
//   //         cliente: quilometragem.cliente,
//   //         kmfinalida: quilometragem.kmfinalida,
//   //         kmfinalvlt: quilometragem.kmfinalvlt,
//   //         kminiida: quilometragem.kminiida,
//   //         kminivlt: quilometragem.kminivlt,
//   //         local: quilometragem.local,
//   //         mediakm: quilometragem.mediakm,
//   //         motorista: quilometragem.motorista,
//   //         stcarro: quilometragem.stcarro,
//   //         totalida: quilometragem.totalida,
//   //         totalkm: quilometragem.totalkm,
//   //       );
//   //     }

//   //     final report = await localreport.get(cdrelat);

//   //     final itens = await localitemreport.list(20, 0, {'CDRELAT': cdrelat});

//   //     // _updateMessage('Criando Db');

//   //     final descupload = 'relatorio_$cdrelat-$cdemp-$email.zip';

//   //     final dir = await getExternalStorageDirectory();
//   //     final dbPath = path.join(
//   //       dir!.path,
//   //       'backups',
//   //       'relatorio',
//   //     ); //final dbPath = path.join(dir!.path, 'backups', 'relatorio');
//   //     final dbDir = Directory(dbPath);
//   //     final exists = dbDir.existsSync();

//   //     if (exists) {
//   //       await dbDir.delete(recursive: true);
//   //     }

//   //     final itenszip = <File>[];

//   //     await dbDir.create(
//   //       recursive: true,
//   //     );

//   //     final backupName = path.join(dbDir.path, 'bkp_AFIXDESPESAS.db');

//   //     final helper = DatabaseHelper();

//   //     await helper.openDB(companyId: 1, dbName: backupName);

//   //     // _updateMessage('Preenchendo os dados do relatório no DB');

//   //     final repositoryHelper = RepositoryHelper(helper: helper);

//   //     final reportDataSource = RelatorioLocalDataSourceImpl(repositoryHelper);

//   //     final itemDataSource = DespesaItemLocalDataSourceImpl(repositoryHelper);

//   //     if (gravarquilometragem) {
//   //       final quilometragemDataSource =
//   //           QuilometragemLocalDataSourceImpl(repositoryHelper);

//   //       await quilometragemDataSource.saveOrUpdate(entity!);
//   //     }

//   //     /*ATUALIZAR O CAMPO DTENVIO*/
//   //     final model = RelatorioModel(
//   //       id: report.id,
//   //       cdrelat: report.cdrelat,
//   //       cdemp: report.cdemp,
//   //       cdjob: report.cdjob,
//   //       dtperate: report.dtperate,
//   //       dtperde: report.dtperde,
//   //       dsuser: report.dsuser,
//   //       dsmotivo: report.dsmotivo,
//   //       cdfuncionario: report.cdfuncionario,
//   //       dsreprovado: report.dsreprovado,
//   //       cdfilial: report.cdfilial,
//   //       dtenvio: DateFormat('dd-MM-yyyy', 'pt_Br').format(DateTime.now()),
//   //     );

//   //     await reportDataSource.update(model);

//   //     /*ATUALIZAR O CAMPO DTENVIO*/

//   //     for (final item in itens) {
//   //       await itemDataSource.saveOrUpdate(item);
//   //     }

//   //     await reportDataSource.saveinfo(
//   //       cdemp.toString(),
//   //       email,
//   //     );

//   //     await helper.close();

//   //     itenszip.add(File(backupName));

//   //     /*
//   //   localizar e copiar os comprovantes
//   //   */

//   //     for (final item in itens) {
//   //       final filename = path.basename(item.dsfoto);

//   //       final file = File(item.dsfoto);

//   //       final exists = file.existsSync();

//   //       if (exists) {
//   //         file.copySync(path.join(dbPath, filename));
//   //         itenszip.add(File(path.join(dbPath, filename)));
//   //       }
//   //     }

//   //     /*
//   //   compactar os dados
//   //               enviar o arquivo compactado para o servidor.
//   //             */

//   //     final zipFile = File(path.join(dbDir.path, descupload));
//   //     try {
//   //       await ZipFile.createFromFiles(
//   //         sourceDir: dbDir,
//   //         files: itenszip,
//   //         zipFile: zipFile,
//   //       );
//   //     } catch (e) {
//   //       log(e.toString());
//   //     }

//   //     // _updateMessage('Enviando os dados...', 1);

//   //     final http = di.dependencyAssembly<HttpHelper>();
//   //     final uploadfilebyte = zipFile.readAsBytesSync();

//   //     final response = await http.uploadFile(
//   //       url:
//   //           'http://afixcode1.afixcode.com.br/api.afixbase/api/producao/salvabackup',
//   //       extension: 'zip',
//   //       file: uploadfilebyte,
//   //       filenamearq: descupload,
//   //     );

//   //     log('resposta ${response.statusCode} -  ${response.body} - ${response.errorMessage}');

//   //     _updateMessage('Processo finalizado.', 2);

//   //     dbDir.deleteSync(recursive: true);

//   //     if (response.statusCode == 200) {
//   //       upload = true;
//   //     }
//   //   } else {
//   //     if (msgdespesas == 'sem despesa') {
//   //       _updateMessage('Não existe Despesas para serem enviadas', 3);
//   //     } else {
//   //       _updateMessage('Relatório de Atendimento está sem comprovante', 3);
//   //     }
//   //   }

//   //   return upload;
//   // }

//   Future<bool> existQuilometragem(int rel, int cdemp) async {
//     var existe = false;
//     final helperQuilometragem = DatabaseHelper();

//     final repositoryHelper = DatabaseService(helper: helperQuilometragem);

//     const tableName = 'QUILOMETRAGEM';
//     const whereParams = 'CDRELAT = ?';
//     final whereValues = <Object?>[rel];

//     if (await repositoryHelper.exists(
//       tableName: tableName,
//       whereParams: whereParams,
//       whereValues: whereValues,
//     )) {
//       existe = true;
//     }

//     return existe;
//   }

//   Future<bool> existFotoRelAtendimento(int rel) async {
//     var existe = false;
//     Map<String, Object?> dsfotorelaten;
//     msgdespesas = '';

//     final helperRelAtend = DatabaseHelper();

//     final repositoryHelper = DatabaseService(helper: helperRelAtend);

//     const tableName = 'ITENS';
//     const whereParams = 'CDRELAT = ? AND CDDESPESA = ?';
//     final whereValues = <Object?>[rel, 16];

//     try {
//       dsfotorelaten = await repositoryHelper.find(
//         tableName: tableName,
//         // columns: ['DSFOTO'],
//         whereParams: whereParams,
//         whereValues: whereValues,
//       );

//       if (dsfotorelaten.values.first.toString() != '') {
//         //var teste2 = ''; teste2.replaceAll('DSFOTO:', ' ').trim();
//         existe = true;
//       }
//     } catch (e) {
//       msgdespesas = 'sem despesa';
//     }

//     return existe;
//   }
// }
