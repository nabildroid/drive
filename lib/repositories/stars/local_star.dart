import 'package:drive/models/main.dart';

import 'stars_repository.dart';

class LocalStarRepositoryFactory extends StarsRepository {
  @override
  Future<List<Node>> get() {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<void> star(Node node) {
    // TODO: implement star
    throw UnimplementedError();
  }

  @override
  Future<void> unstar(Node node) {
    // TODO: implement unstar
    throw UnimplementedError();
  }
}