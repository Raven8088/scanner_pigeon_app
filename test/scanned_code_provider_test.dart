import 'package:flutter_test/flutter_test.dart';
import 'package:sacanner_pigeon_app/src/dto/scanner/scanned_code_dto.dart';
import 'package:sacanner_pigeon_app/src/resources/provider/scanned/scanned_code_provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  late ScannedCodeProvider provider;

  setUpAll(() async {
    // Inicializamos la base de datos en memoria
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  setUp(() async {
    provider = ScannedCodeProvider();
    await provider.createTableIfNotExists(); // 👈 Fuerza la tabla
  });

  test('insertCode y getAllCodes funcionan correctamente', () async {
    final dto = ScannedCodeDTO(
      content: 'https://test.com',
      type: 'URL',
      timestamp: DateTime.now(),
    );

    await provider.insertCode(dto);

    final result = await provider.getAllCodes();
    expect(result, isNotEmpty);
    expect(result.first.content, equals('https://test.com'));
  });

  test('deleteById elimina correctamente', () async {
    final dto = ScannedCodeDTO(
      content: 'to-delete',
      type: 'Texto Plano',
      timestamp: DateTime.now(),
    );

    await provider.insertCode(dto);
    final all = await provider.getAllCodes();
    final toDeleteId = all.first.id!;
    await provider.deleteById(toDeleteId);

    final after = await provider.getAllCodes();
    expect(after.where((e) => e.id == toDeleteId), isEmpty);
  });

  test('deleteAll elimina todos los registros', () async {
    await provider.insertCode(ScannedCodeDTO(
      content: 'clean-me',
      type: 'Texto Plano',
      timestamp: DateTime.now(),
    ));

    await provider.deleteAll();

    final result = await provider.getAllCodes();
    expect(result, isEmpty);
  });

  test('dropTable elimina la tabla y la recrea', () async {
    await provider.dropTable();
    await provider.createTableIfNotExists(); // 👈 Agregado aquí

    await provider.insertCode(ScannedCodeDTO(
      content: 'new after drop',
      type: 'URL',
      timestamp: DateTime.now(),
    ));

    final result = await provider.getAllCodes();
    expect(result, isNotEmpty);
  });
}
