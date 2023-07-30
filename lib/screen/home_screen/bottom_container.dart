import 'package:flutter/material.dart';
import 'package:nutrivine/presenter/home_screen_presenter/bottom_container_presenter.dart';
import 'package:nutrivine/utils/app_colors.dart';

class BottomContainer extends StatelessWidget {
  BottomContainer({Key? key}) : super(key: key);
  BottomContainerPresenter presenter = BottomContainerPresenter();
  @override
  Widget build(BuildContext context) {
    presenter.initialize();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StreamBuilder(
            stream: presenter.streamControllersocialProfile.stream,
            initialData: presenter.mapsocialProfile,
            builder: (context, snapshot) {
              return Expanded(
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          print('tapped');
                        },
                        onHover: (value) {
                          String key = presenter.socialProfile[index];
                          presenter.mapsocialProfile[key] = value;
                          presenter.updateControllersocialProfile();
                        },
                        child: AnimatedDefaultTextStyle(
                          duration: Duration(milliseconds: 5),
                          style: presenter.mapsocialProfile[
                                  presenter.socialProfile[index]]!
                              ? TextStyle(decoration: TextDecoration.underline)
                              : TextStyle(decoration: TextDecoration.none),
                          child: Text(presenter.socialProfile[index]),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: 10);
                    },
                    itemCount: presenter.socialProfile.length),
              );
            }),
        StreamBuilder(
            stream: presenter.streamControllercompanyOptions.stream,
            initialData: presenter.mapcompanyOptions,
            builder: (context, snapshot) {
              return Expanded(
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          print('tapped');
                        },
                        onHover: (value) {
                          String key = presenter.companyOptions[index];
                          presenter.mapcompanyOptions[key] = value;
                          presenter.updateControllerCompanyOptionsProfile();
                        },
                        child: AnimatedDefaultTextStyle(
                          duration: Duration(milliseconds: 5),
                          style: presenter.mapcompanyOptions[
                                  presenter.companyOptions[index]]!
                              ? TextStyle(decoration: TextDecoration.underline)
                              : TextStyle(decoration: TextDecoration.none),
                          child: Text(presenter.companyOptions[index]),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: 10);
                    },
                    itemCount: presenter.companyOptions.length),
              );
            }),
        StreamBuilder(
            stream: presenter.streamControllertypeOfFood.stream,
            initialData: presenter.maptypeOfFood,
            builder: (context, snapshot) {
              return Expanded(
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          print('tapped');
                        },
                        onHover: (value) {
                          String key = presenter.typeOfFood[index];
                          presenter.maptypeOfFood[key] = value;
                          presenter.updateControllerTypeOfFoodProfile();
                        },
                        child: AnimatedDefaultTextStyle(
                          duration: Duration(milliseconds: 5),
                          style: presenter
                                  .maptypeOfFood[presenter.typeOfFood[index]]!
                              ? TextStyle(decoration: TextDecoration.underline)
                              : TextStyle(decoration: TextDecoration.none),
                          child: Text(presenter.typeOfFood[index]),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: 10);
                    },
                    itemCount: presenter.typeOfFood.length),
              );
            }),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Your Email would look peachy here'),
            SizedBox(
              height: 25,
              width: 100,
              child: TextField(
                controller: presenter.textControllerForEmailField,
              ),
            ),
            GestureDetector(
              child: Container(
                child: Text("Can't Wait"),
              ),
            )
          ],
        ),
      ],
    );
  }
}
