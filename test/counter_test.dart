import 'package:flutter_test/flutter_test.dart';
import 'package:unit_test/counter.dart';

// in test you can follow { Given When Then } rule
// ex: Given we have a counter with initial value 0, when we increment it, then we expect the value to be 1
void main() {
  // we need to test if counter initial value is 0
  // we need to test if counter can be incremented
  // we need to test if counter can be decremented

// just to avoid making it nullable + to be visible in all tests
  late Counter counter;

  ///  PRETESTS
  // it called before each test=>     setup->test->setUp -> test -> setup ..etc
  setUp(
    // methods , objects .. etc
    () => counter = Counter(),
  );
  // it called before all the test=>  setUpAll -> test -> test ..etc
  setUpAll(
    () => null,
  );
  group('Counter Class -', () {
    test(
      'given counter class , when we create it, then it has initial value 0',
      () {
        // Arrange
        // Act
        final result = counter.count;

        // Assert
        expect(result, 0);
      },
    );

    test(
      'given counter class, when we increment it, then we expect the value to be 1',
      () {
        // Arrange
        // Act
        counter.increment();
        final result = counter.count;
        const matcher = 1;

        // Assert
        expect(result, matcher);
      },
    );

    test(
        'given counter class , when we decrement it, then we expect the value to be -1',
        () {
      // Arrange
      // Act
      counter.decrement();
      final result = counter.count;
      const matcher = -1;
      expect(result, matcher);
    });
  });

  test(
      'Given counter class, when we reset it , then we expect the value to be 0',
      () {
    // Arrange
    // Act
    counter.reset();
    const matcher = 0;
    final result = counter.count;
    // Assert
    expect(result, matcher);
  });

  /// POST TESTS
  // it called after each test=>    test -> tearDown -> test -> tearDown ..etc
  tearDown(() =>
      null); // it called after all the test=>  test -> test -> tearDownAll
  tearDownAll(
    () => null,
  );
}
