import 'dart:math';

import 'package:drive/models/users_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class NodeHistory extends Equatable {
  final User editedBy;
  final DateTime lastEdit;
  final DateTime created;
  final User createdBy;

  const NodeHistory(
    this.editedBy,
    this.lastEdit,
    this.created,
    this.createdBy,
  );

  @override
  List<Object?> get props => [editedBy, lastEdit, created, createdBy];
}

class Node extends Equatable {
  final String parent;
  final String name;
  final String id;
  final List<NodeHistory> history;

  final List<User> users;

  bool get isPrivate {
    return users.isEmpty;
  }

  Node({
    required this.parent,
    required this.name,
    required this.id,
    required this.history,
    required this.users,
  });

  @override
  List<Object?> get props => [parent, name, id, ...history, ...users];
}

class LinkedNode extends Node {
  final String origin;
  LinkedNode(this.origin, Node node)
      : super(
          id: node.id,
          name: node.name,
          history: node.history,
          parent: node.parent,
          users: node.users,
        );

  @override
  List<Object?> get props => [...super.props, origin];
}

class Folder extends Node {
  final List<Node> childs;
  final Color color;

  Folder({
    required Node node,
    required this.childs,
    required this.color,
  }) : super(
          id: node.id,
          name: node.name,
          history: node.history,
          parent: node.parent,
          users: node.users,
        );

  @override
  List<Object?> get props => [...super.props, ...childs, color];
}

class File extends Node {
  final Metadata metadata;

  final int size;
  final String hash;

  File({
    required Node node,
    required this.size,
    required this.hash,
    required this.metadata,
  }) : super(
          id: node.id,
          name: node.name,
          history: node.history,
          parent: node.parent,
          users: node.users,
        );
  @override
  List<Object?> get props => [...super.props, metadata, size, hash];
}

class Metadata extends Equatable {
  final String mimic;

  const Metadata(this.mimic);

  @override
  List<Object?> get props => [mimic];
}

class ImageMetaData extends Metadata {
  final String thumbnail;
  const ImageMetaData(this.thumbnail) : super("image/png");
}

class LocalFolder {
  final String path;

  LocalFolder(this.path);
}
