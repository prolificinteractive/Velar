![Velar](Images/bg_velar.png)

[![Travis build status](https://img.shields.io/travis/prolificinteractive/Velar.svg?style=flat-square)](https://travis-ci.org/prolificinteractive/Velar)
[![Cocoapods Compatible](https://img.shields.io/cocoapods/v/Velar.svg?style=flat-square)](https://img.shields.io/cocoapods/v/Velar.svg)
[![Platform](https://img.shields.io/cocoapods/p/Velar.svg?style=flat-square)](http://cocoadocs.org/docsets/Velar)
[![Docs](https://img.shields.io/cocoapods/metrics/doc-percent/Velar.svg?style=flat-square)](http://cocoadocs.org/docsets/Velar)

## Description

Velar can present a custom view with a swipeable dismiss gesture.

![Velar.gif](Images/Velar.gif)

## Requirements

* iOS 8.0+

## Installation

### CocoaPods
Pilas is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Velar'
```
## Usage

### Create the Designer 

```
final class DefaultBackgroundOverlayDesigner: BackgroundOverlayDesignable {

    var dismissLabelText: String {
        return "Release to Dismiss!"
    }

    var hideDismissLabel: Bool {
        return false
    }

    var dismissLabelColor: UIColor {
        return UIColor.white
    }

    var backgroundColor: UIColor {
        return UIColor.black.withAlphaComponent(0.4)
    }
}
```

### Build the Modal View Presenter

```
private lazy var velarPresenter: VelarPresenter = {
    return VelarPresenterBuilder.build(designer: DefaultBackgroundOverlayDesigner())
}()
```

### Show the Alert 

```
velarPresenter.show(view: imagePopOverView, animate: true)
```

### Hide the Alert

```
velarPresenter.hide(animate: true)
```


## Contributing to Velar

To report a bug or enhancement request, feel free to file an issue under the respective heading.

If you wish to contribute to the project, fork this repo and submit a pull request. Code contributions should follow the standards specified in the [Prolific Swift Style Guide](https://github.com/prolificinteractive/swift-style-guide).

## License

![prolific](https://s3.amazonaws.com/prolificsitestaging/logos/Prolific_Logo_Full_Color.png)

Copyright (c) 2017 Prolific Interactive

Pilas is maintained and sponsored by Prolific Interactive. It may be redistributed under the terms specified in the [LICENSE] file.

[LICENSE]: ./LICENSE
