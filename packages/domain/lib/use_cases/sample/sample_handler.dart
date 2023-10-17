import 'package:domain/daos/sample/sample_dao.dart';
import 'package:domain/dtos/responses/sample_response.dart';
import 'package:services/network_state_manager/network_state/service_state_manager.dart';

class SampleHandler with ServiceStateMixin {
  SampleHandler();

  final photos = ReactiveList<PhotosData>([]);

  Future<ServiceStatus> fetchSampleData() async {
    return serviceObserver(() async {
      final response = await SampleDao.instance.getSampleData();
      if (response.status.isSuccess) {
        photos.value = response.body?.photos ?? [];
      }
      return response.status;
    });
  }
}
