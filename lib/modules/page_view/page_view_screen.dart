import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop_app/main.dart';
import 'package:shop_app/modules/first_screen/first_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


import '../../models/user/login_molel/boarding_model.dart';
import '../../shared/components/components.dart';

import '../../shared/styles/colors.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({Key? key}) : super(key: key);

  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  final pageController = PageController(viewportFraction: 0.8, keepPage: true);

  final List<BoardingModel> boarding = [
    BoardingModel(
      imgUrl: 'assets/Images/pageview.png',
      title: 'Page1',
      body: 'body1',
    ),
    BoardingModel(
      imgUrl: 'assets/Images/pageview.png',
      title: 'Page2',
      body: 'body2',
    ),
    BoardingModel(
      imgUrl: 'assets/Images/pageview.png',
      title: 'Page3',
      body: 'body3',
    ),
  ];

  late bool isLast = false;

  void submit() {
    sharedPreferences.setBool('onBoarding', true).then((value) {
      if (value) {
        navigateToAndReplace(context, const FirstScreen());
      }
    }).catchError((onError) {
      if (kDebugMode) {
        print(onError.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              submit();
            },
            child: Text('SKIP', style: Theme.of(context).textTheme.caption),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemBuilder: (context, index) => pageViewBuilder(boarding[index]),
              physics: const BouncingScrollPhysics(),
              itemCount: boarding.length,
              onPageChanged: (int index) {
                if (index == boarding.length - 1) {
                  setState(
                    () {
                      isLast = true;
                    },
                  );
                } else {
                  isLast = false;
                }
              },
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  children: [
                    Center(
                      child: SmoothPageIndicator(
                        controller: pageController,
                        count: boarding.length,
                        effect: WormEffect(
                          dotHeight: 10.3,
                          dotWidth: 10.3,
                          dotColor: iconColor,
                          spacing: 16.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  if (isLast) {
                    submit();
                  } else {
                    pageController.nextPage(
                      duration: const Duration(milliseconds: 750),
                      curve: Curves.decelerate,
                    );
                  }
                },
                icon: const Icon(FontAwesomeIcons.arrowRight),
                color: iconColor,
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget pageViewBuilder(BoardingModel boarding) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: buttonColor,
            gradient: LinearGradient(
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd,
              colors: [
                HexColor('0077B6'),
                HexColor('023E8A'),
              ],
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                child: Image(
                  image: AssetImage(boarding.imgUrl),
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text(
                    boarding.title,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    boarding.body,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
