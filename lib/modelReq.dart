

class modelReq
{

  String _first_name;
  String _last_name;
  String _avatar;

  modelReq(this._first_name, this._last_name, this._avatar);

  String get avatar => _avatar;

  set avatar(String value) {
    _avatar = value;
  }

  String get last_name => _last_name;

  set last_name(String value) {
    _last_name = value;
  }

  String get first_name => _first_name;

  set first_name(String value) {
    _first_name = value;
  }
}