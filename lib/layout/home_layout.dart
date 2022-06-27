import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shop_app/modules/home_screens/cart/cart_screen.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/cubit/cubit.dart';

import '../modules/home_screens/search/search_screen.dart';
import '../shared/cubit/states.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              actions: [
                /*AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: cubit.isSearchExpanded
                      ? 200
                      : 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: kElevationToShadow[7],
                  ),
                  child: Row(
                    children: [
                      Material(
                        type: MaterialType.transparency,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                            onPressed: () {
                              cubit.changeSearchState();
                            },
                            icon: Icon(cubit.searchIcon),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: cubit.isSearchExpanded? TextField(
                            style: Theme.of(context).textTheme.bodyText1,
                            onSubmitted: (value){},
                            onTap: (){navigateTo(context, const SearchScreen());},
                            decoration: const InputDecoration(
                              hintText: 'Search',
                              border: InputBorder.none,
                              fillColor: Colors.white,
                            ),
                          ):null,
                        ),
                      )
                    ],
                  ),
                ),*/
                IconButton(
                    onPressed: () {
                      navigateTo(
                        context,
                         SearchScreen(),
                      );
                    },
                    icon: const Icon(Icons.search_outlined)),
                IconButton(
                    onPressed: () {
                      navigateTo(
                        context,
                        const CartScreen(),
                      );
                    },
                    icon: const Icon(Icons.add_shopping_cart_outlined)),
              ],
              title: Text(cubit.title[cubit.currentIndex],
                  style: Theme.of(context).textTheme.headline5),
            ),
            body: cubit.screen[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              type: BottomNavigationBarType.fixed,
              items: cubit.navBarItem,
              onTap: (index) {
                cubit.navBarChange(index);
              },
            ),
          );
        },
      ),
    );
  }
}
