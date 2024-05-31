import 'package:faker/src/faker.dart';
import 'package:quiz1/question3/user_model.dart';

// getUserById(int? id) {
//   if (id == null || id < 0) return null;
//   Map<String, dynamic> user = {};
//   user = {
//     "id": id,
//     "first_name": faker.person.firstName(),
//     "last_name": faker.person.lastName(),
//     "about": faker.lorem.words(3).join(' '),
//     "image": faker.image.image(),
//   };
//   return user;
// }

User? getUserById(int? id) {
  if (id == null || id < 0) return null;

  Map<String, dynamic> userJson = {
    "id": id,
    "first_name": faker.person.firstName(),
    "last_name": faker.person.lastName(),
    "about": faker.lorem.words(3).join(' '),
    "image": faker.image.image(),
  };

  return User.fromJson(userJson);
}
