
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecomap/gridPage.dart';
import 'package:ecomap/homeModel.dart';
import 'package:ecomap/modelReq.dart';
import 'package:ecomap/modelStore.dart';
import 'package:ecomap/setUplocator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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

          builder: (contxts,child,model)=>Container(

            width: double.infinity,
            height: double.infinity,

            child: Scaffold(

              drawer: Drawer(

                child: ListView(

                  children: [

                    DrawerHeader(

                      decoration: BoxDecoration(

                        image: DecorationImage(

                          image: NetworkImage('https://cdn.pixabay.com/photo/2015/10/27/12/26/gift-1008894__340.jpg'),fit: BoxFit.fill
                        )

                ), child: null,
              ),

                  ],

                ),

              ),

              appBar: AppBar(

                flexibleSpace: Container(

                  decoration: BoxDecoration(

                    gradient: LinearGradient(

                      colors: [

                        Color(0xFF64dfdf),
                        Color(0xFF6930c3),


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
                                 },



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

                                  },


                          ),
          ],
                        ),
                      ),


                    SliverList(delegate: SliverChildListDelegate([

                      SizedBox(

                        height: 20,
                      ),

                      Container(

                        padding: EdgeInsets.only(left: 5),

                          child: Text('In Store',style: TextStyle(fontSize: 20,color: Color(0xFF383e56)),)),

                      SizedBox(

                        height: 20,
                      ),

                      Container(

                        width: double.infinity,
                        height: 380,

                        child: FutureBuilder<List<modelStore>>(

                          future:model.storeLoad(),
                          builder:(contxt,snapshot)
                          {

                            if(snapshot.data!=null)
                              {
                             return  GridView.count(
                               // Create a grid with 2 columns. If you change the scrollDirection to
                               // horizontal, this produces 2 rows.
                               crossAxisCount: 2,
                               crossAxisSpacing: 2,
                               mainAxisSpacing: 2,
                               // Generate 100 widgets that display their index in the List.
                               children: List.generate(snapshot.data!.length, (index) {
                                 return GestureDetector(

                                   onTap: ()
                                   {
                                        Navigator.push(contxts,MaterialPageRoute(builder: (contxt)=>gridPage(title: snapshot.data![index].category,)));
                                   },

                                   child: Container(

                                     width: 40,
                                     height: 30,
                                     child:Card(child: Image.network(snapshot.data![index].image))
                                   ),
                                 );
                               }),
                             );
                              }
                            else
                              {
                                 return Center(child: CircularProgressIndicator.adaptive(valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFF5200))));
                              }

                          }

                        ),
                      ),

                    ])),


                    SliverList(delegate: SliverChildListDelegate([

                      SizedBox(

                        height: 20,

                      ),

                      Container(

                          padding: EdgeInsets.only(left: 5),

                          child: Text('Coming soon',style: TextStyle(fontSize: 20,color: Color(0xFF383e56)),)),

                     SizedBox(

                       height: 20,

                     ),

                     Container(

                       padding: EdgeInsets.only(left: 5,right: 5),

                       width: double.infinity,
                       height: 230,

                       child:Card(
                         
                         child: Image.network('https://cdn.pixabay.com/photo/2017/05/23/22/33/birthday-2338813__340.jpg',fit: BoxFit.cover),
                         
                       )

                     ),

                      SizedBox(

                        height: 30,

                      )



                    ]
                    ))

                  ],


                )


            ),
          ),


        ),


      ),

    );



  }


}

