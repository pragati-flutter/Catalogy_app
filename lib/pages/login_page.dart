import 'package:flutter/material.dart';
import 'package:flutter_catalog/util/routes.dart';

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

      color: Colors.white,
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
        fontWeight: FontWeight.bold,
        
        ),),
            SizedBox(
              height: 20,
            ),
        
        Padding(padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 32.0),
            child:  Column(
            children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Username",
                    labelText: "Enter user name",
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
            decoration:InputDecoration(
        hintText: "Passward",
        labelText: "Enter passward",
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
        
        color:  Colors.deepPurple,
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
    );
  }
}
