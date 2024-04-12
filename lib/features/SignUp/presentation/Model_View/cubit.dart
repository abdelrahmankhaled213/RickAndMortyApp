import 'package:ecommerce_app/features/SignUp/presentation/Model_View/cubit_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignUpCubit extends Cubit<AuthState>{
  SignUpCubit():super (InitialState());
 String? email;
 String? password;
 String? confirmpassword;
final signupkey=GlobalKey<FormState>();
var changeiconstatepassword=true;
var changeiconstateconfirmpassword=true;
void changeIconStateConfirmPassword(){
  changeiconstateconfirmpassword=!changeiconstateconfirmpassword;
  emit(ChangeIconConfirmPasswordState());
}
void changeIconState(){
  changeiconstatepassword=!changeiconstatepassword;
  emit(ChangeIconState());
}
Future<void> signUpWithEmailAndPassword()async{
  try{
    emit(LoadingState());
 await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email!, password: password!);
 await FirebaseAuth.instance.currentUser!.sendEmailVerification();
    emit(LoadedState());
  }on FirebaseAuthException
  catch(e){
   emit(FaliureState(faliureMsg: e.toString()));
  }
}
  Future<UserCredential?> signInWithGoogle() async {
    // Trigger the authentication flow
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn(
          scopes: [
            'https://www.googleapis.com/auth/drive',
          ]
      ).signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await googleUser
          ?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
emit(GoogleSignUpSuccess());
      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    }catch(e){
      emit(GoogleSigUpFailed());
    }
  }

}