import 'package:drive/models/main.dart';
import 'package:drive/repositories/stars/local_star.dart';

import 'remote_star.dart';
import 'stars_repository.dart';

class StarRepositoryFactory extends StarsRepository {
  final LocalStarRepository _local;
  final RemoteStarRepository _remote;

  StarRepositoryFactory(this._local, this._remote);
  @override
  Future<List<Node>> get() {
    return _local.get();
  }

  @override
  Future<void> star(Node node) async {
    await _remote.star(node);
    await _local.star(node);
  }

  @override
  Future<void> unstar(Node node) async {
    await _remote.unstar(node);
    await _local.unstar(node);
  }
}
