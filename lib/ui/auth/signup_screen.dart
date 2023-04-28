import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dumy/ui/auth/login_screen.dart';
import 'package:firebase_dumy/widgets/round_button.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailControler = TextEditingController();
  final passwordControler = TextEditingController();

  FirebaseAuth _auth=FirebaseAuth.instance;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailControler.dispose();
    passwordControler.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:
      AppBar(title: const Text('SignUp'),
          centerTitle: true,

      ),
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
                        hintText: "Email",
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
                title: 'Sign Up',
                ontap: (){

                  if(_formKey.currentState!.validate())
              {
                _auth.createUserWithEmailAndPassword(
                    email: emailControler.text.toString(),
                    password: passwordControler.text.toString());
                print('object1');

              }
              print('object');

              Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),));
            }),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account"),
                TextButton(
                    onPressed: (){
                      Navigator.push(
                          context, MaterialPageRoute(
                          builder: (context) => LoginScreen(),));
                    },
                    child: Text('Sign In'))




              ],
            )
          ],
        ),
      ),
    );
  }
}
