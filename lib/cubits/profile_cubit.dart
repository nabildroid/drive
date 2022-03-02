import 'package:drive/models/main.dart';
import 'package:drive/repositories/users/users_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileState extends Equatable {
  final Profile? profile;

  const ProfileState({this.profile});

  @override
  List<Object?> get props => [profile];
}

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository _repository;

  ProfileCubit(AuthUser user, this._repository) : super(ProfileState()) {
    _repository.getProfile(user.id).listen(
          (value) => emit(
            ProfileState(profile: value),
          ),
        );
  }
}
