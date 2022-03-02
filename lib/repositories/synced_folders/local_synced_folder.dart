import 'package:drive/models/main.dart';
import 'package:drive/repositories/synced_folders/synced_folder_repository.dart';

class LocalSyncedFolderRepository extends SyncedFolderRepository {
  @override
  Future<SyncFolder> create(SyncFolder syncFolder) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<void> delete(SyncFolder syncFolder) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<SyncFolder>> get() {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<OutSyncFolderState> isOutOfSync(SyncFolder syncFolder) {
    // TODO: implement isOutOfSync
    throw UnimplementedError();
  }

  @override
  Future<SyncFolder> pause(SyncFolder syncFolder) {
    // TODO: implement pause
    throw UnimplementedError();
  }

  @override
  Future<SyncFolder> resume(SyncFolder syncFolder) {
    // TODO: implement resume
    throw UnimplementedError();
  }

  @override
  Future<void> doSync(SyncFolder syncFolder) {
    // TODO: implement sync
    throw UnimplementedError();
  }

  @override
  Future<SyncFolder> updateConfiguration(SyncFolder syncFolder) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
