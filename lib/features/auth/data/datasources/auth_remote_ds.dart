
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tic_tac_toe/features/auth/data/models/user_model.dart';
import 'package:tic_tac_toe/features/auth/domain/entities/user_entity.dart';

class AuthRemoteDs {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserEntity> loginWithEmailAndPassword(String email, String password)async{
   final credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
   UserModel model = UserModel.fromFirebase(credential.user);
   return model.toEntity();
  }

  Future<UserEntity> registerWithEmailAndPassword(String email, String password)async{
    final credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    UserModel model = UserModel.fromFirebase(credential.user);
    return model.toEntity();
  }
}
