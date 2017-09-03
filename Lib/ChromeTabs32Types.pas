unit ChromeTabs32Types;

// The contents of this file are subject to the Mozilla Public License
// Version 1.1 (the "License"); you may not use this file except in compliance
// with the License. You may obtain a copy of the License at http://www.mozilla.org/MPL/
//
// Alternatively, you may redistribute this library, use and/or modify it under the terms of the
// GNU Lesser General Public License as published by the Free Software Foundation;
// either version 2.1 of the License, or (at your option) any later version.
// You may obtain a copy of the LGPL at http://www.gnu.org/copyleft/.
//
// Software distributed under the License is distributed on an "AS IS" basis,
// WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for the
// specific language governing rights and limitations under the License.
//
// The original code is ChromeTabs32.pas, released December 2012.
//
// The initial developer of the original code is Easy-IP AS (Oslo, Norway, www.easy-ip.net),
// written by Paul Spencer Thornton (paul.thornton@easy-ip.net, www.easy-ip.net).
//
// Portions created by Easy-IP AS are Copyright
// (C) 2012 Easy-IP AS. All Rights Reserved.

interface

uses
  {$IF CompilerVersion >= 23.0}
  System.Classes,
  WinApi.Windows;
  {$ELSE}
  Classes,
  Windows;
  {$IFEND}

type
  {$IF CompilerVersion < 18.0}
  TVerticalAlignment = (
    taAlignTop,
    taAlignBottom,
    taVerticalCenter
  );
  {$IFEND}

  TChromeTabDirection = (
    drLeft,
    drRight
  );

  TDrawToFunctions = (
    dfBrush,
    dfPen,
    dfBrushAndPen
  );

  TChromeTabDragType = (
    dtNone,
    dtWithinContainer,
    dtBetweenContainers
  );

  TChromeTabModifiedStyle = (
    msNone,
    msLeftToRight,
    msRightToLeft,
    msKnightRider
  );

  TChromeTabDragDisplay = (
    ddCursor,
    ddTab,
    ddControl,
    ddTabAndControl
  );

  TChromeTabs32SpinnerState = (
    tssNone,
    tssRenderedUpload,
    tssRenderedDownload,
    tssImageUpload,
    tssImageDownload
  );

  TTabChangeType = (
    tcAdded,
    tcMoved,
    tcDeleting,
    tcDeleted,
    tcPropertyUpdated,
    tcActivated,
    tcDeactivated,
    tcPinned,
    tcControlState,
    tcVisibility
  );

  TTabOrientation = (
    toTop,
    toBottom
  );

  TTextTrimType = (
    tttNone,
    tttCharacter,
    tttWord,
    tttEllipsisCharacter,
    tttEllipsisWord,
    tttEllipsisPath,
    tttFade
  );

  THitTestArea = (
    htNowhere,
    htBackground,
    htTab,
    htAddButton,
    htCloseButton,
    htScrollButtonLeft,
    htScrollButtonRight
  );

  TDrawState = (
    dsUnknown,
    dsActive,
    dsNotActive,
    dsDown,
    dsHot,
    dsDisabled
  );

  TCloseButtonVisiblity = (
    bvNever,
    bvAll,
    bvActive
  );

  TChromeTabItemType = (
    itTabContainer,
    itBackground,
    itTab,
    itTabOutline,
    itTabText,
    itTabCloseButton,
    itTabImage,
    itTabImageOverlay,
    itTabImageSpinner,
    itTabMouseGlow,
    itTabModifiedGlow,
    itAddButton,
    itAddButtonPlus,
    itScrollLeftButton,
    itScrollRightButton
  );

  TTabDropOption = (
    tdDeleteDraggedTab,
    tdCreateDroppedTab,
    tdMoveTab
  );
  TTabDropOptions = set of TTabDropOption;

  TChromeTabs32State = (
    stsAnimatingMovement,
    stsAnimatingStyle,
    stsDragging,
    stsDragStarted,
    stsDragFinished,
    stsCancellingDrag,
    stsCompletingDrag,
    stsDeletingUnPinnedTabs,
    stsTabDeleted,
    stsEndTabDeleted,
    stsResizing,
    stsMouseDown,
    stsPendingUpdates,
    stsAddingDroppedTab,
    stsAnimatingNewTab,
    stsFirstPaint,
    stsControlPositionsInvalidated,
    stsDebug,
    stsAnimatingCloseTab
  );
  TChromeTabs32States = set of TChromeTabs32State;

  TChromeTabs32EaseType = (
    ttNone,
    ttLinearTween,
    ttEaseInQuad,
    ttEaseOutQuad,
    ttEaseInOutQuad,
    ttEaseInCubic,
    ttEaseOutCubic,
    ttEaseInOutCubic,
    ttEaseInQuart,
    ttEaseOutQuart,
    ttEaseInOutQuart,
    ttEaseInQuint,
    ttEaseOutQuint,
    ttEaseInOutQuint,
    ttEaseInSine,
    ttEaseOutSine,
    ttEaseInOutSine,
    ttEaseInExpo,
    ttEaseOutExpo,
    ttEaseInOutExpo,
    ttEaseInCirc,
    ttEaseOutCirc,
    ttEaseInOutCirc
  );

  TChromeTabs32crollButtons = (
    csbNone,
    csbLeft,
    csbRight,
    csbLeftAndRight
  );

  TTabDisplayState = (
    tdNormal,
    tdCompressed,
    tdScrolling
  );

  TScrollDirection = (
    mdsNone,
    mdsLeft,
    mdsRight
  );

  TAddButtonVisibility = (
    avNone,
    avLeft,
    avRightFloating,
    avRightFixed
  );

  TDragOverType = (
    dotNone,
    dotHomeContainer,
    dotRemoteContainer
  );

  TBiDiModes = set of TBiDiMode;

  THitTestResult = record
    TabIndex: Integer;
    HitTestArea: THitTestArea;
  end;

  TPolygon = packed array of TPoint;

const
  BidiLeftToRightTabModes: TBiDiModes = [bdLeftToRight, bdRightToLeftReadingOnly];
  BidiRightToLeftTabModes: TBiDiModes = [bdRightToLeft, bdRightToLeftNoAlign];
  BidiLeftToRightTextModes: TBiDiModes = [bdLeftToRight];
  BidiRightToLeftTextModes: TBiDiModes = [bdRightToLeft, bdRightToLeftNoAlign, bdRightToLeftReadingOnly];
  BidiLeftTextAlignmentModes: TBiDiModes = [bdLeftToRight, bdRightToLeftNoAlign, bdRightToLeftReadingOnly];
  BidiRightTextAlignmentModes: TBiDiModes = [bdRightToLeft];


  HitTestDescriptions: array[THitTestArea] of string = (
    'Nowhere',
    'Background',
    'Tab',
    'New Button',
    'Close Button',
    'Scroll Left',
    'Scroll Right'
  );

  TabChangeTypeDescriptions: array[TTabChangeType] of string = (
    'Added',
    'Moved',
    'Deleting',
    'Deleted',
    'PropertyUpdated',
    'Activated',
    'Deactivated',
    'Pinned',
    'Control State',
    'Visibility'
  );

  TabDrawStateDescriptions: array[TDrawState] of string = (
    'Unknown',
    'Active',
    'Not Active',
    'Down',
    'Hot',
    'Disabled'
  );

  ChromeTabs32StateDescriptions: array[TChromeTabs32State] of string = (
    'Animating Movement',
    'Animating Style',
    'Dragging',
    'Drag Started',
    'Drag Finished',
    'Cancelling Drag',
    'Completing Drag',
    'Tabs Deleted By Close Button',
    'Tab Deleted',
    'End Tab Deleted',
    'Resizing',
    'Mouse Down',
    'Pending Updates',
    'Adding Dropped Tab',
    'Animating New Tab',
    'First Paint',
    'Controls Invalidated',
    'Debug',
    'Animating Close Tab'
  );

  ChromeTabs32ControlTypeDescriptions: array[TChromeTabItemType] of string = (
    'Tab Container',
    'Background',
    'Tab',
    'Tab Outline',
    'Tab Text',
    'Tab Close Button',
    'Tab Image',
    'Tab Image Overlay',
    'Tab Image Spinner',
    'Tab Mouse Glow',
    'Tab Modified Glow',
    'Add Button',
    'Add Button Plus',
    'Scroll Left Button',
    'Scroll Right Button'
  );

  ChromeTabs32EaseTypeDestriptions: array[TChromeTabs32EaseType] of string = (
    'None',
    'LinearTween',
    'In Quad',
    'Out Quad',
    'In Out Quad',
    'In Cubic',
    'Out Cubic',
    'In Out Cubic',
    'In Quart',
    'Out Quart',
    'In Out Quart',
    'In Quint',
    'Out Quint',
    'In Out Quint',
    'In Sine',
    'Out Sine',
    'In Out Sine',
    'In Expo',
    'Out Expo',
    'In Out Expo',
    'In Circ',
    'Out Circ',
    'In Out Circ'
  );

implementation

end.
