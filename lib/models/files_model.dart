import 'dart:math';

import 'package:drive/models/users_model.dart';
import 'package:equatable/equatable.dart';

class NodeHistory extends Equatable {
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

  @override
  // TODO: implement props
  List<Object?> get props => [editedBy, lastEdit, created, createdBy];
}

class Node extends Equatable {
  final String parent;
  final String name;
  final String id;
  final List<NodeHistory> history = [NodeHistory.init()];

  final List<String> users = [];

  bool get isPrivate {
    return users.isEmpty;
  }

  Node(this.parent, this.name, this.id);

  @override
  // TODO: implement props
  List<Object?> get props => [parent, name, id, ...history];
}

class LinkedNode extends Node {
  final String origin = "dsdd";
  LinkedNode(String parent, String name, String id) : super(parent, name, id);

  List<Object?> get props => [...super.props, origin];
}

class Folder extends Node {
  final List<Node> childs;
  final String Color = "ddzdzd";

  Folder(this.childs)
      : super('', 'Folder' + Random().nextInt(100).toString(), '');

  List<Object?> get props => [...super.props, ...childs, Color];
}

class File extends Node {
  final Metadata metadata;

  final int size;
  final String hash;

  File(this.metadata, this.size, this.hash) : super('', 'File', '');
  List<Object?> get props => [...super.props, metadata, size, hash];
}

class Metadata extends Equatable {
  final String mimic;

  Metadata(this.mimic);

  List<Object?> get props => [mimic];
}

class ImageMetaData extends Metadata {
  final String thumbnail = "sdsdsd";
  ImageMetaData(String mimic) : super("image/png");
}

class LocalFolder {
  final String path = "sdsdsd";
}
