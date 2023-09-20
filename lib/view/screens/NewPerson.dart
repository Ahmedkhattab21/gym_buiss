import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gym2/provider/NewPersonProvider.dart';
import 'package:gym2/view/screens/searchScreen.dart';
import 'package:provider/provider.dart';
import '../widget/button.dart';
import 'AddPerson.dart';

class NewPerson extends StatelessWidget {
  const NewPerson({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(SearchScreen.routeName);
            },
            child: Container(
              width: double.infinity,
              height: 70.h,
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                border: Border.all(
                  color: const Color.fromRGBO(0, 0, 0, .37),
                ),
              ),
              child: Row(
                children:  [
                  Padding(
                    padding: EdgeInsets.only(right: 20.w),
                    child:const Icon(
                      FontAwesomeIcons.magnifyingGlass,
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
          Button(
              fun: () {
                Provider.of<NewPersonProvider>(context,listen: false).clearData();
                Navigator.of(context)
                    .pushNamed(AddPerson.routeName, arguments: 0);
              },
              wid: 150.r,
              hei: 150.r,
              cir: 30.r,
              color: const Color.fromRGBO(22, 178, 66, 1),
              text: "+"),
        ],
      ),
    );
  }
}
