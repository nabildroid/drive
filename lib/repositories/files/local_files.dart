import 'package:drive/models/main.dart';

import 'files_repository.dart';

class LocalFilesRepository extends FilesRepository {
  @override
  Future<void> delete(Node node) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<Node>> fromPath(String path) {
    // TODO: implement fromPath
    throw UnimplementedError();
  }

  @override
  Future<LinkedNode> link(Node origin, Node destination) {
    // TODO: implement link
    throw UnimplementedError();
  }

  @override
  Future<void> move(Node source, Node destination) {
    // TODO: implement move
    throw UnimplementedError();
  }

  @override
  Future<void> rename(Node node, name) {
    // TODO: implement rename
    throw UnimplementedError();
  }

  @override
  Future<Node> share(Node node, List<User> users) {
    // TODO: implement share
    throw UnimplementedError();
  }

  @override
  Future<Folder> createFolder(Folder folder) {
    // TODO: implement createFolder
    throw UnimplementedError();
  }
}
