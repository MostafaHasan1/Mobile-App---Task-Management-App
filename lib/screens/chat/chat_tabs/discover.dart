import 'package:login_page_setup/const_config/color_config.dart';
import 'package:login_page_setup/const_config/text_config.dart';
import 'package:flutter/material.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.scaffoldColor,
      body: Center(
        child: Text("Updates Coming soon....",style: TextDesign().bodyTextSmall,),
      ),
    );
  }
}