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
                ? homeScreen(cubit.homeModel!) ///put ! after home model to avoid error
                : circularProgressIndicator(),
          );
        },
      ),
    );
  }
}

Widget homeScreen(HomeModel model) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      children: [
        CarouselSlider(
            items: model.data?.banners?.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: HexColor('0096C7'),
                      image: DecorationImage(
                        image: NetworkImage('${i.image}'),
                        fit: BoxFit.fill,
                      ),
                    ),
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
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            )),
      ],
    ),
  );
}
