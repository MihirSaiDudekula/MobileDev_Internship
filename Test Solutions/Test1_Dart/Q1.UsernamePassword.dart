// 1.	Write a dart program to initialize a map of usernames and passwords associated
// with it.
// passwd={‘rahul’: ‘genius’, ‘kumar’: ‘smart’, ‘ankita’: ‘intelligent’}
// Define the following functions:
// a) To print all the items in the map.
// b) To print all the keys in the map.
// c) To print all the values in the map.
// d) To get the passwords of users. For example, passwd[‘rahul’]= genius
// e) Change the password of a particular user. For example, passwd[‘ankita’]= ‘brilliant’


void main() {
  Map<String, String> passwd = {
    'rahul': 'genius',
    'kumar': 'smart',
    'ankita': 'intelligent'
  };

  // Function to print all items in the map
  void printAllItems(Map<String, String> map) {
    map.forEach((key, value) {
      print('$key: $value');
    });
  }

  // Function to print all keys in the map
  void printAllKeys(Map<String, String> map) {
    print('Keys:');
    map.keys.forEach((key) {
      print(key);
    });
  }

  // Function to print all values in the map
  void printAllValues(Map<String, String> map) {
    print('Values:');
    map.values.forEach((value) {
      print(value);
    });
  }

  // Function to get the password of a user
  void getPassword(Map<String, String> map, String username) {
    if (map.containsKey(username)) {
      print('$username: ${map[username]}');
    } else {
      print('User not found');
    }
  }

  // Function to change the password of a user
  void changePassword(Map<String, String> map, String username, String newPassword) {
    if (map.containsKey(username)) {
      map[username] = newPassword;
      print('Password for $username changed successfully');
    } else {
      print('User not found');
    }
  }

  // Testing the functions
  printAllItems(passwd);
  printAllKeys(passwd);
  printAllValues(passwd);

  getPassword(passwd, 'rahul');
  getPassword(passwd, 'john');

  changePassword(passwd, 'ankita', 'brilliant');
  getPassword(passwd, 'ankita');
}
