import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nutrivine/utils/app_colors.dart';
import 'package:nutrivine/utils/icons.dart';
import 'package:nutrivine/utils/text_styles.dart';

class NavBar extends StatefulWidget {
  NavBar({Key? key, required this.navbarKey, required this.scrollController})
      : super(key: key);
  GlobalKey navbarKey;
  ScrollController scrollController;

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.scrollController.addListener(onScrollListener);
    });
  }

  bool showBoxShadowNavbar = false;
  void onScrollListener() {
    if (widget.scrollController.offset > 0 && !showBoxShadowNavbar) {
      setState(() {
        showBoxShadowNavbar = true;
      });
    } else {
      setState(() {
        showBoxShadowNavbar = false;
      });
    }
  }

  BoxDecoration navbarBoxDecorationWithBoxShadow =
      BoxDecoration(color: AppColors.whiteColor, boxShadow: [
    BoxShadow(
      color: Colors.grey.shade200,
      spreadRadius: 1,
      blurRadius: 3,
      offset: const Offset(0, 5),
    ),
    BoxShadow(
      color: Colors.grey.shade100,
      offset: const Offset(-3, 0),
    ),
    BoxShadow(
      color: Colors.grey.shade100,
      offset: const Offset(3, 0),
    )
  ]);
  @override
  Widget build(BuildContext context) {
    return Container(
      key: widget.navbarKey,
      height: 80,
      decoration: showBoxShadowNavbar
          ? navbarBoxDecorationWithBoxShadow
          : const BoxDecoration(),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 80,
              child:
                  SvgPicture.asset(height: 20, width: 20, AppIcons.navbarIcon),
            ),
            Row(children: [
              Wrap(
                spacing: 15,
                children: [
                  Container(
                    child: Text(
                      'About us',
                      style: TextStyles.navBarTextStyle,
                    ),
                  ),
                  Container(
                    child: Text(
                      'Our Recipes',
                      style: TextStyles.navBarTextStyle,
                    ),
                  ),
                  Container(
                    child: Text(
                      'About Us',
                      style: TextStyles.navBarTextStyle,
                    ),
                  ),
                  Container(
                    child: Text(
                      'Our Recipes',
                      style: TextStyles.navBarTextStyle,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 15,
              ),
              Row(
                children: [
                  SvgPicture.asset(height: 20, width: 20, AppIcons.searchIcon),
                  const SizedBox(
                    width: 10,
                  ),
                  SvgPicture.asset(height: 20, width: 20, AppIcons.userIcon),
                  const SizedBox(
                    width: 10,
                  ),
                  SvgPicture.asset(height: 20, width: 20, AppIcons.cartIcon),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
