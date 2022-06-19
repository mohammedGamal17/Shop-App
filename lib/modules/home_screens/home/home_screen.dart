import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:shop_app/models/home_model/home_model.dart';
import 'package:shop_app/models/home_model/product.dart';
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

                ///put ! after home model to avoid error
                ? homeScreen(cubit.homeModel!, context)
                : circularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget homeScreen(HomeModel model, context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
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
                          color: HexColor('16679a'),
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
                  height: 200.0,
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
            const SizedBox(
              height: 10.0,
            ),
            SizedBox(
              height: 80.0,
              child: ListView.separated(
                itemBuilder: (context, index) => categoriesBuilder(),
                separatorBuilder: (context, index) => separatorVertical() ,
                itemCount: 10,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 2.0,
              mainAxisSpacing: 2.0,
              childAspectRatio: 1.0 / 1.27,
              children: List.generate(
                model.data!.products!.length,
                (index) =>
                    productBuilder(model.data!.products![index], context),
              ),
            ),
          ],
        ),
      ),
    );
  }
Widget categoriesBuilder(){
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: const [
        Image(image: NetworkImage('https://student.valuxapps.com/storage/uploads/categories/1644527120pTGA7.clothes.png'),width: 80,height: 80.0),
        Text('data'),
      ],
    );
}
  Widget productBuilder(Product model, context) {
    Icon favIcon = Icon(
      AppCubit.get(context).icon,
      color: HexColor('0077B6'),
    );
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image(
                image: NetworkImage('${model.image}'),
                height: 130.0,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
              Row(
                children: [
                  model.discount != 0
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('${model.name}',
                    style: TextStyle(
                      color: HexColor('0077B6'),
                      fontFamily: 'Changa',
                      fontSize: 12.0,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),

                ///if discount = 0 hide it
                Text(
                  'EGP ${model.price}',
                  style: TextStyle(
                    color: HexColor('0077B6'),
                    fontFamily: 'Changa',
                    fontSize: 14.0,
                  ),
                ),

                Row(
                  children: [
                    if (model.discount != 0)
                      Text(
                        'EGP ${model.oldPrice}',
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
                        AppCubit.get(context).changeIconFav();
                      },
                      icon: favIcon,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
