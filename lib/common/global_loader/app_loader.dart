import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'app_loader.g.dart';

@riverpod
class AppLoader extends _$AppLoader {
  @override
  bool build() {
    return false;
  }

  void updateLoader(bool val) {
    state = val;
  }
}
