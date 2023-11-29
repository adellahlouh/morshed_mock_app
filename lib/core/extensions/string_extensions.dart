
extension NonNullableStringExtension on String {
  String isOrEmpty(String value) {
    if (this.isEmpty) return value;
    return this;
  }
}
extension NullableStringExtension on String? {
  String isNullOrEmpty(String value) {
    if (this == null || this!.isEmpty) return value;
    return this!;
  }

  String subStringMoreThan(int val) {
    if(this == null) return '';
    if(this != null && this!.length > val) return '${this!.substring(0, val)}...';
    else return this!;
  }
}

extension NullableObjectExtension on Object? {
  dynamic isNull(dynamic value){
    if(this == null) return value;
    return this;
  }

 dynamic isNotNull(dynamic value){
    if(this != null) return value;
    return 'null';
 }
}

