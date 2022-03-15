import 'package:equatable/equatable.dart';

import 'files_model.dart';

enum SyncFolderState { running, paused, waiting }
enum OutSyncFolderState { none, local, remote }

class SyncFolder extends Equatable {
  final String id;
  final String name;
  final Folder remote;
  final LocalFolder local;

  final Duration period;
  final SyncFolderState state;

  const SyncFolder({
    required this.id,
    required this.name,
    required this.remote,
    required this.local,
    required this.period,
    required this.state,
  });

  @override
  List<Object?> get props => [id, name, remote, local.path, period, state];
}
