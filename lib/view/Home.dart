
import 'package:flutter/material.dart';
import 'package:gym2/view/Daily.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final md=MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: Image.asset('assets/images/img1.jpg',fit: BoxFit.cover),
          ),
          Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Accounting App",style:  TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).pushReplacementNamed(DailyPage.routeName);
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 60),
                      alignment: Alignment.center,
                      width: md.width * .46962616,
                      height:md.height * .08,
                      decoration: BoxDecoration(color:Theme.of(context).primaryColor,borderRadius: BorderRadius.circular(15)),
                      child: Text("Let’s Go",style: Theme.of(context).textTheme.button,),
                    ),),
                ],)),
        ],
      ),

    );
  }
}
