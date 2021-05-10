


import 'package:ecomap/dataService.dart';
import 'package:ecomap/dataServicestore.dart';
import 'package:ecomap/homeModel.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setUplocator()
{

 locator.registerLazySingleton<dataServicestore>(() => dataServicestore());
 locator.registerLazySingleton<dataService>(()=>dataService());
 locator.registerFactory<homeModel>(() => homeModel());

}