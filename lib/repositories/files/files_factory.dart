import 'package:drive/models/main.dart';
import 'package:drive/repositories/files/files_repository.dart';
import 'package:drive/repositories/files/local_files.dart';

import 'remote_files.dart';

class FilesRepositoyFactory extends FilesRepository {
  final LocalFilesRepository _local;
  final RemoteFilesRepository _remote;

  FilesRepositoyFactory(this._local, this._remote);

  @override
  Future<void> delete(Node node) async {
    await _remote.delete(node);
    await _local.delete(node);
  }

  @override
  Future<Folder> fromPath(String path) {
    //todo check for connectivity and the Data Syncing and select repo
    return _local.fromPath(path);
  }

  @override
  Future<LinkedNode> link(Node origin, Node destination) async {
    final linked = await _remote.link(origin, destination);
    await _local.link(origin, linked);
    return linked;
  }

  @override
  Future<void> move(Node source, Node destination) async {
    final dest = await _remote.move(source, destination);
    await _local.move(source, destination);
  }

  @override
  Future<void> rename(Node node, name) async {
    await _remote.rename(node, name);
    await _local.rename(node, name);
  }

  @override
  Future<Node> share(Node node, List<User> users) async {
    final sharedNode = await _remote.share(node, users);
    await _local.share(sharedNode, users);

    return sharedNode;
  }

  @override
  Future<Folder> createFolder(Folder folder) async {
    final newFolder = await _remote.createFolder(folder);
    await _local.createFolder(newFolder);
    return newFolder;
  }
}
