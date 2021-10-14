import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            SizedBox(height: 75),
            Text("deliveroo",
              style: TextStyle(
                color: Colors.deepOrange,
                fontSize: 45,
                fontWeight: FontWeight.w900
              ),
            ),
            SizedBox(height: 50),
            ToggleSwitch(
              minWidth: 125,
              minHeight: 35,
              fontSize: 12,
              cornerRadius: 20,
              totalSwitches: 2,
              labels: ["Customer", "Restaurant"],
              activeBgColor: [Colors.deepOrange],
              inactiveBgColor: Colors.grey[200],
              onToggle: (index) {
                // TODO: Backend Work
              },
            )
          ],
        ),
      ),
    );
  }
  
}