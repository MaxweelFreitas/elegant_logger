import 'package:flutter_test/flutter_test.dart';
import 'package:poc_ml/helpers/tree.dart';
import 'package:poc_ml/helpers/x_term/x_term_color.dart';

void main() {
  test('''
Should print a directory tree 🌳
\x1B[35m│\x1B[0m \x1B[36m.\x1B[0m                            \x1B[35m│\x1B[0m\n\x1B[35m│\x1B[0m \x1B[36m├─\x1B[0m\x1B[33msrc\x1B[0m                        \x1B[35m│\x1B[0m\n\x1B[35m│\x1B[0m \x1B[36m│ \x1B[0m\x1B[36m└─\x1B[0m\x1B[33mcomponents\x1B[0m               \x1B[35m│\x1B[0m\n\x1B[35m│\x1B[0m \x1B[36m│ \x1B[0m    \x1B[36m├─\x1B[0m\x1B[33mwidgets\x1B[0m              \x1B[35m│\x1B[0m\n\x1B[35m│\x1B[0m \x1B[36m│ \x1B[0m    \x1B[36m│ \x1B[0m\x1B[36m├─\x1B[0m\x1B[33mbutton.dart\x1B[0m        \x1B[35m│\x1B[0m\n\x1B[35m│\x1B[0m \x1B[36m│ \x1B[0m    \x1B[36m│ \x1B[0m\x1B[36m└─\x1B[0m\x1B[33mtext_field.dart\x1B[0m    \x1B[35m│\x1B[0m\n\x1B[35m│\x1B[0m \x1B[36m│ \x1B[0m    \x1B[36m└─\x1B[0m\x1B[33mutils.dart\x1B[0m           \x1B[35m│\x1B[0m\n\x1B[35m│\x1B[0m \x1B[36m├─\x1B[0m\x1B[33mpubspec.yaml\x1B[0m               \x1B[35m│\x1B[0m\n\x1B[35m│\x1B[0m \x1B[36m└─\x1B[0m\x1B[33mREADME.md\x1B[0m                  \x1B[35m│\x1B[0m\n''',
      () async {
    final directoryStructure = {
      'src': {
        'components': {
          'widgets': {
            'button.dart': {},
            'text_field.dart': {},
          },
          'utils.dart': {},
        },
      },
      'pubspec.yaml': {},
      'README.md': {},
    };

    final a = Tree.genTreeByMap(
      directoryStructure,
      lineLength: 30,
      dividerColor: XTermColor.magenta,
      textColor: XTermColor.yellow,
    );

    expect(
      a,
      '''\x1B[35m│\x1B[0m \x1B[36m.\x1B[0m                            \x1B[35m│\x1B[0m\n\x1B[35m│\x1B[0m \x1B[36m├─\x1B[0m\x1B[33msrc\x1B[0m                        \x1B[35m│\x1B[0m\n\x1B[35m│\x1B[0m \x1B[36m│ \x1B[0m\x1B[36m└─\x1B[0m\x1B[33mcomponents\x1B[0m               \x1B[35m│\x1B[0m\n\x1B[35m│\x1B[0m \x1B[36m│ \x1B[0m    \x1B[36m├─\x1B[0m\x1B[33mwidgets\x1B[0m              \x1B[35m│\x1B[0m\n\x1B[35m│\x1B[0m \x1B[36m│ \x1B[0m    \x1B[36m│ \x1B[0m\x1B[36m├─\x1B[0m\x1B[33mbutton.dart\x1B[0m        \x1B[35m│\x1B[0m\n\x1B[35m│\x1B[0m \x1B[36m│ \x1B[0m    \x1B[36m│ \x1B[0m\x1B[36m└─\x1B[0m\x1B[33mtext_field.dart\x1B[0m    \x1B[35m│\x1B[0m\n\x1B[35m│\x1B[0m \x1B[36m│ \x1B[0m    \x1B[36m└─\x1B[0m\x1B[33mutils.dart\x1B[0m           \x1B[35m│\x1B[0m\n\x1B[35m│\x1B[0m \x1B[36m├─\x1B[0m\x1B[33mpubspec.yaml\x1B[0m               \x1B[35m│\x1B[0m\n\x1B[35m│\x1B[0m \x1B[36m└─\x1B[0m\x1B[33mREADME.md\x1B[0m                  \x1B[35m│\x1B[0m\n''',
    );
  });
}
