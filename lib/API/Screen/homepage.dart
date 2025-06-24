import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:main_projects/API/Model/patient.dart';
import 'package:main_projects/API/Providers/auth_provider.dart';
import 'package:main_projects/API/Screen/register.dart';
import 'package:main_projects/API/Screen/treatement.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart'as http;
import 'branch.dart';

void main(){
  runApp(MaterialApp(debugShowCheckedModeBanner: false,home: homepage(),));
}

class homepage extends StatefulWidget {
  static const routeName='/home';
  const homepage({super.key});

  @override
  State<homepage> createState() => _hhomepageomeState();
}

class _hhomepageomeState extends State<homepage> {
  List<Patient>patients=[];

  @override
  void initState(){
    super.initState();
    fetchData();
  }
  Future<void>fetchData()async{
    try{
      final url=Uri.parse('https://flutter-amr.noviindus.in/api/PatientList');
      final tocken= Provider.of<authprovider>(context,listen:false).tocken;
      final response=await http.get(
          url,headers:{
        'authorization':'Bearer $tocken',
      }
      );
      if(response.statusCode==200){
        final Map<String, dynamic> jsonData = json.decode(response.body);
        setState(() {
          patients = (jsonData['patient'] as List)
              .map((item) => Patient.fromJson(item))
              .toList();
        });
      }else{
        print("");
      }
    }catch(e){
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hello there!!"),
        shadowColor: Colors.amber,),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Patient List"),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterPatient()));
              },
                  child: Text('Register'))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BranchPage()));
              }, child: Text("branches")),
              ElevatedButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TreatmentScreen()));
              }, child: Text("treatment"))
            ],
          ),

        ],
      ),
    );
  }
}