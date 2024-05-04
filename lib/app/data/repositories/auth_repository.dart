import 'package:get/get.dart';
import '../provider/network/api_endpoint.dart';
import '../provider/network/api_provider.dart';

class AuthRepository {
  late APIProvider apiClient;

  AuthRepository() {
    apiClient = APIProvider();
  }


 
}