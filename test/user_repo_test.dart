import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:unit_test/user_model.dart';
import 'package:unit_test/user_repo.dart';

class MockHTTPClient extends Mock implements Client {}

void main() {
  late UserRepo userRepo;
  late MockHTTPClient client;
  setUp(() {
    client = MockHTTPClient();
    userRepo = UserRepo(client: client);
  });
  group(
    'user repo class - ',
    () {
      group(
        'getUser function',
        () {
          test(
            'given user repo, when we getUser method, then we get a user model object',
            () async {
              //arrange
              when(() => client.get(Uri.parse(
                  'https://jsonplaceholder.typicode.com/users/1'))).thenAnswer(
                (invocation) async {
                  return Response('''
                 {
                  "id": 1,
                  "name": "Leanne Graham",
                  "email": "Sincere@april.biz",
                  "website": "hildegard.org"
                  }
                  ''', 200);
                },
              );
              //act
              final user = await userRepo.getUser();
              //assert
              expect(user, isA<User>());
            },
          );

          test(
            'given user repo, when we use getUser method and status code is NOT 200, then we get an exception',
            () async {
              //arrange
              //act
              final user = await userRepo.getUser();
              //assert
              expect(user, throwsException);
            },
          );
        },
      );
    },
  );
}
