import 'package:get_it/get_it.dart';
import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:lm_feed_ui_example/services/likeminds_service.dart';

final GetIt locator = GetIt.I;

void _setupLocator(LMSDKCallback callback, String apiKey) {
  locator.registerSingleton(LikeMindsService(callback, apiKey));
}

void setupLMFeed(LMSDKCallback callback, String apiKey) {
  _setupLocator(callback, apiKey);
}
