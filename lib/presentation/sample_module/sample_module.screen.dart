
import 'package:flutter/material.dart';
import 'package:graphics/graphics_consts/graphics_string_consts.dart';
import 'package:graphics/widgets/cards/photo_card.dart';
import 'package:reactiv/reactiv.dart';
import 'package:base_flutter/presentation/sample_module/controllers/sample_module.controller.dart';
import 'package:services/network_state_manager/network_state/service_state_manager.dart';
import 'package:services/network_widgets/network_state_view.dart';
import 'package:services/network_widgets/show_snackbar.dart';

class SampleModuleScreen extends ReactiveStateWidget<SampleModuleController> {
  const SampleModuleScreen({super.key});

  @override
  BindController<SampleModuleController>? bindController() {
    return BindController(controller: () => SampleModuleController(), autoDispose: true);
  }

  @override
  void initStateWithContext(BuildContext context) {
    super.initStateWithContext(context);
    controller.sampleHandler.fetchSampleData().then((value) {
      if(value.isError) {
       showSnackBar(context: context, title: value.message, isError: true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var photos = controller.sampleHandler.photos;
    return Scaffold(
      appBar: AppBar(
        title: const Text(GraphicsStringConsts.sampleData),
      ),
      body: Observer(
          listenable: controller.sampleHandler.serviceState,
          listener: (ServiceState state) {
            return NetworkStateView.sizeFree(
              networkState: state,
              child: (photos.isNotEmpty)
                  ? GridView.builder(
                      itemBuilder: (context, index) {
                        return PhotoCard(
                          title: photos[index].title,
                          imgUrl: photos[index].url,
                          description: photos[index].description,
                        );
                      },
                      itemCount: photos.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.3,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                          mainAxisExtent: 350),
                    )
                  : const Text(GraphicsStringConsts.noDataFound),
            );
          }),
    );
  }
}
