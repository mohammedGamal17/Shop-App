import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

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
          return Scaffold(
            body: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => itemBuilder(context),
              separatorBuilder: (context, index) => const SizedBox(height: 0.0),
              itemCount: 10,
            ),
          );
        },
      ),
    );
  }

  Widget itemBuilder(context) {
    AppCubit cubit = AppCubit.get(context);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 150.0,
        width: double.infinity,
        alignment: Alignment.center,
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
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Image(
                    image: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwZ3KUJBqpbi9pHwj9-s8oHd-i7qJGoORMfw&usqp=CAU'),
                    height: 125.0,
                    width: 125.0,
                    fit: BoxFit.fill,
                  ),
                  Row(
                    children: [
                      1 != 0
                          ? Container(
                        color: Colors.red,
                        child: Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 7.0),
                          child: Text(
                            '% 20',
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
                      'IPhone',
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
                      'EGP 2000',
                      style: TextStyle(
                        color: HexColor('0077B6'),
                        fontFamily: 'Changa',
                        fontSize: 14.0,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        if (1 != 0)
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
                            //AppCubit.get(context).postFav(model.id!);
                          },
                          icon: true
                          //AppCubit.get(context).fav[model.id]!
                              ? Icon(
                            cubit.icon = Icons.favorite,
                            color: HexColor('0077B6'),
                          )
                              : Icon(
                            cubit.icon = Icons.favorite_border_outlined,
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
