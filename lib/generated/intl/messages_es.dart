// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a es locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'es';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "accessGranted":
            MessageLookupByLibrary.simpleMessage("✅ Acceso concedido"),
        "addCode": MessageLookupByLibrary.simpleMessage(
            "Escanea un código QR para guardar la información."),
        "authFailed":
            MessageLookupByLibrary.simpleMessage("Autenticación fallida"),
        "authTitle": MessageLookupByLibrary.simpleMessage("Autenticación"),
        "authenticate": MessageLookupByLibrary.simpleMessage("Autenticarse"),
        "authenticating":
            MessageLookupByLibrary.simpleMessage("Verificando identidad..."),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancelar"),
        "codeAddError":
            MessageLookupByLibrary.simpleMessage("Error al agregar el código"),
        "codeAdded": MessageLookupByLibrary.simpleMessage(
            "Código agregado correctamente"),
        "codeDeleteError":
            MessageLookupByLibrary.simpleMessage("Error al eliminar el código"),
        "codeDeleted": MessageLookupByLibrary.simpleMessage(
            "Código eliminado correctamente"),
        "date": MessageLookupByLibrary.simpleMessage("Fecha"),
        "delete": MessageLookupByLibrary.simpleMessage("Eliminar"),
        "deleteConfirmationMessage": MessageLookupByLibrary.simpleMessage(
            "Esta acción no se puede deshacer."),
        "deleteConfirmationTitle":
            MessageLookupByLibrary.simpleMessage("¿Eliminar código?"),
        "id": MessageLookupByLibrary.simpleMessage("Id"),
        "mustAuthenticate": MessageLookupByLibrary.simpleMessage(
            "Debes autenticarte para continuar"),
        "noCodes": MessageLookupByLibrary.simpleMessage(
            "No hay códigos escaneados aún"),
        "placeQrInFrame": MessageLookupByLibrary.simpleMessage(
            "Ajustar el QR dentro del marco"),
        "scancode": MessageLookupByLibrary.simpleMessage("Escanear Código"),
        "scanningCode":
            MessageLookupByLibrary.simpleMessage("Escaneando Código QR"),
        "turnFlash": MessageLookupByLibrary.simpleMessage("Encender flash"),
        "type": MessageLookupByLibrary.simpleMessage("Tipo"),
        "unexpectedError":
            MessageLookupByLibrary.simpleMessage("Error inesperado")
      };
}
