class Validator{

  static String? validateName({required String name}){
    if(name == null){
      return null;
    }

    if(name.isEmpty){
      return "Name can\'t be empty";
    }

    return null;
  }

  static String? validateEmail({required String email}){
    if(email == null){
      return null;
    }

    RegExp emailRegExp = RegExp(
      r"^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$"
    );

    if(email.isEmpty){
      return "Email can\'t be empty";
    }else if(!emailRegExp.hasMatch(email)){
      return "Enter a valid email address";
    }

    return null;
  }

  static String? validatePassword({required String password}){
    if(password == null){
      return null;
    }

    RegExp passRegExp = RegExp(
        r"^(?=.*\d)(?=.*[\u0021-\u002b\u003c-\u0040])(?=.*[A-Z])(?=.*[a-z])\S{8,16}$"
    );

    if(password.isEmpty){
      return "Password can\'t be empty";
    }else if(password.length < 6){
      return "Enter a valid password";
    }

    return null;
  }


}