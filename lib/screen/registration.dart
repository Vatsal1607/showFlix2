import 'package:update_showflix/screen/home.dart';
import 'package:update_showflix/screen/registration.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class rag extends StatefulWidget {
  const rag({Key? key}) : super(key: key);
  @override
  State<rag> createState() => _ragState();
}

class _ragState extends State<rag> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double bottomInsets = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Image.asset(
                  "assets/image/logo3.png",
                  scale: 3,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Registration",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: TextFormField(
                          validator: (value){
                            if(value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
                              return 'Enter correct Username';
                            } else {
                              return null;
                            }
                          },
                          scrollPadding:
                              EdgeInsets.only(bottom: bottomInsets + 40.0),
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            focusColor: Colors.amber,
                            labelText: "Username",
                            hintText: "Username",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(color: Colors.amber)),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30.0, right: 30),
                        child: TextFormField(
                          validator: (value){
                            if(value!.isEmpty || !RegExp(r'^[\w-\.]+@([\w-)]+\.)+[\w]{2,4}').hasMatch(value)){
                              return 'Enter correct Email';
                            } else {
                              return null;
                            }
                          },
                          scrollPadding:
                              EdgeInsets.only(bottom: bottomInsets + 40.0),
                          decoration: InputDecoration(
                              labelText: "Email",
                              hintText: "Email",
                              prefixIcon: Icon(Icons.mail),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(color: Colors.amber))),
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 30.0, right: 30, top: 30),
                        child: TextFormField(
                          controller: pass,
                          validator: (value){
                            if(value!.isEmpty || value.length < 6){
                              return 'Enter atleast 6 character';
                            } else {
                              return null;
                            }
                          },
                          scrollPadding:
                              EdgeInsets.only(bottom: bottomInsets + 40.0),
                          obscureText: true,
                          decoration: InputDecoration(
                              labelText: "Password",
                              hintText: "Password",
                              prefixIcon: Icon(Icons.lock),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(color: Colors.amber))),
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 30.0, right: 30, top: 30),
                        child: TextFormField(
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Enter atleast 6 character';
                            } if(value != pass.text){
                              return 'Password is not matched';
                            } else {
                              return null;
                            }
                          },
                          scrollPadding:
                              EdgeInsets.only(bottom: bottomInsets + 40.0),
                          obscureText: true,
                          decoration: InputDecoration(
                              labelText: "Confirm Password",
                              hintText: "Confirm Password",
                              prefixIcon: Icon(Icons.lock),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(color: Colors.amber))),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: 335.0,
                      height: 50,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.amber)),
                        onPressed: () {
                          if(_formKey.currentState!.validate()){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Home()),
                              );
                          }
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/image/Google.png",
                      scale: 20,
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Image.asset(
                      "assets/image/facebook.png",
                      scale: 39,
                    ),
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
