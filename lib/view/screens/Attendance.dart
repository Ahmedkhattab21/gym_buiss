import 'package:flutter/material.dart';

import '../widget/button.dart';

class Attendance extends StatelessWidget {
  const Attendance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Button(fun: (){print("hghg");}, wid: 350, hei: 100, cir: 20, color: Color.fromRGBO(22, 178, 66, 1), text:"Add"));
  }
}
