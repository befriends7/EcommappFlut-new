
import 'dart:convert' as convert;
import 'modelReq.dart';
import 'package:http/http.dart' as http;

class dataService{

  Future<List<modelReq>> idLoad() async
  {

    List<modelReq> lstFinal = [];

    var url = Uri.parse('https://reqres.in/api/users?page=1');
    var response = await http.get(url);

    if(response.statusCode==200)
    {
      
      var dataResp = convert.jsonDecode(response.body);
      List finList = dataResp['data'];

      for(var i = 0;i<finList.length;i++) {
        modelReq model = modelReq(finList[i]['first_name'], finList[i]['last_name'], finList[i]['avatar']);
        lstFinal.add(model);
      }
    }
    else
    {
       modelReq model = modelReq('Server Error','Server Error', 'https://cdn.pixabay.com/photo/2018/01/04/15/51/404-error-3060993_960_720.png');
       lstFinal.add(model);
    }

    return lstFinal;

  }

}