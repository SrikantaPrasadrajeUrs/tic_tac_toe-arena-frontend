import 'package:tic_tac_toe/features/auth/domain/entities/user_entity.dart';

abstract interface class AuthRepository {
  Future<UserEntity> loginWithEmailAndPassword(String email, String password);
  Future<UserEntity> registerWithEmailAndPassword(String name, String email, String password);
}
