import 'package:flutter/material.dart';
import 'package:shop_app/main.dart';
import 'package:shop_app/shared/components/components.dart';

import '../modules/page_view/page_view_screen.dart';
import '../shared/styles/theme_service.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            onPressed: () {
              sharedPreferences.clear();
              navigateToAndReplace(
                context,
                const PageViewScreen(),
              );
            },
            icon: const Icon(Icons.logout_outlined)),
        IconButton(onPressed: () {ThemeService().changeTheme();},icon: const Icon(Icons.dark_mode)),
      ]),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('data'),
            ],
          ),
        ),
      ),
    );
  }
}
