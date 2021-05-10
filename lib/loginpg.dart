

import 'package:custom_clippers/Clippers/sin_cosine_wave_clipper.dart';
import 'package:ecomap/homeModel.dart';
import 'package:ecomap/setUplocator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:scoped_model/scoped_model.dart';

import 'main.dart';

class loginPg extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _loginPg();
  }

}

class _loginPg extends State<loginPg>
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(

      home: ScopedModel<homeModel>(

        model: locator<homeModel>(),
        child: ScopedModelDescendant<homeModel>(

          builder: (contxt,child,model)=> Scaffold(

            body: Container(

              width: double.infinity,
              height: double.infinity,

              child: Column(

                children: [

                ClipPath(

                  clipper: SinCosineWaveClipper(),

                  child: Container(

                        width: double.infinity,
                        height: 220,
                        color: Colors.transparent,
                    
                    child: Image.asset('assets/loginpic.jpg',fit: BoxFit.cover),

                      )

                ),

                  SizedBox(height: 25,),

                  Container(

                    width: double.infinity,
                     alignment: Alignment.topLeft,
                     padding: EdgeInsets.only(left: 20),

                      child: Text('Treat yourself',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 35,color: Color(0xFFFF5200),fontFamily: 'GoblinOne'),)),

                  SizedBox(

                    height: 40,

                  ),

                  Container(


                    width: double.infinity,

                    padding: EdgeInsets.only(left: 20,right: 20),

                    child: Column(

                      children: [

                        TextField(

                          maxLength:10,

                          decoration: InputDecoration(


                              hintText: 'Email',
                              hintStyle: TextStyle(color: Colors.grey,fontSize: 20),
                              enabledBorder: UnderlineInputBorder(

                                  borderSide: BorderSide(color: Color(0xFFFF5200))

                              )
                          ),

                        ),

                        SizedBox(

                          height: 20,

                        ),

                        TextField(

                          maxLength: 10,
                          obscureText: true,

                          decoration: InputDecoration(

                            hintText: 'Password',
                            hintStyle: TextStyle(color: Colors.grey),
                            enabledBorder: UnderlineInputBorder(

                              borderSide: BorderSide(color:Color(0xFFFF5200))

                            )

                          ),

                        )


                      ],


                    ),


                  ),

                  SizedBox(height: 30),

                  Container(

                    width: double.infinity,
                    height: 55,

                    

                    decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(50),

                    ),



                    padding: EdgeInsets.only(left: 25,right: 25),

                    child: RaisedButton(


                      color: Color(0xFFFF5200),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),

                      onPressed: ()
                      {

                      },

                      child: Text('Login',style: TextStyle(color: Colors.white,fontSize: 18),),

                      
                      
                    ),

                  ),

                  SizedBox(

                    height: 20,


                  ),

                  GestureDetector(

                    onTap: ()
                      {

                      },

                      child: Text('Forget Password?',style:TextStyle(fontSize: 14,color: Color(0xFFFF5200)),)),

                  SizedBox(

                    height: 25,

                  ),

                  Container(


                    width: double.infinity,
                    height: 55,

                    padding: EdgeInsets.only(left: 25,right: 25),

                    child: RaisedButton(


                      color: Color(0xFF72147e),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      
                      onPressed: (){

                      },


                      child: Text('Sign up',style: TextStyle(color: Colors.white,fontSize: 17),),

                    ),

                  ),

                  SizedBox(

                    height: 30,

                  ),

                  Row(

                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [

                      GestureDetector(

                        onTap: (){

                        },

                        child: Container(

                          width: 40,
                          height: 40,

                          child: Image.asset('assets/g.png'),

                        ),
                      ),
                      
                      SizedBox(
                        
                        width: 40,
                        
                      ),
                      
                      GestureDetector(
                        
                        onTap: (){
                          
                        },
                        
                        child: Container(
                          
                          width: 40, 
                          height: 40,
                          
                          child: Image.asset('assets/f.png'),
                          
                        ),
                        
                        
                      )
                      

                    ],

                  )


                ],

              ),

            ),

          ),

        )

      ),

    );
  }

}