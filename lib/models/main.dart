import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String avatar;

  User(this.id, this.name, this.avatar);

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, avatar];
}

class AuthUser extends User {
  final bool isPremuim;

  AuthUser({
    required String id,
    required String name,
    required String avatar,
    required this.isPremuim,
  }) : super(id, name, avatar);

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, avatar, isPremuim];
}

class Profile extends User {
  final DateTime lastChange;
  final int size;

  // todo bloc direct creation
  Profile(User user, this.lastChange, this.size)
      : super(user.id, user.name, user.avatar);

  @override
  // TODO: implement props
  List<Object?> get props => [...super.props, lastChange, size];
}

class NodeHistory {
  final User editedBy;
  final DateTime lastEdit;
  final DateTime created;
  final User createdBy;

  NodeHistory(this.editedBy, this.lastEdit, this.created, this.createdBy);

  NodeHistory.init()
      : editedBy = User("dsdsd", "sdsdd", "https://github.com/nabildroid.png"),
        created = DateTime.now(),
        lastEdit = DateTime.now(),
        createdBy = User("dsdsd", "sdsdd", "https://github.com/nabildroid.png");
}

class Node {
  final String parent;
  final String name;
  final String id;
  final List<NodeHistory> history = [NodeHistory.init()];

  final List<String> users = [];

  bool get isPrivate {
    return users.isEmpty;
  }

  Node(this.parent, this.name, this.id);
}

class LinkedNode extends Node {
  final String origin = "dsdd";
  LinkedNode(String parent, String name, String id) : super(parent, name, id);
}

class Folder extends Node {
  final List<Node> childs;
  final String Color = "ddzdzd";

  Folder(this.childs) : super('', 'Folder', '');
}

class File extends Node {
  final Metadata metadata;

  final int size;
  final String hash;

  File(this.metadata, this.size, this.hash) : super('', 'File', '');
}

class Metadata {
  final String mimic;

  Metadata(this.mimic);
}

class ImageMetaData extends Metadata {
  final String thumbnail = "sdsdsd";
  ImageMetaData(String mimic) : super("image/png");
}

class LocalFolder {
  final String path = "sdsdsd";
}

enum SyncFolderState { running, paused, waiting }
enum OutSyncFolderState { none, local, remote }

class SyncFolder {
  final String id = "sdsdsd";
  final String name = "sdsdsd";
  final Folder remote;
  final LocalFolder local;

  final Duration period = Duration(hours: 2);
  final SyncFolderState state = SyncFolderState.running;

  SyncFolder(this.remote, this.local);
}
