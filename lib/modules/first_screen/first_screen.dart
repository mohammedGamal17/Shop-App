import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/layout/home.dart';
import 'package:shop_app/modules/Login/login.dart';
import 'package:shop_app/shared/components/components.dart';

import '../../main.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Center(
              child: Text(
                'Welcome To Shop',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            const SizedBox(height: 30.0),
            const Expanded(
              child: Image(
                image: AssetImage('assets/Images/pageview.png'),
              ),
            ),
            const SizedBox(height: 10.0),
            decorationButton(
              context,
              pageRoute: Login(),
              text: 'Log in',
            ),
            const SizedBox(height: 10.0),
           /* decorationButton(
              context,
              pageRoute: const Home(),
              text: 'Continue as a Guest',
            ),*/
            TextButton(
                onPressed: () {
                  sharedPreferences.setInt('fakeId', 1).then((value) {
                    navigateToAndReplace(context, const Home());
                  }).catchError((onError) {
                    if (kDebugMode) {
                      print(onError.toString());
                    }
                  });
                },
                child: Text(
                  'Continue as A guest',
                  style: Theme.of(context).textTheme.bodyText2,
                ))
          ],
        ),
      ),
    );
  }
}
/**/
