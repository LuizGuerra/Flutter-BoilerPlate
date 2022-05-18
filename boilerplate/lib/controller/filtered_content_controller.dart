class FilteredContentController<Comparable> {
  final List<Comparable> _content;
  List<Comparable> _filteredContent = [];

  FilteredContentController({required List<Comparable> content})
      : _content = content, _filteredContent = List<Comparable>.from(content);

  // returns true if could find element
  // returns false if no matching value were found
  bool filter(bool Function(Comparable) f) {
    _filteredContent = _content.where((element) => f(element)).toList();
    return _filteredContent.isEmpty;
  }

  List<Comparable> getList() => _filteredContent;

  void reset() {
    _filteredContent = List<Comparable>.from(_content);
  }
}