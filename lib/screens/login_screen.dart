import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.orange, Colors.deepOrange]
            )
          ),
          child: Column(
            children: [
              Spacer(flex: 2),
              Text("deliveroo",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 45,
                  fontWeight: FontWeight.w900
                ),
              ),
              Spacer(flex: 2),
              Text("sign in as:",
                style: TextStyle(
                  color: Colors.white
                ),
              ),
              SizedBox(height: 10),
              ToggleSwitch(
                minWidth: 125,
                minHeight: 35,
                fontSize: 12,
                cornerRadius: 20,
                totalSwitches: 2,
                labels: ["customer", "restaurant"],
                icons: [Icons.restaurant, Icons.business_center],
                activeBgColor: [Colors.white],
                activeFgColor: Colors.deepOrange,
                inactiveBgColor: Colors.orange.withOpacity(0.75),
                inactiveFgColor: Colors.black.withOpacity(0.5),
                onToggle: (index) {
                  // TODO: Backend Work
                },
              ),
              Spacer(flex: 1),
              TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none
                  ),
                  hintText: "username",
                  hintStyle: TextStyle(color: Colors.white70),
                  prefixIcon: Icon(Icons.person, color: Colors.white70),
                  prefixIconConstraints: BoxConstraints(minWidth: 75),
                  filled: true,
                  fillColor: Colors.black.withOpacity(0.15)
                ),
                validator: (value) {
                  // TODO: Backend Work
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none
                  ),
                  hintText: "password",
                  hintStyle: TextStyle(color: Colors.white70),
                  prefixIcon: Icon(Icons.lock, color: Colors.white70),
                  prefixIconConstraints: BoxConstraints(minWidth: 75),
                  filled: true,
                  fillColor: Colors.black.withOpacity(0.15)
                ),
                validator: (value) {
                  // TODO: Backend Work
                },
              ),
              Spacer(flex: 1),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Backend Work
                  }, 
                  child: Text("login",
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.bold
                    )
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)
                      )
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    elevation: MaterialStateProperty.all(0),
                  ),
                ),
              ),
              Spacer(flex: 2)
            ],
          ),
        ),
      ),
    );
  }
  
}