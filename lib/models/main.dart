class User {
  final String id;
  final String name;
  final String avatar;

  final bool isPremuim;

  User(this.id, this.name, this.avatar, this.isPremuim);
}

class Profile {
  final DateTime lastChange;
  final int size;

  Profile(this.lastChange, this.size);
}

class Node {
  final String parent;
  final String name;
  final String id;
  late final DateTime lastChange;

  Node(this.parent, this.name, this.id);
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
