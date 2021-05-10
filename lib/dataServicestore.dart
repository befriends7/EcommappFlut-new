
import 'package:http/http.dart' as http;
import 'package:ecomap/modelStore.dart';
import 'dart:convert' as convert;

class dataServicestore{

    Future<List<modelStore>> dataLoad() async
    {

        List<modelStore> list = [];
        var url = Uri.parse('https://fakestoreapi.com/products/');
        var response = await http.get(url);

        if(response.statusCode==200)
            {

                List data = convert.jsonDecode(response.body);

                for(var i=0;i<data.length;i++)
                {


                    String price  = data[i]["price"].toString();
                    modelStore model = modelStore(data[i]["title"],price,data[i]["description"],data[i]["category"],data[i]["image"]);
                    list.add(model);

                }

            }
        else{

            list.clear();
        }

        return list;

    }


}