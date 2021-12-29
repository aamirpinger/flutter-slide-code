import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/core/services/loader_service.dart';

final loaderProvider = Provider<Loader>(
  (ref) => LoaderService(),
);
