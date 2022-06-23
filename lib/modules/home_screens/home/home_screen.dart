import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:shop_app/models/categories_model/categories.dart';
import 'package:shop_app/models/home_model/home_model.dart';
import 'package:shop_app/models/home_model/product.dart';
import 'package:shop_app/shared/cubit/cubit.dart';

import '../../../shared/components/components.dart';
import '../../../shared/cubit/states.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../../shared/styles/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      AppCubit()
        ..getHomeData()
        ..getCategoriesData(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          if(state is FavSuccessState){
            if(!state.model.status!){
              snack(context, content:'${state.model.message}' );
            }
          }
        },
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            body: cubit.homeModel != null && cubit.categoriesModel != null

            ///put ! after home model to avoid error
                ? homeScreen(cubit.homeModel!, cubit.categoriesModel!, context)
                : circularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget homeScreen(HomeModel model, CategoriesModel categoriesModel, context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
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
            Text(
              'Categories',
              style: Theme
                  .of(context)
                  .textTheme
                  .headline5,
            ),
            SizedBox(
              height: 80.0,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    categoriesBuilder(
                        categoriesModel.data!.data![index], context),
                separatorBuilder: (context, index) => separatorVertical(),
                itemCount: categoriesModel.data!.data!.length,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              'Products',
              style: Theme
                  .of(context)
                  .textTheme
                  .headline5,
            ),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 2.0,
              mainAxisSpacing: 2.0,
              childAspectRatio: 1.0 / 1.37,
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

  Widget categoriesBuilder(DataX model, context) {
    return Container(
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
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Image(
              image: NetworkImage('${model.image}'),
              fit: BoxFit.fill,
              width: 80.0,
              height: 80.0,
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
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
              height: 20.0,
              width: 84.0,
              child: stackText(text: '${model.name}', context),
            ),
          ],
        ),
      ),
    );
  }

  Widget productBuilder(Product model, context) {
    AppCubit cubit = AppCubit.get(context);
    return InkWell(
      onTap: () {
        navigateTo(context, Widget);
      },
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Image(
                    image: NetworkImage('${model.image}'),
                    height: 125.0,
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
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '${model.name}',
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
                            print(model.id);
                            AppCubit.get(context).postFavData(model.id!);
                          },
                          icon: AppCubit
                              .get(context)
                              .favMap[model.id]!
                              ? Icon(
                            cubit.icon = Icons.favorite, color: HexColor('0077B6'),)
                              : Icon(cubit.icon =
                              Icons.favorite_border_outlined, color: HexColor('0077B6'),),
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
