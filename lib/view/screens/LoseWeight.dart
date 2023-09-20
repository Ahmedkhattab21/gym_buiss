
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../provider/LoseWeightProvider.dart';

class LoseWeight extends StatelessWidget {
   const LoseWeight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.only(top: 15.h),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildCell(context,"الرقم", 60),
                  ...Provider.of<LosingProvider>(context,listen: true).person.map((e) => _buildCell2(context,e.id.toString(), 60),),
                ],
              ),
              Flexible(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          _buildCell(context,"الاسم",200),
                          _buildCell(context,"تاريخ البدايه",140),
                          _buildCell(context,"الطول",90),
                          _buildCell(context,"الوزن",90),
                          _buildCell(context,"العمر",90),
                          _buildCell(context," عدد الايام",90),
                          _buildCell(context,"الحضور",150),
                          _buildCell(context,"الدفع",130),
                          _buildCell(context,"نوع التمرين",170),
                          _buildCell(context,"الايام",(170 * Provider.of<LosingProvider>(context,listen: true).long)+0),

                        ],
                      ),
                      ...Provider.of<LosingProvider>(context,listen: false).person.map((e) =>Row(
                        children: [
                          Container(
                            padding:  EdgeInsets.all(7.r),
                            decoration: BoxDecoration(
                              border:Border.all(width: 0.w),
                              color: Colors.white,
                            ),
                            alignment: Alignment.center,
                            width: 200.w,
                            height: 60.0.h,
                            child: Text(e.name.toString(),
                              overflow:TextOverflow.ellipsis,
                              textAlign:TextAlign.end
                              ,style: Theme.of(context).textTheme.headline2,
                            ),
                          ),
                          _buildCell2(context,e.date.toString(), 140),
                          _buildCell2(context,e.height.toString(), 90),
                          _buildCell2(context,e.weight.toString(), 90),
                          _buildCell2(context,e.age.toString(), 90),
                          _buildCell2(context,e.days.toString(), 90),
                          _buildCell2(context,e.atten_day.length.toString(), 150),
                          _buildCell2(context,e.payed==0?"دفع":"لم يدفع", 130),
                          _buildCell2(context,"تخسيس", 170),
                          ...(e.atten_day).map((ee) => Container(
                            decoration: BoxDecoration(
                              border:Border.all(width: 0.w),
                              color: Colors.white,
                            ),
                            alignment: Alignment.center,
                            width: 170.w,
                            height: 60.0.h,
                            child: FittedBox(child: Text(ee,style: Theme.of(context).textTheme.headline2,
                            ),
                            ),
                          )),
                        ],
                      ),).toList(),]
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

   Widget _buildCell(BuildContext context,String txt ,double wid){
     return Container(
       padding: EdgeInsets.all(5.r),
       decoration: BoxDecoration(
         border:Border.all(width: 0.w),
         color:const Color.fromRGBO(238, 238, 238, .83),
       ),
       alignment: Alignment.center,
       width: wid.w,
       height: 60.0.h,
       child: FittedBox(child: Text(txt,style: Theme.of(context).textTheme.headline2,
       ),
       ),
     );
   }

   Widget _buildCell2(BuildContext context,String txt ,double wid){
     return Container(
       decoration: BoxDecoration(
         border:Border.all(width: 0..w),
         color: Colors.white,
       ),
       alignment: Alignment.center,
       width: wid.w,
       height: 60.0.h,
       child: FittedBox(child: Text(txt,style: Theme.of(context).textTheme.headline2,
       ),
       ),
     );
   }
}
