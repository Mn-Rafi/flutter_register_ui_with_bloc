import 'package:flutter/material.dart';
import 'package:login_app/presentation/screens/screen_reister.dart';

class ScreenLogin extends StatelessWidget {
  const ScreenLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text('Login'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ScreenRegister(),
                    ));
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: const Center(
        child: Text('Login Screen'),
      ),
    );
  }
}
