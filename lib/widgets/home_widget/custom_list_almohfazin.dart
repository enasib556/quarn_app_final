import 'package:flutter/material.dart';
import 'package:quarn_app/widgets/home_widget/container_almohfazin.dart';

class CustomListAlmohfazin extends StatelessWidget {
  const CustomListAlmohfazin({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 201,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) => const Padding(
          padding: EdgeInsets.all(9.0),
          child: ContainerAlmohfazin(),
        ),
        itemCount: 10,
      ),
    );
  }
}
