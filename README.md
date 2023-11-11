
# Cupertino Squircle

Cupertino Squircle is a Flutter package that provides a simple way to create squircle shapes (squared circles) with customizable borders and colors, inspired by the design language of Apple's iOS. This package is ideal for developers looking to add a touch of Cupertino aesthetic to their Flutter applications.

## Features

- **Customizable Squircles:** Easily create squircle shapes with customizable background colors.
- **Border Customization:** Option to add borders to the squircles with control over color and width.
- **Flutter Compatibility:** Works with all flutter-supported platform.

## Getting Started

To start using the Cupertino Squircle package, add it to your Flutter project by including it in your `pubspec.yaml` file:

yamlCopy code

`dependencies:
  cupertino_squircle: ^1.0.0` 

After adding the dependency, run `flutter packages get` in your terminal to download and install it.

## Usage

Import the package in your Dart code:

dartCopy code

`import 'package:cupertino_squircle/cupertino_squircle.dart';` 

Here's a simple example to create a squircle:

dartCopy code

`CupertinoSquircle(
  bgColor: Colors.blue,
  borderColor: Colors.white,
  borderWidth: 2.0,
  height: 100.0,
)` 

For more examples, please refer to the `/example` folder.

## Additional Information

- **Contributing:** Contributions are welcome! Please read our contributing guidelines to get started.
- **Issues and Feedback:** For any issues, questions, or feedback, please file an issue on the GitHub repository.
- **License:** This project is licensed under the MIT License - see the LICENSE file for details.