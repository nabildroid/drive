import 'package:bloc/bloc.dart';
import 'package:drive/cubits/app_cubit.dart';
import 'package:equatable/equatable.dart';

import '../repositories/stars/stars_repository.dart';

class StarsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class StarsCubit extends Cubit<StarsState> {
  final AppCubit _app;
  final StarsRepository _repo;

  StarsCubit(this._app, this._repo) : super(StarsState());
}
