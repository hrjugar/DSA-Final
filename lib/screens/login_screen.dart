import 'package:dsa_final/database/customer.dart';
import 'package:dsa_final/screens/customer_main_screen.dart';
import 'package:dsa_final/database/restaurant.dart';
import 'package:dsa_final/screens/restaurant_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:collection/collection.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  int _toggleSwitchIndex = 0;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
              initialLabelIndex: _toggleSwitchIndex,
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
              onToggle: (index) => setState(() => _toggleSwitchIndex = index)
            ),
            Spacer(flex: 1),
            TextField(
              controller: _usernameController,
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
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
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
            ),
            Spacer(flex: 1),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  List<List<dynamic>> accountGroups = [customers, restaurants];
                  var account = accountGroups[_toggleSwitchIndex]
                    .firstWhereOrNull(
                      (account) => account.username == _usernameController.text
                        && account.password == _passwordController.text
                    );
                  print("C1: ${_usernameController.text}");
                  if (account == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Invalid username or password."))
                    );
                  } else if (_toggleSwitchIndex == 0) {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => CustomerMainScreen(
                          customer: account
                        )
                      )
                    );                    
                  } else if (_toggleSwitchIndex == 1) {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => RestaurantMainScreen(
                          restaurant: account
                        )
                      )
                    );
                  }
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
    );
  }
  
}