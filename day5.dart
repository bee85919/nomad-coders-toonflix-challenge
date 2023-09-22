import 'dart:collection';

typedef TermDefinition = Map<String, String>;

class Dictionary {
  final LinkedHashMap<String, String> _words = LinkedHashMap();

  void add(String term, String definition) {
    _words[term] = definition;
    print("단어 추가: $term : $definition");
  }

  void update(String term, String definition) {
    if (_words.containsKey(term)) {
      _words[term] = definition;
      print("단어 갱신: $term : $definition");
    } else {
      print("해당 단어 없음");
    }
  }

  void delete(String term) {
    if (_words.remove(term) != null) {
      print("단어 삭제: $term");
    }
  }

  String? get(String term) => _words[term];

  bool exists(String term) => _words.containsKey(term);
  int count() => _words.length;
  void showAll() {
    print("모두 보기:");
    _words.forEach((k, v) => print('$k: $v'));
  }

  // Bulk Operations
  void bulkAdd(List<TermDefinition> terms) {
    print("여러 단어 추가");
    terms.forEach((t) {
      _words[t['term'] ?? ''] = t['definition'] ?? '';
    });
  }

  void bulkDelete(List<String> terms) {
    print("여러 단어 삭제");
    terms.forEach((t) => _words.remove(t));
  }
}

void main() {
  final dictionary = Dictionary();

  dictionary.add('a', 'a');

  dictionary.update('b', 'b');

  dictionary.update('a', 'b');

  dictionary.bulkAdd([
    {'term': 'c', 'definition': 'c'},
    {'term': 'd', 'definition': 'd'},
    {'term': 'e', 'definition': 'e'}
  ]);

  dictionary.showAll();

  dictionary.delete('c');

  dictionary.bulkDelete(['d', 'e']);

  print('Word count: ${dictionary.count()}');
}
