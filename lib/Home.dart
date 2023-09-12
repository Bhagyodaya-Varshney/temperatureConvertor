import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  final controller = TextEditingController();
  var result = '';
  static String? dropdownvalue;
  static String? dropdownvalue1;
  List<String> temp = [' Celcius(°C)',' Kelvin(°K)',' Fahrenhite(°F)'];
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(1, 93, 87, 0.5),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(1, 33, 24, 1.0),
        title: Text("Temperature Convertor",style: TextStyle(fontSize: 20,color: Colors.white),),
      ),
      body: Center(
        child: Container(
            width: (MediaQuery.of(context).size.width*0.95),
            height: (MediaQuery.of(context).size.height*0.50),
            decoration: BoxDecoration(
              color: Color.fromRGBO(1, 58, 51, 1.0),
              borderRadius: BorderRadius.all(Radius.circular(8))
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                  children: [
                    SizedBox(height: 30,),
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: (MediaQuery.of(context).size.width)*0.42,
                          decoration: BoxDecoration(
                              border: Border.all(color: Color.fromRGBO(1, 33, 32, 0.5),width: 2),
                              borderRadius: BorderRadius.all(Radius.circular(4))
                          ),
                          child: TextField(
                            textAlign: TextAlign.center,
                            controller: controller,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: 'Enter Temperature',
                              hintStyle: TextStyle(color: Color.fromRGBO(190, 190, 190, 1.0))
                            ),
                            style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Color.fromRGBO(180, 180, 180, 1.0)),
                          ),
                        ),
                        SizedBox(width: 5,),
                        DropdownButtonHideUnderline(
                            child: Container(
                              width: (MediaQuery.of(context).size.width)*0.45,
                              height: 50,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Color.fromRGBO(1, 33, 32, 0.5),width: 2),
                                  borderRadius: BorderRadius.all(Radius.circular(4))
                              ),
                              child: Center(
                                child: DropdownButton2<String>(
                                  hint: Text(" Select Temp Format",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.white),),
                                  dropdownStyleData: DropdownStyleData(width: 155,decoration: BoxDecoration(borderRadius: BorderRadius.circular(5))),
                                  menuItemStyleData: MenuItemStyleData(height: 50),
                                  value: dropdownvalue,
                                  onChanged: (String? newValue){
                                    setState(() {
                                      dropdownvalue=newValue;
                                    });
                                  },
                                  items: temp.map((String valueItem){
                                    return DropdownMenuItem(value: valueItem,child: Text(valueItem,style: TextStyle(color: Color.fromRGBO(190, 190, 190, 1.0),fontWeight: FontWeight.bold,fontSize: 15),));
                                  }).toList(),
                                ),
                              ),
                            )
                        )
                      ],
                    ),
                    SizedBox(height: 35,),
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width*0.42,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color.fromRGBO(1, 33, 32, 0.5),width: 1.5),
                            borderRadius: BorderRadius.all(Radius.circular(3))
                          ),
                          child:Center(child: Text(result,textAlign: TextAlign.center,style: TextStyle(color: Color.fromRGBO(190, 190, 190, 1.0),fontWeight: FontWeight.bold,fontSize: 15),))
                        ),
                        SizedBox(width: 5,),
                        DropdownButtonHideUnderline(
                            child: Container(
                              width: (MediaQuery.of(context).size.width)*0.45,
                              height: 50,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Color.fromRGBO(1, 33, 32, 0.5),width: 2),
                                  borderRadius: BorderRadius.all(Radius.circular(4))
                              ),
                              child: Center(
                                child: DropdownButton2<String>(
                                  hint: Text(" Select Temp Format",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.white),),
                                  dropdownStyleData: DropdownStyleData(width: 155,decoration: BoxDecoration(borderRadius: BorderRadius.circular(5))),
                                  menuItemStyleData: MenuItemStyleData(height: 50),
                                  value: dropdownvalue1,
                                  onChanged: (String? newValue){
                                    setState(() {
                                      dropdownvalue1=newValue;
                                    });
                                  },
                                  items: temp.map((String valueItem){
                                    return DropdownMenuItem(value: valueItem,child: Text(valueItem,style: TextStyle(color: Color.fromRGBO(190, 190, 190, 1.0),fontWeight: FontWeight.bold,fontSize: 15)));
                                  }).toList(),
                                ),
                              ),
                            )
                        )
                      ],
                    ),
                    SizedBox(height: 70,),
                    Container(
                      width: 400,
                        height: 40,
                        child: ElevatedButton(
                            onPressed: (){
                              //'Celcius','Kelvin','Fahrenhite'
                              setState(() {
                                tempResult();
                              });
                            },
                            child: Text("Calculate",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.black,shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20)))),
                        )
                    ),
                    SizedBox(height: 10,),
                    TextButton(onPressed: (){
                      controller.clear();
                      dropdownvalue=null;
                      dropdownvalue1=null;
                      setState(() {
                      result='';
                    })
                    ;},
                        child: Text("Clear All",style: TextStyle(color: Colors.green),))
                  ],
                ),
          ),
        ),
      )
    );
  }
  void tempResult(){
    //'Celcius(°C)','Kelvin(°K)','Fahrenhite(°F)'
    if(dropdownvalue1==' Celcius(°C)' && dropdownvalue==' Celcius(°C)'){result=controller.text;}
    else if(dropdownvalue1==' Kelvin(°K)' && dropdownvalue==' Kelvin(°K)'){result=controller.text;}
    else if(dropdownvalue1==' Fahrenhite(°F)' && dropdownvalue==' Fahrenhite(°F)'){result=controller.text;}

    else if(dropdownvalue==' Celcius(°C)' && dropdownvalue1==' Fahrenhite(°F)'){result=(int.parse(controller.text)*9/5+32).toString();}
    else if(dropdownvalue==' Celcius(°C)' && dropdownvalue1==' Kelvin(°K)'){result=(int.parse(controller.text)+273.15).toString();}

    else if(dropdownvalue==' Kelvin(°K)' && dropdownvalue1==' Celcius(°C)'){result=(int.parse(controller.text)-273.15).toString();}
    else if(dropdownvalue==' Kelvin(°K)' && dropdownvalue1==' Fahrenhite(°F)'){result=(int.parse(controller.text)*9/5-459.67).toString();}

    else if(dropdownvalue==' Fahrenhite(°F)' && dropdownvalue1==' Celcius(°C)'){result=((int.parse(controller.text)-32)*5/9).toString();}
    else if(dropdownvalue==' Fahrenhite(°F)' && dropdownvalue1==' Kelvin(°K)'){result=((int.parse(controller.text)+459.67)*5/9).toString();}

  }
}
