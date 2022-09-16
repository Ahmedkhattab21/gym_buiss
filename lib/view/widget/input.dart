import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  String txt;
  TextEditingController? controller;
  Widget? widget;
 Input({required this.txt,this.controller,this.widget});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(txt,style: Theme.of(context).textTheme.headline2,),
          Container(
            padding:const EdgeInsets.only(top: 5,bottom: 5),
              margin: const EdgeInsets.only(left: 15,top: 5,right: 5),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(238, 238, 238, 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      cursorColor: Colors.black45,
                      style: Theme.of(context).textTheme.headline1,
                      controller: controller,
                      decoration: InputDecoration(
                        fillColor:const  Color.fromRGBO(238, 238, 238, 1),
                        filled: true,
                        enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:const BorderSide(color: Color.fromRGBO(238, 238, 238, 1),width: 0),
                        ),
                          focusedBorder:UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:const BorderSide(color: Color.fromRGBO(238, 238, 238, 1),width: 0),
                          ),
                      ),
                    ),
                  ),
                 widget??Container(),
                ],
              ),
          ),
        ],
      ),
    );
  }
}
