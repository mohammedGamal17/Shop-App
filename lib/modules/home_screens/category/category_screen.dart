import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/cubit/cubit.dart';
import '../../../shared/cubit/states.dart';

class CategoryScreen extends StatelessWidget{
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: Text('Category Screen',style: Theme.of(context).textTheme.bodyText1),
            ),
          );
        },
      ),
    );
  }
}