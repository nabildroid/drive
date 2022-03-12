import 'package:drive/models/main.dart';
import 'package:drive/repositories/files/files_repository.dart';
import 'package:drive/repositories/synced_folders/synced_folder_repository.dart';
import 'package:drive/repositories/users/users_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppState extends Equatable {
  final Profile? profile;

  final Folder? rootFolder;
  final List<File> recentFiles;
  final List<SyncFolder> syncedFoldes;

  bool get loading => profile == null || rootFolder == null;

  const AppState._({
    required this.profile,
    required this.rootFolder,
    required this.recentFiles,
    required this.syncedFoldes,
  });

  const AppState.init()
      : profile = null,
        rootFolder = null,
        recentFiles = const [],
        syncedFoldes = const [];

  AppState copyWith({
    Profile? profile,
    Folder? rootFolder,
    List<File>? recentFiles,
    List<SyncFolder>? syncedFoldes,
  }) {
    return AppState._(
      profile: profile ?? this.profile,
      rootFolder: rootFolder ?? this.rootFolder,
      recentFiles: recentFiles ?? this.recentFiles,
      syncedFoldes: syncedFoldes ?? this.syncedFoldes,
    );
  }

  @override
  List<Object?> get props => [profile];
}

class AppCubit extends Cubit<AppState> {
  final ProfileRepository _repository;
  final SyncedFolderRepository _syncedFolderRepository;
  final FilesRepository _filesRepository;

  AppCubit(
    AuthUser user,
    this._repository,
    this._syncedFolderRepository,
    this._filesRepository,
  ) : super(const AppState.init()) {
    _repository.getProfile(user.id).listen(
          (value) => emit(state.copyWith(profile: value)),
        );

    _filesRepository.top().then((value) => emit(
          state.copyWith(rootFolder: value),
        ));

    _syncedFolderRepository.get().then(
          (value) => emit(state.copyWith(syncedFoldes: value)),
        );
  }
}
