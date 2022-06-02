import 'package:flutter/material.dart';

import 'package:shop_app/main.dart';
import 'package:shop_app/modules/first_screen/first_screen.dart';
import 'package:shop_app/shared/components/components.dart';



class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            onPressed: () {
              sharedPreferences.remove('token');
              navigateToAndReplace(
                context,
                const FirstScreen(),
              );
            },
            icon: const Icon(Icons.logout_outlined)),
        /*IconButton(
            onPressed: () {
              ThemeService().changeTheme();
            },
            icon: const Icon(Icons.dark_mode)),*/
      ]),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              Text('data'),
            ],
          ),
        ),
      ),
    );
  }
}
