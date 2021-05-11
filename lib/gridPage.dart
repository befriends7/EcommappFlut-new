

import 'package:condition/condition.dart';
import 'package:ecomap/homeModel.dart';
import 'package:ecomap/homePage.dart';
import 'package:ecomap/modelStore.dart';
import 'package:ecomap/setUplocator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:scoped_model/scoped_model.dart';

class gridPage extends StatefulWidget
{

  String title;

  gridPage({Key? key,required this.title}):super(key:key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _gridPage(title);
  }


}


class _gridPage extends State<gridPage>
{

  String titles;


  _gridPage(this.titles);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(

      home:ScopedModel<homeModel>(

        model: locator<homeModel>(),

        child: ScopedModelDescendant<homeModel>(

          builder: (contxt,child,model)=>Scaffold(


            appBar: AppBar(centerTitle:true,

                leading: GestureDetector(

                  onTap: (){

                    Navigator.push(contxt,MaterialPageRoute(builder: (contxt)=>homePage()));

                  },


                  child: Icon(Icons.arrow_back,color: Colors.white,),

                ),

                title:Text(titles),flexibleSpace:

                Container(

                  decoration: BoxDecoration(

                    gradient: LinearGradient(

                      colors: [

                        Color(0xFF64dfdf),
                        Color(0xFF6930c3),


                      ]

                    )

                  ),

                )


              ),

            body: Container(

              width: double.infinity,
              height: double.infinity,


              child: FutureBuilder<List<modelStore>>(

                future: model.storeLoad(),
                builder: (contxt,snapshot){

                  if(snapshot.data!=null)
                    {
                      return GridView.count(crossAxisCount: 2,
                      
                        padding: EdgeInsets.all(10),
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,

                        children:List.generate(snapshot.data!.length, (index) {
                          
                          return Container(
                            
                            child: Conditioned(

                              cases: [

                                Case(snapshot.data![index].category==titles, builder:()=>Card(child: Image.network(snapshot.data![index].image,fit:BoxFit.contain)))

                              ],


                              defaultBuilder: () => Image.network('https://cdn.pixabay.com/photo/2018/03/04/15/23/pictures-3198278__340.png',fit:BoxFit.contain),
                            
                          ),
                          );
                          
                        })

                      );
                    }
                  else
                    {

                      return Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFF5200))));
                    }

                },


              ),


            ),

          ),


        ),

      )

    );
  }

}