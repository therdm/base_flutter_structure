import 'package:domain/dtos/responses/sample_response.dart';
import 'package:services/data_providers/data_providers.dart';

class SampleDao {
  SampleDao._();

  static final instance = SampleDao._();

  Future<ServiceResponse<SampleResponse>> getSampleData() async {
    final response = await RestApi.instance.get('/sample-data/photos');
    return response.richData(SampleResponse.fromJson(response.body));
    if (response.status.isSuccess) {
      return response.richData(SampleResponse.fromJson(response.body));
    }
  }
}
