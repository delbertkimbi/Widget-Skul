import 'package:flutter/material.dart';
import 'package:widgets_app/model/flutter_widget_model.dart';

final List<FlutterWidgetModel> widgetList = [
  // 📦 BASIC
  FlutterWidgetModel(
    name: 'Text',
    description:
        'Displays a string of text with a single style. It is one of the most commonly used widgets in Flutter to show content.',
    usage:
        'Used to show static or dynamic text on the screen, such as labels, titles, and paragraphs.',
    exampleImage: 'assets/examples/basic/text_code.png',
    exampleOutput: 'assets/examples/basic/text_output.png',
    category: 'Basic',
    icon: Icons.text_fields,
    learnMoreUrl: 'https://api.flutter.dev/flutter/widgets/Text-class.html',
  ),

  FlutterWidgetModel(
    name: 'Container',
    description:
        'A versatile box widget that can contain other widgets, apply padding, margins, borders, and other styling properties.',
    usage:
        'Used for layout, decoration, padding, and positioning of widgets. It is often used as a parent container for other widgets.',
    exampleImage: 'assets/examples/basic/container.png',
    exampleOutput: 'assets/examples/basic/container_output.png',
    category: 'Basic',
    icon: Icons.crop_square,
    learnMoreUrl:
        'https://api.flutter.dev/flutter/widgets/Container-class.html',
  ),

  FlutterWidgetModel(
    name: 'Icon',
    description:
        'Displays a graphical symbol to visually communicate action, content, or brand.',
    usage:
        'Used for showing common icons like home, settings, or user avatars.',
    exampleImage: 'assets/examples/basic/icon_code.png',
    exampleOutput: 'assets/examples/basic/icon_output.png',
    category: 'Basic',
    icon: Icons.insert_emoticon,
    learnMoreUrl: 'https://api.flutter.dev/flutter/widgets/Icon-class.html',
  ),

  FlutterWidgetModel(
    name: 'ListTile',
    description:
        'A single fixed-height row that typically contains some text as well as a leading or trailing icon.',
    usage: 'Used to create simple rows in lists, settings, or menus.',
    exampleImage: 'assets/examples/basic/listtile.png',
    exampleOutput: 'assets/examples/basic/listtile_output.png',
    category: 'Basic',
    icon: Icons.view_list,
    learnMoreUrl:
        'https://api.flutter.dev/flutter/material/ListTile-class.html',
  ),

  FlutterWidgetModel(
    name: 'Column',
    description:
        'A widget that displays its children in a vertical array, aligning them in a single column.',
    usage:
        'Used to stack widgets vertically, such as for form fields, buttons, or a list of items.',
    exampleImage: 'assets/examples/basic/column.png',
    exampleOutput: 'assets/examples/basic/column_output.png',
    category: 'Basic',
    icon: Icons.view_column,
    learnMoreUrl: 'https://api.flutter.dev/flutter/widgets/Column-class.html',
  ),

  FlutterWidgetModel(
    name: 'Image',
    description: 'Displays an image from assets, network, or memory.',
    usage: 'Used to show pictures or illustrations in the app UI.',
    exampleImage: 'assets/examples/basic/image_code.png',
    exampleOutput: 'assets/examples/basic/image_output.png',
    category: 'Basic',
    icon: Icons.image,
    learnMoreUrl: 'https://api.flutter.dev/flutter/widgets/Image-class.html',
  ),

  FlutterWidgetModel(
    name: 'ElevatedButton',
    description: 'A Material Design button that elevates when pressed.',
    usage: 'Used for triggering actions when tapped by the user.',
    exampleImage: 'assets/examples/basic/elevatedbutton_code.png',
    exampleOutput: 'assets/examples/basic/elevatedbutton_output.png',
    category: 'Basic',
    icon: Icons.smart_button,
    learnMoreUrl:
        'https://api.flutter.dev/flutter/material/ElevatedButton-class.html',
  ),

  FlutterWidgetModel(
    name: 'Row',
    description:
        'A widget that displays its children in a horizontal array, aligning them in a single row.',
    usage:
        'Used to stack widgets horizontally, such as buttons in a toolbar or elements in a horizontal scroll.',
    exampleImage: 'assets/examples/basic/row.png',
    exampleOutput: 'assets/examples/basic/row_output.png',
    category: 'Basic',
    icon: Icons.view_stream,
    learnMoreUrl: 'https://api.flutter.dev/flutter/widgets/Row-class.html',
  ),

  FlutterWidgetModel(
    name: 'TextFormField',
    description:
        'A form-aware version of the TextField widget with validation support.',
    usage:
        'Used in forms to collect and validate user input like email, passwords, and names.',
    exampleImage: 'assets/examples/input/textformfield.png',
    exampleOutput: 'assets/examples/input/textformfield_output.png',
    category: 'Input & Interactive',
    icon: Icons.text_fields,
    learnMoreUrl:
        'https://api.flutter.dev/flutter/material/TextFormField-class.html',
  ),

  // ⚙️ INTERMEDIATE
  FlutterWidgetModel(
    name: 'ListView',
    description:
        'A scrollable list of widgets arranged linearly, either vertically or horizontally. It’s ideal for displaying large data.',
    usage:
        'Used for displaying long lists of items, like contacts, messages, or images, which require scrolling.',
    exampleImage: 'assets/examples/intermediate/listview.png',
    exampleOutput: 'assets/examples/intermediate/listview_output.png',
    category: 'Intermediate',
    icon: Icons.format_list_bulleted,
    learnMoreUrl: 'https://api.flutter.dev/flutter/widgets/ListView-class.html',
  ),
  FlutterWidgetModel(
    name: 'GridView',
    description: 'Displays items in a 2D grid layout.',
    usage:
        'Used for arranging items in a scrollable grid pattern, like photo galleries.',
    exampleImage: 'assets/examples/intermediate/gridview_code.png',
    exampleOutput: 'assets/examples/intermediate/gridview_output.png',
    category: 'Intermediate',
    icon: Icons.grid_on,
    learnMoreUrl: 'https://api.flutter.dev/flutter/widgets/GridView-class.html',
  ),
  FlutterWidgetModel(
    name: 'Stack',
    description:
        'A widget that overlays its children on top of each other, creating complex visual layouts with the ability to position them freely.',
    usage:
        'Used when you want to place widgets on top of each other, like displaying a text label over an image.',
    exampleImage: 'assets/examples/intermediate/stack.png',
    exampleOutput: 'assets/examples/intermediate/stack_output.png',
    category: 'Intermediate',
    icon: Icons.layers,
    learnMoreUrl: 'https://api.flutter.dev/flutter/widgets/Stack-class.html',
  ),
  FlutterWidgetModel(
    name: 'Wrap',
    description:
        'Displays its children in multiple horizontal or vertical runs.',
    usage:
        'Used for displaying dynamic items that wrap to the next line when space runs out.',
    exampleImage: 'assets/examples/intermediate/wrap_code.png',
    exampleOutput: 'assets/examples/intermediate/wrap_output.png',
    category: 'Intermediate',
    icon: Icons.wrap_text,
    learnMoreUrl: 'https://api.flutter.dev/flutter/widgets/Wrap-class.html',
  ),
  FlutterWidgetModel(
    name: 'PageView',
    description: 'Scrolls through a list of widgets one page at a time.',
    usage: 'Used for onboarding screens, photo carousels, or tabbed views.',
    exampleImage: 'assets/examples/intermediate/pageview_code.png',
    exampleOutput: 'assets/examples/intermediate/pageview_output.png',
    category: 'Intermediate',
    icon: Icons.view_carousel,
    learnMoreUrl: 'https://api.flutter.dev/flutter/widgets/PageView-class.html',
  ),
  FlutterWidgetModel(
    name: 'GestureDetector',
    description:
        'Detects gestures like tap, double tap, and swipe on its child widget, making it interactive.',
    usage:
        'Used to make any widget respond to user interactions, such as onTap, onLongPress, or onSwipe.',
    exampleImage: 'assets/examples/intermediate/gesturedetector.png',
    exampleOutput: 'assets/examples/intermediate/gesturedetector_output.png',
    category: 'Intermediate',
    icon: Icons.touch_app,
    learnMoreUrl:
        'https://api.flutter.dev/flutter/widgets/GestureDetector-class.html',
  ),
  FlutterWidgetModel(
    name: 'Expanded',
    description:
        'A widget that expands a child widget to fill the available space within a `Row`, `Column`, or `Flex` widget.',
    usage:
        'Used to make child widgets fill the available space proportionally, especially useful when working with flexible layouts.',
    exampleImage: 'assets/examples/intermediate/expanded.png',
    exampleOutput: 'assets/examples/intermediate/expanded_output.png',
    category: 'Intermediate',
    icon: Icons.open_in_full,
    learnMoreUrl: 'https://api.flutter.dev/flutter/widgets/Expanded-class.html',
  ),

  // 🚀 ADVANCED
  FlutterWidgetModel(
    name: 'FutureBuilder',
    description:
        'A widget that builds itself based on the latest snapshot of a `Future` and allows asynchronous data handling.',
    usage:
        'Used for displaying data that might be fetched asynchronously from APIs, databases, or other sources.',
    exampleImage: 'assets/examples/advanced/futurebuilder.png',
    exampleOutput: 'assets/examples/advanced/futurebuilder_output.png',
    category: 'Advanced',
    icon: Icons.hourglass_empty,
    learnMoreUrl:
        'https://api.flutter.dev/flutter/widgets/FutureBuilder-class.html',
  ),

  FlutterWidgetModel(
    name: 'CustomPaint',
    description:
        'A widget that provides a canvas to draw custom graphics, shapes, and animations during the paint phase.',
    usage:
        'Used to draw complex, custom UI elements or animations, like custom graphs, charts, or illustrations.',
    exampleImage: 'assets/examples/advanced/custompaint.png',
    exampleOutput: 'assets/examples/advanced/custompaint_output.png',
    category: 'Advanced',
    icon: Icons.brush,
    learnMoreUrl:
        'https://api.flutter.dev/flutter/widgets/CustomPaint-class.html',
  ),

  FlutterWidgetModel(
    name: 'AnimatedContainer',
    description:
        'A container that automatically transitions its values when changed, providing smooth animations for layout and styling changes.',
    usage:
        'Used to animate changes to the properties of a container, like color, size, or padding.',
    exampleImage: 'assets/examples/advanced/animatedcontainer.png',
    exampleOutput: 'assets/examples/advanced/animatedcontainer_output.png',
    category: 'Advanced',
    icon: Icons.animation,
    learnMoreUrl:
        'https://api.flutter.dev/flutter/widgets/AnimatedContainer-class.html',
  ),

  FlutterWidgetModel(
    name: 'Provider',
    description:
        'A state management solution that uses inherited widgets to share and update state across the widget tree.',
    usage:
        'Used for managing and propagating state across an app, making it easier to handle complex states and dependencies.',
    exampleImage: 'assets/examples/advanced/provider.png',
    exampleOutput: 'assets/examples/advanced/provider_output.png',
    category: 'Advanced',
    icon: Icons.sync,
    learnMoreUrl:
        'https://api.flutter.dev/flutter/packages/provider/Provider-class.html',
  ),

  // 🎨 NEW EXAMPLES
  FlutterWidgetModel(
    name: 'Drawer',
    description:
        'A slide-in menu that allows navigation between different parts of the app. Typically used for side menus.',
    usage:
        'Used for navigation between major sections of the app, usually triggered by tapping an icon or swipe gesture.',
    exampleImage: 'assets/examples/intermediate/drawer.png',
    exampleOutput: 'assets/examples/intermediate/drawer_output.png',
    category: 'Intermediate',
    icon: Icons.menu,
    learnMoreUrl: 'https://api.flutter.dev/flutter/widgets/Drawer-class.html',
  ),

  FlutterWidgetModel(
    name: 'Form',
    description:
        'A container for form fields, used to collect and validate user input efficiently.',
    usage:
        'Used to create forms with various fields like text fields, checkboxes, and buttons, and handle form submission.',
    exampleImage: 'assets/examples/intermediate/form.png',
    exampleOutput: 'assets/examples/intermediate/form_output.png',
    category: 'Intermediate',
    icon: Icons.list,
    learnMoreUrl: 'https://api.flutter.dev/flutter/widgets/Form-class.html',
  ),

  FlutterWidgetModel(
    name: 'Hero',
    description:
        'A widget that animates the transition of a widget between screens, usually to create smooth page transitions.',
    usage:
        'Used to create a shared element transition, where an element from one screen smoothly transforms into another screen.',
    exampleImage: 'assets/examples/advanced/hero.png',
    exampleOutput: 'assets/examples/advanced/hero_output.png',
    category: 'Advanced',
    icon: Icons.camera_alt,
    learnMoreUrl: 'https://api.flutter.dev/flutter/widgets/Hero-class.html',
  ),

  FlutterWidgetModel(
    name: 'ReorderableListView',
    description: 'A list view that allows the user to drag and reorder items.',
    usage:
        'Used for creating reorderable lists for settings, preferences, or any list-based UI.',
    exampleImage: 'assets/examples/advanced/reorderablelist_code.png',
    exampleOutput: 'assets/examples/advanced/reorderablelist_output.png',
    category: 'Advanced',
    icon: Icons.reorder,
    learnMoreUrl:
        'https://api.flutter.dev/flutter/widgets/ReorderableListView-class.html',
  ),

  FlutterWidgetModel(
    name: 'StreamBuilder',
    description: 'Builds itself based on the latest snapshot of a Stream.',
    usage:
        'Used to reactively build UI with real-time data such as sockets or live updates.',
    exampleImage: 'assets/examples/advanced/streambuilder_code.png',
    exampleOutput: 'assets/examples/advanced/streambuilder_output.png',
    category: 'Advanced',
    icon: Icons.stream,
    learnMoreUrl:
        'https://api.flutter.dev/flutter/widgets/StreamBuilder-class.html',
  ),

  FlutterWidgetModel(
    name: 'AnimatedOpacity',
    description:
        'A widget that animates the opacity of a child widget, creating fade-in and fade-out effects.',
    usage:
        'Used for creating smooth transitions where elements fade in or out of view, typically for UI changes like showing/hiding elements.',
    exampleImage: 'assets/examples/advanced/animatedopacity.png',
    exampleOutput: 'assets/examples/advanced/animatedopacity_output.png',
    category: 'Advanced',
    icon: Icons.opacity,
    learnMoreUrl:
        'https://api.flutter.dev/flutter/widgets/AnimatedOpacity-class.html',
  ),

  FlutterWidgetModel(
    name: 'CircularProgressIndicator',
    description:
        'A circular progress indicator that shows a loading state or progress in an indeterminate fashion.',
    usage:
        'Used to indicate to the user that something is loading, such as fetching data or waiting for a task to complete.',
    exampleImage: 'assets/examples/basic/progress_indicator.png',
    exampleOutput: 'assets/examples/basic/progress_indicator_output.png',
    category: 'Basic',
    icon: Icons.circle,
    learnMoreUrl:
        'https://api.flutter.dev/flutter/material/CircularProgressIndicator-class.html',
  ),

  FlutterWidgetModel(
    name: 'Snackbar',
    description:
        'A lightweight message that briefly appears at the bottom of the screen to provide feedback to the user.',
    usage:
        'Used for displaying short messages, such as confirmation of an action, error, or information.',
    exampleImage: 'assets/examples/basic/snackbar.png',
    exampleOutput: 'assets/examples/basic/snackbar_output.png',
    category: 'Basic',
    icon: Icons.message,
    learnMoreUrl:
        'https://api.flutter.dev/flutter/material/Snackbar-class.html',
  ),

  FlutterWidgetModel(
    name: 'MaterialPageRoute',
    description:
        'A route that uses material design for page navigation, providing a standard transition effect when navigating between screens.',
    usage:
        'Used to navigate between pages in the app with the default material design page transition.',
    exampleImage: 'assets/examples/intermediate/material_page_route.png',
    exampleOutput:
        'assets/examples/intermediate/material_page_route_output.png',
    category: 'Intermediate',
    icon: Icons.pageview,
    learnMoreUrl:
        'https://api.flutter.dev/flutter/material/MaterialPageRoute-class.html',
  ),
];
