import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop_app/shared/components/components.dart';

import '../../../models/categories_model/categories.dart';
import '../../../shared/cubit/app_cubit/cubit.dart';
import '../../../shared/cubit/app_cubit/states.dart';
import '../../../shared/styles/colors.dart';

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
                ? bodyBuilder(cubit.categoriesModel!, context)
                : circularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget bodyBuilder(CategoriesModel categoriesModel, context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 1.0,
            mainAxisSpacing: 1.0,
            children: List.generate(
              categoriesModel.data!.data!.length,
              (index) =>
                  categoriesList(categoriesModel.data!.data![index], context),
            ),
          ),
        ],
      ),
    );
  }

  Widget categoriesList(DataX model, context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(10.0),
        onTap: () {},
        child: Container(
          height: 128.0,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: buttonColor,
            gradient: LinearGradient(
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd,
              colors: [
                HexColor('0077B6'),
                HexColor('023E8A'),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: NetworkImage('${model.image}'),
                  fit: BoxFit.fill,
                  height: 80.0,
                  width: 80.0,
                ),
                //separatorVertical(),
                Text(
                  '${model.name}'.capitalize!,
                  style: Theme.of(context).textTheme.bodyText1,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
