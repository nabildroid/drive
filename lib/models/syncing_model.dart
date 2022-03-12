import 'files_model.dart';

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
