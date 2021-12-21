import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen>{

  String? name;
  String? email;
  String? password;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Widget buildNameField(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name'),
      validator: (String? value){
        if(value!=null && value.isEmpty){
          return 'Name is required';
        }
      },
      onSaved: (String? value){
        name = value!;
      },
    );
  }

  Widget buildEmailField(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Email'),
      validator: (String? value){
        if(value!=null && value.isEmpty){
          return 'Email is required';
        }
      },
      onSaved: (String? value){
        email = value!;
      },
    );
  }

  Widget buildPasswordField(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Password'),
      validator: (String? value){
        if(value!=null && value.isEmpty){
          return 'Password is required';
        }
      },
      onSaved: (String? value){
        password = value!;
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text("Form Demo")),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
          key: formKey,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildNameField(),
            buildPasswordField(),
            buildEmailField(),
            SizedBox(height: 100),
            // ignore: deprecated_member_use, deprecated_member_use
            RaisedButton(
              // ignore: prefer_const_constructors
              child: Text('Submit',style: TextStyle(color: Colors.blue, fontSize: 16,),),
              onPressed: (){
                if(!formKey.currentState!.validate()){
                  return;
                }
                formKey.currentState!.save();
                print(name);
              },)
          ],
        ),),
      ),
    );
  }
}

