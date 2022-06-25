import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shop_app/models/user/profile/get_profile/get_profile.dart';

import '../../../shared/components/components.dart';
import '../../../shared/cubit/cubit.dart';
import '../../../shared/cubit/states.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getProfileDate(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);

          return Scaffold(
              body: cubit.getProfile != null
                  ? bodyBuilder(cubit.getProfile!, context)
                  : circularProgressIndicator());
        },
      ),
    );
  }

  Widget bodyBuilder(GetProfile model, context) {
    TextStyle? bodyText1 = Theme.of(context).textTheme.bodyText1;
    TextStyle? headLine5 = Theme.of(context).textTheme.headline5;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 300.0,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: NetworkImage('${model.data?.image}'),
                    opacity: 0.1,
                    fit: BoxFit.cover,
                  )),
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0)),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage('${model.data?.image}'),
                      radius: 100.0,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              'name'.capitalize!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: headLine5,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
              ),
              child: Text(
                '${model.data?.name}'.capitalize!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: bodyText1,
              ),
            ),
            separatorHorizontal(height: 0.5),
            Text(
              'email'.capitalize!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: headLine5,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
              ),
              child: Text(
                '${model.data?.email}',
                style: bodyText1,
              ),
            ),
            separatorHorizontal(height: 0.5),
            Text(
              'phone'.capitalize!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: headLine5,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
              ),
              child: Text(
                '${model.data?.phone}',
                style: bodyText1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
