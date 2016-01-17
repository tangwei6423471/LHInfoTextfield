# LHInfoTextfield

[![CI Status](http://img.shields.io/travis/leoMobileDeveloper/LHInfoTextfield.svg?style=flat)](https://travis-ci.org/leoMobileDeveloper/LHInfoTextfield)
[![Version](https://img.shields.io/cocoapods/v/LHInfoTextfield.svg?style=flat)](http://cocoapods.org/pods/LHInfoTextfield)

## Gif
<img src="https://raw.github.com/LeoMobileDeveloper/LHInfoTextfield/master/ScreenShot/gif.gif" width="320" />


## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

- ARC

## Installation

LHInfoTextfield is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "LHInfoTextfield"
```


##How to use
In the file that you want to use
```
    #import "UITextField+LHInfo.h"

```
Add a condition
```
[self.textfield lh_addObserverWithCondition:^BOOL(UITextField *textfield) {
    return textfield.text.length > 8;
} Config:^(LHAnchorView *anchorView) {
    anchorView.borderColor = [UIColor redColor];
    anchorView.textColor = [UIColor redColor];
} Infomation:@"HaHa length is greater that 8"];

[self.textfield lh_addObserverWithCondition:^BOOL(UITextField *textfield) {
    return textfield.text.length > 6;
} Config:^(LHAnchorView *anchorView) {
    anchorView.borderColor = [UIColor darkGrayColor];
    anchorView.textColor = [UIColor blueColor];
} Infomation:@"💀👻🎅"];


```
Note:When add multi conditions,it will follow the order the the conditon is added,and find the first condition that match.

## Author

leoMobileDeveloper, leomobiledeveloper@gmail.com

## License

LHInfoTextfield is available under the MIT license. See the LICENSE file for more info.
