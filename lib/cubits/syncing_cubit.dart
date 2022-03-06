import 'package:bloc/bloc.dart';
import 'package:drive/cubits/app_cubit.dart';
import 'package:drive/repositories/synced_folders/synced_folder_repository.dart';
import 'package:equatable/equatable.dart';

class SyncingState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SyncingCubit extends Cubit<SyncingState> {
  final AppCubit _app;
  final SyncedFolderRepository _repo;

  SyncingCubit(this._app, this._repo) : super(SyncingState());
}
