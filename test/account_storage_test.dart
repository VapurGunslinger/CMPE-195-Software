import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_application_1/auth_storage.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  test('updates saved profile details across all account fields', () async {
    await AuthStorage.saveAccount(
      name: 'Jane Doe',
      email: 'jane@example.com',
      password: 'secret123',
    );

    await AuthStorage.updateAccount(
      name: 'Jane Smith',
      email: 'jane.smith@example.com',
      age: '31 years',
      condition: 'Hypertension monitoring',
    );

    final account = await AuthStorage.getSavedAccount();

    expect(account['name'], 'Jane Smith');
    expect(account['email'], 'jane.smith@example.com');
    expect(account['password'], 'secret123');
    expect(account['age'], '31 years');
    expect(account['condition'], 'Hypertension monitoring');
  });
}
