import 'package:tic_tac_toe/features/auth/domain/entities/user_entity.dart';
import 'package:tic_tac_toe/features/auth/domain/repositoories/auth_repository.dart';

class RegisterEmailPassword {
  final AuthRepository _repository;
  const RegisterEmailPassword(this._repository);

  Future<UserEntity> call(String name, String email, String password) async {
    return await _repository.registerWithEmailAndPassword(name, email, password);
  }
}
