import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/cubit/cubit.dart';

import '../../../shared/components/components.dart';
import '../../../shared/cubit/states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getHomeData(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Container(
            child: cubit.homeModel != null
                ? homeScreen()
                : circularProgressIndicator(),
          );
        },
      ),
    );
  }
}

Widget homeScreen() {
  return Column(
    children: const [
      Text('Home'),
      SizedBox(
        height: 10.0,
      ),
      Text('Screen'),
    ],
  );
}
