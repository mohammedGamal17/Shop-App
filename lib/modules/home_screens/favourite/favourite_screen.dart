import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';


import '../../../models/get_fav_model/data_x.dart';

import '../../../shared/components/components.dart';
import '../../../shared/cubit/cubit.dart';
import '../../../shared/cubit/states.dart';
import '../../../shared/styles/colors.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getFavData(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            body: state is !GetFavLoadingState
                ? ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => itemBuilder(
                        cubit.getFavModel!.data!.data![index], context),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 0.0),
                    itemCount: cubit.getFavModel!.data!.data!.length,
                  )
                : circularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget itemBuilder(DataX model, context) {

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
                    image: NetworkImage('${model.product?.image}'),
                    height: 125.0,
                    width: 125.0,
                    fit: BoxFit.fill,
                  ),
                  Row(
                    children: [
                      model.product?.discount != 0
                          ? Container(
                              color: Colors.red,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 7.0),
                                child: Text(
                                  '% ${model.product?.discount}',
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
                      '${model.product?.name}',
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
                      'EGP ${model.product?.oldPrice}',
                      style: TextStyle(
                        color: HexColor('0077B6'),
                        fontFamily: 'Changa',
                        fontSize: 14.0,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        if (model.product?.discount != 0)
                          Text(
                            'EGP 2000',
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
                             AppCubit.get(context).postFavData(model.id!);
                          },
                          icon: AppCubit.get(context)
                                      .favMap[model.product?.id] ==
                                  null
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
