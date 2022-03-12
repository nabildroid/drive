import 'package:drive/models/main.dart';
import 'package:drive/models/syncing_model.dart';
import 'package:drive/repositories/synced_folders/local_synced_folder.dart';
import 'package:drive/repositories/synced_folders/remote_synced_folder.dart';
import 'package:drive/repositories/synced_folders/synced_folder_repository.dart';

class SyncedFolderRepositoryFactory extends SyncedFolderRepository {
  final LocalSyncedFolderRepository _local;
  final RemoteSyncedFolderRepository _remote;

  SyncedFolderRepositoryFactory(this._local, this._remote);

  @override
  Future<SyncFolder> create(SyncFolder syncFolder) async {
    final newSyncFolder = await _remote.create(syncFolder);
    await _local.create(newSyncFolder);
    return newSyncFolder;
  }

  @override
  Future<void> delete(SyncFolder syncFolder) async {
    await _remote.delete(syncFolder);
    await _local.delete(syncFolder);
  }

  @override
  Future<List<SyncFolder>> get() async {
    return _local.get();
  }

  @override
  Future<OutSyncFolderState> isOutOfSync(SyncFolder syncFolder) async {
    // todo i don't know the logic for this
    // we should check in two ways
    // remote to local
    // local to remote
    // and sync files deletion in folders
    return _remote.isOutOfSync(syncFolder);
  }

  @override
  Future<SyncFolder> pause(SyncFolder syncFolder) async {
    final pausedFolder = await _remote.pause(syncFolder);
    await _local.pause(
        pausedFolder); // CHECK i don't now is this pattern is going to make issues or bugs
    return pausedFolder;
  }

  @override
  Future<SyncFolder> resume(SyncFolder syncFolder) async {
    final resumedFolder = await _remote.resume(syncFolder);
    await _local.resume(resumedFolder);
    return resumedFolder;
  }

  @override
  Future<void> doSync(SyncFolder syncFolder) {
    // TODO: implement sync
    throw UnimplementedError();
  }

  @override
  Future<SyncFolder> updateConfiguration(SyncFolder syncFolder) async {
    final newConfig = await _remote.updateConfiguration(syncFolder);
    await _local.updateConfiguration(newConfig);
    return newConfig;
  }
}
