import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nutrivine/presenter/home_screen_presenter/home_screen_presenter.dart';
import 'package:nutrivine/screen/home_screen/bottom_container.dart';
import 'package:nutrivine/screen/home_screen/navbar.dart';
import 'package:nutrivine/utils/app_colors.dart';
import 'package:nutrivine/utils/button_styles.dart';
import 'package:nutrivine/utils/icons.dart';
import 'package:nutrivine/utils/text_styles.dart';

class Desktop extends StatefulWidget {
  Desktop({Key? key}) : super(key: key);

  @override
  State<Desktop> createState() => _DesktopState();
}

class _DesktopState extends State<Desktop> {
  GlobalKey buttonKey = GlobalKey();
  GlobalKey navbarKey = GlobalKey();
  GlobalKey belowNavbarTextColumnKey = GlobalKey();
  double buttonPosition = 80;
  double buttonWidth = 0;
  ScrollController scrollController = ScrollController();
  late HomeScreenPresenter homeScreenPresenter;

  @override
  void initState() {
    homeScreenPresenter = HomeScreenPresenter();
    homeScreenPresenter.initialize();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      RenderBox buttonBox =
          buttonKey.currentContext!.findRenderObject() as RenderBox;
      RenderBox navbarBox =
          navbarKey.currentContext!.findRenderObject() as RenderBox;
      RenderBox belowNavbarTextColumnBox =
          belowNavbarTextColumnKey.currentContext!.findRenderObject()
              as RenderBox;

      final buttonBoxPosition = buttonBox.localToGlobal(Offset.zero);
      final navbarBoxPosition = navbarBox.localToGlobal(Offset.zero);
      final belowNavbarTextColumnBoxPosition =
          belowNavbarTextColumnBox.localToGlobal(Offset.zero);
      // printPosition(buttonBoxPosition);
      // printPosition(navbarBoxPosition);

      // printPosition(belowNavbarTextColumnBoxPosition);
      buttonPosition = belowNavbarTextColumnBoxPosition.dy +
          belowNavbarTextColumnBox.size.height -
          buttonBox.size.height;
      buttonWidth =
          MediaQuery.of(context).size.width / 2 - buttonBox.size.width / 2;

      setState(() {});
    });
  }

  void printPosition(temp) {
    print('position y ${temp.dy}, position x ${temp.dx}');
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    TextStyle navbarStyle = const TextStyle(
        decoration: TextDecoration.none,
        fontSize: 20,
        color: AppColors.blackColor,
        fontWeight: FontWeight.normal);
    TextStyle textFollowingnavbarStyle = const TextStyle(
        decoration: TextDecoration.none,
        fontSize: 50,
        color: AppColors.blackColor);
    TextStyle textFollowingnavbarBelowStyle = const TextStyle(
        decoration: TextDecoration.none,
        fontSize: 20,
        color: AppColors.blackColor);

    TextStyle buttonTextStyle = TextStyle(
        decoration: TextDecoration.none,
        fontSize: 15,
        color: AppColors.whiteColor);

    TextStyle foodContainerTextStyle = TextStyle(
        decoration: TextDecoration.none,
        fontSize: 35,
        color: AppColors.blackColor);
    TextStyle foodContainerTextStyleText = TextStyle(
        decoration: TextDecoration.none,
        fontSize: 15,
        fontWeight: FontWeight.normal,
        color: AppColors.blackColor);

    TextStyle foodOrderingContainerTextStyle = TextStyle(
        decoration: TextDecoration.none,
        fontSize: 20,
        fontWeight: FontWeight.w900,
        color: AppColors.blackColor);

    TextStyle skipButtonBelowText = TextStyle(
        decoration: TextDecoration.none,
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: AppColors.blackColor);

    return ScaffoldMessenger(
      child: Scaffold(
        body: Column(
          children: [
            NavBar(
              navbarKey: navbarKey,
              scrollController: scrollController,
            ),
            Expanded(
              child: SingleChildScrollView(
                controller: scrollController,
                child: Stack(
                  children: [
                    Column(children: [
                      Column(
                        key: belowNavbarTextColumnKey,
                        children: [
                          Text(
                            'VEG OUT ON VARIETY',
                            textAlign: TextAlign.center,
                            style: textFollowingnavbarStyle,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'ready when you are food built on fruits + veggies',
                            textAlign: TextAlign.center,
                            style: textFollowingnavbarBelowStyle,
                          ),
                          SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                      Container(
                        height: height * 0.75,
                        child: Row(
                          children: [
                            Expanded(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'NONE OF THE PREP.',
                                  style: foodContainerTextStyle,
                                ),
                                Text(
                                  'ALL THE VICTORY.',
                                  style: foodContainerTextStyle,
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                Text(
                                  'Daily Harvest does more so you can do less. Think nourishing and delicious',
                                  style: foodContainerTextStyleText,
                                ),
                                Text(
                                  'fruit + veg-packed food without the prep, mess, or stress.',
                                  style: foodContainerTextStyleText,
                                ),
                              ],
                            )),
                            Container(
                              width: screenWidth * 0.45,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/pexels-jane-doan-1092730.jpg'),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: height * 0.80,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Center(
                              child: Text('HOW IT WORKS',
                                  style: foodContainerTextStyle),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      height: 300,
                                      width: screenWidth / 4,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/pexels-jane-doan-1092730.jpg'),
                                          fit: BoxFit.cover,
                                        ),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    SizedBox(
                                      width: screenWidth / 4,
                                      child: Text(
                                        'CHOOSE WHAT YOU WANT',
                                        style: foodOrderingContainerTextStyle,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    SizedBox(
                                      width: screenWidth / 4,
                                      child: Text(
                                        'Build your box with nourishing items for breakfast, lunch, dinner, and snack time.',
                                        style: foodContainerTextStyleText,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 300,
                                      width: screenWidth / 4,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/pexels-jane-doan-1092730.jpg'),
                                          fit: BoxFit.cover,
                                        ),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    SizedBox(
                                      width: screenWidth / 4,
                                      child: Text(
                                        'YOUR FOOD,YOUR SCHEDULE',
                                        style: foodOrderingContainerTextStyle,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    SizedBox(
                                      width: screenWidth / 4,
                                      child: Text(
                                        'Select a plan and delivery day. Pop your items in the freezer and enjoy whenever.',
                                        style: foodContainerTextStyleText,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      height: 300,
                                      width: screenWidth / 4,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/pexels-jane-doan-1092730.jpg'),
                                          fit: BoxFit.cover,
                                        ),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    SizedBox(
                                      width: screenWidth / 4,
                                      child: Text(
                                        'QUICK NO FUSS PREP',
                                        style: foodOrderingContainerTextStyle,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    SizedBox(
                                      width: screenWidth / 4,
                                      child: Text(
                                        'Get fruit + veg-packed food without the shopping, chopping, or mess.',
                                        style: foodContainerTextStyleText,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                ElevatedButton(
                                    style: ButtonStyes.desktopButtonStyle,
                                    onPressed: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 20, 20, 20),
                                      child: Text(
                                        "LET'S GO",
                                        textAlign: TextAlign.center,
                                        style: buttonTextStyle,
                                      ),
                                    )),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Skip, pause or cancel anytime',
                                  style: skipButtonBelowText,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: AppColors.ivory,
                        child: BottomContainer(),
                      ),
                    ]),
                    Positioned(
                      top: buttonPosition,
                      left: buttonWidth,
                      child: ElevatedButton(
                          key: buttonKey,
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(
                                AppColors.whiteColor),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                AppColors.blackColor),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            )),
                          ),
                          onPressed: () {
                            homeScreenPresenter.navigateToOrderScreen(context);
                            // Navigator.of(context)
                            //     .pushReplacementNamed('home_screen');
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),

                            // padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                            child: Text(
                              'Build Your Own Box',
                              textAlign: TextAlign.center,
                              style: buttonTextStyle,
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
