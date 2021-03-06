import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop_app/shared/cubit/app_cubit/cubit.dart';

import '../../../models/cart/get_cart/cart_item.dart';
import '../../../shared/components/components.dart';
import '../../../shared/cubit/app_cubit/states.dart';
import '../../../shared/styles/colors.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getCart(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          if (state is AddCartSuccessState) {
            if (!state.addCartModel.status!) {
              snack(context, content: state.addCartModel.message!);
            } else {
              snack(context, content: state.addCartModel.message!);
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Cart',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            body: state is! GetCartLoadingState
                ? listCreation(context)
                : circularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget listCreation(context){
    AppCubit cubit = AppCubit.get(context);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView.separated(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => itemBuilder(
                cubit.getCartModel!.data!.cart_items![index], context),
            separatorBuilder: (context, index) =>
            const SizedBox(height: 0.0),
            itemCount: cubit.getCartModel!.data!.cart_items!.length,
          ),
          //Spacer(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 70.0,
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
                padding: const EdgeInsets.all(8.0),
                child: Row(

                  children: [
                    Text('Total',style: TextStyle(fontSize: 20.0),),
                    Spacer(),
                    Text('EGP ${cubit.getCartModel!.data!.total}'),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget itemBuilder(CartItem model, context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Container(
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 7.0),
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
                                AppCubit.get(context)
                                    .addToCart(model.product!.id);
                              },
                              icon: Icon(
                                Icons.remove_shopping_cart_outlined,
                                color: HexColor('0077B6'),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
