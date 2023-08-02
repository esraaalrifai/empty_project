class NetworkUtil{


 static bool isEmail(String value) {
    RegExp regExp = new RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    return regExp.hasMatch(value);
  }

 static bool isValidSyriaMobileNumber(String mobileNumber) {
    RegExp regex = RegExp(r'^(!?(\+|00)?(963)|0)?9\d{8}$');
    return regex.hasMatch(mobileNumber);
  }

 static bool isValidPassword(String password, String confirmPassword) {
    RegExp regex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d@$!%*#?&]{8,}$');
    return (password == confirmPassword) && regex.hasMatch(password);
  }


 static bool isName(String value) {
    RegExp regExp = new RegExp(
        r'^[a-zA-Z]+(([,. -][a-zA-Z ])?[a-zA-Z]*)*$');

    return regExp.hasMatch(value);
  }
}