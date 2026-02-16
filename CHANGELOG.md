## 2.1.1
- CHANGELOG and README updated

## 2.1.0
- `s_packages` dependency upgraded
- Added `ShakeController` for programmatic shake triggering via `controller.shake()`

## 2.0.0
- package no longer holds the source code for it, but exports/exposes the `s_packages` package instead, which will hold this package's latest source code.
- The only future changes to this package will be made via `s_packages` package dependency upgrades, in order to bring the new fixes or changes to this package
- dependent on `s_packages`: ^1.1.2


## 1.0.2

* Added Demo GIF example

## 1.0.1

* Added comprehensive dartdoc comments to all public API elements (100% coverage)
* Improved package description for better clarity
* Enhanced documentation with detailed parameter descriptions and examples
* Updated README.md with complete API reference and usage examples
* All files verified and up to date with latest package information

## 1.0.0

* Initial stable release of the Shaker package
* Implemented `Shaker` widget for adding shake animations to any Flutter widget
* Customizable shake parameters:
  * Duration control for animation length
  * Frequency (hz) adjustment for shake speed
  * Rotation angle customization
  * Offset control for shake direction and intensity
  * Curve customization for animation easing
* onComplete callback support for post-animation actions
* Built on flutter_animate package for smooth performance
* Comprehensive example application demonstrating usage
* Full test coverage with unit and widget tests
* MIT License

## 0.0.1

* Initial development release
