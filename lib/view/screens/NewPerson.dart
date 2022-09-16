
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gym2/view/screens/searchScreen.dart';
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
        onTap: (){
          Navigator.of(context).pushNamed(searchScreen.routeName);
        },
        child: Container(
          width: 360,
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color:const Color.fromRGBO(0, 0, 0, .37),),
          ),
        child: Row(
          children:const [
             Padding(
              padding:  EdgeInsets.only(left: 23),
              child: Icon(FontAwesomeIcons.magnifyingGlass,color: Colors.black,),
            ),
            Spacer(),
          ],
        ),
        ),
      ),
          Button(fun: (){
            Navigator.of(context).pushNamed(AddPerson.routeName);
          }
            , wid: 190, hei: 190, cir: 30, color:const Color.fromRGBO(22, 178, 66, 1), text:"+"),
        ],
      ),
    );
  }
}
