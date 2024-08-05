class Converter {
  //TODO: Create a conversor from HEX to DECIMAL,
  static int hexToDec(String hexColor) {
    if (!_isValidHexadecimal(hexColor)) {
      throw ArgumentError("Invalid hexadecimal string");
    }

    int len = hexColor.length;
    int base = 1;
    int decVal = 0;

    for (int i = len - 1; i >= 0; i--) {
      int charCode = hexColor.codeUnitAt(i);
      if (charCode >= 48 && charCode <= 57) {
        decVal += (charCode - 48) * base;
        base = base * 16;
      } else if (charCode >= 65 && charCode <= 70) {
        decVal += (charCode - 55) * base;
        base = base * 16;
      } else if (charCode >= 97 && charCode <= 102) {
        // for lowercase 'a'-'f'
        decVal += (charCode - 87) * base;
        base = base * 16;
      }
    }
    return decVal;
  }
}

bool _isValidHexadecimal(String hexVal) {
  for (int i = 0; i < hexVal.length; i++) {
    int charCode = hexVal.codeUnitAt(i);
    if (!(charCode >= 48 && charCode <= 57) && // '0'-'9'
        !(charCode >= 65 && charCode <= 70) && // 'A'-'F'
        !(charCode >= 97 && charCode <= 102)) {
      // 'a'-'f'
      return false;
    }
  }
  return true;
}
