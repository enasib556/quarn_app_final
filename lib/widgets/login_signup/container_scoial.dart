import 'package:flutter/material.dart';

class ContainerSocial extends StatelessWidget {
  final String icon;
  const ContainerSocial({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black,width: 0.2),
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(icon),
          )
      ),
    );
  }
}
