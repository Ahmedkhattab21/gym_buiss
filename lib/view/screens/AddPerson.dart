import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym2/provider/NewPersonProvider.dart';
import 'package:intl/intl.dart' as intl;
import 'package:provider/provider.dart';
import '../../provider/searchProvider.dart';
import '../widget/button.dart';
import '../widget/input.dart';


class AddPerson extends StatelessWidget {
  static const String routeName="/AddPerson";
 const AddPerson({super.key});

  @override
  Widget build(BuildContext context) {
    final int id=ModalRoute.of(context)!.settings.arguments as int;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon:const Icon(Icons.arrow_back_ios,color: Colors.black,),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          actions:  [
            const CircleAvatar(
              backgroundImage:AssetImage("assets/images/img1.jpg"),),
            SizedBox(width: 20.w),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding:  EdgeInsets.only(top: 15.h),
                child: Text(id !=0? "تعديل بيانات الشخص":"اضافة شخص",style: Theme.of(context).textTheme.displayLarge!.copyWith(fontWeight:FontWeight.w500),),
              ),
              Padding(
                padding:  EdgeInsets.only(top: 15.h,right: 20.w),
                child: Input(txt: "الاسم",hintTxt: "ادخل الاسم",controller:Provider.of<NewPersonProvider>(context,listen: false).nameController,),
              ),
              Padding(
                padding: EdgeInsets.only(right: 20.w,top: 15.h),
                child: Input(
                  txt: "تاريخ البدايه",
                  hintTxt: intl.DateFormat.yMd().format(Provider.of<NewPersonProvider>(context,listen: true).selectedDate),
                  widget:Row(
                  children: [
                  IconButton(onPressed:(){
                    Provider.of<NewPersonProvider>(context,listen: false).getDateFromUser(context);
                  } ,icon: Icon(Icons.access_alarm_outlined,size: 40.r),focusColor: Colors.black,),
                    SizedBox(width: 20.w,),
                ],),),
              ),
              Padding(
                padding: EdgeInsets.only(right: 20.w,top: 15.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(child: Input(txt: "الطول ",hintTxt: "ادخل الطول",controller:Provider.of<NewPersonProvider>(context,listen: false).heightController,),),
                    Expanded(child: Input(txt: "الوزن",hintTxt: "ادخل الوزن",controller:Provider.of<NewPersonProvider>(context,listen: false).weightController,),),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 20.w,top: 15.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(child: Input(txt: "العمر",hintTxt: "ادخل العمر",controller:Provider.of<NewPersonProvider>(context,listen: false).age ,),),
                    Expanded(
                      child: Input(
                        txt: "عدد الايام ",
                        hintTxt: Provider.of<NewPersonProvider>(context, listen: true).selectedDays == null
                            ? ""
                            :"${Provider.of<NewPersonProvider>(context, listen: true).selectedDays!.toString()} ايام" ,
                        widget: Row(
                          children: [
                            Consumer(
                              builder: ((BuildContext ctx,
                                      NewPersonProvider value, ch) =>
                                  DropdownButton(
                                    items: value.daysList
                                        .map((e) => DropdownMenuItem(
                                            value: e.toString(),
                                            child: Text(
                                              e.toString(),
                                              textDirection:
                                                  TextDirection.rtl,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayMedium,
                                            )))
                                        .toList(),
                                    onChanged: (String? x) => value.onTap(x),
                                    icon: const Icon(Icons.keyboard_arrow_down),
                                    iconSize: 40.r,
                                    underline: Container(),
                                    elevation: 1,
                                    borderRadius: BorderRadius.circular(20.r),
                                  )),
                            ),
                            SizedBox(width: 15.w),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(right: 20.w,top: 15.h),
                child: Input(txt: "نوع التمرين",
                  hintTxt: Provider.of<NewPersonProvider>(context, listen: true).selectedType??"",
                  widget: Row(
                    children: [
                      Consumer(
                        builder:
                            ((BuildContext ctx, NewPersonProvider value, ch) =>
                                DropdownButton(
                                  items: value.typeList
                                      .map((e) => DropdownMenuItem(
                                          value: e,
                                          child: SizedBox(
                                            width: 100.w,
                                            child: Text(
                                              e,
                                              textDirection: TextDirection.rtl,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayMedium,
                                            ),
                                          )))
                                      .toList(),
                                  onChanged: (String? x) => value.onTap2(x),
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  iconSize: 40.r,
                                  underline: Container(),
                                  elevation: 1,
                                  borderRadius: BorderRadius.circular(20.r),
                                )),
                      ),
                      SizedBox(width: 5.w),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 20.w,top: 15.h),
                child: Input(txt: "الدفع",
                  hintTxt: Provider.of<NewPersonProvider>(context, listen: true)
                              .selectedPayed ==
                          null
                      ? ""
                      : Provider.of<NewPersonProvider>(context, listen: true)
                          .selectedPayed!,
                  widget: Row(
                  children: [
                    Consumer(builder:((BuildContext ctx,NewPersonProvider value,ch)=>
                    DropdownButton(
                      items: value.payed.map((e) =>DropdownMenuItem(
                          value: e.toString(),
                          child: SizedBox(
                              width: 100.w,
                              child: Text(e.toString(),
                                textDirection: TextDirection.rtl,
                                style: Theme.of(context).textTheme.displayMedium,)))).toList(),
                      onChanged: (String? x)=>value.ontapp3(x),
                      icon:const Icon(Icons.keyboard_arrow_down),
                      iconSize: 40.r,
                      underline: Container(),
                      elevation: 1,
                      borderRadius: BorderRadius.circular(20.r),
                    )),),
                    SizedBox(width: 15.w),
                  ],
                ),),
              ),
              Padding(
                padding:  EdgeInsets.only(left: 20.w,top:15.h,bottom: 45.h),
                child: Row(
                  children: [
                    const Spacer(),
                    Button(fun: (){
                      if(id !=0 ){
                        Provider.of<NewPersonProvider>(context,listen: false).validateUpdateItem(context,id);
                      Provider.of<SearchProvider>(context,listen: false).searchInDatabase(context,id.toInt());
                      }else{
                        Provider.of<NewPersonProvider>(context,listen: false).validateAddItem(context);
                      }
                      },
                        wid: 209..w,
                        hei: 74.h,
                        cir: 10.r,
                        color: const Color.fromRGBO(22, 178, 66, 1),
                        text: id != 0 ? "تحديث" : "اضافه"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




