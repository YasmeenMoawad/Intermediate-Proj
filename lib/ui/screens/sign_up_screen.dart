import 'package:flutter/material.dart';
import 'package:intermediate_final_project/ui/screens/all_products.dart';
import 'package:intermediate_final_project/ui/widgets/provider.dart';
import 'package:provider/provider.dart';



class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  final gender = ["Female" , "Male", "Other"].toList();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const Text(
            "Sign Up",
            style: TextStyle(fontSize: 25),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  const Icon(Icons.person,color: Colors.black54,size: 25),
                  const SizedBox(width: 20,),
                  SizedBox(
                    height: 50,width: 150,
                    child: TextFormField(
                      decoration: const InputDecoration(labelText: "First Name", labelStyle: TextStyle(fontSize: 20)),
                    ),
                  ),
                  const SizedBox(width: 30,),
                  SizedBox(
                    height: 50,width: 150,
                    child: TextFormField(
                      decoration: const InputDecoration(labelText: "Last Name", labelStyle: TextStyle(fontSize: 20)),
                    ),
                  ),
                ],
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: "ex: ahmed@gmail.com",labelText: "Email", labelStyle: TextStyle(fontSize: 20),icon: Icon(Icons.email),),
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: "**********", labelText: "Password", labelStyle: TextStyle(fontSize: 20),icon: Icon(Icons.vpn_key),),
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: "**********", labelText: "Confirm Password", labelStyle: TextStyle(fontSize: 20),icon: Icon(Icons.vpn_key),),
              ),
              TextFormField(
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(hintText: "ex: 01055555555", labelText: "Phone Number", labelStyle: TextStyle(fontSize: 20),icon: Icon(Icons.add_call),),
              ),
              Row(
                children: [
                  const Icon(Icons.account_box_outlined),
                  const SizedBox(width: 20,),
                  const Text("Gender : ", style: TextStyle(fontSize: 22,color: Colors.black54),),
                  const SizedBox(width: 50,),
                  DropdownButton(
                      value: Provider.of<MyProvider>(context,listen: false).defaultItem,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      style: const TextStyle(fontSize: 25,color: Colors.blue),
                      items: gender.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                      onChanged: (String? val) => Provider.of<MyProvider>(context,listen: false).switchChange(val)
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.access_time_outlined),
                  const SizedBox(width: 20,),
                  const Text("Birth : ", style: TextStyle(fontSize: 22,color: Colors.black54),),
                  const SizedBox(width: 50,),
                  ElevatedButton(
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.lightBlueAccent),),
                      onPressed:(){
                        showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                        ).then((selectedDate) {
                          if (selectedDate != null) {
                            Provider.of<MyProvider>(context,listen: false).dateChanger(selectedDate);
                          }
                        });
                      },
                      child: Text(Provider.of<MyProvider>(context,listen: false).formattedDate,
                          style: const TextStyle(fontSize: 25)),
                  ),
                ],
              ),
              const SizedBox(height: 30,),
              CheckboxListTile(
                title: const Text("I agree to terms & conditions"),
                value: Provider.of<MyProvider>(context,listen: false).checkedValue,
                onChanged: (newValue) {
                  Provider.of<MyProvider>(context,listen: false).check(newValue);
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
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
                child: const Text("Register",style: TextStyle(fontSize: 35),),
              ),
            ],
          ),
        ),
    );
  }
}
