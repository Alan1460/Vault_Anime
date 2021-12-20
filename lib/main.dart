import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:paginas/data_source/db_data_source.dart';
import 'package:paginas/data_source/rest_data_source.dart';
import 'package:paginas/repository/user_repository.dart';
import 'my_app.dart';


Future<void> main() async {
  // this is the key
  WidgetsFlutterBinding.ensureInitialized();

  final dbDataSource = await DbDataSource.init();
  final userDataSource = RestDataSource();

  final userRepository = UserRepository(userDataSource, dbDataSource);
  
  Get.put(userRepository);

  Loggy.initLoggy(
    logPrinter: const PrettyPrinter(
      showColors: true,
    ),
  );
  runApp(MyApp());
}
