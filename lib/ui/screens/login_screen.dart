import 'package:flutter/material.dart';
import 'package:intermediate_final_project/ui/screens/all_products.dart';
import 'package:intermediate_final_project/ui/screens/sign_up_screen.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login",style: TextStyle(fontSize: 25),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: "Email", labelStyle: TextStyle(fontSize: 20),icon: Icon(Icons.email),),
              ),
              const SizedBox(height: 20,),
              TextFormField(
                decoration: const InputDecoration(labelText: "Password", labelStyle: TextStyle(fontSize: 20),icon: Icon(Icons.vpn_key),),
              ),
              const SizedBox(height: 20,),
              ElevatedButton(
                onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=> AllProducts()));
                },
                  style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: const BorderSide(color: Colors.blue)),
                  ),
                ),
                  child: const Text("Login",style: TextStyle(fontSize: 25),),
              ),
              TextButton(child: const Text("Don't have account yet? Sign Up",
              style: TextStyle(fontSize: 20),),
              onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>  SignUp()));
              }),
            ],
          ),
      ),
    );
  }
}
