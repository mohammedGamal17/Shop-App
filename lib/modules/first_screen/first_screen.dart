import 'package:flutter/material.dart';
import 'package:shop_app/modules/Login/login.dart';
import 'package:shop_app/modules/signup/signup.dart';
import 'package:shop_app/shared/components/components.dart';

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
            decorationButton(
              context,
              pageRoute: SignUp(),
              text: 'Sign Up',
            ),
          ],
        ),
      ),
    );
  }
}
/*IconButton(onPressed: () {ThemeService().changeTheme();},icon: const Icon(Icons.dark_mode)),*/
