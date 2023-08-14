import 'package:flutter/material.dart';

import '../../core/env/env.dart';
import '../template/base_layout.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      body: Container(
        color: Colors.red,
        child: Text(Env.instance.get('base_url')),
      ),
    );
  }
}
