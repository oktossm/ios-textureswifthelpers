//
// Created by Mikhail Mulyar on 06/11/16.
// Copyright (c) 2016 Mikhail Mulyar. All rights reserved.
//

import UIKit
import AsyncDisplayKit


//MARK: - Specs


extension ASLayoutElement {

    public var layoutElement: ASLayoutElement {
        return self
    }

    public func with(insets: UIEdgeInsets) -> ASLayoutSpec {
        return ASInsetLayoutSpec(insets: insets, child: self)
    }

    public func with(insets: CGFloat) -> ASLayoutSpec {
        return ASInsetLayoutSpec(insets: UIEdgeInsetsMake(insets, insets, insets, insets), child: self)
    }

    public func with(_ top: CGFloat, _ left: CGFloat, _ bottom: CGFloat, _ right: CGFloat) -> ASLayoutSpec {
        return ASInsetLayoutSpec(insets: UIEdgeInsetsMake(top, left, bottom, right), child: self)
    }

    public func with(overlay: ASLayoutElement) -> ASLayoutSpec {
        return ASOverlayLayoutSpec(child: self, overlay: overlay)
    }

    public func with(background: ASLayoutElement) -> ASLayoutSpec {
        return ASBackgroundLayoutSpec(child: self, background: background)
    }

    public func wrapped() -> ASLayoutSpec {
        return ASWrapperLayoutSpec(layoutElement: self)
    }

    public func absolute() -> ASLayoutSpec {
        return ASAbsoluteLayoutSpec(children: [self])
    }

    public func centered(_ centering: ASCenterLayoutSpecCenteringOptions = .XY,
                         sizing: ASCenterLayoutSpecSizingOptions = []) -> ASLayoutSpec {
        return ASCenterLayoutSpec(centeringOptions: centering, sizingOptions: sizing, child: self)
    }

    public func laidOut(horizontally: ASRelativeLayoutSpecPosition = .start,
                        vertically: ASRelativeLayoutSpecPosition = .start,
                        sizing: ASRelativeLayoutSpecSizingOption = []) -> ASLayoutSpec {
        return ASRelativeLayoutSpec(horizontalPosition: horizontally,
                                    verticalPosition: vertically,
                                    sizingOption: sizing,
                                    child: self)
    }

    public func with(ratio: CGFloat) -> ASLayoutSpec {
        return ASRatioLayoutSpec(ratio: ratio, child: self)
    }
}


//MARK: - ASLayoutElementStyle


extension ASLayoutElement {

    public func styled(_ modification: (ASLayoutElementStyle) -> ()) -> ASLayoutElement {
        modification(self.style)
        return self
    }

    public func with(width: CGFloat) -> ASLayoutElement {
        self.style.width = width.points
        return self
    }

    public func with(width: ASDimension) -> ASLayoutElement {
        self.style.width = width
        return self
    }

    public func with(height: CGFloat) -> ASLayoutElement {
        self.style.height = height.points
        return self
    }

    public func with(height: ASDimension) -> ASLayoutElement {
        self.style.height = height
        return self
    }

    public func with(maxWidth: CGFloat) -> ASLayoutElement {
        self.style.maxWidth = maxWidth.points
        return self
    }

    public func with(maxWidth: ASDimension) -> ASLayoutElement {
        self.style.maxWidth = maxWidth
        return self
    }

    public func with(maxHeight: CGFloat) -> ASLayoutElement {
        self.style.maxHeight = maxHeight.points
        return self
    }

    public func with(maxHeight: ASDimension) -> ASLayoutElement {
        self.style.maxHeight = maxHeight
        return self
    }

    public func with(minWidth: CGFloat) -> ASLayoutElement {
        self.style.minWidth = minWidth.points
        return self
    }

    public func with(minWidth: ASDimension) -> ASLayoutElement {
        self.style.minWidth = minWidth
        return self
    }

    public func with(minHeight: CGFloat) -> ASLayoutElement {
        self.style.minHeight = minHeight.points
        return self
    }

    public func with(minHeight: ASDimension) -> ASLayoutElement {
        self.style.minHeight = minHeight
        return self
    }

    public func withSize(_ width: CGFloat, _ height: CGFloat) -> ASLayoutElement {
        self.style.preferredSize = CGSize(width: width, height: height)
        return self
    }

    public func withSize(_ width: ASDimension, _ height: ASDimension) -> ASLayoutElement {
        self.style.preferredLayoutSize = ASLayoutSize(width: width, height: height)
        return self
    }

    public func withMinSize(_ width: CGFloat, _ height: CGFloat) -> ASLayoutElement {
        self.style.minSize = CGSize(width: width, height: height)
        return self
    }

    public func withMinSize(_ width: ASDimension, _ height: ASDimension) -> ASLayoutElement {
        self.style.minLayoutSize = ASLayoutSize(width: width, height: height)
        return self
    }

    public func withMaxSize(_ width: CGFloat, _ height: CGFloat) -> ASLayoutElement {
        self.style.maxSize = CGSize(width: width, height: height)
        return self
    }

    public func withMaxSize(_ width: ASDimension, _ height: ASDimension) -> ASLayoutElement {
        self.style.maxLayoutSize = ASLayoutSize(width: width, height: height)
        return self
    }
}


//MARK: - ASStackLayoutElement


extension ASLayoutElement {

    public func withSpacing(before value: CGFloat) -> ASLayoutElement {
        self.style.spacingBefore = value
        return self
    }

    public func withSpacing(after value: CGFloat) -> ASLayoutElement {
        self.style.spacingAfter = value
        return self
    }

    public func withFlexGrow(_ value: CGFloat = 1.0) -> ASLayoutElement {
        self.style.flexGrow = value
        return self
    }

    public func withFlexShrink(_ value: CGFloat = 1.0) -> ASLayoutElement {
        self.style.flexShrink = value
        return self
    }

    public var flexible: ASLayoutElement {
        self.style.flexShrink = 1.0
        self.style.flexGrow = 1.0
        return self
    }

    public func withFlex(basis value: ASDimension) -> ASLayoutElement {
        self.style.flexBasis = value
        return self
    }

    public func aligned(_ value: ASStackLayoutAlignSelf) -> ASLayoutElement {
        self.style.alignSelf = value
        return self
    }

    public func with(ascender value: CGFloat) -> ASLayoutElement {
        self.style.ascender = value
        return self
    }

    public func with(descender value: CGFloat) -> ASLayoutElement {
        self.style.descender = value
        return self
    }
}


//MARK: - ASAbsoluteLayoutElement


extension ASLayoutElement {

    public func withPosition(_ value: CGPoint) -> ASLayoutElement {
        self.style.layoutPosition = value
        return self
    }

    public func withPosition(_ x: CGFloat, _ y: CGFloat) -> ASLayoutElement {
        self.style.layoutPosition = CGPoint(x: x, y: y)
        return self
    }

    public func positioned(at value: CGPoint) -> ASLayoutElement {
        self.style.layoutPosition = value
        return self.absolute()
    }

    public func positioned(at x: CGFloat, _ y: CGFloat) -> ASLayoutElement {
        self.style.layoutPosition = CGPoint(x: x, y: y)
        return self.absolute()
    }
}


//MARK: - ASStackLayoutSpec, ASAbsoluteLayoutSpec


extension Array where Element: ASLayoutElement {

    public func stacked(direction: ASStackLayoutDirection = .horizontal,
                        spacing: CGFloat = 0,
                        justify: ASStackLayoutJustifyContent = .start,
                        align: ASStackLayoutAlignItems = .stretch,
                        flexWrap: ASStackLayoutFlexWrap = .noWrap,
                        alignContent: ASStackLayoutAlignContent = .start) -> ASStackLayoutSpec {
        return ASStackLayoutSpec(direction: direction,
                                 spacing: spacing,
                                 justifyContent: justify,
                                 alignItems: align,
                                 flexWrap: .noWrap,
                                 alignContent: .start,
                                 children: self)
    }

    public func horizontallyStacked(spacing: CGFloat = 0,
                                    justify: ASStackLayoutJustifyContent = .start,
                                    align: ASStackLayoutAlignItems = .stretch,
                                    flexWrap: ASStackLayoutFlexWrap = .noWrap,
                                    alignContent: ASStackLayoutAlignContent = .start) -> ASStackLayoutSpec {
        return ASStackLayoutSpec(direction: .horizontal,
                                 spacing: spacing,
                                 justifyContent: justify,
                                 alignItems: align,
                                 flexWrap: .noWrap,
                                 alignContent: .start,
                                 children: self)
    }

    public func verticallyStacked(spacing: CGFloat = 0,
                                  justify: ASStackLayoutJustifyContent = .start,
                                  align: ASStackLayoutAlignItems = .stretch,
                                  flexWrap: ASStackLayoutFlexWrap = .noWrap,
                                  alignContent: ASStackLayoutAlignContent = .start) -> ASStackLayoutSpec {
        return ASStackLayoutSpec(direction: .vertical,
                                 spacing: spacing,
                                 justifyContent: justify,
                                 alignItems: align,
                                 flexWrap: .noWrap,
                                 alignContent: .start,
                                 children: self)
    }

    public func absolute(with sizing: ASAbsoluteLayoutSpecSizing = .default) -> ASAbsoluteLayoutSpec {
        return ASAbsoluteLayoutSpec(sizing: sizing, children: self)
    }
}


//MARK: - ASDimension helpers


public extension ASDimension {
    public static var auto: ASDimension {
        return ASDimensionMake(.auto, 0)
    }
}


public protocol CGFloatConvertible {
    func cgFloatValue() -> CGFloat
}


public extension CGFloatConvertible {

    public var points: ASDimension {
        return ASDimensionMake(self.cgFloatValue())
    }

    public var fraction: ASDimension {
        return ASDimensionMakeWithFraction(self.cgFloatValue())
    }
}


extension Double: CGFloatConvertible {
    public func cgFloatValue() -> CGFloat {
        return CGFloat(self)
    }
}


extension Float: CGFloatConvertible {
    public func cgFloatValue() -> CGFloat {
        return CGFloat(self)
    }
}


extension CGFloat: CGFloatConvertible {
    public func cgFloatValue() -> CGFloat {
        return self
    }
}


extension Integer {
    public func cgFloatValue() -> CGFloat {
        return CGFloat(self.toIntMax())
    }
}


extension Int: CGFloatConvertible {
}


extension Int8: CGFloatConvertible {
}


extension Int16: CGFloatConvertible {
}


extension Int32: CGFloatConvertible {
}


extension Int64: CGFloatConvertible {
}


extension UInt: CGFloatConvertible {
}


extension UInt8: CGFloatConvertible {
}


extension UInt16: CGFloatConvertible {
}


extension UInt32: CGFloatConvertible {
}


extension UInt64: CGFloatConvertible {
}


//MARK: - Flexible specs


extension ASLayoutElement {

    public static var flexible: ASLayoutElement {
        return ASLayoutSpec().flexible
    }

    public static var spacer: ASLayoutElement {
        return ASLayoutSpec().withFlexGrow()
    }
}
