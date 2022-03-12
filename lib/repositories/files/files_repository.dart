import 'package:drive/models/files_model.dart';
import 'package:drive/models/users_model.dart';

abstract class FilesRepository {
  Future<Folder> top() {
    return fromPath("/");
  }

  Future<Folder> fromPath(String path);

  Future<void> move(Node source, Node destination);
  Future<void> rename(Node node, String name);

  Future<Folder> createFolder(Folder folder);

  Future<void> delete(Node node);

  Future<Node> share(Node node, List<User> users);

  Future<LinkedNode> link(Node origin, Node destination);

  // todo create lock folder
}
