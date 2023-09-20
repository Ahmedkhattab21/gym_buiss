
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym2/view/screens/Daily.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final md=MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: Image.asset('assets/images/img1.jpg',fit: BoxFit.cover),
              ),
              Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "برنامج حسابات",
                        style: TextStyle(
                          fontSize: 32.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      InkWell(
                        onTap: ()async{
                          Navigator.of(context).pushReplacementNamed(DailyPage.routeName);
                        },
                        child: Container(
                          margin:  EdgeInsets.only(bottom: 60.h),
                          alignment: Alignment.center,
                          width: md.width *.4,
                          height:md.height * .1,
                          decoration: BoxDecoration(color:Theme.of(context).primaryColor,borderRadius: BorderRadius.circular(15)),
                          child: Text("ابدا",style: Theme.of(context).textTheme.button,),
                        ),),
                    ],)),
            ],
          ),
        ),

      ),
    );
  }
}
