import 'package:flutter/material.dart';


import 'package:flutter_catalog/util/routes.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

moveToHome(BuildContext context) async{

  if(_formKey.currentState?.validate()??false) {
print("forms validate successfully");


    setState(() {
      changeButton = true;
    });

    await Future.delayed(Duration(seconds: 1));

    await Navigator.pushNamed(context, MyRoutes.homeRoute);
    setState(() {
      changeButton = false;
    });
  }else{
    print("not validate");
  }
}



  @override
  Widget build(BuildContext context) {
    return Material(

      
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset("images/undraw_secure_login_pdn4.png",
              fit: BoxFit.cover
                ,),
          SizedBox(
            height: 20,
          ),

          Text("Welcome $name",style: TextStyle(fontSize: 24,
          fontWeight: FontWeight.bold,color:(Theme.of(context).colorScheme.secondary),

          ),

          ),
              SizedBox(
                height: 20,
              ),

          Padding(padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 32.0),
              child:  Column(
              children: [
                  TextFormField(
                    style:TextStyle(color: (Theme.of(context).colorScheme.secondary)),
                    decoration: InputDecoration(
                      hintText: "Username",
                      hintStyle: TextStyle(color:(Theme.of(context).colorScheme.secondary)),
                      labelText: "Enter user name",
                   labelStyle:    TextStyle(color:(Theme.of(context).colorScheme.secondary)),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: (Theme.of(context).colorScheme.secondary)),
                      ),


                    ),

                    validator: (value){

                      if(value== null || value.isEmpty){
                        return "username cannot be empty";
                      }
                      return null;
                    },
          onChanged:(value){
               name = value;
          setState(() {});
          },



                  ),



          TextFormField(

          obscureText: true,
            style:TextStyle(color: Colors.white),
              decoration:InputDecoration(

          hintText: "Passward",
          hintStyle: TextStyle(color:(Theme.of(context).colorScheme.secondary)),
          labelText: "Enter passward",
          labelStyle: TextStyle(color:(Theme.of(context).colorScheme.secondary)),

                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: (Theme.of(context).colorScheme.secondary)),
                ),

              ),
            validator: (value){

              if(value==null||value.isEmpty){
          return "Password length should not be empty";
              }else if(value.length<6){
          return "Password length should be atleast 6";
              }
              return null;
            },
          ),
                SizedBox(
                  height: 20.0,
                ),
          
          
          
                Material(
                 borderRadius: BorderRadius.circular(changeButton?50:10),
          color: Theme.of(context).colorScheme.primary,

            child: InkWell(
          
              onTap:() => moveToHome(context),
            child: AnimatedContainer(
             duration: Duration(seconds: 1),
              alignment: Alignment.center,
              height: 50,
              width: changeButton?50:100,
          
              child:changeButton?Icon(Icons.done,color: Colors.white,) :Text("Login",style:TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
            ),
            ),
          )
              ],
              ),
          ),
            ],
          
          ),
        ),
      ),
    );
  }
}
