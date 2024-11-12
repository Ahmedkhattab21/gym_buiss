import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gym2/provider/NewPersonProvider.dart';
import 'package:provider/provider.dart';

import '../../provider/searchProvider.dart';
import '../widget/button.dart';
import 'AddPerson.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = "/search";

  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {


  @override
  void initState() {
    super.initState();
    Provider.of<SearchProvider>(context, listen: false)
        .searchInDatabase(context);
  }

  @override
  Widget build(BuildContext context) {

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          actions:  [
            const CircleAvatar(
              backgroundImage: AssetImage("assets/images/img1.jpg"),
            ),
            SizedBox(
              width: 20.w,
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding:  EdgeInsets.only(left: 15.w),
              margin:  EdgeInsets.only(bottom: 180.h,left: 20.w,right: 20.w),
              width: double.infinity,
              height: 70.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                border: Border.all(
                  color: const Color.fromRGBO(0, 0, 0, .37),
                ),
              ),
              child: Row(
                children: [
                   Padding(
                    padding: EdgeInsets.only(right: 20.w),
                    child: const Icon(
                      FontAwesomeIcons.magnifyingGlass,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    child: Form(
                      key: Provider.of<SearchProvider>(context, listen: false).globalKey,
                      child: TextFormField(
                        style: Theme.of(context).textTheme.displayMedium,
                        controller: Provider.of<SearchProvider>(context, listen: false).controller,
                        cursorColor: Colors.black45,
                        decoration:  InputDecoration(
                          contentPadding: EdgeInsets.only(right: 10.w),
                          enabledBorder:const UnderlineInputBorder(
                            borderSide: BorderSide(width: 0, color: Colors.white),
                          ),
                          focusedBorder:const UnderlineInputBorder(
                            borderSide: BorderSide(width: 0, color: Colors.white),
                          ),
                        ),
                        onChanged: (String m) {
                          if(Provider.of<SearchProvider>(context, listen: false)
                              .getDouble2(Provider.of<SearchProvider>(context, listen: false).controller.text) != -1
                              && Provider.of<SearchProvider>(context, listen: false).controller.text.isNotEmpty){
                          Provider.of<SearchProvider>(context, listen: false).searchInDatabase(context, int.parse(m));
                          }
                          Provider.of<SearchProvider>(context, listen: false).changeState();

                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Provider.of<SearchProvider>(context, listen: true).vvb == -1
                ? Text(
                  "الشضص غير موجود",
                  style: Theme.of(context).textTheme.displayMedium,
                )
                : (Provider.of<SearchProvider>(context, listen: false)
                                .getDouble2(Provider.of<SearchProvider>(context, listen: false).controller.text) == -1 ||
                Provider.of<SearchProvider>(context, listen: false).controller.text.isEmpty)
                    ? Center(
                        child: Text(
                        "ادخل رقم الشخص ",
                        style: Theme.of(context).textTheme.displayMedium,
                      ))
                    : Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildCell(context,"الرقم", 60),
                              ...Provider.of<SearchProvider>(context,
                                      listen: false)
                                  .person
                                  .map(
                                    (e) => _buildCell2(context,e.id.toString(), 60),
                                  )
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
                                      _buildCell(context,"الاسم", 200),
                                      _buildCell(context,"تاريخ البدايه", 140),
                                      _buildCell(context,"الطول", 90),
                                      _buildCell(context,"الوزن", 90),
                                      _buildCell(context,"العمر", 90),
                                      _buildCell(context," عدد الايام", 90),
                                      _buildCell(context,"الحضور", 150),
                                      _buildCell(context,"الدفع", 130),
                                      _buildCell(context,"نوع التمرين", 170),
                                      _buildCell(context,
                                          "الايام",
                                          Provider.of<SearchProvider>(context,
                                                          listen: true)
                                                      .person[0]
                                                      .atten_day
                                                      .isEmpty
                                              ? 170
                                              : (170 *
                                                      Provider.of<SearchProvider>(
                                                              context,
                                                              listen: true)
                                                          .person[0]
                                                          .atten_day
                                                          .length) +
                                                  0.0),
                                    ],
                                  ),
                                  ...Provider.of<SearchProvider>(context,
                                          listen: false)
                                      .person
                                      .map(
                                        (e) => Row(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(7.r),
                                              decoration: BoxDecoration(
                                                border: Border.all(width: 0),
                                                color: Colors.white,
                                              ),
                                              alignment: Alignment.center,
                                              width: 200.w,
                                              height: 60.0.h,
                                              child: Text(
                                                e.name.toString(),
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.end,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .displayMedium,
                                              ),
                                            ),
                                            _buildCell2(context,e.date.toString(), 140),
                                            _buildCell2(context,e.height.toString(), 90),
                                            _buildCell2(context,e.weight.toString(), 90),
                                            _buildCell2(context,e.age.toString(), 90),
                                            _buildCell2(context,e.days.toString(), 90),
                                            _buildCell2(context,
                                                e.atten_day.length.toString(),
                                                150),
                                            _buildCell2(context,
                                                e.payed == 0
                                                    ? "دفع"
                                                    : "لم يدفع",
                                                130),
                                            _buildCell2(context,
                                                e.type == 0
                                                    ? "تخسيس"
                                                    : "حديد",
                                                170),
                                            ...(e.atten_day)
                                                .map((ee) => Container(
                                                      decoration: BoxDecoration(
                                                        border:
                                                            Border.all(width: 0),
                                                        color: Colors.white,
                                                      ),
                                                      alignment: Alignment.center,
                                                      width: 170.w,
                                                      height: 60.0.h,
                                                      child: FittedBox(
                                                        child: Text(
                                                          ee.toString(),
                                                          style: Theme.of(context)
                                                              .textTheme
                                                              .displayMedium,
                                                        ),
                                                      ),
                                                    )),
                                          ],
                                        ),
                                      )
                                      .toList(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
            
            (Provider.of<SearchProvider>(context, listen: false)
                            .getDouble2(Provider.of<SearchProvider>(context, listen: false).controller.text) !=
                        -1 &&
                Provider.of<SearchProvider>(context, listen: false).controller.text.isNotEmpty &&
                    Provider.of<SearchProvider>(context, listen: true).vvb != -1)
                ? Padding(
                    padding: EdgeInsets.only(bottom: 60.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          child: Button(
                              fun: () async {
                                await Provider.of<NewPersonProvider>(context, listen: false)
                                    .getIdData(Provider.of<SearchProvider>(context, listen: false).person[0].id);

                                Navigator.of(context).pushNamed(AddPerson.routeName,
                                    arguments: Provider.of<SearchProvider>(context, listen: false).person[0].id);
                              },
                              wid: 140.w,
                              hei: 74.h,
                              cir: 10.r,
                              color: const Color.fromRGBO(22, 178, 66, 1),
                              text: "تعديل"),
                        ),
                        Flexible(
                          child: Button(
                              fun: () {
                                Provider.of<SearchProvider>(context, listen: false)
                                    .delete(Provider.of<SearchProvider>(context,
                                            listen: false)
                                        .person[0]
                                        .id);
                              },
                              wid: 140.w,
                              hei: 74.h,
                              cir: 10.r,
                              color: const Color.fromRGBO(240, 9, 9, .77),
                              text: "حذف"),
                        ),
                      ],
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }

  Widget _buildCell(BuildContext context,String txt, double wid) {
    return Container(
      padding: EdgeInsets.all(5.r),
      decoration: BoxDecoration(
        border: Border.all(width: 0.w),
        color: const Color.fromRGBO(238, 238, 238, .83),
      ),
      alignment: Alignment.center,
      width: wid.w,
      height: 60.0.h,
      child: FittedBox(
        child: Text(
          txt,
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
    );
  }

  Widget _buildCell2(BuildContext context,String txt, double wid) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 0.w),
        color: Colors.white,
      ),
      alignment: Alignment.center,
      width: wid.w,
      height: 60.0.h,
      child: FittedBox(
        child: Text(
          txt,
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
    );
  }

}
