import 'package:flutter/material.dart';
import 'package:nutrivine/screen/home_screen/home_view_desktop.dart';
import 'package:responsive_builder/responsive_builder.dart';

class IndexScreen extends StatefulWidget {
  IndexScreen({Key? key}) : super(key: key);

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        // Check the sizing information here and return your UI
        if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
          return Desktop();
        }

        if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
          return Container(color: Colors.red);
        }

        if (sizingInformation.deviceScreenType == DeviceScreenType.watch) {
          return Container(color: Colors.yellow);
        }

        return Container(color: Colors.purple);
      },
    );
  }
}
