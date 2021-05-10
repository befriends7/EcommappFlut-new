
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecomap/homeModel.dart';
import 'package:ecomap/modelReq.dart';
import 'package:ecomap/modelStore.dart';
import 'package:ecomap/setUplocator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';
import 'package:toast/toast.dart';

bool _enabled = true;

class homePage extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _homePage();
  }

}

class _homePage extends State<homePage>
{

  List<modelReq> lstFinal = [];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(

      home: ScopedModel<homeModel>(

        model: locator<homeModel>(),
        child: ScopedModelDescendant<homeModel>(

          builder: (context,child,model)=>Container(

            width: double.infinity,
            height: double.infinity,

            child: Scaffold(

              drawer: Drawer(

                child: ListView(

                  children: [

                    DrawerHeader(

                      decoration: BoxDecoration(

                        gradient: LinearGradient(

                          colors: [

                            Color(0xFFFF5200),
                            Color(0xFFe48900)

                          ]

                        )

                      ),

                        child:Column(

                      children: [

                        SizedBox(height: 20,),

                        CircleAvatar(

                          backgroundColor: Colors.white,

                          radius:40.0,
                          child: Image.network('https://cdn.pixabay.com/photo/2014/04/02/10/48/head-304615_960_720.png',fit: BoxFit.fill,),

                        )

                      ],

                    ))

                  ],

                ),

              ),

              appBar: AppBar(

                flexibleSpace: Container(

                  decoration: BoxDecoration(

                    gradient: LinearGradient(

                      colors: [

                        Color(0xFFFF5200),
                        Color(0xFFe48900),

                      ]

                    )

                  ),

                ),

                actions: [

                  IconButton(onPressed: (){

                    Toast.show("Clicked", context);

                  }, icon: Icon(Icons.shopping_cart,color: Colors.white,))

                ],
                centerTitle:true,backgroundColor: Color(0xFFFF5200),title: Text('Welcome',style: TextStyle(color: Colors.white),
              ),),

                body: CustomScrollView(
                  slivers:[


                      SliverList(
                        delegate: SliverChildListDelegate([

                          SizedBox(

                            height: 30,

                          )

                        ]),
                      ),

                      SliverList(
                        delegate: SliverChildListDelegate([
                           Container(

                            width: double.infinity,
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.only(left: 5),

                          child: Text('Satisifed Customers',style: TextStyle(fontSize: 20,color: Color(0xFF383e56)),)),
            ],
                        ),
                      ),

                      SliverList(
                        delegate: SliverChildListDelegate([
                           SizedBox(

                            height: 20,

                          ),
                        ],
                        ),
                      ),

                         SliverList(
                           delegate: SliverChildListDelegate([
                             FutureBuilder<List<modelReq>>(
                                 future: model.idLoads(),
                                 builder: (context,snapshot) {
                                   if (snapshot.data != null) {
                                     return Container(

                                       width: double.infinity,
                                       height: 200,

                                       padding: EdgeInsets.only(left: 5),

                                       child: ListView.builder(
                                           itemCount: snapshot.data!.length,
                                           scrollDirection: Axis.horizontal,

                                           itemBuilder: (context, index) {
                                             modelReq model = snapshot.data![index];

                                             return Container(
                                               width: 120,
                                               height: 180,

                                               padding: EdgeInsets.only(left: 1,right: 1),

                                               child: Card(

                                                 child: Column(

                                                   children: [

                                                     Container(



                                                       width: double.infinity,
                                                       height: 140,

                                                       child: Image.network(
                                                         model.avatar,
                                                         fit: BoxFit.fill,),

                                                     ),

                                                     SizedBox(height: 10,),
                                                     Container(

                                                       width: double.infinity,

                                                       alignment: Alignment.center,

                                                       child: Column(

                                                         children: [

                                                           Text(model.first_name,
                                                             style: TextStyle(
                                                                 color: Color(
                                                                     0xFF383e56)),),
                                                           Text(model.last_name,
                                                             style: TextStyle(
                                                                 color: Color(
                                                                     0xFF383e56)),)


                                                         ],

                                                       ),

                                                     )

                                                   ],

                                                 ),

                                               ),
                                             );
                                           }

                                       ),
                                     );
                                   }
                                   else {
                                     return Center(


                                       child: CircularProgressIndicator(color: Color(0xFFFF5200)),

                                     );
                                   }
                                 }


                             ),
            ]
                           ),
                         ),



                      SliverList(

                           delegate: SliverChildListDelegate([ SizedBox(height: 20,)])),

                      SliverList(
                        delegate: SliverChildListDelegate([
                          Container(

                              width: double.infinity,
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.only(left: 5),

                          child: Text('Top Deals',style: TextStyle(fontSize: 20,color: Color(0xFF383e56)),)
                          ),
                          SizedBox(

                            height: 20,

                          ),
          ],
                        ),
                      ),




                      SliverList(
                        delegate: SliverChildListDelegate([

                          FutureBuilder<List<modelStore>>(

                              future:model.storeLoad(),
                              builder: (contxt,snapshot)
                                  {

                                    if(snapshot.data!=null)
                                      {

                                        return Column(

                                          children: [

                                            Container(

                                              width:double.infinity,
                                              height: 220,


                                              child: CarouselSlider.builder(
                                                itemCount: snapshot.data!.length,
                                                options: CarouselOptions(
                                                  aspectRatio: 2.0,
                                                  enlargeCenterPage: true,
                                                  autoPlay: true,
                                                ),
                                                itemBuilder: (context, itemIndex,realIdx){

                                                  var model =snapshot.data![itemIndex];

                                                  return  Container(

                                                    width: double.infinity,
                                                    height:270,


                                                    child: Card(
                                                      child: Column(

                                                        children: [

                                                          Container(

                                                            padding: EdgeInsets.only(top: 10),
                                                            width:100,
                                                             height: 155,
                                                              child: Image.network(model.image,fit: BoxFit.fill,)),


                                                          SizedBox(height: 14,),

                                                          Container(

                                                            height: 20,

                                                              width:double.infinity,
                                                              alignment: Alignment.center,
                                                              child: Text(model.title,style: TextStyle(fontSize: 14),)),



                                                        ],



                                                      ),
                                                    ),
                                                  );

                                                },


                                                ),
                                            )
                                          ],

                                        );

                                      }

                                    else
                                    {
                                        return Center(child: CircularProgressIndicator.adaptive(valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFF5200))));
                                    }

                                  }



                          ),
          ],
                        ),
                      ),



                    ],


                )


            ),
          ),


        ),


      ),

    );



  }


}

