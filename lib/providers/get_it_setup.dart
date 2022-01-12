import 'package:get_it/get_it.dart';
import 'package:bhive_fund/providers/firebase_dynamic_link.dart';
import 'firebase_dynamic_link.dart';

void setUpGetIt() {
  GetIt.I.registerSingleton<DynamicLinksApi>(DynamicLinksApi());
}
//
