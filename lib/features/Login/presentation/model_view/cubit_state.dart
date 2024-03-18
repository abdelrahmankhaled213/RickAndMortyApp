abstract class LoginState{

}
class InitialStateLoginState extends LoginState{

}
class LoadingLogin extends LoginState{

}
class LoadedLogin extends LoginState{

}
class FaliureLogin extends LoginState{
String faliuremsg;
FaliureLogin({
  required this.faliuremsg
});
}
class ChangeLoginIconState extends LoginState{

}
