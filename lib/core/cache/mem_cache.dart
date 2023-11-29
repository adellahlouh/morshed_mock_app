class MemoryCache<T> {
  T? previousData;
  T? currentData;

  MemoryCache({this.previousData, this.currentData});

  // example:
  // first time called => ( previous = null ; current = 1 ; )
  // second time called => ( previous = current ; current = 2 ; )
  void update(T data) {
    previousData = currentData;
    currentData = data;
  }

  void clear() {
    previousData = null;
    currentData = null;
  }

  bool get hasData => currentData != null;

  bool get hasPreviousData => previousData != null;

  MemoryCache<T> copyWith({T? previousData, T? currentData}) {
    return MemoryCache<T>(
      previousData: previousData ?? this.previousData,
      currentData: currentData ?? this.currentData,
    );
  }

  @override
  String toString() => "MemoryCache: currentData is ${this.currentData},"
      " and previousData is ${this.previousData}";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MemoryCache &&
          runtimeType == other.runtimeType &&
          previousData == other.previousData &&
          currentData == other.currentData;

}
