import 'dart:convert';
import 'package:api_test/constants/mystyle.dart';
import 'package:api_test/views/view_order_page.dart';
import 'package:api_test/widgets/mysize.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

import '../models/UserModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //************* Fetch Api Data ************
  List<UserModel> userModel =[];
  Future<List<UserModel>> getUserApi() async {

    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode==200){
      for(Map i in data){
        userModel.add(UserModel.fromJson(i));
      }
      return userModel;
    }
    else{
      return userModel;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade400,
        title: const Text("Completed order"),
        centerTitle: true,
      ),
      body:FutureBuilder(
        future:getUserApi() ,
        builder:(context,snapshot){
          if(!snapshot.hasData){
            return const
            Center(child: CircularProgressIndicator()
            );
          }else{
            return ListView.builder(
                itemCount: userModel.length,
                itemBuilder: (context,index){
                  return  Column(
                    children: [
                      //Card
                      Padding(
                        padding:EdgeInsets.symmetric(horizontal: 6.w,vertical: 2.h),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ViewOrderPage(
                              name:userModel[index].name.toString(),
                              userName:userModel[index].username.toString(),
                              zipCode:userModel[index].address!.zipcode.toString(),
                            )));
                          },
                          child: Card(
                            color: Colors.grey.shade300,
                            shadowColor:Colors.teal.shade500,
                            child: Container(
                              width: double.infinity,
                              height: 33.h,
                              decoration: const BoxDecoration(
                                // color: Colors.tealAccent.shade400,
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 7.h,
                                    decoration: const BoxDecoration(
                                      color: Colors.teal,
                                    ),
                                    child: Center(
                                        child: Text(
                                          "Order",
                                          style: TextStyle(color: Colors.white, fontSize: 14.sp),
                                        )),
                                  ),
                                  Padding(
                                    padding:EdgeInsets.symmetric(vertical: 2.h),
                                    child: Text(
                                      userModel[index].username.toString(),
                                      style: TextStyle(color: Colors.tealAccent.shade700,fontSize: 18.0,fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  ListTile(
                                    leading:CircleAvatar(
                                      backgroundColor: Colors.grey.shade500,
                                      radius: 30,
                                    ),
                                    title: Row(
                                      children:[
                                        const Icon(
                                          Icons.watch_later_outlined,
                                          color: Colors.teal,
                                          size: 20,
                                        ),
                                        MySizeBox(myWidth: 1.w,),
                                        const Text(
                                          "10:30",
                                          style: MyStyle.myTimeStyle,
                                        ),
                                        MySizeBox(myWidth: 4.w,),

                                        const Icon(
                                          Icons.calendar_month,
                                          color: Colors.teal,
                                          size: 20,
                                        ),
                                        MySizeBox(myWidth: 1.w,),
                                        const Text(
                                          "05 May, 2022",
                                          style: MyStyle.myTimeStyle,
                                        ),
                                      ],
                                    ),
                                    subtitle:Padding(
                                      padding: EdgeInsets.symmetric(vertical: 1.3.h),
                                      child: const Text("Prescription Consultation",style: MyStyle.mySubTitleStyle,),
                                    ),
                                    trailing: Container(
                                      width:9.3.w,
                                      height:4.3.h,
                                      decoration: BoxDecoration(
                                          color: Colors.teal,
                                          borderRadius: BorderRadius.circular(9)
                                      ),
                                      child: const Icon(Icons.done,color: Colors.white,),
                                    ),
                                  ),
                                  Padding(
                                    padding:EdgeInsets.symmetric(vertical: 1.h),
                                    child: const Divider(color: Colors.grey,thickness:1,indent:15,endIndent: 15,),
                                  ),
                                  Text(
                                    "Finished",
                                    style: TextStyle(color: Colors.tealAccent.shade700,fontSize: 13.0,fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                });
          }
        },
      ),
    );
  }
}
