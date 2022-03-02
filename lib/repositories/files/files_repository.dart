import 'package:drive/models/main.dart';

abstract class FilesRepository {
  Future<Node> top() {
    return fromPath("/");
  }

  Future<Node> fromPath(String path);

  Future<void> move(Node source, Node destination);
  Future<void> rename(Node node, name);

  Future<void> delete(Node node);

  Future<Node> share(Node node, List<User> users);

  Future<LinkedNode> link(Node origin, Node destination);

  // todo create lock folder
}
