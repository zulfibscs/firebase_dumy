import 'package:firebase_dumy/ui/auth/signup_screen.dart';
import 'package:firebase_dumy/widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailControler = TextEditingController();
  final passwordControler = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailControler.dispose();
    passwordControler.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        appBar:
            AppBar(title: const Text('Login'),
                centerTitle: true,
                automaticallyImplyLeading: false),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                        controller: emailControler,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                            hintText: "Email",
                            prefixIcon: Icon(Icons.email)
                        ),
                      validator: (value) {
                        if(value!.isEmpty){
                          return 'Enter Email';
                        }
                        return null;
                      },
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                        controller: passwordControler,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: const InputDecoration(
                            hintText: "Password",
                            prefixIcon: Icon(Icons.lock)
                        ),
                      validator: (value) {
                        if(value!.isEmpty){
                          return 'Enter password';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
               RoundButton(
                title: 'Login',
                 ontap: (){
                  if(_formKey.currentState!.validate()){

                  }
                  print('hey');
                 },

              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account"),
                  TextButton(
                      onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(
                              builder: (context) => SignUpScreen(),));
                      },
                      child: Text('Sign up'
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
