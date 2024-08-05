class XTermColor {
  static const reset = '\x1B[0m';

  //ForegroundColors
  static const black = '\x1B[30m';
  static const red = '\x1B[31m';
  static const green = '\x1B[32m';
  static const yellow = '\x1B[33m';
  static const blue = '\x1B[34m';
  static const magenta = '\x1B[35m';
  static const cyan = '\x1B[36m';
  static const white = '\x1B[37m';

  static const blackBright = '\x1B[90m';
  static const redBright = '\x1B[91m';
  static const greenBright = '\x1B[92m';
  static const yellowBright = '\x1B[93m';
  static const blueBright = '\x1B[94m';
  static const magentaBright = '\x1B[95m';
  static const cyanBright = '\x1B[96m';
  static const whiteBright = '\x1B[97m';

  //BackgroundColors
  static const blackBg = '\x1B[40m';
  static const redBg = '\x1B[41m';
  static const greenBg = '\x1B[42m';
  static const yellowBg = '\x1B[43m';
  static const blueBg = '\x1B[44m';
  static const magentaBg = '\x1B[45m';
  static const cyanBg = '\x1B[46m';
  static const whiteBg = '\x1B[47m';

  static const blackBrightBg = '\x1B[100m';
  static const redBrightBg = '\x1B[101m';
  static const greenBrightBg = '\x1B[102m';
  static const yellowBrightBg = '\x1B[103m';
  static const blueBrightBg = '\x1B[104m';
  static const magentaBrightBg = '\x1B[105m';
  static const cyanBrightBg = '\x1B[106m';
  static const whiteBrightBg = '\x1B[107m';

  //\x1B[38;5;<FG COLOR>m
  static String std256FG(int codeColor) {
    if (codeColor < 0) {
      return 'std256FG color is invalid! [needs to be Grater and then 0]';
    } else if (codeColor > 255) {
      return 'std256FG color is invalid![needs to be less than 256]';
    } else {
      return '\x1B[38;5;${codeColor}m';
    }
  }

  //\x1B[48;5;<FG COLOR>m
  static String std256BG(int codeColor) {
    if (codeColor < 0) {
      return 'std256BG color is invalid! [needs to be Grater and then 0]';
    } else if (codeColor > 255) {
      return 'std256BG color is invalid![needs to be less than 256]';
    } else {
      return '\x1B[48;5;${codeColor}m';
    }
  }

  static String rgbFg(int red, int green, int blue) {
    if (red < 0) {
      return 'Red color is invalid! [needs to be Grater and then 0]';
    } else if (red > 255) {
      return 'Red color is invalid![needs to be less than 256]';
    } else if (green < 0) {
      return 'Green color is invalid! [needs to be Grater and then 0]';
    } else if (green > 255) {
      return 'Green color is invalid![needs to be less than 256]';
    } else if (blue < 0) {
      return 'Blue color is invalid! [needs to be Grater and then 0]';
    } else if (blue > 255) {
      return 'Blue color is invalid![needs to be less than 256]';
    } else {
      return '\x1B[38;2;$red;$green;${blue}m';
    }
  }

  static String rgbBg(int red, int green, int blue) {
    if (red < 0) {
      return 'Red color is invalid! [needs to be Grater and then 0]';
    } else if (red > 255) {
      return 'Red color is invalid![needs to be less than 256]';
    } else if (green < 0) {
      return 'Green color is invalid! [needs to be Grater and then 0]';
    } else if (green > 255) {
      return 'Green color is invalid![needs to be less than 256]';
    } else if (blue < 0) {
      return 'Blue color is invalid! [needs to be Grater and then 0]';
    } else if (blue > 255) {
      return 'Blue color is invalid![needs to be less than 256]';
    } else {
      return '\x1B[48;2;$red;$green;${blue}m';
    }
  }

  //TODO: Create a method to convert from Hex to XTermRGB color
  @Deprecated('Essa função ainda não está pronta, favor não utilizar')
  static String hexFg(String hexColor) {
    //Verficar se tem um dos seguintes formatos válidos e tratar
    //XXXXXX
    //0xXXXXXX
    //0xFFXXXXXX
    return '\x1B[38;2;$red;$green;${blue}m';
  }

  // 1 - validate RED, GREEN and BLUE and return result
  // format to receive normalizated numbers at \x1B[38;2;$red;$green;${blue}m
}
