import 'package:flutter/foundation.dart';
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
              sharedPreferences.remove('token').then((value) {
                sharedPreferences.remove('fakeId');
                navigateToAndReplace(
                  context,
                  const FirstScreen(),
                );
              }).catchError((onError){
                if (kDebugMode) {
                  print(onError.toString());
                }
              });
            },
            icon: const Icon(Icons.logout_outlined)),
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
