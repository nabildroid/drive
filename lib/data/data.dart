import 'package:flutter/material.dart';

import '../models/files_model.dart';
import '../models/syncing_model.dart';
import '../models/users_model.dart';

var users = [
  User("id1", "nabil lakrib", "https://github.com/nabil.png"),
  User("id2", "nabildroid", "https://github.com/nabildroid.png"),
  User("id3", "test", "https://github.com/test.png"),
  User("id4", "uglify", "https://github.com/a.png"),
  User("id5", "marcos", "https://github.com/b.png"),
  User("id6", "algeria", "https://github.com/c.png"),
  User("id7", "testify", "https://github.com/d.png"),
  User("id8", "channing", "https://github.com/e.png"),
];

final histories = [
  NodeHistory(
    users[1],
    DateTime.now().subtract(Duration(days: 1)),
    DateTime.now().subtract(Duration(days: 3)),
    users[5],
  ),
  NodeHistory(
    users[3],
    DateTime.now().subtract(Duration(days: 10)),
    DateTime.now().subtract(Duration(days: 30)),
    users[2],
  ),
  NodeHistory(
    users[1],
    DateTime.now().subtract(Duration(days: 9)),
    DateTime.now().subtract(Duration(days: 22)),
    users[4],
  ),
  NodeHistory(
    users[2],
    DateTime.now().subtract(Duration(days: 120)),
    DateTime.now().subtract(Duration(days: 226)),
    users[7],
  ),
  NodeHistory(
    users[7],
    DateTime.now().subtract(Duration(days: 56)),
    DateTime.now().subtract(Duration(days: 73)),
    users[6],
  ),
];

var files = [
  File(
    node: Node(
        history: [histories[0]],
        id: "azazazazaz",
        users: [users[0], users[1]],
        name: "dog picture",
        parent: "dsdsdsdsd"),
    size: 18,
    hash: "sdsdsdsds",
    metadata: const Metadata("sdsd"),
  ),
  File(
    node: Node(
        history: [histories[1]],
        id: "dzefzrgergrege",
        users: [users[5]],
        name: "khamsat",
        parent: "dsdsdzzzddsdsd"),
    size: 260,
    hash: "sdsdsdsdsrgazrgz",
    metadata: const Metadata("sdsd"),
  ),
  File(
    node: Node(
        history: [histories[2]],
        id: "ezfezrgezrg",
        name: "excel",
        users: [users[1]],
        parent: "dsdsdzzerfead"),
    size: 56,
    hash: "sdsdsdsdtzgegegz",
    metadata: const Metadata("sdsd"),
  ),
  File(
    node: Node(
        history: [histories[3]],
        id: "ezfezrgezrg",
        name: "backup noton",
        users: [],
        parent: "dsdsdzzerfead"),
    size: 152,
    hash: "sdsdsdsdtzgefefre",
    metadata: const Metadata("sdsd"),
  ),
  File(
    node: Node(
        history: [histories[4]],
        id: "ezfezrfezfefrg",
        name: "specter alan walker",
        users: [],
        parent: "fafrfd"),
    size: 60,
    hash: "sdsdsdsdtztzhthhe",
    metadata: const Metadata("sdsd"),
  ),
  File(
    node: Node(
        history: [histories[2]],
        id: "ezfezrfezfefrg",
        name: "faded alan walker",
        users: [users[0], users[1]],
        parent: "fafrfd"),
    size: 60,
    hash: "sdsdsdsdtztrgege",
    metadata: const Metadata("sdsd"),
  ),
];

var folder = [
  Folder(
    node: Node(
      history: [histories[3]],
      id: "ezfezrfezfefrg",
      name: "music",
      parent: "/",
      users: [users[0], users[1], users[3]],
    ),
    childs: [files[4], files[5], files[2]],
    color: Colors.green,
  ),
  Folder(
    node: Node(
      history: [histories[1]],
      id: "ezfeezdzdrfezfefrg",
      name: "music",
      parent: "/",
      users: [users[4]],
    ),
    childs: [files[1], files[5], files[2]],
    color: Colors.green,
  ),
  Folder(
    node: Node(
      history: [histories[1]],
      id: "/",
      name: "music",
      parent: "/",
      users: [users[0], users[1]],
    ),
    childs: [
      files[1],
      files[3],
      Folder(
        node: Node(
            history: [histories[0]],
            id: "ezfezrfezfefrg",
            name: "music",
            users: [],
            parent: "/"),
        childs: [files[4], files[5], files[1]],
        color: Colors.green,
      ),
      Folder(
        node: Node(
            history: [histories[3]],
            id: "ezfezrfezfefrg",
            name: "chainge",
            users: [...users],
            parent: "/"),
        childs: [files[1], files[2], files[4]],
        color: Colors.green,
      ),
    ],
    color: Colors.green,
  ),
];

var syncings = [
  SyncFolder(
    id: "dsdsd",
    local: LocalFolder("dsds/dsd"),
    name: "screenshorts",
    period: Duration(hours: 2),
    remote: folder[1],
    state: SyncFolderState.running,
  ),
  SyncFolder(
    id: "dsdsd",
    local: LocalFolder("dsds/cdsc"),
    name: "wallpaper",
    period: Duration(days: 1),
    remote: folder[2],
    state: SyncFolderState.paused,
  ),
];
