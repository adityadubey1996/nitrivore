import 'package:flutter/material.dart';
import 'package:nutrivine/presenter/order_screen_presenter/order_screen_presenter.dart';
import 'package:nutrivine/utils/app_colors.dart';
import 'package:nutrivine/utils/enums.dart';
import 'package:nutrivine/utils/text_styles.dart';

class OrderBody extends StatefulWidget {
  OrderBody({Key? key, required this.presenter}) : super(key: key);
  OrderScreenPreenter presenter;
  @override
  State<OrderBody> createState() => _OrderBodyState();
}

class _OrderBodyState extends State<OrderBody> {
  late GlobalKey infoContainerKey;
  @override
  void initState() {
    super.initState();
    infoContainerKey = GlobalKey();
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.presenter.getOrderScreenSelected()) {
      case OrderScreenSelected.welcome:
        return Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                HeaderContainer(),
                InfoContainer(
                  infoContainerKey: infoContainerKey,
                  presenter: widget.presenter,
                ),
                BottomContainer(orderScreenPresenter: widget.presenter)
              ],
            ),
          ),
        );
      case OrderScreenSelected.selectItems:
        return Container(
          child: Text('selectItems'),
        );
      case OrderScreenSelected.selectSize:
        return Container(
          child: Text('selectSize'),
        );
      case OrderScreenSelected.checkout:
        return Container(
          child: Text('checkout'),
        );

      default:
        return Container(
          child: Text('Error'),
        );
    }
  }
}

class HeaderContainer extends StatelessWidget {
  const HeaderContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 30, 0, 15),
            child: Text(
              'GET READY FOR GOOD FOOD',
              style: TextStyles.headerTextStyle50,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Text(
              "Enjoy delicious, nourishing food that's ready in minutes, too. Find out if we deliver to you.",
              style: TextStyles.headerTextStyle20,
            ),
          ),
        ],
      ),
    );
  }
}

class InfoContainer extends StatelessWidget {
  const InfoContainer(
      {Key? key, required this.infoContainerKey, required this.presenter})
      : super(key: key);
  final GlobalKey infoContainerKey;
  final OrderScreenPreenter presenter;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.fromLTRB(100, 100, 100, 150),
      child: Row(
        key: infoContainerKey,
        children: [
          Flexible(
              flex: 3,
              child: Container(
                height: 500,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(
                    'assets/images/pexels-jane-doan-1092730.jpg',
                  ),
                  fit: BoxFit.cover,
                )),
              )),
          Flexible(
              flex: 2,
              child: Container(
                height: 500,
                padding: EdgeInsets.only(right: 30, left: 30),
                decoration: BoxDecoration(color: AppColors.ivory),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      TextField(
                        decoration: InputDecoration(hintText: 'Enter Pin Code'),
                        controller: presenter.pinCodeController,
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      TextField(
                        decoration:
                            InputDecoration(hintText: 'Enter Email Address'),
                        controller: presenter.emailController,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      StreamBuilder<bool>(
                          stream: presenter.viewPricingLoadingState.stream,
                          initialData: false,
                          builder: (context, snapshot) {
                            return ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    foregroundColor: AppColors.whiteColor,
                                    backgroundColor: AppColors.blackColor,
                                    padding: EdgeInsets.all(25),
                                    textStyle: TextStyles.orderNavbarTextStyle),
                                onPressed: () {
                                  presenter.onViewPricingButtonClick();
                                },
                                child: !(snapshot.data ?? false)
                                    ? Text('View Plans + Pricing')
                                    : CircularProgressIndicator());
                          }),
                      SizedBox(
                        height: 40,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            // TODO: add link text style here
                            TextSpan(
                                text: 'By clicking above, you agree to our'),
                            TextSpan(
                                text: 'Teams of Use',
                                style: TextStyles.underLinetextWelcomeScree),
                            TextSpan(text: ' and'),
                            TextSpan(
                                text: ' Terms of Sale',
                                style: TextStyles.underLinetextWelcomeScree),
                            TextSpan(text: ' and consent to our'),
                            TextSpan(
                                text: ' Privacy Policy',
                                style: TextStyles.underLinetextWelcomeScree),
                            TextSpan(text: ' Already have and accouont?'),
                            TextSpan(text: ' Log In')
                          ],
                        ),
                      ),
                    ]),
              )),
        ],
      ),
    );
  }
}

class BottomContainer extends StatelessWidget {
  const BottomContainer({Key? key, required this.orderScreenPresenter})
      : super(key: key);
  final OrderScreenPreenter orderScreenPresenter;

  @override
  Widget build(BuildContext context) {
    OrderScreenPreenter presenter = orderScreenPresenter;
    return Container(
      height: 100,
      decoration: BoxDecoration(color: AppColors.blackColor),
      width: double.infinity,
      child: Center(
        child: SizedBox(
          height: 15,
          child: StreamBuilder(
              stream: presenter.streamControllerBottomContainerOptions.stream,
              initialData: presenter.bottomContainerOptions,
              builder: (context, snapshot) {
                return ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return FittedBox(
                        child: InkWell(
                          onTap: () {
                            print('tapped');
                          },
                          onHover: (value) {
                            String key =
                                presenter.bottomContainerOptions[index];
                            presenter.mapbottomContainerOptions[key] = value;
                            presenter
                                .updateControllerTypeOfbottomContainerOptions();
                          },
                          child: AnimatedDefaultTextStyle(
                            duration: Duration(milliseconds: 5),
                            style: presenter.mapbottomContainerOptions[
                                    presenter.bottomContainerOptions[index]]!
                                ? TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: AppColors.whiteColor,
                                    fontSize: 15)
                                : TextStyle(
                                    decoration: TextDecoration.none,
                                    color: AppColors.whiteColor,
                                    fontSize: 15),
                            child:
                                Text(presenter.bottomContainerOptions[index]),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(width: 10);
                    },
                    itemCount: presenter.bottomContainerOptions.length);
              }),
        ),
      ),
    );
  }
}
