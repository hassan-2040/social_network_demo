import 'package:flutter/material.dart';
import 'package:social_network/utilities/size_config.dart';
import 'package:social_network/views/home/components/home_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: HomeBody(),
      ),
    );
  }
}
