import 'package:sealed_annotations/sealed_annotations.dart';

part 'request_status.sealed.dart';

@Sealed()
abstract class _RequestStatus<T> {
  void initial();
  void loading();
  void success({T? data});
  void failure({required String error});
}
