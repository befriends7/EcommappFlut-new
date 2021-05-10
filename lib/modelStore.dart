

class modelStore
{
  String _title;
  String _price;
  String _description;
  String _category;
  String _image;

  modelStore(
      this._title, this._price, this._description, this._category, this._image);

  String get image => _image;

  set image(String value) {
    _image = value;
  }

  String get category => _category;

  set category(String value) {
    _category = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  String get price => _price;

  set price(String value) {
    _price = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }
}