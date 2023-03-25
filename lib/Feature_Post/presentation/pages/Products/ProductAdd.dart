
//import 'dart:html';

import 'package:clean_arch_app/core/resource/AssetManager.dart';
import 'package:clean_arch_app/core/resource/MediaQuery.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:io';
import 'dart:async';
import 'package:image/image.dart' as Im;
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:math' as Math;

import 'package:date_format/date_format.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:paychalet/Payments/ProductsMain.dart';
//import 'package:paychalet/main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
///import 'package:paychalet/AppLocalizations.dart';
//import 'package:paychalet/Invoices/Invoices_Class.dart';
//import '../main_page.dart';
//import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
//import  'package:keyboard_actions/keyboard_actions.dart';
//import 'package:paychalet/KeyBoard/KeyBoard.dart';
import 'package:http/http.dart' as http;


class ProductAdd extends StatefulWidget {
  var Docs_max;
  ProductAdd({this.Docs_max});
  @override
  _ProductAddState createState() => _ProductAddState();
}

QuerySnapshot? cars;
QuerySnapshot? cars_token;
QuerySnapshot? carsproviders;
const CURVE_HEIGHT = 160.0;
const AVATAR_RADIUS = CURVE_HEIGHT * 0.28;
const AVATAR_DIAMETER = AVATAR_RADIUS * 2;
Color? colorOne ;
Color? colorTwo ;
Color? colorThree ;
User? user;
dynamic _pickImageError;
bool isVideo = false;

String? _retrieveDataError;
typedef OnPickImageCallback = void Function(
    double? maxWidth, double? maxHeight, int? quality);
final ImagePicker _picker = ImagePicker();
final TextEditingController maxWidthController = TextEditingController();
final TextEditingController maxHeightController = TextEditingController();
final TextEditingController qualityController = TextEditingController();

class _ProductAddState extends State<ProductAdd> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

//  add  keyboard action

  final FocusNode _nodeText1 = FocusNode();
  final FocusNode _nodeText2 = FocusNode();
  final FocusNode _nodeText3 = FocusNode();
  final FocusNode _nodeText4 = FocusNode();
  final FocusNode _nodeText5 = FocusNode();
  final FocusNode _nodeText6 = FocusNode();

  /// Creates the [KeyboardActionsConfig] to hook up the fields
  /// and their focus nodes to our [FormKeyboardActions].


  /// end add  keyboard action
  //  Color pyellow = Color(red4);
  File? _image;
  XFile? image;
  final ImagePicker _picker = ImagePicker();
  // PickedFile _imageFile;
  //File? _imageFile;
  DateTime _date = DateTime.now();
  QuerySnapshot? carsinvoice;

  final GlobalKey<ScaffoldState> _scaffoldKeysnak = new GlobalKey<ScaffoldState>();



  @override
  void initState() {

    super.initState();

    getCurrentUser();
    //  print("inside init");
    colorOne = Colors.red;
    colorTwo = Colors.red;
    colorThree = Colors.red;
    getData().then((results) {
      setState(() {

        contPaymentid.text = widget.Docs_max;
        cars = results;
        printlist();
      });
    });






    getDataproviders().then((results) {
      setState(() {
        // print(widget.Docs_max);
        //contPaymentid.text = widget.Docs_max;
        carsproviders = results;
        printlistproviders();
      });
    });

  }

/*
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
*/
  String? imagename;
  //PickedFile sampleimage;
  File? sampleimage;
  var currentdate;
  int state = 0;
  var url2;

  List<String> list_cat = [];


  String _selectedCat = 'Category';


  List<String> list_Providers = [];

  String _selectedProviders = 'Providers';

  List<String> list_currency = ['Shakel','Dollar'];

  String _selectedcurrency = 'Shakel';

  List<String> list_pays_from = ['Emad','Walid','Emad+Walid'];

  String _selectedpays_from = 'Emad';

  TextEditingController contPaymentid = new TextEditingController();
  TextEditingController contPaymentname = new TextEditingController();
  TextEditingController contPaymentAmt = new TextEditingController();
  TextEditingController contPaymentfav = new TextEditingController();
  TextEditingController contPaymentcat = new TextEditingController();
  TextEditingController contPaymentdesc = new TextEditingController();
  TextEditingController contPaymenturl = new TextEditingController();
  TextEditingController contPaymentdentrydate = new TextEditingController();
  TextEditingController contPaymentTo = new TextEditingController();
  TextEditingController contPaymentdate = new TextEditingController();
   File? imageFile ;






  Widget build(BuildContext context) {

    var pheight = MediaQuery.of(context).size.height;
    var pwidth = MediaQuery.of(context).size.width;

//    var appLanguage = Provider.of<AppLanguage>(context);

    return SafeArea(
      child: Scaffold(
      //  resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: true,
        key: _scaffoldKey,
        // drawer: Appdrawer(),
        body:  GestureDetector(
          onTap: (){
            print('ontap');
            FocusScopeNode currentFocus = FocusScope.of(context);

            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },

          child: Stack(
            children: <Widget>[
              //header shape
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    //borderRadius: BorderRadius.circular(200),
                    //  color: red4,
                  ),
                  child: CustomPaint(
                    child: Container(
                      height: 400.0,
                    ),
                    painter: _MyPainter(),
                  ),
                ),
              ),

              //background color
              Positioned(
                bottom: -125,
                left: -150,
                child: Container(
                  height: 250, //MediaQuery.of(context).size.height / 4,
                  width: 250, //MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(250),
                    color: Colors.red,
                  ),
                ),
              ),
              Positioned(
                bottom: -100,
                right: -115,
                child: Container(
                  height: 250, //MediaQuery.of(context).size.height / 4,
                  width: 250, //MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                      color: Colors.red),
                ),
              ),
              //menu
              Positioned(
                top: 20,
                right: 20,
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                    print('inside button');
                    print('inside button');
                    //_scaffoldKey.currentState.openDrawer();
                    // Navigator.of(context).pushReplacement(
                    //   new MaterialPageRoute(
                    //       builder: (BuildContext context) => new main_page()),
                    // );
                  },
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 15,
                left: MediaQuery.of(context).size.width / 2 -
                    ('Add Payment'.toString().length * 8),
                child: Text('Add Payment',
                  //AppLocalizations.of(context).translate('Add Payment'),

                  //'Add Payment',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white,),
                ),
              ),
              //body
              Positioned(
                  top: 100,
                  right: 0,
                  child: SingleChildScrollView(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height:pheight+200,
//                          MediaQuery.of(context).size.height >= 775.0
//                              ? MediaQuery.of(context).size.height
//                              : 775.0,
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Container(
                          // color: Colors.red,
                          //   height: MediaQuery.of(context).size.height/2,
                          //   width: MediaQuery.of(context).size.width,

                          child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: [
                                      Container(
                                        height: MediaQuery.of(context).size.height / 15,
                                        width: MediaQuery.of(context).size.width/4,
                                        child: Material(
                                          elevation: 5.0,
                                          borderRadius: BorderRadius.circular(5.0),
                                          child:

                                          Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Text('Payment Id',
                                                //'${AppLocalizations.of(context).translate('Payment Id')} :'
                                              ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width:5),
                                      Container(
                                        height: MediaQuery.of(context).size.height / 15,
                                        width: MediaQuery.of(context).size.width-(MediaQuery.of(context).size.width/4)-15,

                                        child: Material(
                                          elevation: 5.0,
                                          borderRadius: BorderRadius.circular(5.0),
                                          child: TextFormField(

                                              keyboardType: TextInputType.number,
                                              controller: contPaymentid,
                                              onChanged: (value) {},
                                              validator: (input) {
                                                if (input!.isEmpty) {
                                                  return 'Please Prod Id ';
                                                }
                                              },
                                              onSaved: (input) => imagename = input,
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,

//                        prefixIcon: Icon(Icons.search,
//                            color: red2),
//                            size: 30.0),
                                                  suffixIcon: IconButton(
                                                      icon: Icon(Icons.cancel,
                                                          color:Colors.red,
                                                          // Color(getColorHexFromStr('#FEE16D')),
                                                          size: 20.0),
                                                      onPressed: () {
                                                        print('inside clear');
                                                        contPaymentid.clear();
                                                        contPaymentid.clear();
                                                      }),
                                                  contentPadding:
                                                  EdgeInsets.only(left: 15.0, top: 15.0,right:15),
                                                  hintText:'Payment Id',
                                                 // AppLocalizations.of(context).translate('Payment Id'),

                                                  hintStyle: TextStyle(
                                                      color: Colors.grey,
                                                      fontFamily: 'Quicksand'))),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: MediaQuery.of(context).size.height / 15,
                                        width: MediaQuery.of(context).size.width/4,
                                        child: Material(
                                          elevation: 5.0,
                                          borderRadius: BorderRadius.circular(5.0),
                                          child:

                                          Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Text('Payment_Date'
                                              //  '${AppLocalizations.of(context).translate('Payment_Date')} :'
                                              ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width:5),
                                      Row(

                                        children: <Widget>[


                                          SizedBox(
                                            width: MediaQuery
                                                .of(context)
                                                .size
                                                .width / 2,
                                            child: ElevatedButton(
                                              //elevation: 0,
                                              onPressed: () {
                                                //  Navigator.of(context).pushReplacementNamed('/MainPage');
//                                               DatePicker.showDatePicker(context,
//                                                   showTitleActions: true,
//                                                   minTime: DateTime(2018,3,5),
//                                                   maxTime: DateTime(2025,6,7),
//                                                   onChanged: (date) {
//                                                     print('change $date');
//                                                   },
//                                                   onConfirm: (date) {
//                                                     setState(() {
//                                                       _date = date;
//
// //                                                  _day = formatDate(date,
// //                                                      [ dd]);
// //                                                  _due_date = formatDate(
// //                                                      date.add(new Duration(
// //                                                          days: 30)),
// //                                                      [yyyy,'-',M,'-',dd]);
//                                                     });
//                                                     print('confirm $date');
//                                                   },
//                                                   currentTime: DateTime.now(),
//                                                  // locale: LocaleType.ar
//                                               );
                                              }
                                              ,
                                            //  color: Colors.white,
                                              //padding: EdgeInsets.only(left: (5.0), top: 5.0),
                                              //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
                                              child: Text('${formatDate(_date,
                                                  [yyyy,'-',M,'-',dd,' '])}',style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight
                                                      .bold),),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
//                                             DatePicker.showDatePicker(context,
//                                                 showTitleActions: true,
//                                                 minTime: DateTime(2018,3,5),
//                                                 maxTime: DateTime(2025,6,7),
//                                                 onChanged: (date) {
//                                                   print('change $date');
//                                                 },
//                                                 onConfirm: (date) {
//                                                   setState(() {
//                                                     _date = date;
// //                                                  _day = formatDate(date,
// //                                                      [ dd]);
// //                                                  _due_date = formatDate(
// //                                                      date.add(new Duration(
// //                                                          days: 30)),
// //                                                      [yyyy,'-',M,'-',dd]);
//                                                   });
//                                                   print('confirm $date');
//                                                 },
//                                                 currentTime: DateTime.now(),
//                                              //   locale: LocaleType.ar
//                                             );
                                            },
                                            child: Icon(Icons.edit ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),

                                  Row(
                                    children: [
                                      Container(
                                        height: MediaQuery.of(context).size.height / 15,
                                        width: MediaQuery.of(context).size.width/4,
                                        child: Material(
                                          elevation: 5.0,
                                          borderRadius: BorderRadius.circular(5.0),
                                          child:

                                          Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Text('Payment_name',
                                               // '${AppLocalizations.of(context).translate('Payment_name')} :'
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width:5),
                                      Container(
                                        height: MediaQuery.of(context).size.height / 15,
                                        width: MediaQuery.of(context).size.width-(MediaQuery.of(context).size.width/4)-15,

                                        child: Material(
                                          elevation: 5.0,
                                          borderRadius: BorderRadius.circular(5.0),
                                          child: TextFormField(
                                              controller: contPaymentname,
                                              onChanged: (value) {},
                                              validator: (input) {
                                                if (input!.isEmpty) {
                                                  return 'Please Prod Name ';
                                                }
                                              },
                                              onSaved: (input) => imagename = input,
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
//                        prefixIcon: Icon(Icons.search,
//                            color: red2),
//                            size: 30.0),
                                                  suffixIcon: IconButton(
                                                      icon: Icon(Icons.cancel,
                                                          color: Colors.cyan,//(
                                                           //   getColorHexFromStr('#FEE16D')
                                                          //),
                                                          size: 20.0),
                                                      onPressed: () {
                                                        print('inside clear');
                                                        contPaymentname.clear();
                                                        contPaymentname.clear();
                                                      }),
                                                  contentPadding:
                                                  EdgeInsets.only(left: 15.0, top: 15.0,right:15),
                                                 // hintText: AppLocalizations.of(context).translate('Payment_name'),
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey,
                                                      fontFamily: 'Quicksand'))),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),



                                  Row(
                                    children: [
                                      Container(
                                        height: MediaQuery.of(context).size.height / 15,
                                        width: MediaQuery.of(context).size.width/4,
                                        child: Material(
                                          elevation: 5.0,
                                          borderRadius: BorderRadius.circular(5.0),
                                          child:

                                          Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Text('Payment_desc'
                                                //${AppLocalizations.of(context).translate('Payment_desc')} :'
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width:5),
                                      Container(
                                        height: MediaQuery.of(context).size.height / 15,
                                        width: MediaQuery.of(context).size.width-(MediaQuery.of(context).size.width/4)-15,
                                        child: Material(
                                          elevation: 5.0,
                                          borderRadius: BorderRadius.circular(5.0),
                                          child:

                                          TextFormField(
                                              controller: contPaymentdesc,
                                              onChanged: (value) {},
                                              validator: (input) {
                                                if (input!.isEmpty) {
                                                  return 'Please Prod Name ';
                                                }
                                              },
                                              onSaved: (input) => imagename = input,
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
//                        prefixIcon: Icon(Icons.search,
//                            color: red2),
//                            size: 30.0),
                                                  suffixIcon: IconButton(
                                                      icon: Icon(Icons.cancel,
                                                          color: Colors.black
                                                          ,
                                                          size: 20.0),
                                                      onPressed: () {
                                                        print('inside clear');
                                                        contPaymentdesc.clear();
                                                        contPaymentdesc.clear();
                                                      }),
                                                  contentPadding:
                                                  EdgeInsets.only(left: 15.0, top: 15.0,right:15),
                                               //   hintText: AppLocalizations.of(context).translate('Payment_desc'),

                                                  hintStyle: TextStyle(
                                                      color: Colors.grey,
                                                      fontFamily: 'Quicksand'))),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: MediaQuery.of(context).size.height / 15,
                                        width: MediaQuery.of(context).size.width/4,
                                        child: Material(
                                          elevation: 5.0,
                                          borderRadius: BorderRadius.circular(5.0),
                                          child:

                                          Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Text('Payment_from',
                                            //   '${AppLocalizations.of(context).translate('Payment_from')} :'
                                              ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width:5),
                                      Container(
                                        height: MediaQuery.of(context).size.height / 15,
                                        width: MediaQuery.of(context).size.width-(MediaQuery.of(context).size.width/4)-15,

                                        child: Material(
                                          elevation: 5.0,
                                          borderRadius: BorderRadius.circular(5.0),
                                          child: Row(
                                            children: [

                                              Padding(
                                                padding: const EdgeInsets.only(left:15.0,right:15),
                                                child: Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 15.0),
                                                    child: DropdownButton<String>(
                                                        items: list_pays_from.map((String val) {
                                                          return new DropdownMenuItem<String>(
                                                            value: val,
                                                            child: new Text(val),
                                                          );
                                                        }).toList(),
                                                        hint: Text(_selectedpays_from),
                                                        onChanged: (newVal) {
                                                          this.setState(() {
                                                           // _selectedpays_from = newVal;
                                                          });
                                                        }),
                                                  ),
                                                ),
                                              ),







                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: MediaQuery.of(context).size.height / 15,
                                        width: MediaQuery.of(context).size.width/4,
                                        child: Material(
                                          elevation: 5.0,
                                          borderRadius: BorderRadius.circular(5.0),
                                          child:

                                          Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Text('Payment_to',
                                               // '${AppLocalizations.of(context).translate('Payment_to')} :'
                                              ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width:5),
                                      Container(
                                        height: MediaQuery.of(context).size.height / 15,
                                        width: MediaQuery.of(context).size.width-(MediaQuery.of(context).size.width/4)-15,

                                        child: Material(
                                          elevation: 5.0,
                                          borderRadius: BorderRadius.circular(5.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [

                                              Padding(
                                                padding: const EdgeInsets.only(left:5.0,right:5),
                                                child: Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 15.0),
                                                    child: DropdownButton<String>(
                                                        items: list_Providers.map((String val) {
                                                          return new DropdownMenuItem<String>(
                                                            value: val,
                                                            child: new Text(val),
                                                          );
                                                        }).toList(),
                                                        hint: Text(_selectedProviders),
                                                        onChanged: (newVal) {
                                                          this.setState(() {
                                                            //_selectedProviders = newVal;
                                                          });
                                                        }),
                                                  ),
                                                ),
                                              ),


                                              IconButton(icon:Icon(Icons.refresh,color: Colors.red,size: 15,
                                              ),
                                                onPressed:(){
                                                  getDataproviders().then((results) {
                                                    setState(() {
                                                      // print(widget.Docs_max);
                                                      //contPaymentid.text = widget.Docs_max;
                                                      carsproviders = results;
                                                      printlistproviders();
                                                    });
                                                  });
                                                },),

                                              IconButton(icon:Icon(Icons.add,color: Colors.red,size: 15,
                                              ),
                                                onPressed:(){
                                                  getData().then((results) {
                                                    setState(() {
                                                      Navigator.pushNamed(
                                                          context, '/AddProvider');
                                                    });
                                                  });
                                                },),




//                                    RaisedButton(
//                                        elevation: 7.0,
//                                        child: Text( AppLocalizations.of(context).translate('Add Providers')),
//                                        textColor: Colors.white,
//                                        color: Colors.red,
//                                        onPressed: () {
//                                          Navigator.pushNamed(
//                                              context, '/CategoryAdd');
//                                        }),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
//                              Material(
//                                elevation: 5.0,
//                                borderRadius: BorderRadius.circular(5.0),
//                                child: TextFormField(
//                                    controller: contPaymentTo,
//                                    onChanged: (value) {},
//                                    validator: (input) {
//                                      if (input.isEmpty) {
//                                        return 'Please contPaymentTo ';
//                                      }
//                                    },
//                                    onSaved: (input) => imagename = input,
//                                    decoration: InputDecoration(
//                                        border: InputBorder.none,
////                        prefixIcon: Icon(Icons.search,
////                            color: red2),
////                            size: 30.0),
//                                        suffixIcon: IconButton(
//                                            icon: Icon(Icons.cancel,
//                                                color: Color(
//                                                    getColorHexFromStr('#FEE16D')),
//                                                size: 20.0),
//                                            onPressed: () {
//                                              print('inside clear');
//                                              contPaymentTo.clear();
//                                              contPaymentTo.clear();
//                                            }),
//                                        contentPadding:
//                                        EdgeInsets.only(left: 15.0, top: 15.0,right:15),
//                                        hintText: AppLocalizations.of(context).translate('Payment_to'),
//
//                                        hintStyle: TextStyle(
//                                            color: Colors.grey,
//                                            fontFamily: 'Quicksand'))),
//                              ),
                                  SizedBox(
                                    height: 5,
                                  ),


//                                 Row(
//                                   children: [
//                                     Container(
//                                       height: MediaQuery.of(context).size.height / 15,
//                                       width: MediaQuery.of(context).size.width/4,
//                                       child: Material(
//                                         elevation: 5.0,
//                                         borderRadius: BorderRadius.circular(5.0),
//                                         child:
//
//                                         Padding(
//                                           padding: const EdgeInsets.all(10),
//                                           child: Text('Category',
//                                             //  '${AppLocalizations.of(context).translate('Category')} :'
//                                             ),
//                                         ),
//                                       ),
//                                     ),
//                                     SizedBox(width:5),
//                                     Container(
//                                       height: MediaQuery.of(context).size.height / 15,
//                                       width: MediaQuery.of(context).size.width-(MediaQuery.of(context).size.width/4)-15,
//
//                                       child: Material(
//                                         elevation: 5.0,
//                                         borderRadius: BorderRadius.circular(5.0),
//                                         child: Row(
//
//                                           children: [
//
//                                             Padding(
//                                               padding: const EdgeInsets.only(left:0.0,right:0),
//                                               child: Align(
//                                                 alignment: Alignment.topLeft,
//                                                 child: Padding(
//                                                   padding: const EdgeInsets.only(left: 15.0),
//                                                   child: DropdownButton<String>(
//                                                       items: list_cat.map((String val) {
//                                                         return new DropdownMenuItem<String>(
//                                                           value: val,
//                                                           child: new Text(val),
//                                                         );
//                                                       }).toList(),
//                                                       hint: Text(_selectedCat),
//                                                       onChanged: (newVal) {
//                                                         this.setState(() {
//                                                           //_selectedCat = newVal;
//                                                         });
//                                                       }),
//                                                 ),
//                                               ),
//                                             ),
//                                             IconButton(icon:Icon(Icons.refresh,color: Colors.red,size: 15,
//                                             ),
//
//
//                                               onPressed:(){
//                                                 getData().then((results) {
//                                                   setState(() {
//                                                     print(widget.Docs_max);
//                                                     contPaymentid.text = widget.Docs_max;
//                                                     cars = results;
//                                                     printlist();
//                                                   });
//                                                 });
//                                               },),
//
//                                             IconButton(icon:Icon(Icons.add,color: Colors.red,size: 15,
//                                             ),
//                                               onPressed:(){
//                                                 getData().then((results) {
//                                                   setState(() {
//                                                     Navigator.pushNamed(
//                                                         context, '/CategoryAdd');
//                                                   });
//                                                 });
//                                               },),
// //                                    RaisedButton(
// //                                        elevation: 7.0,
// //                                        child: Text( AppLocalizations.of(context).translate('Add Category')),
// //                                        textColor: Colors.white,
// //                                        color: Colors.red,
// //                                        onPressed: () {
// //                                          Navigator.pushNamed(
// //                                              context, '/CategoryAdd');
// //                                        }),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: 5,
//                                 ),
//
//                                 Row(
//                                   children: [
//                                     Container(
//                                       height: MediaQuery.of(context).size.height / 15,
//                                       width: MediaQuery.of(context).size.width/4,
//                                       child: Material(
//                                         elevation: 5.0,
//                                         borderRadius: BorderRadius.circular(5.0),
//                                         child:
//
//                                         Padding(
//                                           padding: const EdgeInsets.all(10),
//                                           child: Text('Payment_amt',
//                                              // '${AppLocalizations.of(context).translate('Payment_amt')} :'
//                                              ),
//                                         ),
//                                       ),
//                                     ),
//                                     SizedBox(width:5),
//                                     Container(
//                                       height: MediaQuery.of(context).size.height / 15,
//                                       width: MediaQuery.of(context).size.width-(MediaQuery.of(context).size.width/4)-15,
//
//                                       child: Material(
//                                         elevation: 5.0,
//                                         borderRadius: BorderRadius.circular(5.0),
//                                         child:
//                                         Row(
//                                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                           children: [
//                                             Container(
//                                               width: MediaQuery.of(context).size.width/3,
//                                               child: TextFormField(
//                                                   keyboardType: TextInputType.numberWithOptions(),
//                                                   focusNode: _nodeText1,
//                                                   controller: contPaymentAmt,
//                                                   onChanged: (value) {},
//                                                   validator: (input) {
//                                                     if (input!.isEmpty) {
//                                                       return 'Please Prod Cost ';
//                                                     }
//                                                   },
//                                                   onSaved: (input) => imagename = input,
//                                                   decoration: InputDecoration(
//                                                       border: InputBorder.none,
// //                        prefixIcon: Icon(Icons.search,
// //                            color: red2),
// //                            size: 30.0),
//                                                       suffixIcon: IconButton(
//                                                           icon: Icon(Icons.cancel,
//                                                               color: Colors.blue,
//                                                               size: 20.0),
//                                                           onPressed: () {
//                                                             print('inside clear');
//                                                             contPaymentAmt.clear();
//                                                             contPaymentAmt.clear();
//                                                           }),
//                                                       contentPadding:
//                                                       EdgeInsets.all( 10.0),//, top: 15.0,right:15),
//                                                      // hintText: AppLocalizations.of(context).translate('Payment_amt'),
//
//                                                       hintStyle: TextStyle(
//                                                           color: Colors.grey,
//                                                           fontFamily: 'Quicksand'))),
//                                             ),
//                                             Text("curr"),
//                                             SizedBox(width: 5,),
//                                             Align(
//                                               alignment: Alignment.topLeft,
//                                               child: Padding(
//                                                 padding: const EdgeInsets.only(left: 15.0),
//                                                 child: DropdownButton<String>(
//                                                     items: list_currency.map((String val) {
//                                                       return new DropdownMenuItem<String>(
//                                                         value: val,
//                                                         child: new Text(val),
//                                                       );
//                                                     }).toList(),
//                                                     hint: Text(_selectedcurrency),
//                                                     onChanged: (newVal) {
//                                                       this.setState(() {
//                                                         _selectedcurrency = newVal!;
//                                                       });
//                                                     }),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//



                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      ElevatedButton(
                                         // elevation: 7.0,
                                          child: Text('save'),
                                              ///AppLocalizations.of(context).translate('Save'),
                                          // Text("Save"),
                                          //textColor: Colors.white,
                                          //color: Colors.red,
                                          onPressed: () {
                                            print('inside save');
                                            addpaymenttosql();
                                            addimagedata();

//                                      _scaffoldKey.currentState.showSnackBar
//                                      (SnackBar(
//                                        content: Text("Hay this is it"),
//                                        backgroundColor: Color.fromARGB(255, 255, 0, 0),
//                                        duration: Duration(seconds: 5),
//                                        action: SnackBarAction(
//                                          label: 'UNDO',
//                                          onPressed: _scaffoldKey.,
//                                        ),
//                                      ));
                                          }



                                      ),
                                      ElevatedButton(
                                        //elevation: 7.0,
                                        child:  Text('Canceled',
                                          //  AppLocalizations.of(context).translate('Cancel')
                                           ),

                                        // Text("Upload"),
                                      //  textColor: Colors.white,
                                       // color: Colors.red,
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                      ElevatedButton(

                                               child: Text("Show"),
                                               //  Text("Upload"),
                                               //textColor: Colors.white,
                                              // color: Colors.red,
                                               onPressed: () {
                                                 print('inside save 1');
                                                // _onPressedone();
                                                // _onPressedall();
                                                 addisubcollection();


                                               },
                                             ),
                                             // RaisedButton(
                                             //   elevation: 7.0,
                                             //   child: Text("Read"),
                                             //   //  Text("Upload"),
                                             //   textColor: Colors.white,
                                             //   color: Colors.red,
                                             //   onPressed: () {
                                             //     print('inside save 1');
                                             //     // _onPressedone();
                                             //     // _onPressedall();
                                             //    // readisubcollection();
                                             //     call_get_data_invoice();
                                             //
                                             //
                                             //
                                             //   },
                                             // ),
                                    ],
                                  ),



                        Container(
                            padding: EdgeInsets.only(top:20, left:20, right:20),
                            alignment: Alignment.topCenter,
                            child: Column(

                              children: [

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    ElevatedButton(
                                        onPressed: () async {
                                          image = await ImagePicker().pickImage(source: ImageSource.camera);
                                          setState(() {
                                            //update UI
                                          });
                                        },
                                        child: Text("Pick Image camera")
                                    ),
                                    ElevatedButton(
                                        onPressed: () async {
                                          image = await ImagePicker().pickImage(source: ImageSource.gallery);
                                          setState(() {
                                            //update UI
                                          });
                                        },
                                        child: Text("Pick Image gallery")
                                    ),
                                  ],
                                ),

                                image == null?Container():
                                Container(
                                    height:getHeight(context)/4,
                                    width: getWidth(context) -20
                                    ,child: Image.file(File(image!.path)))

                              ],)
                        )









                                ],
                              )),
                        ),
                      ),
                    ),
                  ),
              ],

              //  ),

          ),
        ),


      ),
    );
  }

  Widget enableupload() {
    return Container(
      child: Column(
        children: <Widget>[
          Image.file(
            sampleimage!,
            height: MediaQuery.of(context).size.height/3.5,
            width: MediaQuery.of(context).size.width-20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                //elevation: 7.0,
                child: Text("Compressed"),
                //  Text("Upload"),
             //   textColor: Colors.white,
             //   color: Colors.red,
                onPressed: () {
                 // compressImage();
                  /* final StorageReference fbsr =FirebaseStorage.instance.ref().child('${contimage.text}.jpg');
                   final StorageUploadTask task = fbsr.putFile(sampleimage);
                   var downurl = fbsr.getDownloadURL();
                  print("the URL for image= ${downurl.toString()}");
                   */
                },
              ),
              ElevatedButton(
             //   elevation: 7.0,
                child: setUpButtonChild(),
                //  Text("Upload"),
              //  textColor: Colors.white,
              //  color: Colors.red,
                onPressed: () {
                  setState(() {
                    state = 1;
                  });

                  uploadimage();

                  /* final StorageReference fbsr =FirebaseStorage.instance.ref().child('${contimage.text}.jpg');
               final StorageUploadTask task = fbsr.putFile(sampleimage);
               var downurl = fbsr.getDownloadURL();
              print("the URL for image= ${downurl.toString()}");
               */
                },
              ),
            ],
          ),

////////
///////
        ],
      ),
    );
  }

  Future<String> uploadimage() async {
    // print('inside upload proc');
    // final StorageReference ref =
    // FirebaseStorage.instance.ref().child('${contPaymentname.text}.jpg');
    // print("the pict${sampleimage}");
    // final StorageUploadTask task = ref.putFile(sampleimage);
    // var downurl = await (await task.onComplete).ref.getDownloadURL();
    //
    // var url = downurl.toString();
    // url2 = url;
    // //print("the URL for image= ${url}");
    // setState(() {
    //   state = 2;
    // });
    //
    // final todayDate = DateTime.now();
    // currentdate = formatDate(todayDate,
    //     [yyyy, '-', mm, '-', dd, ' ', hh, ':', nn, ':', ss, ' ', am]);
    //
    // addimagedata();
    return "";
  }

  Widget setUpButtonChild() {
    if (state == 0) {
      return new Text(
        "Click Upload",
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      );
    } else if (state == 1) {
      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      );
    } else {
      return Icon(Icons.check, color: Colors.white);
    }
  }

  // void compressImage() async {
  //   print("inside compressed");
  //
  //   if (sampleimage == null) {
  //     print("inside compressed no file ");
  //   } else {
  //     File imageFile = sampleimage;
  //     final tempDir = await getTemporaryDirectory();
  //     final path = tempDir.path;
  //     int rand = new Math.Random().nextInt(10000);
  //
  //     Im.Image image = Im.decodeImage(imageFile.readAsBytesSync());
  //     Im.Image smallerImage = Im.copyResize(
  //         image); // choose the size here, it will maintain aspect ratio
  //
  //     var compressedImage = new File('$path/img$rand.jpg')
  //       ..writeAsBytesSync(Im.encodeJpg(image, quality: 50));
  //     setState(() {
  //       sampleimage = compressedImage;
  //     });
  //   }
  // }


  void addisubcollection() {
    final todayDate = DateTime.now();
    currentdate = formatDate(todayDate,
        [yyyy, '-', mm, '-', dd, ' ', hh, ':', nn, ':', ss, ' ', am]);


    FirebaseFirestore.instance.collection("Clean_App_Products_New").add({
     "productId" :"1",
     "productName":'CAKE',
     "productImage" :"IMAGEPAth",
     "productPrice" :40.4,
     "productCat":"COLTHES",
     "productEntryDate":currentdate,
     "favoriteFlag" :"0"


    });
  }
  ////emad  add new  testhhjhjn
//  void readisubcollection() {
//    String temp_no,temp_name,temp_price;
//    Invoices_Class inv ;
//    //Invoiceone invone;
//    FirebaseFirestore.instance.collection("Invoices")
//        .get().then((docSnapshot) =>
//    {
//         temp_no=docSnapshot.docs[0]['Invoice_Details'][0]['Type_no'].toString(),
//         temp_name=docSnapshot.docs[0]['Invoice_Details'][0]['Type_name'],
//         temp_price=docSnapshot.docs[0]['Invoice_Details'][0]['Type_price'].toString(),
//
//print(docSnapshot.docs[0]['Invoice_No']),
//     inv.Invoice_no = docSnapshot.docs[0]['Invoice_No'],
//      inv.Invoice_date = docSnapshot.docs[0]['Invoice_date'],
//      inv.Invoice_Details.add(Invoiceone(Type_no: temp_no,Type_name:temp_name,Type_price:temp_price)),
//
//      //invone.Type_no=docSnapshot.docs[0]['Invoice_Details'][0]['Type_no'],
//      //invone.Type_name=docSnapshot.docs[0]['Invoice_Details'][0]['Type_name'],
//      //invone.Type_price=docSnapshot.docs[0]['Invoice_Details'][0]['Type_price'],
//     // inv.Invoice_Details.add(invone),
//      print (inv),
//
//
//
////      print(docSnapshot.docs[0]),
////      print(docSnapshot.docs[0]['Invoice_No']),
////      print(docSnapshot.docs[0]['Invoice_date']),
////      print(docSnapshot.docs[0]['Invoice_Details'][0]['Type_name'])
//    });
//  }

//   getDatainvoice() async {
//     // print('inside invoice getdata ');
//     QuerySnapshot snapshot = await FirebaseFirestore.instance
//         .collection('Invoices').get();
//
//     List<Invoices> _InvoiceList = [];
//     snapshot.docs.forEach((document) {
//       // print('llll');
//       Invoices _invoice = Invoices.fromJson(document.data());
//       //print('the list =${document.data()}');
// //     print(_invoice.Invoice_no);
// //     print(_invoice.Invoice_date);
//
//       _InvoiceList.add(_invoice);
//     });
//
// //
//     print('last data');
//     _InvoiceList.forEach((element) {
//       print(element.Invoice_date);
//       print(element.Invoice_no);
//       element.invoices.forEach((el) {
//         print(el.Type_no);
//         print(el.Type_name);
//         print(el.Type_price);
//       });
//     });
//     print(_InvoiceList[0].Invoice_date);
//     print(_InvoiceList[0].Invoice_no);
//     print(_InvoiceList[0].invoices[0].Type_name);
//   }


  call_get_data_invoice()
  {
  //  getDatainvoice();
    //.then((resultstoken) {
    //setState(() {
    //carsinvoice = resultstoken;

    // printlistinvoice( );
    //});
    //});
  }

  getCurrentUser() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    user = await _auth.currentUser;

    //final uid = user.uid;
    //return user.email;
  }
  addimagedata() {
    final todayDate = DateTime.now();
    currentdate = formatDate(todayDate,
        [yyyy, '-', mm, '-', dd, ' ', hh, ':', nn, ':', ss, ' ', am]);


    getCurrentUser();
    FirebaseFirestore.instance.collection("Payments").doc().set({
      'Payment_id': contPaymentid.text,
      'Payment_name': contPaymentname.text,
      'Payment_desc': contPaymentdesc.text,
      'Payment_amt': contPaymentAmt.text,
      'Payment_to': _selectedProviders ,//contPaymentTo.text,
      'Payment_fav': "false",
      'Payment_cat': _selectedCat,
      'Payment_entry_date':_date,// currentdate,
      'Payment_modify_date':todayDate,// currentdate,
      'Payment_img': url2,
      'Payment_from':_selectedpays_from,
      'Payment_user':user?.email.toString(),
      'Payment_currency':_selectedcurrency
    })
    ;

    FirebaseFirestore.instance.collection("PaymentsHistory").doc().set({
      'Payment_id': contPaymentid.text,
      'Payment_name': contPaymentname.text,
      'Payment_desc': contPaymentdesc.text,
      'Payment_amt': contPaymentAmt.text,
      'Payment_to': contPaymentTo.text,
      'Payment_fav': "false",
      'Payment_cat': _selectedCat,
      'Payment_entry_date': todayDate,//currentdate,
      'Payment_modify_date': todayDate,//currentdate,
      'Payment_img': url2,
      'Payment_from':_selectedpays_from,
      'Payment_user':user?.email.toString(),
      'Payment_currency':_selectedcurrency
    });

    _showSnackbar(contPaymentname.text);
    setState(() {
      contPaymentid.text = (int.parse(contPaymentid.text) + 1).toString();
      contPaymentname.clear();
      contPaymentdesc.clear();
      contPaymentAmt.clear();
      contPaymentTo.clear();
    });



  }
  Future<http.Response> addpaymenttosql() async {
    print('inside add');
    final todayDate = DateTime.now();
    currentdate = formatDate(todayDate,
        [yyyy, '-', mm, '-', dd, ' ', hh, ':', nn, ':', ss, ' ', am]);
    var url = ("http://emaddwiekat.atwebpages.com/Sales/Flutter/Addpaymentd.php");

    var response = await  http.post(Uri.parse(url), body: {
      "Payment_id": contPaymentid.text,
      "Payment_name": contPaymentname.text,
      "Payment_desc": contPaymentdesc.text,
      "Payment_amt": contPaymentAmt.text,
      "Payment_to": _selectedProviders ,
      "Payment_fav": "false",
      "Payment_cat": _selectedCat,
      "Payment_entry_date":_date.toString(),// currentdate,
      "Payment_modify_date":currentdate.toString(),// currentdate,
      "Payment_img": 'url2',
      "Payment_from":_selectedpays_from,
      "Payment_user":user!.email.toString(),
      "Payment_currency":_selectedcurrency
    });
    print("${response.statusCode}");
    print("${response.body}");
    return response;
  }
  getData() async {
    //return await FirebaseFirestore.instance.collection("Gym-Proding").snapshots();
    return await FirebaseFirestore.instance.collection('PaymentsCategory').get();
  }

  getDataproviders() async {
    //return await FirebaseFirestore.instance.collection("Gym-Proding").snapshots();
    return await FirebaseFirestore.instance.collection('Providers').get();
  }
  printlistproviders() {
    // if (cars != null) {
    //   list_Providers.clear();
    //   for (var i = 0; i < carsproviders.docs.length; i++) {
    //     list_Providers.add(carsproviders.docs[i].data()['Provider_name']);
    //   }
    // } else {
    //   print("error");
    // }
  }

  print_data() async {
    return await FirebaseFirestore.instance.collection('users').get();
  }


  print_data_list() {
    // print('inside func list');
    // if (cars_token != null) {
    //
    //   for (var i = 0; i < cars_token.docs.length; i++) {
    //     print('token data ');
    //     print(cars_token.docs[i].data());
    //     //list_cat.add(cars.docs[i].data()['cat_name']);
    //   }
    // } else {
    //   print("error");
    // }
  }

  printlist() {
    // if (cars != null) {
    //   list_cat.clear();
    //   for (var i = 0; i < cars.docs.length; i++) {
    //     list_cat.add(cars.docs[i].data()['cat_name']);
    //   }
    // } else {
    //   print("error");
    // }
  }


  void _showSnackbar(String name) {
//    final scaff = Scaffold.of(context);
//     _scaffoldKey.currentState.showSnackBar(SnackBar(
//       content: Text('Tranaction ${name} Saved'),
//       backgroundColor: Colors.amber,
//       duration: Duration(seconds: 5),
//       action: SnackBarAction(
//         label: 'Done', onPressed: _scaffoldKey.currentState.hideCurrentSnackBar,
//       ),
//     ));
  }
//  void _onPressed() {
//    print('inside onpreesses');
//    FirebaseFirestore.instance.collection("users").get().then((querySnapshot) {
//      querySnapshot.docs.forEach((result) {
//        print(result.data);
////        FirebaseFirestore.instance
////            .collection("users")
////            .doc(result.id)
////            .collection("tokens")
////            .get()
////            .then((querySnapshot) {
////          querySnapshot.docs.forEach((result) {
////            print(result.data);
////          });
////        });
//      });
//    });
//  }
//
//
//  void _onPressedone() async{
//    final User _auth = FirebaseAuth.instance.currentUser;
//    FirebaseFirestore.instance
//        .collection("users")
//        .doc(_auth.uid)
//        .collection("tokens")
//        .get().then((value){
//          value.docs.forEach((element) {
//            print(element.data()['token']);
//          });
//
//    });
//  }
//
//  void _onPressedall() async{
//



//    FirebaseFirestore.instance
//        .collection("users")
//        .doc(_auth.uid)
//        .collection("tokens")
//        .get().then((value){
//      print(value.docs[0].data()['token']);
//    });
}













class _MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.red;

    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();

    path.moveTo(0, size.height * 0.5);
    path.quadraticBezierTo(
        size.width / 2, size.height / 1, size.width, size.height * 0.4);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
