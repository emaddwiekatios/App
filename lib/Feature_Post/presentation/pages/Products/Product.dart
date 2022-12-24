import 'dart:math';

import 'package:clean_arch_app/core/resource/AssetManager.dart';
import 'package:flutter/material.dart';

import '../../../../core/resource/ColorManger.dart';
import '../../../../core/resource/FontManager.dart';
import '../../../../core/resource/MediaQuery.dart';
import '../../../../core/resource/ValueManger.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);

            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Stack(
            children: <Widget>[
              //header shape
              // Positioned(
              //   top: 0,
              //   left: 0,
              //   child: Container(
              //     height: MediaQuery
              //         .of(context)
              //         .size
              //         .height / 4,
              //     width: MediaQuery
              //         .of(context)
              //         .size
              //         .width,
              //     decoration: BoxDecoration(
              //       //borderRadius: BorderRadius.circular(200),
              //       //  color: Colors.amber,
              //     ),
              //     child: CustomPaint(
              //       child: Container(
              //         height: 400.0,
              //       ),
              //       painter: _MyPainter(),
              //     ),
              //   ),
              // ),
              /*
              Positioned(
                top: 125,
                left: -150,
                child: Container(
                  height: 450, //MediaQuery.of(context).size.height / 4,
                  width: 450, //MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(250),
                    color: Colors.amber,
                  ),
                ),
              ),
              Positioned(
                top: 100,
                left: 115,
                child: Container(
                  height: 350, //MediaQuery.of(context).size.height / 4,
                  width: 350, //MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                      color: Colors.amber),
                ),
              ),
              */
              //a
              // Positioned(
              //   bottom: -125,
              //   left: -150,
              //   child: Container(
              //     height: 250, //MediaQuery.of(context).size.height / 4,
              //     width: 250, //MediaQuery.of(context).size.width,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(250),
              //       color: ColorManager.primary,
              //     ),
              //   ),
              // ),
              // Positioned(
              //   bottom: -100,
              //   right: -115,
              //   child: Container(
              //     height: 250, //MediaQuery.of(context).size.height / 4,
              //     width: 250, //MediaQuery.of(context).size.width,
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(200),
              //         color: ColorManager.primary),
              //   ),
              // ),
              //menu
              Positioned(
                top: AppSize.s4,
                left: -AppSize.s4,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: ColorManager.grey2,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    //print('inside button');
                    //scaffoldKey.currentState!.openDrawer();

                    //  Navigator.pushReplacementNamed(context, "/ProductsMain");
                  },
                ),
              ),
              Positioned(
                top: AppSize.s20,
                right: get_width(context) / FontManagerSize.s2,
                child: Text(
                  'T-shirt',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),

              //         },
              //       ),
              //     ],
              //   ),
              // ),
              // //body
              Positioned(
                  top: get_height(context) / FontManagerSize.s14,
                  right: 0,
                  bottom: 20,
                  child: SizedBox(
                      //color: Colors.red,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height >= 775.0
                          ? MediaQuery.of(context).size.height
                          : 775.0,
                      /* decoration: new BoxDecoration(
                          gradient: new LinearGradient(
                              colors: [
                                Colors.red,
                              Colors.orange
    
                              //Color(getColorHexFromStr('#FDD100')),
                               //Color(getColorHexFromStr('#FDD120'))
                              ],
                              begin: const FractionalOffset(0.0, 0.0),
                              end: const FractionalOffset(1.0, 1.0),
                              stops: [0.0, 1.0],
                              tileMode: TileMode.clamp),
                        ),
    */
                      child: Column(
                        children: [
                          Container(
                            height: get_height(context) / FontManagerSize.s2_5,
                            decoration: const BoxDecoration(
                                color: Colors.tealAccent,
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(AssetManager.mancat4))),
                          )
                        ],
                      ))),
              //header title
              // Positioned(
              //   top: MediaQuery.of(context).size.height / 18,
              //   left: MediaQuery.of(context).size.width / 2 - 50,
              //   child: Text('Details'
              //     //AppLocalizations.of(context).translate('Details'),
              //     ,style: TextStyle(fontSize: 29, fontWeight: FontWeight.bold),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}