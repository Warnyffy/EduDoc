import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'getstarted_controller.dart';

class GetstartedPage extends GetView<GetstartedController> {
  const GetstartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('GetstartedPage')),
        body: const SafeArea(child: Text('GetstartedController')));
  }
}
