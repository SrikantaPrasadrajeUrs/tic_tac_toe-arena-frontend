

import 'package:tic_tac_toe/features/auth/data/datasources/auth_remote_ds.dart';
import 'package:tic_tac_toe/features/auth/domain/entities/user_entity.dart';
import 'package:tic_tac_toe/features/auth/domain/repositoories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository{
  final AuthRemoteDs _ds;
  const AuthRepositoryImpl(this._ds);

  @override
  Future<UserEntity> loginWithEmailAndPassword(String email, String password) async{
    final userEntity = await _ds.loginWithEmailAndPassword(email, password);
    return userEntity;
  }

  @override
  Future<UserEntity> registerWithEmailAndPassword(String name, String email, String password) {
    return _ds.registerWithEmailAndPassword(email, password);
  }

}