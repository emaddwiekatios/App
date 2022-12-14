

import 'package:clean_arch_app/Feature_Post/presentation/pages/Products/ProductsClass.dart';

import 'package:clean_arch_app/core/resource/Construct.dart';
import 'package:flutter/material.dart';

import '../../../../core/resource/ColorManger.dart';
import '../../../../core/resource/FontManager.dart';
import '../../../../core/resource/MediaQuery.dart';
import '../../../../core/resource/ValueManger.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

// ignore: must_be_immutable
class ProductDetails extends StatefulWidget {
  ProductDetails({Key? key, required this.instProd}) : super(key: key);
  ProductClass instProd;
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

List<Color> colorList = [Colors.black, Colors.red, Colors.blue, Colors.yellow];
late int _selectedRadio;
int _selectedSized = 0;

class _ProductDetailsState extends State<ProductDetails> {
  @override
  void initState() {
    super.initState();
    _selectedRadio = 0;
  }

  setSelectedRadio(int val) {
    setState(() {
      _selectedRadio = val;
    });
  }

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
                right: getWidth(context) / FontManagerSize.s2_5,
                child: Text(
                  widget.instProd.productName,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),

              Positioned(
                  top: getHeight(context) / FontManagerSize.s14,
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
                          Card(
                            // shape: RoundedRectangleBorder(
                            //     borderRadius: BorderRadius.circular(AppSize.s20)),
                            //color: Colors.red,
                            margin: const EdgeInsets.all(AppSize.s6),
                            //elevation: 20,
                            child: Hero(
                              tag: widget.instProd.productId,
                              child: Container(
                                height:
                                    getHeight(context) / FontManagerSize.s2_5,
                                decoration: BoxDecoration(
                                    // borderRadius: BorderRadius.circular(AppSize.s20),
                                    // color: Colors.tealAccent,
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        // image: AssetImage(AssetManager.mancat4)
                                        image: AssetImage(
                                            widget.instProd.productImage))),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: getHeight(context) / AppSize.s60,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: AppSize.s40, right: AppSize.s40),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.instProd.productName,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  '${widget.instProd.productPrice}\$',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: AppSize.s4, left: AppSize.s28),
                            child:Row(
                              children: const [
                                   Icon(
                                  Icons.star,
                                  color: Colors.amberAccent,
                                ),
                                 Text('   (${20}) Rieview'),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: AppSize.s12,
                                top: AppSize.s4,
                                right: AppSize.s8),
                            child: Text(
                              lorem(paragraphs: 1, words: 30),
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: AppSize.s12,
                                top: AppSize.s8,
                                right: AppSize.s8),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Selected Color',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: ColorManager.primary),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(AppSize.s4),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(AppSize.s4),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: _selectedRadio == 0
                                                        ? Colors.black
                                                        : Colors.transparent,
                                                    width: AppSize.s1),
                                                borderRadius:
                                                    BorderRadius.circular(200),
                                                color: Colors.red),
                                            child: Radio(
                                              fillColor:
                                                  MaterialStateProperty.all(
                                                      Colors.red),
                                              overlayColor:
                                                  MaterialStateProperty.all(
                                                      Colors.red),
                                              focusColor: Colors.amberAccent,
                                              hoverColor: Colors.grey,
                                              splashRadius: 5,
                                              value: 0,
                                              groupValue: _selectedRadio,
                                              onChanged: (val) {
                                                setSelectedRadio(0);
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(AppSize.s4),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: _selectedRadio == 1
                                                        ? Colors.black
                                                        : Colors.transparent,
                                                    width: AppSize.s1),
                                                borderRadius:
                                                    BorderRadius.circular(200),
                                                color: Colors.green),
                                            child: Radio(
                                              fillColor:
                                                  MaterialStateProperty.all(
                                                      Colors.green),
                                              overlayColor:
                                                  MaterialStateProperty.all(
                                                      Colors.green),
                                              splashRadius: 5,
                                              value: 1,
                                              groupValue: _selectedRadio,
                                              onChanged: (val) {
                                                setSelectedRadio(1);
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(AppSize.s4),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: _selectedRadio == 2
                                                        ? Colors.black
                                                        : Colors.transparent,
                                                    width: AppSize.s1),
                                                borderRadius:
                                                    BorderRadius.circular(200),
                                                color: Colors.yellow),
                                            child: Radio(
                                              fillColor:
                                                  MaterialStateProperty.all(
                                                      Colors.yellow),
                                              //  overlayColor:MaterialStateProperty.all(Colors.green) ,
                                              splashRadius: 5,

                                              value: 2,
                                              groupValue: _selectedRadio,
                                              onChanged: (val) {
                                                setSelectedRadio(2);
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(AppSize.s4),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: _selectedRadio == 3
                                                        ? Colors.black
                                                        : Colors.transparent,
                                                    width: AppSize.s1),
                                                borderRadius:
                                                    BorderRadius.circular(200),
                                                color: Colors.purple),
                                            child: Radio(
                                              fillColor:
                                                  MaterialStateProperty.all(
                                                      Colors.purple),
                                              //  overlayColor:MaterialStateProperty.all(Colors.green) ,
                                              splashRadius: 5,

                                              value: 3,
                                              groupValue: _selectedRadio,
                                              onChanged: (val) {
                                                setSelectedRadio(3);
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Text('Selected color: ${_selectedRadio == 0 ? 'Red' : _selectedRadio == 1 ? 'Green' : 'Blue'}'),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: AppSize.s12,
                                top: AppSize.s8,
                                right: AppSize.s8),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Selected Sized',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: ColorManager.primary),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(AppSize.s4),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(AppSize.s4),
                                      child: Column(
                                        children: [
                                          Container(
                                              height: 30,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.grey,
                                                      width: AppSize.s1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          AppSize.s10),
                                                  color: _selectedSized == 0
                                                      ? ColorManager.primary
                                                      : Colors.white),
                                              child: Center(
                                                  child: InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          _selectedSized = 0;
                                                        });
                                                      },
                                                      child: const Text('M')))),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(AppSize.s4),
                                      child: Column(
                                        children: [
                                          Container(
                                              height: 30,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.grey,
                                                      width: AppSize.s1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          AppSize.s10),
                                                  color: _selectedSized == 1
                                                      ? ColorManager.primary
                                                      : Colors.white),
                                              child: Center(
                                                  child: InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          _selectedSized = 1;
                                                        });
                                                      },
                                                      child: const Text('S')))),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(AppSize.s4),
                                      child: Column(
                                        children: [
                                          Container(
                                              height: 30,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.grey,
                                                      width: AppSize.s1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          AppSize.s10),
                                                  color: _selectedSized == 2
                                                      ? ColorManager.primary
                                                      : Colors.white),
                                              child: Center(
                                                  child: InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          _selectedSized = 2;
                                                        });
                                                      },
                                                      child: const Text('L')))),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(AppSize.s4),
                                      child: Column(
                                        children: [
                                          Container(
                                              height: 30,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.grey,
                                                      width: AppSize.s1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          AppSize.s10),
                                                  color: _selectedSized == 3
                                                      ? ColorManager.primary
                                                      : Colors.white),
                                              child: Center(
                                                  child: InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          _selectedSized = 3;
                                                        });
                                                      },
                                                      child: const Text('XL')))),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(AppSize.s4),
                                      child: Column(
                                        children: [
                                          Container(
                                              height: 30,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.grey,
                                                      width: AppSize.s1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          AppSize.s10),
                                                  color: _selectedSized == 4
                                                      ? ColorManager.primary
                                                      : Colors.white),
                                              child: Center(
                                                  child: InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          _selectedSized = 4;
                                                        });
                                                      },
                                                      child: const Text('XXL')))),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Text('Selected color: ${_selectedRadio == 0 ? 'Red' : _selectedRadio == 1 ? 'Green' : 'Blue'}'),
                            ],
                          ),
                          const SizedBox(
                            height: AppSize.s10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              getElevationButton(

                                parFontSize: 15,
                                parBorderWidth: 1,
                                 parBorderRadius: 10,
                                parForegroundColor: ColorManager.primary,
                                parBackGroundColor: Colors.white,
                                onTabButton: () {},
                                nameButton: 'ADD To Carts',
                              ),
                              getElevationButton(
                                parFontSize: 15,
                                parBorderWidth: 1,
                                parBorderRadius: 10,
                                parForegroundColor: Colors.white,
                                parBackGroundColor: ColorManager.primary,
                                onTabButton: () {},
                                nameButton: 'Buy Now',
                              )
                            ],
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

// ignore: camel_case_types, must_be_immutable
class getChecked extends StatelessWidget {
  // ignore: non_constant_identifier_names
  getChecked({Key? key, required this.index_temp, required this.index})
      : super(key: key);
  // ignore: non_constant_identifier_names
  int index, index_temp;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(250),
          border: Border.all(
              color: index == index_temp ? Colors.green : Colors.transparent,
              width: AppSize.s2)),
      child: CircleAvatar(
        backgroundColor: colorList[index],
        radius: AppSize.s12,
      ),
    );
  }
}
