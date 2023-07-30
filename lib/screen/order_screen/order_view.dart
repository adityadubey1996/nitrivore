import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nutrivine/presenter/order_screen_presenter/order_screen_presenter.dart';
import 'package:nutrivine/screen/order_screen/order_body.dart';
import 'package:nutrivine/utils/app_colors.dart';
import 'package:nutrivine/utils/enums.dart';
import 'package:nutrivine/utils/text_styles.dart';

class OrderScreen extends StatefulWidget {
  OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  late OrderScreenPreenter presenter;
  @override
  void initState() {
    super.initState();
    presenter = OrderScreenPreenter();
    presenter.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: presenter.orderScreenKey,
      child: ValueListenableBuilder<OrderScreenSelected>(
          valueListenable: presenter.screenSelectedValueNotifier,
          builder: (BuildContext context, OrderScreenSelected screenSelected,
              Widget? child) {
            return Scaffold(
                appBar: AppBar(
                  leading: InkWell(
                    onTap: () {
                      presenter.onBackClick();
                    },
                    child: const Icon(
                      Icons.arrow_back_sharp,
                      color: Colors.black,
                      size: 25.0,
                    ),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [...appBarItems(presenter)],
                  ),
                  actions: null,
                  backgroundColor: AppColors.whiteColor,
                ),
                body: OrderBody(
                  presenter: presenter,
                ));
          }),
    );
  }

  List<Widget> appBarItems(OrderScreenPreenter presenter) {
    List<Widget> widgetList = [];
    presenter.screenOptionMap.forEach((key, value) {
      widgetList.add(InkWell(
        onTap: () {
          presenter.onAppBarItemClick(value);
        },
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(children: [
            SizedBox(
              width: 10,
            ),
            number(key),
            SizedBox(
              width: 10,
            ),
            Text(
              key,
              style: TextStyles.orderNavbarTextStyle,
            ),
          ]),
        ),
      ));
    });
    return widgetList;
  }

  Widget number(String key) {
    bool isSelected = false;
    isSelected = presenter.getIsSelectedFlagFromKey(key);
    int number = presenter.getIsSelectedIndexFromKey(key);
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: isSelected
          ? BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 1,
              ),
            )
          : const BoxDecoration(
              color: AppColors.nonSelectedOrderScreenAppVarNumberBackground,
              shape: BoxShape.circle,
            ),
      child: Text(
        number.toString(),
        style: TextStyles.orderNavbarTextStyle,
      ),
    );
  }
}
