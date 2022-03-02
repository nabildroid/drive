class User {
  final String id;
  final String name;
  final String avatar;

  User(this.id, this.name, this.avatar);
}

class Profile extends User {
  final DateTime lastChange;
  final int size;
  final bool isPremuim;

  Profile(this.lastChange, this.size, this.isPremuim) : super('', '', '');
}

class NodeHistory {
  final User editedBy;
  final DateTime lastEdit;
  final DateTime created;
  final User createdBy;

  NodeHistory(this.editedBy, this.lastEdit, this.created, this.createdBy);
}

class Node {
  final String parent;
  final String name;
  final String id;
  late final List<NodeHistory> history;

  late final List<String> users;

  bool get isPrivate {
    return users.isEmpty;
  }

  Node(this.parent, this.name, this.id);
}

class LinkedNode extends Node {
  late final String origin;
  LinkedNode(String parent, String name, String id) : super(parent, name, id);
}

class Folder extends Node {
  final List<Node> childs;
  late final String Color;

  Folder(this.childs) : super('', '', '');
}

class File extends Node {
  final Metadata metadata;

  final int size;
  final String hash;

  File(this.metadata, this.size, this.hash) : super('', '', '');
}

class Metadata {
  final String mimic;

  Metadata(this.mimic);
}

class ImageMetaData extends Metadata {
  late final String thumbnail;
  ImageMetaData(String mimic) : super("image/png");
}

class LocalFolder {
  late final String path;
}

enum SyncFolderState { running, paused, waiting }

class SyncFolder {
  late final String id;
  late final String name;
  final Folder remote;
  final LocalFolder local;

  late final Duration period;
  late final SyncFolderState state;

  SyncFolder(this.remote, this.local);
}
