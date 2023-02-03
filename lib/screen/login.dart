import 'package:update_showflix/screen/home.dart';
import 'package:update_showflix/screen/registration.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);
  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final _formKey = GlobalKey<FormState>();

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
                  scale: 2,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Login",
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
                        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                        child: TextFormField(
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Enter correct Details';
                            } else {
                              return null;
                            }
                          },
                          scrollPadding: EdgeInsets.only(bottom:bottomInsets + 40.0),
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            focusColor: Colors.amber,
                            labelText: "Username",
                            hintText: "Username or Email",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(color: Colors.amber)
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30.0, right: 30,top: 10),
                        child: TextFormField(
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Enter atleast 6 character';
                            } else {
                              return null;
                            }
                          },
                          scrollPadding: EdgeInsets.only(bottom:bottomInsets + 40.0),
                          obscureText: true,
                          decoration: InputDecoration(
                              labelText: "Password",
                              hintText: "Password",
                              prefixIcon: Icon(Icons.lock),
                              border: OutlineInputBorder(

                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(color: Colors.amber)
                              )
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 280),
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(color: Colors.amber),
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
                      backgroundColor: MaterialStateProperty.all(Colors.amber)),
                  onPressed: () {
                    if(_formKey.currentState!.validate()){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Home()),
                      );
                    }
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              SizedBox(height: 25),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const rag()),
                  );
                },
                child: RichText(
                  text: const TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: "Don't Have an Account?  ",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: 'Sign Up Here',
                          style: TextStyle(
                              color: Colors.amber,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 25),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
