
import 'package:flutter/material.dart';
import 'package:gym2/provider/OverWeightProvider.dart';
import 'package:provider/provider.dart';


class OverWeight extends StatelessWidget {
  const OverWeight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget _buildCell(String txt ,double wid){
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
    Widget _buildCell2(String txt ,double wid){
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
                    _buildCell("id", 60),
                    ...Provider.of<OveringProvider>(context,listen: false).person.map((e) => _buildCell2(e.id.toString(), 60),),
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
                              _buildCell("Name",200),
                              _buildCell("Start Date",140),
                              _buildCell("Height",90),
                              _buildCell("Weight",90),
                              _buildCell("Age",90),
                              _buildCell(" Days",90),
                              _buildCell("Attendance",150),
                              _buildCell("payed",130),
                              _buildCell("Type",170),
                              _buildCell("Dates",(170 * Provider.of<OveringProvider>(context,listen: true).long) +0.0),

                            ],
                          ),
                          ...Provider.of<OveringProvider>(context,listen: false).person.map((e) =>Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(7),
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
                              _buildCell2(e.date.toString(), 140),
                              _buildCell2(e.height.toString(), 90),
                              _buildCell2(e.weight.toString(), 90),
                              _buildCell2(e.age.toString(), 90),
                              _buildCell2(e.days.toString(), 90),
                              _buildCell2("14", 150),
                              _buildCell2(e.payed==0?"payed":"Not payed", 130),
                              _buildCell2("Over Weight", 170),
                              ...(e.atten_day).map((ee) => Container(
                                decoration: BoxDecoration(
                                  border:Border.all(width: 0),
                                  color: Colors.white,
                                ),
                                alignment: Alignment.center,
                                width: 170,
                                height: 60.0,
                                child: FittedBox(child: Text(ee,style: Theme.of(context).textTheme.headline2,
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
