// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "accessGranted":
            MessageLookupByLibrary.simpleMessage("✅ Access granted"),
        "addCode": MessageLookupByLibrary.simpleMessage(
            "Scan a QR code to save the information."),
        "authFailed":
            MessageLookupByLibrary.simpleMessage("Authentication failed"),
        "authTitle": MessageLookupByLibrary.simpleMessage("Authentication"),
        "authenticate": MessageLookupByLibrary.simpleMessage("Authenticate"),
        "authenticating":
            MessageLookupByLibrary.simpleMessage("Verifying identity..."),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "codeAddError":
            MessageLookupByLibrary.simpleMessage("Error adding the code"),
        "codeAdded":
            MessageLookupByLibrary.simpleMessage("Code added successfully"),
        "codeDeleteError":
            MessageLookupByLibrary.simpleMessage("Error deleting the code"),
        "codeDeleted":
            MessageLookupByLibrary.simpleMessage("Code deleted successfully"),
        "date": MessageLookupByLibrary.simpleMessage("Date"),
        "delete": MessageLookupByLibrary.simpleMessage("Delete"),
        "deleteConfirmationMessage": MessageLookupByLibrary.simpleMessage(
            "This action cannot be undone."),
        "deleteConfirmationTitle":
            MessageLookupByLibrary.simpleMessage("Delete code?"),
        "id": MessageLookupByLibrary.simpleMessage("ID"),
        "mustAuthenticate": MessageLookupByLibrary.simpleMessage(
            "You must authenticate to continue"),
        "noCodes": MessageLookupByLibrary.simpleMessage("No codes scanned yet"),
        "placeQrInFrame": MessageLookupByLibrary.simpleMessage(
            "Place the QR code inside the frame"),
        "scancode": MessageLookupByLibrary.simpleMessage("Scan Code"),
        "scanningCode":
            MessageLookupByLibrary.simpleMessage("Scanning QR Code"),
        "turnFlash": MessageLookupByLibrary.simpleMessage("Turn on flash"),
        "type": MessageLookupByLibrary.simpleMessage("Type"),
        "unexpectedError":
            MessageLookupByLibrary.simpleMessage("Unexpected error")
      };
}
