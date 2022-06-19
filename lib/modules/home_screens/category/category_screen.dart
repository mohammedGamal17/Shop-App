import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shop_app/shared/components/components.dart';

import '../../../models/categories_model/categories.dart';
import '../../../shared/cubit/cubit.dart';
import '../../../shared/cubit/states.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getCategoriesData(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            body: cubit.categoriesModel != null

                ///put ! after home model to avoid error
                ? bodyBuilder(cubit.categoriesModel!)
                : circularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget bodyBuilder(CategoriesModel categoriesModel) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ListView.separated(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) =>
                categoriesList(categoriesModel.data!.data![index], context),
            separatorBuilder: (context, index) => separatorHorizontal(),
            itemCount: categoriesModel.data!.data!.length,
          )
        ],
      ),
    );
  }

  Widget categoriesList(DataX model, context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: NetworkImage('${model.image}'),
            fit: BoxFit.fill,
            height: 70.0,
            width: 70.0,
          ),
          separatorVertical(),
          Text(
            '${model.name}'.capitalize!,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
