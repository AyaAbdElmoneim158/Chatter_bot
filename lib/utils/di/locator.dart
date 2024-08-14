import 'package:get_it/get_it.dart';
import '../../repositories/api_services.dart';
import '../../viewmodel/chat_view_model.dart';

final locator = GetIt.instance;

setUpLocator() {
  locator.registerLazySingleton(() => ChatViewModel());
  locator.registerLazySingleton(() => GoogleGenerativeServices());
}
