//
//  RoofUIStyleGuide.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 4/22/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation
import CoreGraphics
import UIKit


///Screen width over largest screen width
private var multiplier = UIScreen.main.bounds.size.width/414


//MARK: durations

let roofUITimeIntervalExtraLong: TimeInterval = 0.5
let roofUITimeIntervalLong: TimeInterval = 0.35
let roofUITimeIntervalStandard: TimeInterval = 0.3
let roofUITimeIntervalShort: TimeInterval = 0.15

//MARK: corner radius

let roofUICornerRadius: CGFloat = 10


//MARK: margins


let roofUIMargin0: CGFloat = min(8, 8 * multiplier)
let roofUIMarginA: CGFloat = min(11, 11 * multiplier)
let roofUIMarginB: CGFloat = min(17, 17 * multiplier)
let roofUIMarginC: CGFloat = min(20, 20 * multiplier)
let roofUIMarginD: CGFloat = min(40, 40 * multiplier)
let roofUIMarginE: CGFloat = min(62, 62 * multiplier)
let roofUIMarginF: CGFloat = min(90, 90 * multiplier)
let roofUIMarginG: CGFloat = min(120, 120 * multiplier)

let roofUIFormCellVerticalPadding: CGFloat = min(15, 15 * multiplier)


//MARK: heights
let roofUIButtonHeight: CGFloat = min(60, 60 * multiplier)
let roofUIFieldAuxiliaryViewSize: CGFloat = min(22, 22 * multiplier)
let roofUIKeyboardAccessoryHeight: CGFloat = min(40, 40 * multiplier)
let roofUISectionHeaderHeight: CGFloat = min(48, 48 * multiplier)
let roofUIFloatingNavigationButtonHeight: CGFloat = min(46, 46 * multiplier)
let roofUIBarButtonHeight: CGFloat = 33
let roofUIActivityIndicatorHeight: CGFloat = 100


//MARK: widths
let roofUIMaxButtonWidth: CGFloat = min(300, 300 * multiplier)
let roofUIImageStandardWidth: CGFloat = min(80, 80 * multiplier)
let roofUIImageMediumWidth: CGFloat = min(100, 100 * multiplier)
let roofUIIconSize: CGFloat = 32
let roofUIIconSizeSmall: CGFloat = 16

//MARK: shadows
let roofUINavShadowHeight: CGFloat = 2
let roofUINavShadowOpacity: Float = 0.8
let roofUIButtonSheetShadowOpacity: Float = 1
let roofUIButtonSheetShadowOffset: CGSize = CGSize.zero
let roofUINavShadowColor: UIColor = roofUINeutralCColor
let roofUIButtonSheetShadowColor: UIColor = roofUINeutralEColor
let roofUINavShadowRadius: CGFloat = 0
let roofUIButtonSheetShadowRadius: CGFloat = 5

//MARK: priorities
let roofUILayoutPriorityHigh: CGFloat = 750


//MARK: colors
///Reds
let roofUIPrimaryColor = UIColor(red: 255/255, green: 90/255, blue: 100/255, alpha: 1)
///Blues
let roofUISecondaryColor = UIColor(red: 61/255, green: 192/255, blue: 215/255, alpha: 1)
let roofUISecondaryDarkColor = UIColor(red: 15/255, green: 109/255, blue: 125/255, alpha: 1)
//Yellows
let roofUIAlertColor = UIColor(red: 231/255, green: 210/255, blue: 99/255, alpha: 1)
let roofUIAlertDarkColor = UIColor(red: 142/255, green: 125/255, blue: 33/255, alpha: 1)


///Grays
let roofUINeutralAColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
let roofUINeutralBColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
let roofUINeutralCColor = UIColor(red: 239/255, green: 239/255, blue: 239/255, alpha: 1)
let roofUINeutralDColor = UIColor(red: 221/255, green: 221/255, blue: 221/255, alpha: 1)
let roofUINeutralEColor = UIColor(red: 189/255, green: 189/255, blue: 189/255, alpha: 1)
let roofUINeutralFColor = UIColor(red: 133/255, green: 133/255, blue: 133/255, alpha: 1)
let roofUINeutralGColor = UIColor(red: 46/255, green: 46/255, blue: 46/255, alpha: 1)

//MARK: alphas
let roofUIStandardTapAlpha: CGFloat = 0.7

//MARK: fonts

let roofUIFontNameRegular = "AzoSans-Regular"
let roofUIFontNameMedium = "AzoSans-Medium"

let roofUIFontThin = roofUIFontNameRegular
let roofUIFontThick = roofUIFontNameMedium

//MARK: font sizes
let roofUIFontSizeNav: CGFloat = 18
let roofUIFontSizeTiny: CGFloat = min(12, 12 * multiplier)
let roofUIFontSizeSmall: CGFloat = min(14, 14 * multiplier)
let roofUIFontSizeMedium: CGFloat = min(17, 17 * multiplier)
let roofUIFontSizeLarge: CGFloat = min(18, 18 * multiplier)
let roofUIFontSizeExtraLarge: CGFloat = min(32, 32 * multiplier)

///For labels and text fields that adjust size.
let roofUIFontSizeMinimum: CGFloat = 8
let roofUIMinimumScaleFactor: CGFloat = 0.5

///Swipe speeds
let roofUIStandardSwipeThreshold: CGFloat = 1200
let roofUIStandardSwipeDistanceThreshold: CGFloat = UIScreen.main.bounds.size.width * 0.34


//MARK: style guid

protocol RoofUITextStyle {
    var font: UIFont? { get }
    var textColor: UIColor? { get }
}
protocol RoofUIKeyboardAccessoryStyle {
    var titleStyle: RoofUITextStyle { get }
    var backgroundColor: UIColor? { get }
    var dividerColor: UIColor? { get }
    var shadowColor: UIColor? { get }
    var shadowRadius: CGFloat? { get }
    var shadowOpacity: Float? { get }
    var shadowOffset: CGSize? { get }
}
protocol RoofUIButtonSheetStyle {
    var backgroundColor: UIColor? { get }
    var shadowColor: UIColor? { get }
    var shadowRadius: CGFloat? { get }
    var shadowOpacity: Float? { get }
    var shadowOffset: CGSize? { get }
}
protocol RoofUIButtonSheetFormStyle: RoofUIButtonSheetStyle {
    var headerLabelStyle: RoofUITextStyle { get }
    var subheaderLabelStyle: RoofUITextStyle? { get }
}
protocol RoofUITextFieldStyle: RoofUITextStyle {
    var placeholderStyle: RoofUITextStyle? { get }
    var accessoryViewStyle: RoofUIKeyboardAccessoryStyle { get }
}
protocol RoofUITitleTextFieldStyle: RoofUITextFieldStyle {
    var labelStyle: RoofUITextStyle { get }
}
protocol RoofUISwitchStyle {
    var onTint: UIColor? { get }
    var offTint: UIColor? { get }
    var indicatorBackgroundColor: UIColor? { get }
}
protocol RoofUITableViewStyle {
    var tableStyle: UITableViewStyle { get }
    var bounces: Bool { get }
    var backgroundColor: UIColor? { get }
}
protocol RoofUITableViewCellStyle {
    var backgroundColor: UIColor? { get }
    var seperatorColor: UIColor? { get }
}

protocol RoofUITableViewCellActionStyle: RoofUITableViewCellStyle {
    var topLeftTextStyle: RoofUITextStyle { get }
    var bottomRightTextStyle: RoofUITextStyle { get }
    var bottomRightThinTextStyle: RoofUITextStyle { get }
    var bottomLeftTextStyle: RoofUITextStyle { get }
    var topRightTextStyleNormal: RoofUITextStyle { get }
    var topRightTextStyleAccent: RoofUITextStyle { get }
    var topRightTextStyleIdle: RoofUITextStyle { get }
}
protocol RoofUITableViewCellDetailStyle: RoofUITableViewCellStyle {
    var topLeftTextStyle: RoofUITextStyle { get }
    var topLeftThinTextStyle: RoofUITextStyle { get }
    var topRightTextStyleNormal: RoofUITextStyle { get }
    var topRightTextStyleAccent: RoofUITextStyle { get }
    var topRightTextStyleIdle: RoofUITextStyle { get }
    var bottomLeftTextStyle: RoofUITextStyle { get }
    var bottomRightTextStyle: RoofUITextStyle { get }
}
protocol RoofUITableViewCellStatusStyle: RoofUITableViewCellStyle {
    var titleTextStyleNormal: RoofUITextStyle { get }
    var titleTextStyleAccent: RoofUITextStyle { get }
    var titleTextStyleIdle: RoofUITextStyle { get }
    var backgroundColorAccent: UIColor? { get }
    var backgroundColorIdle: UIColor? { get }
    var statusTextStyleNormal: RoofUITextStyle { get }
    var statusTextStyleAccent: RoofUITextStyle { get }
    var statusTextStyleIdle: RoofUITextStyle { get }
}
protocol RoofUITableViewCellSegueStyle: RoofUITableViewCellStyle {
    var labelTextThinStyleNormal: RoofUITextStyle { get }
    var labelTextThinStyleAccent: RoofUITextStyle { get }
    var labelTextThinStyleIdle: RoofUITextStyle { get }
    var labelTextStyleNormal: RoofUITextStyle { get }
    var labelTextStyleAccent: RoofUITextStyle { get }
    var labelTextStyleIdle: RoofUITextStyle { get }
    var chevronColor: UIColor? { get }
    var alignment: NSTextAlignment { get }
    var backgroundColorAccent: UIColor? { get }
    var backgroundColorIdle: UIColor? { get }
}
protocol RoofUITableViewCellTextFieldStyle: RoofUITableViewCellStyle {
    var textFieldTextStyle: RoofUITextFieldStyle { get }
    var textFieldAlignment: NSTextAlignment { get }
}
protocol RoofUITableViewCellTitleTextFieldStyle: RoofUITableViewCellStyle {
    var textFieldTextStyle: RoofUITitleTextFieldStyle { get }
}
protocol RoofUITableViewCellPreviewStyle: RoofUITableViewCellStyle {
    var labelTextStyle: RoofUITextStyle { get }
    var titleTextStyle: RoofUITextStyle { get }
}
protocol RoofUITableViewCellSwitchStyle: RoofUITableViewCellStyle {
    var labelTextStyle: RoofUITextStyle { get }
    var switchStyle: RoofUISwitchStyle? { get }
}
protocol RoofUITableViewCellCheckStyle: RoofUITableViewCellStyle {
    var labelTextStyle: RoofUITextStyle { get }
    var selectedLabelTextStyle: RoofUITextStyle { get }
}
protocol RoofUITableViewHeaderStyle {
    var labelTextStyle: RoofUITextStyle { get }
    var backgroundColor: UIColor? { get }
    var borderWidth: CGFloat { get }
    var borderColor: UIColor? { get }
    var height: CGFloat { get }
}
protocol RoofUITableSectionHeaderViewStyle {
    var headerStyle: RoofUITextStyle { get }
    var detailStyle: RoofUITextStyle { get }
    var backgroundColor: UIColor? { get }
    var textAlignment: NSTextAlignment { get }
}
protocol RoofUITableSectionFooterButtonStyle {
    var buttonStyle: RoofUIButtonStyle { get }
}
protocol RoofUITableHeaderFooterViewStyle {
    var textStyle: RoofUITextStyle { get }
    var keyTextStyle: RoofUITextStyle { get }
    var backgroundColor: UIColor? { get }
    var textAlignment: NSTextAlignment { get }
    var buttonStyle: RoofUIButtonStyle { get }
}
protocol RoofUIButtonStyle {
    var backgroundColor: UIColor? { get }
    var borderColor: UIColor? { get }
    var titleTextStyle: RoofUITextStyle { get }
    var buttonType: RoofUIButtonType { get }
}
protocol RoofUINavigationBarStyle {
    var titleStyle: RoofUITextStyle { get }
    var backgroundColor: UIColor? { get }
}

