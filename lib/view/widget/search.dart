import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class search extends StatelessWidget {
TextEditingController controller;
search({required this.controller});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.only(left: 15),
      margin:const EdgeInsets.only(bottom: 180),
      width: 360,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
    border: Border.all(color:const Color.fromRGBO(0, 0, 0, .37),),
      ),
      child: Row(
        children: [
         const Padding(
            padding:  EdgeInsets.only(right: 17,left: 10),
            child: Icon(FontAwesomeIcons.magnifyingGlass,color: Colors.black,),
          ),

          Expanded(
              child:TextFormField(
                style: Theme.of(context).textTheme.headline2,
                controller: controller,
                cursorColor: Colors.black45,
                decoration:const InputDecoration(
                  enabledBorder:UnderlineInputBorder(
                    borderSide: BorderSide(width: 0,color: Colors.white),
                  ),
                  focusedBorder:UnderlineInputBorder(
                    borderSide: BorderSide(width: 0,color: Colors.white),
                  ),
                ),
              ),
          ),
        ],
      ),
    );
  }
}
