
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/LoseWeightProvider.dart';

class LoseWeight extends StatelessWidget {
   LoseWeight({Key? key}) : super(key: key);
  // List<String> Datesss=[
  //   "2/9/2022",
  //   "3/9/2022",
  //   "4/9/2022"
  // ];
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
    return  Padding(
      padding: const EdgeInsets.only(top: 15),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildcell("id", 60),
                    ...Provider.of<LosingProvider>(context,listen: false).pperson.map((e) => _buildcell2(e.id.toString(), 60),),
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
                            _buildcell("Dates",(170 * Provider.of<LosingProvider>(context,listen: true).long)+0 ),

                          ],
                        ),
                        ...Provider.of<LosingProvider>(context,listen: false).pperson.map((e) =>Row(
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
                              child: Text(e.name.toString(),
                                overflow:TextOverflow.ellipsis,
                                textAlign:TextAlign.end
                                ,style: Theme.of(context).textTheme.headline2,
                              ),
                            ),
                            _buildcell2(e.date.toString(), 140),
                            _buildcell2(e.height.toString(), 90),
                            _buildcell2(e.weight.toString(), 90),
                            _buildcell2(e.age.toString(), 90),
                            _buildcell2(e.days.toString(), 90),
                            _buildcell2("14", 150),
                            _buildcell2(e.payed==0?"payed":"Not Payed", 130),
                            _buildcell2("Lose", 150),
                            ...(e.atten_day).map((ee) => Container(
                              decoration: BoxDecoration(
                                border:Border.all(width: 0),
                                color: Colors.white,
                              ),
                              alignment: Alignment.center,
                              width: 170,
                              height: 60.0,
                              child: FittedBox(child: Text("${ee}",style: Theme.of(context).textTheme.headline2,
                              ),
                              ),
                            ) ),

                          ],
                        ),).toList(),]
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
