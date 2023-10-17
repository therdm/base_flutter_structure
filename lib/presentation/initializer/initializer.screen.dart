import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reactiv/reactiv.dart';
import 'package:base_flutter/infrastructure/navigation/navigation.dart';
import 'package:base_flutter/presentation/initializer/controllers/initializer.controller.dart';

class InitializerScreen extends ReactiveStateWidget<InitializerController> {
  const InitializerScreen({super.key, required this.state});

  @override
  BindController<InitializerController>? bindController() {
    return BindController(controller: () => InitializerController(), autoDispose: true);
  }

  final GoRouterState state;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ///Do any initial screen operation like check user is already logged in or not etc
      ///then decide where to go and go there
      Future.delayed(const Duration(milliseconds: 1500)).then((value) {
        if (state.location == '/') {
          Routes.of(context).toLocationSampleModule();
        }
      });
    });


    return const Scaffold(
      body: Center(
        child: Text("I'm the Initial Screen"),
      ),
    );
  }
}
