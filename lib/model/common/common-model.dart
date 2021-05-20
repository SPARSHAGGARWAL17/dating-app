class CommonModel {
  String id;
  String value;
  CommonModel({
    this.id = '',
    this.value = '',
  });
  @override
  String toString() {
    return value.toString();
  }
}
