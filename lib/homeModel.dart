

import 'package:ecomap/dataService.dart';
import 'package:ecomap/dataServicestore.dart';
import 'package:ecomap/modelReq.dart';
import 'package:ecomap/modelStore.dart';
import 'package:ecomap/setUplocator.dart';
import 'package:scoped_model/scoped_model.dart';

class homeModel extends Model
{

  dataService dataServ = locator<dataService>();
  dataServicestore dataStor = locator<dataServicestore>();


    Future<List<modelReq>> idLoads() async
    {

      List<modelReq> lstFinal;

      lstFinal = await dataServ.idLoad();

      return lstFinal;

    }

  Future<List<modelStore>> storeLoad() async
  {

    List<modelStore> listFinal;

    listFinal = await dataStor.dataLoad();


    return listFinal;

  }


}