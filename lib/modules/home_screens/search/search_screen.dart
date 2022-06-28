import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/cubit/cubit.dart';

import '../../../models/search/dataX.dart';
import '../../../shared/cubit/states.dart';
import '../../../shared/styles/colors.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  final search = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    textFormField(
                      autoFocus: true,
                      controller: search,
                      prefix: Icons.search_outlined,
                      textInputType: TextInputType.text,
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'Please Enter Yor Search Data';
                        }
                        return null;
                      },
                      onSubmit: (String value) {
                        cubit.searchProduct(value);
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    if (state is SearchLoadingState)
                      const LinearProgressIndicator(color: Colors.white),
                    if (state is SearchSuccessState)
                      Expanded(
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) => itemBuilder(cubit.searchModel!.data!.data![index],context, isOldPrice: false),
                          separatorBuilder:(context, index) => separatorHorizontal(),
                          itemCount: cubit.searchModel!.data!.data!.length,
                        ),
                      )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget itemBuilder(DataX model, context, {bool isOldPrice = true}) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 130.0,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: buttonColor,
          gradient: LinearGradient(
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomEnd,
            colors: [
              HexColor('FFFFFF'),
              HexColor('FFFFFF'),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Image(
                    image: NetworkImage(model.image),
                    height: 125.0,
                    width: 125.0,
                    fit: BoxFit.fill,
                  ),
                  Row(
                    children: [
                      model.discount != 0 && isOldPrice
                          ? Container(
                              color: Colors.red,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 7.0),
                                child: Text(
                                  '% ${model.discount}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 10.0,
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      model.name,
                      style: TextStyle(
                        color: HexColor('0077B6'),
                        fontFamily: 'Changa',
                        fontSize: 12.0,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                    ///if discount = 0 hide it
                    Text(
                      'EGP ${model.price}',
                      style: TextStyle(
                        color: HexColor('0077B6'),
                        fontFamily: 'Changa',
                        fontSize: 14.0,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        if (model.discount != 0 && isOldPrice)
                          Text(
                            '${model.oldPrice}',
                            style: TextStyle(
                              color: HexColor('90E0EF'),
                              fontFamily: 'Changa',
                              fontSize: 10.0,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            AppCubit.get(context).postFavData(model.id);
                          },
                          icon: AppCubit.get(context).favMap[model.id] == true
                              ? Icon(
                                  AppCubit.get(context).icon = Icons.favorite,
                                  color: HexColor('0077B6'),
                                )
                              : Icon(
                                  AppCubit.get(context).icon =
                                      Icons.favorite_border_outlined,
                                  color: HexColor('0077B6'),
                                ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
