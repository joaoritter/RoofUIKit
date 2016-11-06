//
//  RoofUIStyles.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 5/6/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation
import UIKit


//MARK: keyboard accessory styles
struct RoofUIKeyboardAccessoryStyleBlue: RoofUIKeyboardAccessoryStyle {
    let titleStyle: RoofUITextStyle = RoofUITextStyleThickMediumGrayA()
    let backgroundColor: UIColor? = roofUISecondaryColor
    let dividerColor: UIColor? = roofUINeutralAColor
    let shadowColor: UIColor? = roofUINavShadowColor
    let shadowRadius: CGFloat? = roofUINavShadowRadius
    let shadowOpacity: Float? = roofUINavShadowOpacity
    let shadowOffset: CGSize? = CGSize(width: 0, height: roofUINavShadowHeight)
}

//MARK: button sheet styles
struct RoofUIButtonSheetFormStyleAlert: RoofUIButtonSheetFormStyle {
    let backgroundColor: UIColor? = roofUIAlertColor
    let headerLabelStyle: RoofUITextStyle = RoofUITextStyleThinMediumDarkYellow()
    let subheaderLabelStyle: RoofUITextStyle? = nil
    let shadowColor: UIColor? = roofUIButtonSheetShadowColor
    let shadowRadius: CGFloat? = roofUIButtonSheetShadowRadius
    let shadowOpacity: Float? = roofUIButtonSheetShadowOpacity
    let shadowOffset: CGSize? = CGSize.zero
}

struct RoofUIButtonSheetFormStyleAccent: RoofUIButtonSheetFormStyle {
    let backgroundColor: UIColor? = roofUISecondaryColor
    let headerLabelStyle: RoofUITextStyle = RoofUITextStyleThinMediumDarkBlue()
    let subheaderLabelStyle: RoofUITextStyle? = nil
    let shadowColor: UIColor? = roofUIButtonSheetShadowColor
    let shadowRadius: CGFloat? = roofUIButtonSheetShadowRadius
    let shadowOpacity: Float? = roofUIButtonSheetShadowOpacity
    let shadowOffset: CGSize? = CGSize.zero
}

struct RoofUIButtonSheetFormStyleDefault: RoofUIButtonSheetFormStyle {
    let backgroundColor: UIColor? = roofUINeutralAColor
    let headerLabelStyle: RoofUITextStyle = RoofUITextStyleThickLargeRed()
    let subheaderLabelStyle: RoofUITextStyle? = RoofUITextStyleThinSmallGrayF()
    let shadowColor: UIColor? = roofUIButtonSheetShadowColor
    let shadowRadius: CGFloat? = roofUIButtonSheetShadowRadius
    let shadowOpacity: Float? = roofUIButtonSheetShadowOpacity
    let shadowOffset: CGSize? = CGSize.zero
}

struct RoofUIButtonSheetFormStyleDefaultAccented: RoofUIButtonSheetFormStyle {
    let backgroundColor: UIColor? = roofUINeutralAColor
    let headerLabelStyle: RoofUITextStyle = RoofUITextStyleThickLargeRed()
    let subheaderLabelStyle: RoofUITextStyle? = RoofUITextStyleThinMediumBlueA()
    let shadowColor: UIColor? = roofUIButtonSheetShadowColor
    let shadowRadius: CGFloat? = roofUIButtonSheetShadowRadius
    let shadowOpacity: Float? = roofUIButtonSheetShadowOpacity
    let shadowOffset: CGSize? = CGSize.zero
}

struct RoofUIButtonSheetFormStyleNoShadow: RoofUIButtonSheetFormStyle {
    let backgroundColor: UIColor? = roofUINeutralAColor
    let headerLabelStyle: RoofUITextStyle = RoofUITextStyleThickLargeRed()
    let subheaderLabelStyle: RoofUITextStyle? = RoofUITextStyleThinSmallGrayF()
    let shadowColor: UIColor? = nil
    let shadowRadius: CGFloat? = nil
    let shadowOpacity: Float? = nil
    let shadowOffset: CGSize? = CGSize.zero
}

//MARK: text field styles
struct RoofUITextFieldStyleDefault: RoofUITextFieldStyle {
    let font: UIFont? = UIFont(
        name: roofUIFontThin,
        size: roofUIFontSizeLarge
    )
    let textColor: UIColor? = roofUISecondaryColor
    let placeholderStyle: RoofUITextStyle? = RoofUITextStyleThinLargeGrayD()
    let accessoryViewStyle: RoofUIKeyboardAccessoryStyle = RoofUIKeyboardAccessoryStyleBlue()
}

struct RoofUITextFieldStyleBig: RoofUITextFieldStyle {
    let font: UIFont? = UIFont(
        name: roofUIFontThin,
        size: roofUIFontSizeExtraLarge
    )
    let textColor: UIColor? = roofUISecondaryColor
    let placeholderStyle: RoofUITextStyle? = RoofUITextStyleThinExtraLargeGrayD()
    let accessoryViewStyle: RoofUIKeyboardAccessoryStyle = RoofUIKeyboardAccessoryStyleBlue()
}

struct RoofUITextFieldStyleSmall: RoofUITextFieldStyle {
    let font: UIFont? = UIFont(
        name: roofUIFontThin,
        size: roofUIFontSizeMedium
    )
    let textColor: UIColor? = roofUISecondaryColor
    let placeholderStyle: RoofUITextStyle? = nil
    let accessoryViewStyle: RoofUIKeyboardAccessoryStyle = RoofUIKeyboardAccessoryStyleBlue()
}

//MARK: text styles

struct RoofUITextStyleThinNavRed: RoofUITextStyle {
    let font: UIFont? = UIFont(
        name: roofUIFontThin,
        size: roofUIFontSizeNav
    )
    let textColor: UIColor? = roofUIPrimaryColor
}

struct RoofUITextStyleThinMediumBlueA: RoofUITextStyle {
    let font: UIFont? = UIFont(
        name: roofUIFontThin,
        size: roofUIFontSizeMedium
    )
    let textColor: UIColor? = roofUISecondaryColor
}

struct RoofUITextStyleThickSmallRed: RoofUITextStyle {
    let font: UIFont? = UIFont(
        name: roofUIFontThick,
        size: roofUIFontSizeSmall
    )
    let textColor: UIColor? = roofUIPrimaryColor
}

struct RoofUITextStyleThinLargeGrayA: RoofUITextStyle {
    let font: UIFont? = UIFont(
        name: roofUIFontThin,
        size: roofUIFontSizeLarge
    )
    let textColor: UIColor? = roofUINeutralAColor
}

struct RoofUITextStyleThickLargeGrayA: RoofUITextStyle {
    let font: UIFont? = UIFont(
        name: roofUIFontThick,
        size: roofUIFontSizeLarge
    )
    let textColor: UIColor? = roofUINeutralAColor
}
struct RoofUITextStyleThinLargeBlueB: RoofUITextStyle {
    let font: UIFont? = UIFont(
        name: roofUIFontThin,
        size: roofUIFontSizeLarge
    )
    let textColor: UIColor? = roofUISecondaryDarkColor
}
struct RoofUITextStyleThinLargeYellowB: RoofUITextStyle {
    let font: UIFont? = UIFont(
        name: roofUIFontThin,
        size: roofUIFontSizeLarge
    )
    let textColor: UIColor? = roofUIAlertDarkColor
}

struct RoofUITextStyleThickLargeYellow: RoofUITextStyle {
    let font: UIFont? = UIFont(
        name: roofUIFontThick,
        size: roofUIFontSizeLarge
    )
    let textColor: UIColor? = roofUIAlertColor
}
struct RoofUITextStyleThinLargeYellow: RoofUITextStyle {
    let font: UIFont? = UIFont(
        name: roofUIFontThin,
        size: roofUIFontSizeLarge
    )
    let textColor: UIColor? = roofUIAlertColor
}

struct RoofUITextStyleThinLargeBlueA: RoofUITextStyle {
    let font: UIFont? = UIFont(
        name: roofUIFontThin,
        size: roofUIFontSizeLarge
    )
    let textColor: UIColor? = roofUISecondaryColor
}

struct RoofUITextStyleThinLargeGrayH: RoofUITextStyle {
    let font: UIFont? = UIFont(
        name: roofUIFontThin,
        size: roofUIFontSizeLarge
    )
    let textColor: UIColor? = roofUINeutralGColor
}

struct RoofUITextStyleThinMediumDarkYellow: RoofUITextStyle {
    let font: UIFont? = UIFont(
        name: roofUIFontThin,
        size: roofUIFontSizeMedium
    )
    let textColor: UIColor? = roofUIAlertDarkColor
}
struct RoofUITextStyleThinMediumDarkBlue: RoofUITextStyle {
    let font: UIFont? = UIFont(
        name: roofUIFontThin,
        size: roofUIFontSizeMedium
    )
    let textColor: UIColor? = roofUISecondaryDarkColor
}

struct RoofUITextStyleThinSmallGrayF: RoofUITextStyle {
    let font: UIFont? = UIFont(
        name: roofUIFontThin,
        size: roofUIFontSizeSmall
    )
    let textColor: UIColor? = roofUINeutralFColor
}

struct RoofUITextStyleThinSmallGrayH: RoofUITextStyle {
    let font: UIFont? = UIFont(
        name: roofUIFontThin,
        size: roofUIFontSizeSmall
    )
    let textColor: UIColor? = roofUINeutralGColor
}

struct RoofUITextStyleThickSmallGrayH: RoofUITextStyle {
    let font: UIFont? = UIFont(
        name: roofUIFontThick,
        size: roofUIFontSizeSmall
    )
    let textColor: UIColor? = roofUINeutralGColor
}

struct RoofUITextStyleThinSmallGrayA: RoofUITextStyle {
    let font: UIFont? = UIFont(
        name: roofUIFontThin,
        size: roofUIFontSizeSmall
    )
    let textColor: UIColor? = roofUINeutralAColor
}

struct RoofUITextStyleThinSmallGrayE: RoofUITextStyle {
    let font: UIFont? = UIFont(
        name: roofUIFontThin,
        size: roofUIFontSizeSmall
    )
    let textColor: UIColor? = roofUINeutralEColor
}
struct RoofUITextStyleThinSmallGrayD: RoofUITextStyle {
    let font: UIFont? = UIFont(
        name: roofUIFontThin,
        size: roofUIFontSizeSmall
    )
    let textColor: UIColor? = roofUINeutralDColor
}
struct RoofUITextStyleThinTinyGrayE: RoofUITextStyle {
    let font: UIFont? = UIFont(
        name: roofUIFontThin,
        size: roofUIFontSizeTiny
    )
    let textColor: UIColor? = roofUINeutralEColor
}
struct RoofUITextStyleThinTinyGrayF: RoofUITextStyle {
    let font: UIFont? = UIFont(
        name: roofUIFontThin,
        size: roofUIFontSizeTiny
    )
    let textColor: UIColor? = roofUINeutralFColor
}

struct RoofUITextStyleThinSmallGrayC: RoofUITextStyle {
    let font: UIFont? = UIFont(
        name: roofUIFontThin,
        size: roofUIFontSizeSmall
    )
    let textColor: UIColor? = roofUINeutralCColor
}

struct RoofUITextStyleThinMediumGrayE: RoofUITextStyle {
    let font: UIFont? = UIFont(
        name: roofUIFontThin,
        size: roofUIFontSizeMedium
    )
    let textColor: UIColor? = roofUINeutralEColor
}
struct RoofUITextStyleThinMediumGrayF: RoofUITextStyle {
    let font: UIFont? = UIFont(
        name: roofUIFontThin,
        size: roofUIFontSizeMedium
    )
    let textColor: UIColor? = roofUINeutralFColor
}
struct RoofUITextStyleThinLargeGrayD: RoofUITextStyle {
    let font: UIFont? = UIFont(
        name: roofUIFontThin,
        size: roofUIFontSizeLarge
    )
    let textColor: UIColor? = roofUINeutralDColor
}
struct RoofUITextStyleThinExtraLargeGrayD: RoofUITextStyle {
    let font: UIFont? = UIFont(
        name: roofUIFontThin,
        size: roofUIFontSizeExtraLarge
    )
    let textColor: UIColor? = roofUINeutralDColor
}
struct RoofUITextStyleThinMediumGrayH: RoofUITextStyle {
    let font: UIFont? = UIFont(
        name: roofUIFontThin,
        size: roofUIFontSizeMedium
    )
    let textColor: UIColor? = roofUINeutralGColor
}

struct RoofUITextStyleThickSmallGrayE: RoofUITextStyle {
    let font: UIFont? = UIFont(
        name: roofUIFontThick,
        size: roofUIFontSizeSmall
    )
    let textColor: UIColor? = roofUINeutralEColor
}

struct RoofUITextStyleThickSmallGrayF: RoofUITextStyle {
    let font: UIFont? = UIFont(
        name: roofUIFontThick,
        size: roofUIFontSizeSmall
    )
    let textColor: UIColor? = roofUINeutralFColor
}

struct RoofUITextStyleThickMediumGrayF: RoofUITextStyle {
    let font: UIFont? = UIFont(
        name: roofUIFontThick,
        size: roofUIFontSizeMedium
    )
    let textColor: UIColor? = roofUINeutralFColor
}

struct RoofUITextStyleThickSmallBlueA: RoofUITextStyle {
    let font: UIFont? = UIFont(
        name: roofUIFontThick,
        size: roofUIFontSizeSmall
    )
    let textColor: UIColor? = roofUISecondaryColor
}

struct RoofUITextStyleThickLargeGrayE: RoofUITextStyle {
    let font: UIFont? = UIFont(
        name: roofUIFontThick,
        size: roofUIFontSizeLarge
    )
    let textColor: UIColor? = roofUINeutralEColor
}

struct RoofUITextStyleThinLargeGrayF: RoofUITextStyle {
    let font: UIFont? = UIFont(
        name: roofUIFontThin,
        size: roofUIFontSizeLarge
    )
    let textColor: UIColor? = roofUINeutralFColor
}
struct RoofUITextStyleThinLargeGrayE: RoofUITextStyle {
    let font: UIFont? = UIFont(
        name: roofUIFontThin,
        size: roofUIFontSizeLarge
    )
    let textColor: UIColor? = roofUINeutralEColor
}

struct RoofUITextStyleThickLargeRed: RoofUITextStyle {
    let font: UIFont? = UIFont(
        name: roofUIFontThick,
        size: roofUIFontSizeLarge
    )
    let textColor: UIColor? = roofUIPrimaryColor
}

struct RoofUITextStyleThickMediumGrayA: RoofUITextStyle {
    let font: UIFont? = UIFont(
        name: roofUIFontThick,
        size: roofUIFontSizeMedium
    )
    let textColor: UIColor? = roofUINeutralAColor
}

//MARK: switch styles

struct RoofUISwitchStyleDefault: RoofUISwitchStyle {
    var offTint: UIColor? = roofUINeutralEColor
    var onTint: UIColor? = roofUISecondaryColor
    var indicatorBackgroundColor: UIColor? = roofUINeutralCColor
}

//MARK: text field styles

struct RoofUITitleTextFieldStyleDefault: RoofUITitleTextFieldStyle {
    let font: UIFont? = UIFont(
        name: roofUIFontThin,
        size: roofUIFontSizeMedium
    )
    let textColor: UIColor? = roofUISecondaryColor
    let placeholderStyle: RoofUITextStyle? = RoofUITextStyleThinSmallGrayD()
    let accessoryViewStyle: RoofUIKeyboardAccessoryStyle = RoofUIKeyboardAccessoryStyleBlue()
    let labelStyle: RoofUITextStyle = RoofUITextStyleThinMediumGrayF()
}
struct RoofUITitleTextFieldStyleFixed: RoofUITitleTextFieldStyle {
    let font: UIFont? = UIFont(
        name: roofUIFontThin,
        size: roofUIFontSizeMedium
    )
    let textColor: UIColor? = roofUINeutralEColor
    let placeholderStyle: RoofUITextStyle? = RoofUITextStyleThinSmallGrayD()
    let accessoryViewStyle: RoofUIKeyboardAccessoryStyle = RoofUIKeyboardAccessoryStyleBlue()
    let labelStyle: RoofUITextStyle = RoofUITextStyleThickMediumGrayF()
}
struct RoofUITitleTextFieldStyleFixedBold: RoofUITitleTextFieldStyle {
    let font: UIFont? = UIFont(
        name: roofUIFontThick,
        size: roofUIFontSizeMedium
    )
    let textColor: UIColor? = roofUINeutralFColor
    let placeholderStyle: RoofUITextStyle? = RoofUITextStyleThinSmallGrayD()
    let accessoryViewStyle: RoofUIKeyboardAccessoryStyle = RoofUIKeyboardAccessoryStyleBlue()
    let labelStyle: RoofUITextStyle = RoofUITextStyleThickMediumGrayF()
}

//MARK: TABLE VIEW STYLES

struct RoofUITableViewStyleDefault: RoofUITableViewStyle {
    let tableStyle: UITableViewStyle = .grouped
    var bottomButtonStyle: RoofUIButtonStyle = RoofUIButtonStyleBlueA()
    let bounces: Bool = true
    let backgroundColor: UIColor? = roofUINeutralAColor
}

//MARK: table view cell styles

struct RoofUITableViewCellTextFieldStyleDefault: RoofUITableViewCellTextFieldStyle {
    let backgroundColor: UIColor? = nil
    let borderWidth: CGFloat = 0
    let borderColor: UIColor? = nil
    let textFieldTextStyle: RoofUITextFieldStyle = RoofUITextFieldStyleDefault()
    let seperatorColor: UIColor? = nil
    let textFieldAlignment: NSTextAlignment =  .center //.Left
}
struct RoofUITableViewCellTextFieldStyleBig: RoofUITableViewCellTextFieldStyle {
    let backgroundColor: UIColor? = nil
    let borderWidth: CGFloat = 0
    let borderColor: UIColor? = nil
    let textFieldTextStyle: RoofUITextFieldStyle = RoofUITextFieldStyleBig()
    let seperatorColor: UIColor? = nil
    let textFieldAlignment: NSTextAlignment = .center
}
struct RoofUITableViewCellTextFieldStyleSmall: RoofUITableViewCellTextFieldStyle {
    let backgroundColor: UIColor? = nil
    let borderWidth: CGFloat = 0
    let borderColor: UIColor? = nil
    let textFieldTextStyle: RoofUITextFieldStyle = RoofUITextFieldStyleSmall()
    let seperatorColor: UIColor? = nil
    let textFieldAlignment: NSTextAlignment = .center
}
struct RoofUITableViewCellTitleTextFieldStyleDefault: RoofUITableViewCellTitleTextFieldStyle {
    let backgroundColor: UIColor? = nil
    let borderWidth: CGFloat = 0
    let borderColor: UIColor? = nil
    let textFieldTextStyle: RoofUITitleTextFieldStyle = RoofUITitleTextFieldStyleDefault()
    let seperatorColor: UIColor? = roofUINeutralCColor
    let subLabelTextStyle: RoofUITextStyle? = RoofUITextStyleThinSmallGrayE()
}
struct RoofUITableViewCellTitleTextFieldStyleFixed: RoofUITableViewCellTitleTextFieldStyle {
    let backgroundColor: UIColor? = nil
    let borderWidth: CGFloat = 0
    let borderColor: UIColor? = nil
    let textFieldTextStyle: RoofUITitleTextFieldStyle = RoofUITitleTextFieldStyleFixed()
    let seperatorColor: UIColor? = nil
    let subLabelTextStyle: RoofUITextStyle? = RoofUITextStyleThinSmallGrayE()
}
struct RoofUITableViewCellTitleTextFieldStyleFixedBold: RoofUITableViewCellTitleTextFieldStyle {
    let backgroundColor: UIColor? = roofUINeutralBColor
    let borderWidth: CGFloat = 0
    let borderColor: UIColor? = nil
    let textFieldTextStyle: RoofUITitleTextFieldStyle = RoofUITitleTextFieldStyleFixedBold()
    let seperatorColor: UIColor? = nil
    let subLabelTextStyle: RoofUITextStyle? = RoofUITextStyleThinSmallGrayE()
}
struct RoofUITableViewCellPreviewStyleDefault: RoofUITableViewCellPreviewStyle {
    let backgroundColor: UIColor? = nil
    let borderWidth: CGFloat = 0
    let borderColor: UIColor? = nil
    let labelTextStyle: RoofUITextStyle = RoofUITextStyleThinMediumBlueA()
    let titleTextStyle: RoofUITextStyle = RoofUITextStyleThinMediumGrayF()
    let seperatorColor: UIColor? = roofUINeutralCColor
}

struct RoofUITableViewCellCheckStyleDefault: RoofUITableViewCellCheckStyle {
    let backgroundColor: UIColor? = nil
    let borderWidth: CGFloat = 0
    let borderColor: UIColor? = nil
    let labelTextStyle: RoofUITextStyle = RoofUITextStyleThinMediumGrayF()
    let selectedLabelTextStyle: RoofUITextStyle = RoofUITitleTextFieldStyleDefault()
    let seperatorColor: UIColor? = roofUINeutralCColor
}

struct RoofUITableViewCellSwitchStyleDefault: RoofUITableViewCellSwitchStyle {
    let backgroundColor: UIColor? = nil
    let borderWidth: CGFloat = 0
    let borderColor: UIColor? = nil
    let labelTextStyle: RoofUITextStyle = RoofUITextStyleThinMediumGrayF()
    let seperatorColor: UIColor? = roofUINeutralCColor
    let switchStyle: RoofUISwitchStyle? = RoofUISwitchStyleDefault()
}

struct RoofUITableViewCellSwitchStyleBold: RoofUITableViewCellSwitchStyle {
    let backgroundColor: UIColor? = nil
    let borderWidth: CGFloat = 0
    let borderColor: UIColor? = nil
    let labelTextStyle: RoofUITextStyle = RoofUITextStyleThickMediumGrayF()
    let seperatorColor: UIColor? = nil
    let switchStyle: RoofUISwitchStyle? = RoofUISwitchStyleDefault()
}

struct RoofUITableViewCellDetailStyleDefault: RoofUITableViewCellDetailStyle {
    
    let backgroundColor: UIColor? = roofUINeutralAColor
    let seperatorColor: UIColor? = roofUINeutralDColor
    let topLeftTextStyle: RoofUITextStyle = RoofUITextStyleThickSmallGrayH()
    let topLeftThinTextStyle: RoofUITextStyle = RoofUITextStyleThinSmallGrayH()
    let bottomRightTextStyle: RoofUITextStyle = RoofUITextStyleThinSmallGrayF()
    let bottomLeftTextStyle: RoofUITextStyle = RoofUITextStyleThinSmallGrayE()
    let topRightTextStyleNormal: RoofUITextStyle = RoofUITextStyleThinTinyGrayF()
    let topRightTextStyleAccent: RoofUITextStyle = RoofUITextStyleThinTinyGrayF()
    let topRightTextStyleIdle: RoofUITextStyle = RoofUITextStyleThinTinyGrayF()
}

struct RoofUITableViewCellActionStyleGrayNormal: RoofUITableViewCellActionStyle {
    let backgroundColor: UIColor? = roofUINeutralAColor
    let seperatorColor: UIColor? = roofUINeutralDColor
    let bottomRightTextStyle: RoofUITextStyle = RoofUITextStyleThickSmallGrayE()
    let bottomRightThinTextStyle: RoofUITextStyle = RoofUITextStyleThinSmallGrayD()
    let topLeftTextStyle: RoofUITextStyle = RoofUITextStyleThinLargeGrayH()
    let bottomLeftTextStyle: RoofUITextStyle = RoofUITextStyleThinSmallGrayE()
    let bottomRightTextStyleAttention: RoofUITextStyle = RoofUITextStyleThickSmallGrayE()
    let topRightTextStyleNormal: RoofUITextStyle = RoofUITextStyleThinLargeGrayE()
    let topRightTextStyleAccent: RoofUITextStyle = RoofUITextStyleThickLargeYellow()
    let topRightTextStyleIdle: RoofUITextStyle = RoofUITextStyleThinLargeGrayD()
}

struct RoofUITableViewCellActionStyleAccent: RoofUITableViewCellActionStyle {
    let backgroundColor: UIColor? = roofUINeutralAColor
    let seperatorColor: UIColor? = roofUINeutralEColor
    let bottomRightTextStyle: RoofUITextStyle = RoofUITextStyleThickSmallBlueA()
    let bottomRightThinTextStyle: RoofUITextStyle = RoofUITextStyleThickSmallBlueA()
    let topLeftTextStyle: RoofUITextStyle = RoofUITextStyleThinLargeGrayH()
    let bottomLeftTextStyle: RoofUITextStyle = RoofUITextStyleThinSmallGrayE()
    let bottomRightTextStyleAttention: RoofUITextStyle = RoofUITextStyleThickSmallGrayE()
    let topRightTextStyleNormal: RoofUITextStyle = RoofUITextStyleThinLargeGrayE()
    let topRightTextStyleAccent: RoofUITextStyle = RoofUITextStyleThickLargeYellow()
    let topRightTextStyleIdle: RoofUITextStyle = RoofUITextStyleThinLargeGrayD()
}

struct RoofUITableViewCellStatusStyleLeaderboard: RoofUITableViewCellStatusStyle {
    let backgroundColor: UIColor? = roofUINeutralAColor
    let backgroundColorAccent: UIColor? = roofUINeutralAColor
    let backgroundColorIdle: UIColor? = roofUINeutralAColor
    let seperatorColor: UIColor? = nil
    let titleTextStyleNormal: RoofUITextStyle = RoofUITextStyleThinLargeGrayH()
    let titleTextStyleAccent: RoofUITextStyle = RoofUITextStyleThinLargeGrayH()
    let titleTextStyleIdle: RoofUITextStyle = RoofUITextStyleThinLargeGrayH()
    let statusTextStyleNormal: RoofUITextStyle = RoofUITextStyleThinLargeBlueA()
    let statusTextStyleAccent: RoofUITextStyle = RoofUITextStyleThinLargeBlueA()
    let statusTextStyleIdle: RoofUITextStyle = RoofUITextStyleThinLargeBlueA()
}

struct RoofUITableViewCellStatusStyleNoBackground: RoofUITableViewCellStatusStyle {
    let backgroundColor: UIColor? = roofUINeutralAColor
    let backgroundColorAccent: UIColor? = roofUINeutralAColor
    let backgroundColorIdle: UIColor? = roofUINeutralAColor
    let seperatorColor: UIColor? = roofUINeutralDColor
    let titleTextStyleNormal: RoofUITextStyle = RoofUITextStyleThinLargeGrayH()
    let titleTextStyleAccent: RoofUITextStyle = RoofUITextStyleThinLargeGrayH()
    let titleTextStyleIdle: RoofUITextStyle = RoofUITextStyleThinLargeGrayH()
    let statusTextStyleNormal: RoofUITextStyle = RoofUITextStyleThinLargeBlueA()
    let statusTextStyleAccent: RoofUITextStyle = RoofUITextStyleThinLargeYellow()
    let statusTextStyleIdle: RoofUITextStyle = RoofUITextStyleThinLargeGrayE()
}

struct RoofUITableViewCellStatusStyleIdle: RoofUITableViewCellStatusStyle {
    let backgroundColor: UIColor? = roofUINeutralAColor
    let backgroundColorAccent: UIColor? = roofUINeutralAColor
    let backgroundColorIdle: UIColor? = roofUINeutralAColor
    let seperatorColor: UIColor? = roofUINeutralDColor
    let titleTextStyleNormal: RoofUITextStyle = RoofUITextStyleThinLargeGrayF()
    let titleTextStyleAccent: RoofUITextStyle = RoofUITextStyleThinLargeGrayF()
    let titleTextStyleIdle: RoofUITextStyle = RoofUITextStyleThinLargeGrayF()
    let statusTextStyleNormal: RoofUITextStyle = RoofUITextStyleThinLargeGrayE()
    let statusTextStyleAccent: RoofUITextStyle = RoofUITextStyleThinLargeGrayE()
    let statusTextStyleIdle: RoofUITextStyle = RoofUITextStyleThinLargeGrayE()
}

struct RoofUITableViewCellStatusStyleDefault: RoofUITableViewCellStatusStyle {
    let backgroundColor: UIColor? = roofUISecondaryColor
    let backgroundColorAccent: UIColor? = roofUIAlertColor
    let backgroundColorIdle: UIColor? = roofUISecondaryColor
    let seperatorColor: UIColor? = nil
    let titleTextStyleNormal: RoofUITextStyle = RoofUITextStyleThinLargeBlueB()
    let titleTextStyleAccent: RoofUITextStyle = RoofUITextStyleThinLargeYellowB()
    let titleTextStyleIdle: RoofUITextStyle = RoofUITextStyleThinLargeBlueB()
    let statusTextStyleNormal: RoofUITextStyle = RoofUITextStyleThickLargeGrayA()
    let statusTextStyleAccent: RoofUITextStyle = RoofUITextStyleThickLargeGrayA()
    let statusTextStyleIdle: RoofUITextStyle = RoofUITextStyleThickLargeGrayA()
}

struct RoofUITableViewCellStatusStyleLight: RoofUITableViewCellStatusStyle {
    let backgroundColor: UIColor? = roofUINeutralAColor
    let backgroundColorAccent: UIColor? = roofUINeutralAColor
    let backgroundColorIdle: UIColor? = roofUINeutralAColor
    let seperatorColor: UIColor? = roofUINeutralDColor
    let titleTextStyleNormal: RoofUITextStyle = RoofUITextStyleThinLargeGrayH()
    let titleTextStyleAccent: RoofUITextStyle = RoofUITextStyleThinLargeGrayH()
    let titleTextStyleIdle: RoofUITextStyle = RoofUITextStyleThinLargeGrayH()
    let statusTextStyleNormal: RoofUITextStyle = RoofUITextStyleThinLargeGrayD()
    let statusTextStyleAccent: RoofUITextStyle = RoofUITextStyleThinLargeGrayD()
    let statusTextStyleIdle: RoofUITextStyle = RoofUITextStyleThinLargeGrayD()
}


struct RoofUITableViewCellSegueDefault: RoofUITableViewCellSegueStyle {
    let backgroundColor: UIColor? = roofUINeutralAColor
    let backgroundColorAccent: UIColor? = roofUINeutralAColor
    let backgroundColorIdle: UIColor? = roofUINeutralAColor
    let borderWidth: CGFloat = 0
    let borderColor: UIColor? = nil
    let labelTextThinStyleNormal: RoofUITextStyle = RoofUITextStyleThinLargeGrayE()
    let labelTextThinStyleAccent: RoofUITextStyle = RoofUITextStyleThinLargeGrayE()
    let labelTextThinStyleIdle: RoofUITextStyle = RoofUITextStyleThinLargeGrayE()
    let labelTextStyleNormal: RoofUITextStyle = RoofUITextStyleThickLargeGrayE()
    let labelTextStyleAccent: RoofUITextStyle = RoofUITextStyleThickLargeGrayE()
    let labelTextStyleIdle: RoofUITextStyle = RoofUITextStyleThickLargeGrayE()
    let alignment: NSTextAlignment = .left
    let seperatorColor: UIColor? = roofUINeutralDColor
    var chevronColor: UIColor? = roofUINeutralDColor
}

struct RoofUITableViewCellSegueColorful: RoofUITableViewCellSegueStyle {
    let backgroundColor: UIColor? = roofUISecondaryColor
    let backgroundColorAccent: UIColor? = roofUIAlertColor
    let backgroundColorIdle: UIColor? = roofUISecondaryColor
    let borderWidth: CGFloat = 0
    let borderColor: UIColor? = nil
    let labelTextThinStyleNormal: RoofUITextStyle = RoofUITextStyleThinLargeGrayA()
    let labelTextThinStyleAccent: RoofUITextStyle = RoofUITextStyleThinLargeGrayA()
    let labelTextThinStyleIdle: RoofUITextStyle = RoofUITextStyleThinLargeGrayA()
    let labelTextStyleNormal: RoofUITextStyle = RoofUITextStyleThickLargeGrayA()
    let labelTextStyleAccent: RoofUITextStyle = RoofUITextStyleThickLargeGrayA()
    let labelTextStyleIdle: RoofUITextStyle = RoofUITextStyleThickLargeGrayA()
    let alignment: NSTextAlignment = .left
    let seperatorColor: UIColor? = roofUINeutralDColor
    var chevronColor: UIColor? = roofUINeutralDColor
}


//MARK: table view section header styles


struct RoofUITableSectionHeaderStyleGrayBLeftSmall: RoofUITableSectionHeaderViewStyle {
    let headerStyle: RoofUITextStyle = RoofUITextStyleThinSmallGrayE()
    let detailStyle: RoofUITextStyle = RoofUITextStyleThinSmallGrayE()
    let backgroundColor: UIColor? = roofUINeutralBColor
    let textAlignment: NSTextAlignment = .left
}

struct RoofUITableSectionHeaderStyleGrayBLeftMedium: RoofUITableSectionHeaderViewStyle {
    let headerStyle: RoofUITextStyle = RoofUITextStyleThickSmallBlueA()
    let detailStyle: RoofUITextStyle = RoofUITextStyleThinTinyGrayE()
    let backgroundColor: UIColor? = roofUINeutralBColor
    let textAlignment: NSTextAlignment = .left
}
struct RoofUITableSectionHeaderStyleDescription: RoofUITableSectionHeaderViewStyle {
    let headerStyle: RoofUITextStyle = RoofUITextStyleThickLargeRed()
    let detailStyle: RoofUITextStyle = RoofUITextStyleThinSmallGrayF()
    let backgroundColor: UIColor? = roofUINeutralAColor
    let textAlignment: NSTextAlignment = .left
}
struct RoofUITableSectionHeaderStyleGrayBLeftMediumLight: RoofUITableSectionHeaderViewStyle {
    let headerStyle: RoofUITextStyle = RoofUITextStyleThickSmallGrayF()
    let detailStyle: RoofUITextStyle = RoofUITextStyleThinTinyGrayE()
    let backgroundColor: UIColor? = roofUINeutralBColor
    let textAlignment: NSTextAlignment = .left
}

struct RoofUITableTableButtonHeaderFooterStyleBlueCenteredSmall: RoofUITableHeaderFooterViewStyle {
    let textStyle: RoofUITextStyle = RoofUITextStyleThinMediumGrayH()
    let keyTextStyle: RoofUITextStyle = RoofUITextStyleThickSmallGrayE()
    let backgroundColor: UIColor? = roofUINeutralAColor
    let textAlignment: NSTextAlignment = .center
    let buttonStyle: RoofUIButtonStyle = RoofUIButtonStyleBlueBordered()
}


//MARK: button styles

struct RoofUIButtonStyleBlueA: RoofUIButtonStyle {
    let backgroundColor: UIColor? = roofUISecondaryColor
    let borderColor: UIColor? = nil
    let titleTextStyle: RoofUITextStyle = RoofUITextStyleThinLargeGrayA()
    let buttonType: RoofUIButtonType = .action
}

struct RoofUIButtonStyleYellow: RoofUIButtonStyle {
    let backgroundColor: UIColor? = roofUIAlertColor
    let borderColor: UIColor? = nil
    let titleTextStyle: RoofUITextStyle = RoofUITextStyleThinLargeGrayA()
    let buttonType: RoofUIButtonType = .action
}

struct RoofUIButtonStyleRed: RoofUIButtonStyle {
    let backgroundColor: UIColor? = roofUIPrimaryColor
    let borderColor: UIColor? = nil
    let titleTextStyle: RoofUITextStyle = RoofUITextStyleThinLargeGrayA()
    let buttonType: RoofUIButtonType = .action
}

struct RoofUIButtonStyleBlueBordered: RoofUIButtonStyle {
    let backgroundColor: UIColor? = roofUINeutralAColor
    let borderColor: UIColor? = roofUISecondaryColor
    let titleTextStyle: RoofUITextStyle = RoofUITextStyleThinLargeBlueA()
    let buttonType: RoofUIButtonType = .action
}

struct RoofUIButtonStyleGrayNoBorder: RoofUIButtonStyle {
    let backgroundColor: UIColor? = nil
    let borderColor: UIColor? = nil
    let titleTextStyle: RoofUITextStyle = RoofUITextStyleThinMediumGrayE()
    let buttonType: RoofUIButtonType = .action
}

struct RoofUIButtonStyleWhiteBordered: RoofUIButtonStyle {
    let backgroundColor: UIColor? = nil
    let borderColor: UIColor? = roofUINeutralAColor
    let titleTextStyle: RoofUITextStyle = RoofUITextStyleThinLargeGrayA()
    let buttonType: RoofUIButtonType = .action
}
struct RoofUIButtonStyleGrayBordered: RoofUIButtonStyle {
    let backgroundColor: UIColor? = roofUINeutralAColor
    let borderColor: UIColor? = roofUINeutralEColor
    let titleTextStyle: RoofUITextStyle = RoofUITextStyleThinLargeGrayE()
    let buttonType: RoofUIButtonType = .action
}

struct RoofUIButtonStyleWhiteNoBorder: RoofUIButtonStyle {
    let backgroundColor: UIColor? = nil
    let borderColor: UIColor? = nil
    let titleTextStyle: RoofUITextStyle = RoofUITextStyleThinLargeGrayA()
    let buttonType: RoofUIButtonType = .action
}


//MARK: navigation styles

struct RoofUINavigationBarStyleDefault: RoofUINavigationBarStyle {
    let titleStyle: RoofUITextStyle = RoofUITextStyleThinNavRed()
    let backgroundColor: UIColor? = roofUINeutralAColor
}
