import 'package:domain/use_cases/sample/sample_handler.dart';
import 'package:reactiv/controllers/reactive_controller.dart';

class SampleModuleController extends ReactiveController {
  final sampleHandler = SampleHandler();

  @override
  void onInit() {
    super.onInit();

  }
}
