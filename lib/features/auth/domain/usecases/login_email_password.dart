import 'package:tic_tac_toe/features/auth/domain/entities/user_entity.dart';
import 'package:tic_tac_toe/features/auth/domain/repositoories/auth_repository.dart';

class LoginEmailPassword {
  final AuthRepository _repository;
  const LoginEmailPassword(this._repository);

  Future<UserEntity> call(String email, String password)async{
    return await _repository.loginWithEmailAndPassword(email, password);
  }
}