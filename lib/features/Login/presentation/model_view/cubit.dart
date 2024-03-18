import 'package:ecommerce_app/features/Login/presentation/model_view/cubit_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState>{
  LoginCubit():super(InitialStateLoginState());
bool convert=true;
late String email;
late String password;
void loginWithEmailAndPassword()async{
  emit(LoadingLogin());
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email, password: password);
    emit(LoadedLogin());
  }
  on FirebaseAuthException
  catch(e){
    emit(FaliureLogin(faliuremsg: e.code));
  }
  catch(e){
    emit(FaliureLogin(faliuremsg: e.toString()));
  }

}
void changeIconState(){
  convert=!convert;
  emit(ChangeLoginIconState());
}
}