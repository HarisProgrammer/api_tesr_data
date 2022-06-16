import 'package:api_test/widgets/calendar_widget.dart';
import 'package:api_test/widgets/mysize.dart';
import 'package:api_test/widgets/reusable__container_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ViewOrderPage extends StatelessWidget {
  final String? name;
  final String? userName;
  final String? zipCode;
  const ViewOrderPage({
    Key? key,required this.name,required this.userName,required this.zipCode
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade400,
        title: const Text("view order"),
        centerTitle: true,
      ),
      bottomNavigationBar: Card(
        shadowColor:Colors.teal,
        child: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              label:"Home",
              icon:Icon(Icons.home)
            ),
            BottomNavigationBarItem(
                label:"Folder",
                icon:Icon(Icons.folder)
            ),
            BottomNavigationBarItem(
                label:"Click",
                icon:Icon(Icons.book_online)
            ),
            // BottomNavigationBarItem(
            //     label:"User",
            //     icon:Icon(Icons.person_off_rounded)
            // )
          ],
        ),
      ),
      body: Column(
        children: [
          //*************Gridview Start ************
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
            child: GridView(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, crossAxisSpacing: 20, mainAxisSpacing: 10),
              children: const [
                ReusableContainerWidget(),
                ReusableContainerWidget(),
                ReusableContainerWidget(),
                ReusableContainerWidget()
              ],
            ),
          ),

          //*************Gridview Close ************

          //*************Main Container start************
          Padding(
            padding:EdgeInsets.symmetric(horizontal: 6.w, vertical: 1.h),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:EdgeInsets.symmetric(horizontal: 1.w),
                    child: const Text("Patient Name"),
                  ),
                  //************* First Container************
                  Container(
                    width: 90.w,
                    height: 5.5.h,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding:EdgeInsets.symmetric(horizontal: 3.w),
                      child: Row(
                        children: [
                          Icon(Icons.person,color: Colors.grey.shade300,),
                          MySizeBox(myWidth: 2.w,),
                          Text(name.toString())
                        ],
                      ),
                    ),
                  ),
                  MySizeBox(myHeight: 2.h,),
                  Padding(
                    padding:EdgeInsets.symmetric(horizontal: 1.w),
                    child: const Text("Title for Medicine"),
                  ),
                  //************* Second Container************
                  Container(
                    width: 90.w,
                    height: 5.5.h,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding:EdgeInsets.symmetric(horizontal: 3.w),
                      child: Row(
                        children: [
                          Icon(Icons.person,color: Colors.grey.shade300,),
                          MySizeBox(myWidth: 2.w,),
                          Text(userName.toString())
                        ],
                      ),
                    ),
                  ),
                  MySizeBox(myHeight: 1.h,),
                  Padding(
                    padding:EdgeInsets.symmetric(horizontal: 1.w),
                    child: const Text("Signature"),
                  ),
                  //************* Third Container************
                  Container(
                    width: 90.w,
                    height: 5.5.h,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding:EdgeInsets.symmetric(horizontal: 3.w),
                      child: Row(
                        children: [
                          Icon(Icons.person,color: Colors.grey.shade300,),
                          MySizeBox(myWidth: 2.w,),
                          Text(zipCode.toString())
                        ],
                      ),
                    ),
                  ),
                  MySizeBox(myHeight: 2.h,),
                  //************* Calendar Row ************
                  Row(
                    children:[
                      const Icon(
                        Icons.calendar_month,
                        color: Colors.teal,
                        size: 40,
                      ),
                      MySizeBox(myWidth: 2.w,),
                      CalendarWidget(myTitle: "2022", myColor:Colors.tealAccent.shade700,),
                      CalendarWidget(myTitle: "/02", myColor:Colors.tealAccent.shade700,),
                      const CalendarWidget(myTitle: "/28", myColor:Colors.teal),
                    ],
                  ),
                  MySizeBox(myHeight: 3.h,),
                  //************* Saved Button Start************
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 85.w,
                      height: 5.h,
                      decoration: BoxDecoration(
                          color: Colors.tealAccent.shade400,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(child: Text("Saved",style: TextStyle(color: Colors.white,fontSize:13.sp,fontWeight: FontWeight.bold),)),
                    ),
                  ),
                  MySizeBox(myHeight: 4.h,),
                  //************* Saved Button End ************

                ],
              ),
            ),
          )
          //************* Main Container End ************
        ],
      ),
    );
  }
}
