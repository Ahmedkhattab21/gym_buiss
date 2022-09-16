import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import '../../controller/provider/NewPersonProvider.dart';
import '../widget/button.dart';
import '../widget/search.dart';

class searchScreen extends StatelessWidget {
  static const String routeName="/search";
  searchScreen({Key? key}) : super(key: key);

  List<String> Datesss=[
    "2/9/2022",
    "3/9/2022",
    "4/9/2022"
  ];
  @override
  Widget build(BuildContext context) {
    Widget _buildcell(String txt ,double wid){
      return Container(
        padding:const EdgeInsets.all(5),
        decoration: BoxDecoration(
          border:Border.all(width: 0),
          color:const Color.fromRGBO(238, 238, 238, .83),
        ),
        alignment: Alignment.center,
        width: wid,
        height: 60.0,
        child: FittedBox(child: Text(txt,style: Theme.of(context).textTheme.headline2,
        ),
        ),
      );
    }
    Widget _buildcell2(String txt ,double wid){
      return Container(
        decoration: BoxDecoration(
          border:Border.all(width: 0),
          color: Colors.white,
        ),
        alignment: Alignment.center,
        width: wid,
        height: 60.0,
        child: FittedBox(child: Text(txt,style: Theme.of(context).textTheme.headline2,
        ),
        ),
      );
    }
     return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon:const Icon(Icons.arrow_back_ios,color: Colors.black,),
          onPressed: (){Navigator.of(context).pop();},),
        actions: const [
          CircleAvatar(
            backgroundImage:AssetImage("assets/images/img1.jpg"),),
          SizedBox(width: 20,),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          search(controller: Provider.of<NewPersonProvider>(context,listen: false).controller,),
          Row(
            children: [
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildcell("id", 60),
                _buildcell2("6", 60),

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
                        _buildcell("Name",200),
                        _buildcell("Start Date",140),
                        _buildcell("Hieght",90),
                        _buildcell("Weight",90),
                        _buildcell("Age",90),
                        _buildcell(" Days",90),
                        _buildcell("Attendance",150),
                        _buildcell("payed",130),
                        _buildcell("Type",150),
                        _buildcell("Dates",(170 * Datesss.length) +0.0),
                        
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            border:Border.all(width: 0),
                            color: Colors.white,
                          ),
                          alignment: Alignment.center,
                          width: 200,
                          height: 60.0,
                          child: Text("احمد محمد شعبان محمد حسين  خطاب",
                            overflow:TextOverflow.ellipsis,
                            textAlign:TextAlign.end
                            ,style: Theme.of(context).textTheme.headline2,
                          ),
                        ),
                        _buildcell2("2/6/5555", 140),
                        _buildcell2("170", 90),
                        _buildcell2("70", 90),
                        _buildcell2("20", 90),
                        _buildcell2("4", 90),
                        _buildcell2("14", 150),
                        _buildcell2("Not payed", 130),
                        _buildcell2("OverWeight", 150),
                        ...Datesss.map((e) => Container(
                          decoration: BoxDecoration(
                            border:Border.all(width: 0),
                            color: Colors.white,
                          ),
                          alignment: Alignment.center,
                          width: 170,
                          height: 60.0,
                          child: FittedBox(child: Text("${e}",style: Theme.of(context).textTheme.headline2,
                          ),
                          ),
                        ) ),

                      ],
                    ),
                  ],
                ),
              ),
            ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 60.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Button(fun: (){}
                    , wid: 185, hei: 74, cir: 10, color:const Color.fromRGBO(22, 178, 66, 1), text:"Edit"),
                Button(fun: (){}
                    , wid: 185, hei: 74, cir: 10, color:const Color.fromRGBO(240, 9, 9, .77), text:"Delete"),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
