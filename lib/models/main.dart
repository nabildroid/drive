class Profile {
  final DateTime lastChange;
  final int size;

  Profile(this.lastChange, this.size);
}

class Node {
  final String parent;
  final String name;
  final String id;

  Node(this.parent, this.name, this.id);
}

class Folder extends Node {
  final DateTime lastChange;

  final List<Node> childs;

  Folder(this.lastChange, this.childs) : super('', '', '');
}

class File extends Node {
  final Metadata metadata;

  final int size;
  final String hash;
  final DateTime lastChange;

  File(this.metadata, this.size, this.hash, this.lastChange)
      : super('', '', '');
}

class Metadata {
  final String mimic;

  Metadata(this.mimic);
}
