import 'package:flutter/material.dart';
import 'package:my_store/src/core/database/database_helper.dart';
import 'package:my_store/src/core/di/dependency_assembly.dart' as di;
import 'package:my_store/src/ini/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.setupDependencyAssembly();

  await _initializeServices();

  runApp(const App());
}

Future<void> _initializeServices() async {

  final databaseHelper = di.dependencyAssembly<DatabaseHelper>();

  await databaseHelper.openDB(companyId: 1, dbName: 'AFIXFLOW.db');
}
