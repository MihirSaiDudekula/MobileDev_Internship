// 2. Create a map for words and their meanings. Write functions to add a new entry
// (word:meaning) ,search for a particular word and retrieve meaning, given meaning find
// words with same meaning , remove an entry, display all words sorted alphabetically.


void main() {
  Map<String, String> wordMeanings = {
    'example': 'a representative form or pattern',
    'abundant': 'existing or available in large quantities',
    'meticulous': 'showing great attention to detail'
  };

  // Function to add a new entry
  void addEntry(Map<String, String> map, String word, String meaning) {
    map[word] = meaning;
  }

  // Function to search for a particular word and retrieve meaning
  String getMeaning(Map<String, String> map, String word) {
    return map[word] ?? 'Word not found';
  }

  // Function to find words with the same meaning
  List<String> findWordsWithSameMeaning(Map<String, String> map, String meaning) {
    List<String> words = [];
    map.forEach((key, value) {
      if (value == meaning) {
        words.add(key);
      }
    });
    return words;
  }

  // Function to remove an entry
  void removeEntry(Map<String, String> map, String word) {
    map.remove(word);
  }

  // Function to display all words sorted alphabetically
  void displaySortedWords(Map<String, String> map) {
    List<String> sortedKeys = map.keys.toList()..sort();
    sortedKeys.forEach((key) {
      print('$key: ${map[key]}');
    });
  }

  // Testing the functions
  addEntry(wordMeanings, 'awesome', 'extremely impressive');
  print(getMeaning(wordMeanings, 'awesome'));
  print(findWordsWithSameMeaning(wordMeanings, 'a representative form or pattern'));
  removeEntry(wordMeanings, 'abundant');
  displaySortedWords(wordMeanings);
}

