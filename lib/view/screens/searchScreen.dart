import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gym2/provider/NewPersonProvider.dart';
import 'package:provider/provider.dart';

import '../../provider/AttendanceProvider.dart';
import '../../provider/searchProvider.dart';
import '../widget/button.dart';
import 'AddPerson.dart';


class searchScreen extends StatefulWidget {
  static const String routeName="/search";
  searchScreen({Key? key}) : super(key: key);

  @override
  State<searchScreen> createState() => _searchScreenState();
}

class _searchScreenState extends State<searchScreen> {
  TextEditingController controller=TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey();

  void initState() {
    super.initState();
      Provider.of<SearchProvider>(context,listen: false).ssearchinDatabase(context);
  }
  double getDouble2(String x){
    double? number1=double.tryParse(x)??null;
    if(number1 != null){
      return number1;
    }else{
      return -1;
    }
  }

  @override
  Widget build(BuildContext context) {
     var Dats=Provider.of<SearchProvider>(context,listen: true).Datesss;
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
           Container(
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
                  child:Form(
                    key: globalKey,
                    child: TextFormField(
                      style: Theme.of(context).textTheme.headline2,
                      controller:controller,
                      cursorColor: Colors.black45,
                      decoration:const InputDecoration(
                        enabledBorder:UnderlineInputBorder(
                          borderSide: BorderSide(width: 0,color: Colors.white),
                        ),
                        focusedBorder:UnderlineInputBorder(
                          borderSide: BorderSide(width: 0,color: Colors.white),
                        ),
                      ),
                      onChanged:(String m){
                        setState((){
                            (getDouble2(controller.text) !=-1 &&
                                controller.text.isNotEmpty )?
                            Provider.of<SearchProvider>(context,listen: false).ssearchinDatabase(context,int.parse(m)):Container();
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),

           Provider.of<SearchProvider>(context,listen: true).vvb ==-1?
               Container(child: Text("Cant find the Person",style: Theme.of(context).textTheme.headline2,),)
               : (getDouble2(controller.text) ==-1 || controller.text.isEmpty)?
            Center(child: Text("Enter the Number of Person",style:Theme.of(context).textTheme.headline2,)):
           Row(
              children: [
              Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              _buildcell("id", 60),
                ...Provider.of<SearchProvider>(context,listen: false).pperson.map((e) => _buildcell2(e.id.toString(),60),)
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
                        _buildcell("Type",170),
                        _buildcell("Dates", Provider.of<SearchProvider>(context,listen: true).pperson[0].atten_day.length ==0? 170 : (170 * Provider.of<SearchProvider>(context,listen: true).pperson[0].atten_day.length) +0.0),
                        ],
                      ),
                      ...Provider.of<SearchProvider>(context,listen: false).pperson.map((e)=>Row(
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
                          _buildcell2(e.atten_day.length.toString(), 150),
                          _buildcell2(e.payed==0?"payed":"Not Payed", 130),
                          _buildcell2(e.type==0?"Lose Weight":"Over Weight", 170),
                          ...(e.atten_day).map((ee) => Container(
                            decoration: BoxDecoration(
                              border:Border.all(width: 0),
                              color: Colors.white,
                            ),
                            alignment: Alignment.center,
                            width: 170,
                            height: 60.0,
                            child: FittedBox(child: Text(ee.toString(),style: Theme.of(context).textTheme.headline2,
                            ),
                            ),
                          )
                          ),

                        ],
                      ),).toList(),
                    ],
                  ),
                  ),
              ),
              ],
    ),
           (getDouble2(controller.text) !=-1 && controller.text.isNotEmpty && Provider.of<SearchProvider>(context,listen: true).vvb !=-1)?
           Padding(
            padding: const EdgeInsets.only(bottom: 60.0),
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            Button(fun: ()async{
              await Provider.of<NewPersonProvider>(context,listen: false).getIdData(Provider.of<SearchProvider>(context,listen: false).pperson[0].id);
              Navigator.of(context).pushNamed(AddPerson.routeName,arguments: Provider.of<SearchProvider>(context,listen: false).pperson[0].id);
              }
            , wid: 185, hei: 74, cir: 10, color:const Color.fromRGBO(22, 178, 66, 1), text:"Edit"),
            Button(fun: (){
              Provider.of<SearchProvider>(context,listen: false).Delete(Provider.of<SearchProvider>(context,listen: false).pperson[0].id);

            }
            , wid: 185, hei: 74, cir: 10, color:const Color.fromRGBO(240, 9, 9, .77), text:"Delete"),
            ],
            ),
            ): Container()

        ],
      ),
    );
  }
}
