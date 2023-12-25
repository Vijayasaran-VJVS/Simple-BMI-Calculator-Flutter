

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = "";
  var bgColor = Colors.purple.shade200;

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
      title: Text("BMI Calculator"),
      
        
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("BMI", style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                
                ),),

                SizedBox(height:25 ,),
                
              TextField(

                controller: wtController,
                decoration: InputDecoration(
                  label: Text("Enter your Weight(in Kg)"),
                  prefixIcon: Icon(Icons.monitor_weight_outlined),
                ),
                keyboardType: TextInputType.number,
                
              ),

              SizedBox(height: 11,),

              TextField(

                controller: ftController,
                decoration: InputDecoration(
                  label: Text("Enter your Height(in ft)"),
                  prefixIcon: Icon(Icons.height),
                ),
                keyboardType: TextInputType.number,
                
              ),

              SizedBox(height: 11,),

               TextField(

                controller: inController,
                decoration: InputDecoration(
                  label: Text("Enter your Height(in inches)"),
                  prefixIcon: Icon(Icons.height),
                ),
                keyboardType: TextInputType.number,
                
              ),

              SizedBox(height: 19,),

              ElevatedButton(onPressed: (){

                var wt = wtController.text.toString();
                var ft = ftController.text.toString();
                var inch = inController.text.toString();

                if(wt!="" && ft!="" && inch!=""){

                  var iWt = int.parse(wt);
                  var iFt = int.parse(ft);
                  var iInch = int.parse(inch);

                  var tInch = (iFt*12) + iInch;
                  var tCm = tInch*2.54;
                  var tM = tCm/100;

                  var bmi = iWt/(tM*tM);

                  var msg="";

                  if(bmi>25){

                    msg="You're OverWeight!";
                    bgColor=Colors.red.shade200;

                  }
                  else if(bmi<18){
                    msg="You're UnderWeight!";
                    bgColor=Colors.yellow.shade200;

                  }
                  else{
                    msg="You're !";
                    bgColor=Colors.yellow.shade200;

                  }

                  setState(() {
                    result = "$msg \n your BMI is: ${bmi.toStringAsFixed(4)}";
                  });

                }
                else{

                  setState(() {
                    result = "please fill all the required fields!!";
                  });

                }

              }, child: Text("calculate"),),

              SizedBox(height: 11,),

              Text(result, style: TextStyle(fontSize: 19,),)

              

              ],
            ),
          ),
        ),
      )
    );
  }
}
