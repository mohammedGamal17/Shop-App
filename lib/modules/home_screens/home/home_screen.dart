import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop_app/models/home_model/home_model.dart';
import 'package:shop_app/shared/cubit/cubit.dart';

import '../../../shared/components/components.dart';
import '../../../shared/cubit/states.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
          return Scaffold(
            body: cubit.homeModel != null
                ? Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        CarouselSlider(
                            items:cubit.homeModel?.data?.banners?.map((i) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    decoration: BoxDecoration(
                                      color: HexColor('0096C7'),
                                      image: DecorationImage(
                                        image: NetworkImage('${i.image}'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: Text('',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1),
                                  );
                                },
                              );
                            }).toList(),
                            options: CarouselOptions(
                              height: 250.0,
                              aspectRatio: 16 / 9,
                              viewportFraction: 0.8,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              reverse: false,
                              autoPlay: true,
                              autoPlayInterval: const Duration(seconds: 3),
                              autoPlayAnimationDuration:
                                  const Duration(milliseconds: 800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeCenterPage: true,
                              scrollDirection: Axis.horizontal,
                            ))
                      ],
                    ),
                  )
                : circularProgressIndicator(),
          );
        },
      ),
    );
  }
}

/*Widget homeScreen(HomeModel model) */
