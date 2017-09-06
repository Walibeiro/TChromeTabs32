unit frmMainU;

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
// The original code is ChromeTabsTop.pas, released December 2012.
//
// The initial developer of the original code is Easy-IP AS (Oslo, Norway, www.easy-ip.net),
// written by Paul Spencer Thornton (paul.thornton@easy-ip.net, www.easy-ip.net).
//
// Portions created by Easy-IP AS are Copyright
// (C) 2012 Easy-IP AS. All Rights Reserved.

interface

{$if CompilerVersion >= 21.0}
  {$DEFINE USE_GLASS_FORM}
{$ifend}

// Fix to workaround compiler bug that re-introduces System.Actions
{$if CompilerVersion >= 28.0}
  {$DEFINE USE_SYSTEM_ACTIONS}
{$endif}

{$if CompilerVersion >= 29.0}
  {$DEFINE USE_SYSTEM_IMAGELIST}
{$ifend}

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ActnList, ComCtrls, Spin, Contnrs,
  ExtCtrls, ImgList, Types, Menus, ClipBrd, AppEvnts,

  frameChromeTabsStyleU,

  GR32, GR32_Paths,

  {$IFDEF USE_GLASS_FORM}ChromeTabs32GlassForm,{$ENDIF}

(* NOTE - If you get "unit xxx is redeclared errors", comment out the IFDEF lines
   below. This is due to a Delphi bug with the {$if CompilerVersion .. } * )
  {$IFDEF USE_SYSTEM_ACTIONS}System.Actions,{$ENDIF}
  {$IFDEF USE_SYSTEM_IMAGELIST}System.ImageList,{$ENDIF}                   *)

  ChromeTabs32,
  ChromeTabs32Types,
  ChromeTabs32Utils,
  ChromeTabs32Controls,
  ChromeTabs32Classes,
  ChromeTabs32Log, System.Actions;

type
  TFormType = {$IFDEF USE_GLASS_FORM}
              TChromeTabs32GlassForm
              {$ELSE}
              TForm
              {$ENDIF};

  TfrmMain = class(TFormType)
    ChromeTabsTop: TChromeTabs32;
    ChromeTabsBottom: TChromeTabs32;
    ActionCopyLookAndFeelAsCode: TAction;
    ActionCopyOptionsAsCode: TAction;
    ActionList: TActionList;
    ActionLoadLookAndFeel: TAction;
    ActionLoadOptions: TAction;
    ActionSaveLookandFeel: TAction;
    ActionSaveOptions: TAction;
    ApplicationEvents: TApplicationEvents;
    ButtonCopyLookAndFeel: TButton;
    ButtonCopyOptions: TButton;
    ButtonDeleteActiveTab: TButton;
    ButtonHideTab: TButton;
    ButtonLoadLookAndFeel: TButton;
    ButtonLoadOptions: TButton;
    ButtonMakeAllTabsVisible: TButton;
    ButtonOpenForm: TButton;
    ButtonSaveLookAndFeel: TButton;
    ButtonSaveOptions: TButton;
    ButtonScrollActiveTabIntoView: TButton;
    CheckBoxAddTabDefaults: TCheckBox;
    CheckBoxAutoHideScrollButtons: TCheckBox;
    CheckBoxBackgroundDoubleClickMaximise: TCheckBox;
    CheckBoxCloseButtonAutoHide: TCheckBox;
    CheckBoxContrainDraggedTab: TCheckBox;
    CheckBoxCustomTabShapes: TCheckBox;
    CheckBoxDebugLog: TCheckBox;
    CheckBoxDeleteTabDefaults: TCheckBox;
    CheckBoxDisplayTopTabsInTitleBar: TCheckBox;
    CheckBoxDraggingBackgoundMovesForm: TCheckBox;
    CheckBoxEnableEvents: TCheckBox;
    CheckBoxHideClosebutton: TCheckBox;
    CheckBoxHideImagesWhenSpinnerActive: TCheckBox;
    CheckBoxIgnorePropertyUpdated: TCheckBox;
    CheckBoxModified: TCheckBox;
    CheckBoxMouseGlowVisible: TCheckBox;
    CheckBoxMouseWheelScrolling: TCheckBox;
    CheckBoxMoveTabDefaults: TCheckBox;
    CheckBoxPinned: TCheckBox;
    CheckBoxRightClickSelect: TCheckBox;
    CheckBoxScrolling: TCheckBox;
    CheckBoxScrollOverlayButtons: TCheckBox;
    CheckBoxScrollWhileDragging: TCheckBox;
    CheckBoxSeeThroughTabs: TCheckBox;
    CheckBoxSetTabWidthsFromCaptions: TCheckBox;
    CheckBoxShowPlus: TCheckBox;
    CheckBoxShowTextOnPinnedTabs: TCheckBox;
    CheckBoxSmartResize: TCheckBox;
    CheckBoxSpinnerDownloadReverseDirection: TCheckBox;
    CheckBoxSpinnerUploadReverseDirection: TCheckBox;
    CheckBoxTabWordWrap: TCheckBox;
    CheckBoxTransparentBackground: TCheckBox;
    CheckBoxUseGlass: TCheckBox;
    ComboBoxAddButtonVisibility: TComboBox;
    ComboBoxAddTabEase: TComboBox;
    ComboBoxBidiMode: TComboBox;
    ComboBoxCanvasSmoothingMode: TComboBox;
    ComboBoxCloseButtonVisibility: TComboBox;
    ComboBoxDeleteTabEase: TComboBox;
    ComboBoxDragCursor: TComboBox;
    ComboBoxDragType: TComboBox;
    ComboBoxExternalDragDisplay: TComboBox;
    ComboBoxFontHintMode: TComboBox;
    ComboBoxFontName: TComboBox;
    ComboBoxModifiedGlowEaseType: TComboBox;
    ComboBoxModifiedGlowStyle: TComboBox;
    ComboBoxMovementEaseType: TComboBox;
    ComboBoxMoveTabEase: TComboBox;
    ComboBoxScrollButtons: TComboBox;
    ComboBoxSelectTabs: TComboBox;
    ComboBoxSpinnerState: TComboBox;
    ComboBoxStyleEaseType: TComboBox;
    ComboBoxTextAlignment: TComboBox;
    ComboBoxTextTrimming: TComboBox;
    ComboBoxTextVerticalAlignment: TComboBox;
    EditAddButtonFloatingHorzOffset: TSpinEdit;
    EditAddButtonHeight: TSpinEdit;
    EditAddButtonHorzOffset: TSpinEdit;
    EditAddButtonVerticalOffset: TSpinEdit;
    EditAddButtonWidth: TSpinEdit;
    EditAddTabTime: TSpinEdit;
    EditAnimationStepsMovement: TSpinEdit;
    EditAnimationStepsStyle: TSpinEdit;
    EditAnimationUpdate: TSpinEdit;
    EditCloseButtonAutoHideWidth: TSpinEdit;
    EditCloseButtonHeight: TSpinEdit;
    EditCloseButtonHorzOffset: TSpinEdit;
    EditCloseButtonMouseLeaveDelay: TSpinEdit;
    EditCloseButtonVerticalOffset: TSpinEdit;
    EditCloseButtonWidth: TSpinEdit;
    EditContainerOffsetLeft: TSpinEdit;
    EditContainerOffsetRight: TSpinEdit;
    EditCrossOffset: TSpinEdit;
    EditDeleteTabTime: TSpinEdit;
    EditDragAwayDistance: TSpinEdit;
    EditDragImageAapha: TSpinEdit;
    EditDragImageResize: TEdit;
    EditDragScrollEdge: TSpinEdit;
    EditDragStartPixels: TSpinEdit;
    EditFontAlpha: TSpinEdit;
    EditFontColor: TColorBox;
    EditFontSize: TSpinEdit;
    EditGlassHeightBottom: TSpinEdit;
    EditGlassHeightTop: TSpinEdit;
    EditImageIndex: TSpinEdit;
    EditImageOverlayIndex: TSpinEdit;
    EditLeftScrollButtonHeight: TSpinEdit;
    EditLeftScrollButtonsHorzOffset: TSpinEdit;
    EditLeftScrollButtonsVerticalOffset: TSpinEdit;
    EditLeftScrollButtonWidth: TSpinEdit;
    EditMaxTabWidth: TSpinEdit;
    EditMinTabWidth: TSpinEdit;
    EditModifiedGlowAnimationPeriod: TSpinEdit;
    EditModifiedGlowAnimationUpdate: TSpinEdit;
    EditModifiedGlowHeight: TSpinEdit;
    EditModifiedGlowVerticalOffset: TSpinEdit;
    EditModifiedGlowWidth: TSpinEdit;
    EditMouseGlowHeight: TSpinEdit;
    EditMouseGlowHorzOffset: TSpinEdit;
    EditMouseGlowVerticalOffset: TSpinEdit;
    EditMouseGlowWidth: TSpinEdit;
    EditMoveTabTime: TSpinEdit;
    EditPinnedWidth: TSpinEdit;
    EditRightScrollButtonHeight: TSpinEdit;
    EditRightScrollButtonHorzOffset: TSpinEdit;
    EditRightScrollButtonVerticalOffset: TSpinEdit;
    EditRightScrollButtonWidth: TSpinEdit;
    EditScrollRepeatDelay: TSpinEdit;
    EditScrollSteps: TSpinEdit;
    EditSpinnerAnimationUpdate: TSpinEdit;
    EditSpinnerDownloadAnimationStep: TSpinEdit;
    EditSpinnerDownloadHeight: TSpinEdit;
    EditSpinnerDownloadOffsetX: TSpinEdit;
    EditSpinnerDownloadOffsetY: TSpinEdit;
    EditSpinnerDownloadSweepAngle: TSpinEdit;
    EditSpinnerDownloadWidth: TSpinEdit;
    EditSpinnerUploadAnimationStep: TSpinEdit;
    EditSpinnerUploadHeight: TSpinEdit;
    EditSpinnerUploadOffsetX: TSpinEdit;
    EditSpinnerUploadOffsetY: TSpinEdit;
    EditSpinnerUploadSweepAngle: TSpinEdit;
    EditSpinnerUploadWidth: TSpinEdit;
    EditStates: TEdit;
    EditTabCaption: TEdit;
    EditTabContentMarginLeft: TSpinEdit;
    EditTabContentMarginRight: TSpinEdit;
    EditTabHeight: TSpinEdit;
    EditTabOffsetBottom: TSpinEdit;
    EditTabOffsetLeft: TSpinEdit;
    EditTabOffsetRight: TSpinEdit;
    EditTabOffsetTop: TSpinEdit;
    EditTabOverlap: TSpinEdit;
    GroupBoxAddTab: TGroupBox;
    GroupBoxChange: TGroupBox;
    GroupBoxDefaultAnimationProperties: TGroupBox;
    GroupBoxDefaultFont: TGroupBox;
    GroupBoxDeleteTab: TGroupBox;
    GroupBoxDisplay: TGroupBox;
    GroupBoxDragOver: TGroupBox;
    GroupBoxEvents: TGroupBox;
    GroupBoxLeftButton: TGroupBox;
    GroupBoxMouseMove: TGroupBox;
    GroupBoxMoveTab: TGroupBox;
    GroupBoxNewActiveTab: TGroupBox;
    GroupBoxOtherEvents: TGroupBox;
    GroupBoxRightButton: TGroupBox;
    GroupBoxTabs: TGroupBox;
    ImageList1: TImageList;
    ImageList2: TImageList;
    ImageList3: TImageList;
    ImageList4: TImageList;
    LabelAddButtonFloatingOffset: TLabel;
    LabelAddButtonHeight: TLabel;
    LabelAddButtonHorizontalOffset: TLabel;
    LabelAddButtonVerticalOffset: TLabel;
    LabelAddButtonVisibility: TLabel;
    LabelAddButtonWidth: TLabel;
    LabelAddTabMovement: TLabel;
    LabelAddTabMovementEaseType: TLabel;
    LabelBehaviourDelay: TLabel;
    LabelBehaviourUnit: TLabel;
    LabelBiDiMode: TLabel;
    LabelButtonsScrollButtons: TLabel;
    LabelButtonsScrollLeftHeight: TLabel;
    LabelButtonsScrollLeftHorizontalOffset: TLabel;
    LabelButtonsScrollLeftVerticalOffset: TLabel;
    LabelButtonsScrollLeftWidth: TLabel;
    LabelButtonsScrollRightHeight: TLabel;
    LabelButtonsScrollRightHorizontalOffset: TLabel;
    LabelButtonsScrollRightVerticalOffset: TLabel;
    LabelButtonsScrollRightWidth: TLabel;
    LabelCanvasSmoothingMode: TLabel;
    LabelCloseButtonsAutoHideTabWidth: TLabel;
    LabelCloseButtonsCrossOffset: TLabel;
    LabelCloseButtonsHeight: TLabel;
    LabelCloseButtonsHorizontalOffset: TLabel;
    LabelCloseButtonsVerticalOffset: TLabel;
    LabelCloseButtonsVisibility: TLabel;
    LabelCloseButtonsWidth: TLabel;
    LabelDefaultAnimationPropertiesDefaultMovement: TLabel;
    LabelDefaultAnimationPropertiesDefaultMovementEaseType: TLabel;
    LabelDefaultAnimationPropertiesDefaultStyle: TLabel;
    LabelDefaultAnimationPropertiesDefaultStyleEaseType: TLabel;
    LabelDefaultAnimationPropertiesUpdateTimer: TLabel;
    LabelDefaultRenderingMode: TLabel;
    LabelDeleteTabMovement: TLabel;
    LabelDeleteTabMovementEaseType: TLabel;
    LabelDragDropDragAwayDistance: TLabel;
    LabelDragDropDragCursor: TLabel;
    LabelDragDropDragPixels: TLabel;
    LabelDragDropExternalDisplay: TLabel;
    LabelDragDropImageAlpha: TLabel;
    LabelDragDropImageResize: TLabel;
    LabelEventsCurrentStates: TLabel;
    LabelFeature: TLabel;
    LabelGlassHeightButton: TLabel;
    LabelGlassHeightTop: TLabel;
    LabelMaxTabWidth: TLabel;
    LabelMinTabWidth: TLabel;
    LabelModifiedGlowAnimationEaseType: TLabel;
    LabelModifiedGlowAnimationPeriod: TLabel;
    LabelModifiedGlowAnimationStyle: TLabel;
    LabelModifiedGlowAnimationUpdate: TLabel;
    LabelModifiedGlowHeight: TLabel;
    LabelModifiedGlowVerticalOffset: TLabel;
    LabelModifiedGlowWidth: TLabel;
    LabelMouseGlowHeight: TLabel;
    LabelMouseGlowHorrizontalOffset: TLabel;
    LabelMouseGlowVerticalOffset: TLabel;
    LabelMouseGlowWidth: TLabel;
    LabelMoveTabMovement: TLabel;
    LabelMoveTabMovementEaseType: TLabel;
    LabelNewTabImageIndex: TLabel;
    LabelNewTabImageOverlayIndex: TLabel;
    LabelNewTabSpinner: TLabel;
    LabelNewTabText: TLabel;
    LabelPinnedWidth: TLabel;
    LabelScrollingRepeatDelay: TLabel;
    LabelScrollingScrollEdgeDistance: TLabel;
    LabelScrollingScrollOffset: TLabel;
    LabelScrollingScrollOffsetValue: TLabel;
    LabelScrollingScrollStep: TLabel;
    LabelShowOptionsAndEventsFor: TLabel;
    LabelSpinnersAnimationUpdate: TLabel;
    LabelSpinnersDownloadAnimationStep: TLabel;
    LabelSpinnersDownloadHeight: TLabel;
    LabelSpinnersDownloadOffsetX: TLabel;
    LabelSpinnersDownloadOffsetY: TLabel;
    LabelSpinnersDownloadSweepAngle: TLabel;
    LabelSpinnersDownloadWidth: TLabel;
    LabelTabContainerHeight: TLabel;
    LabelTabContentMargins: TLabel;
    LabelTabOffset: TLabel;
    LabelTabOverlay: TLabel;
    LabelTextDisplayHorizontalAlignment: TLabel;
    LabelTextDisplayTrimmingMode: TLabel;
    LabelTextDisplayVerticalAlignment: TLabel;
    LabelTextFontAlpha: TLabel;
    LabelTextFontColor: TLabel;
    LabelTextFontName: TLabel;
    LabelTextFontSize: TLabel;
    LabelUploadAnimationStep: TLabel;
    LabelUploadHeight: TLabel;
    LabelUploadOffsetX: TLabel;
    LabelUploadOffsetY: TLabel;
    LabelUploadSweepAngle: TLabel;
    LabelUploadWidth: TLabel;
    ListBoxTabDragOver: TListBox;
    OpenDialogLookAndFeel: TOpenDialog;
    OpenDialogTabOptions: TOpenDialog;
    PageControlButtons: TPageControl;
    PageControlMain: TPageControl;
    PageControlOptions: TPageControl;
    PageControlTabExtras: TPageControl;
    PageControlTabSpinners: TPageControl;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    PanelDebug: TPanel;
    PanelDragDisplay: TPanel;
    PanelDragDrop: TPanel;
    PanelEvent: TPanel;
    PanelEvents: TPanel;
    PanelEventsLeft: TPanel;
    PanelIgnorePropertyUpdatedEvents: TPanel;
    PanelLookAndFeelPath: TPanel;
    PanelMain: TPanel;
    PanelMouseGlow: TPanel;
    PanelOpenNewForm: TPanel;
    PanelOverlayButtons: TPanel;
    PanelScroll: TPanel;
    PanelTop: TPanel;
    SaveDialogLookAndFeel: TSaveDialog;
    SaveDialogTabOptions: TSaveDialog;
    ScrollBarScrollOffset: TScrollBar;
    ScrollBox1: TScrollBox;
    TabSheetAddButton: TTabSheet;
    TabSheetAnimation: TTabSheet;
    TabSheetBehaviour: TTabSheet;
    TabSheetButtons: TTabSheet;
    TabSheetCloseButtons: TTabSheet;
    TabSheetDebug: TTabSheet;
    TabSheetDownload: TTabSheet;
    TabSheetDragAndDrop: TTabSheet;
    TabSheetEvents: TTabSheet;
    TabSheetGeneral: TTabSheet;
    TabSheetInternationalization: TTabSheet;
    TabSheetLookAndFeel: TTabSheet;
    TabSheetModifiedGlow: TTabSheet;
    TabSheetMouseGlow: TTabSheet;
    TabSheetOptions: TTabSheet;
    TabSheetScrollButtons: TTabSheet;
    TabSheetScrolling: TTabSheet;
    TabSheetSpinners: TTabSheet;
    TabSheetTabContainer: TTabSheet;
    TabSheetTabs: TTabSheet;
    TabSheetText: TTabSheet;
    TabSheetUpload: TTabSheet;
    TreeViewLookAndFeelItems: TTreeView;
    procedure FormCreate(Sender: TObject);
    procedure ActionCopyLookAndFeelAsCodeExecute(Sender: TObject);
    procedure ActionCopyOptionsAsCodeExecute(Sender: TObject);
    procedure ActionLoadLookAndFeelExecute(Sender: TObject);
    procedure ActionLoadOptionsExecute(Sender: TObject);
    procedure ActionSaveLookandFeelExecute(Sender: TObject);
    procedure ActionSaveOptionsExecute(Sender: TObject);
    procedure ApplicationEventsDeactivate(Sender: TObject);
    procedure ApplicationEventsMessage(var Msg: tagMSG; var Handled: Boolean);
    procedure ButtonDeleteActiveTabClick(Sender: TObject);
    procedure ButtonHideTabClick(Sender: TObject);
    procedure ButtonMakeAllTabsVisibleClick(Sender: TObject);
    procedure ButtonOpenFormClick(Sender: TObject);
    procedure ButtonScrollActiveTabIntoViewClick(Sender: TObject);
    procedure cbTabShapesChange(Sender: TObject);
    procedure CheckBoxEnableEventsClick(Sender: TObject);
    procedure ChromeTabs32ActiveTabChanged(Sender: TObject; ATab: TChromeTab);
    procedure ChromeTabs32ActiveTabChanging(Sender: TObject; AOldTab,
      ANewTab: TChromeTab; var Allow: Boolean);
    procedure ChromeTabs32AfterDrawItem(Sender: TObject;
      const TargetCanvas: TCanvas32; ItemRect: TRect;
      ItemType: TChromeTabItemType; TabIndex: Integer);
    procedure ChromeTabs32AnimateMovement(Sender: TObject;
      ChromeTabs32Control: TBaseChromeTabs32Control;
      var AnimationTimeMS: Cardinal; var EaseType: TChromeTabs32EaseType);
    procedure ChromeTabs32AnimateStyle(Sender: TObject;
      ChromeTabs32Control: TBaseChromeTabs32Control; NewDrawState: TDrawState;
      var AnimationTimeMS: Cardinal; var EaseType: TChromeTabs32EaseType);
    procedure ChromeTabs32BeginTabDrag(Sender: TObject; ATab: TChromeTab;
      var Allow: Boolean);
    procedure ChromeTabs32ButtonAddClick(Sender: TObject; var Handled: Boolean);
    procedure ChromeTabs32ButtonCloseTabClick(Sender: TObject;
      ATab: TChromeTab; var Close: Boolean);
    procedure ChromeTabs32Change(Sender: TObject; ATab: TChromeTab;
      TabChangeType: TTabChangeType);
    procedure ChromeTabs32CreateDragForm(Sender: TObject; ATab: TChromeTab;
      var DragForm: TForm);
    procedure ChromeTabs32DebugLog(Sender: TObject; const Text: string);
    procedure ChromeTabs32EndTabDrag(Sender: TObject;
      Destination: TCustomChromeTabs32; ATab: TChromeTab; var Cancel: Boolean);
    procedure ChromeTabs32Enter(Sender: TObject);
    procedure ChromeTabs32Exit(Sender: TObject);
    procedure ChromeTabs32GetControlPolygons(Sender,
      ChromeTabs32Control: TObject; ItemRect: TRect;
      ItemType: TChromeTabItemType; Orientation: TTabOrientation;
      var Polygons: IChromeTabPolygons);
    procedure ChromeTabs32MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ChromeTabs32MouseEnter(Sender: TObject);
    procedure ChromeTabs32MouseLeave(Sender: TObject);
    procedure ChromeTabs32MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure ChromeTabs32MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ChromeTabs32NeedDragImageControl(Sender: TObject;
      ATab: TChromeTab; var DragControl: TWinControl);
    procedure ChromeTabs32ScrollWidthChanged(Sender: TObject);
    procedure ChromeTabs32SetTabWidth(Sender: TObject;
      ATabControl: TChromeTabControl; var TabWidth: Integer);
    procedure ChromeTabs32ShowHint(Sender: TObject;
      HitTestResult: THitTestResult; var HintText: string;
      var HintTimeout: Integer);
    procedure ChromeTabs32StateChange(Sender: TObject; PreviousState,
      CurrentState: TChromeTabs32States);
    procedure ChromeTabs32TabClientRectChanged(Sender: TObject);
    procedure ChromeTabs32TabDblClick(Sender: TObject; ATab: TChromeTab);
    procedure ChromeTabs32TabDragDropped(Sender: TObject;
      DragTabObject: IDragTabObject; NewTab: TChromeTab);
    procedure ChromeTabs32TabDragOver(Sender: TObject; X, Y: Integer;
      State: TDragState; DragTabObject: IDragTabObject; var Accept: Boolean);
    procedure ChromeTabs32TabDragStart(Sender: TObject; ATab: TChromeTab;
      var Allow: Boolean);
    procedure ChromeTabsBottomTabDragDrop(Sender: TObject; X, Y: Integer;
      DragTabObject: IDragTabObject; Cancelled: Boolean;
      var TabDropOptions: TTabDropOptions);
    procedure ChromeTabsTopTabDragDrop(Sender: TObject; X, Y: Integer;
      DragTabObject: IDragTabObject; Cancelled: Boolean;
      var TabDropOptions: TTabDropOptions);
    procedure ComboBoxSelectTabsChange(Sender: TObject);
    procedure CommonTabPropertyChange(Sender: TObject);
    procedure OnCommonControlPropertyChange(Sender: TObject);
    procedure OnCommonRadioClick(Sender: TObject);
    procedure ScrollBarScrollOffsetChange(Sender: TObject);
    procedure SpinButton1DownClick(Sender: TObject);
    procedure SpinButton1UpClick(Sender: TObject);
    procedure TreeViewLookAndFeelItemsChange(Sender: TObject; Node: TTreeNode);
  private
    FLastMouseX: Integer;
    FLastMouseY: Integer;
    FUpdatingProperties: Boolean;
    FCurrentTabs: TChromeTabs32;
    FUpdatingScrollbar: Boolean;
    FCurrentColorPickerFrame: TframeChromeTabs32Style;

    FLogMouseMove: TChromeTabs32Log;
    FLogDragOver: TChromeTabs32Log;
    FLogChange: TChromeTabs32Log;
    FLogEvents: TChromeTabs32Log;
    FLogOtherEvents: TChromeTabs32Log;
    FLogDebug: TChromeTabs32Log;

    procedure EndColorPicking(Cancelled: Boolean);
    procedure UpdateControls;
    function AddTab(ChromeTabsTop: TChromeTabs32; const Text: string; ImageIndex: Integer): TChromeTab;

    procedure GUIToTabProperties(Tab: TChromeTab);
    procedure TabPropertiesToGUI(Tab: TChromeTab);

    procedure GUIToChromeTabControlProperties(ChromeTabsTop: TChromeTabs32);
    procedure FillEventList;
    procedure IncrementEventListItemCount(Index: Integer);
    procedure UpdateCurrentControl;
    procedure UpdateScrollBar;
    procedure UpdateScrollbarLabel;

    procedure HookEvents;
    procedure UnHookEvents;

    function CreateLog(AParent: TWinControl; const Columns: array of string;
      const ColumnWidths: array of Integer; AutoSizeIndex: Integer = -1): TChromeTabs32Log;
    procedure CreateLogs;

    procedure ChromeTabControlPropertiesToGUI(ChromeTabsTop: TChromeTabs32);
    procedure UpdateLookAndFeelEditors(ChromeTabsTop: TChromeTabs32; Index: Integer);
    procedure OnFrameSelectColorClick(Sender: TObject);
    procedure RefreshLookAndFeelOptions;
    procedure FixControls;
    procedure BuildLookAndFeelTree;
    procedure ProcessDroppedTab(Sender: TObject; X, Y: Integer;
      DragTabObject: IDragTabObject; Cancelled: Boolean;
      var TabDropOptions: TTabDropOptions);
  end;

var
  frmMain: TfrmMain;

implementation

resourcestring
  RStrTabContainer = 'Tab Container';
  RStrBaseline = 'Baseline';
  RStrDefaultFont = 'Default Font';
  RStrModifiedGlow = 'Modified Glow';
  RStrMouseGlow = 'Mouse Glow';
  RStrAddButton = 'Add Button';
  RStrButton = 'Button';
  RStrPlusSymbol = 'Plus Symbol';
  RStrCloseButton = 'Close Button';
  RStrCircle = 'Circle';
  RStrCross = 'Cross';
  RStrScrollButtons = 'Scroll Buttons';
  RStrArrow = 'Arrow';
  RStrBackground = 'Background';
  RStrActive = 'Active';
  RStrNotActive = 'Not Active';
  RStrHot = 'Hot';
  RStrNormal = 'Normal';
  RStrDown = 'Down';
  RStrDisabled = 'Disabled';
  RStrTabBaseline = 'Tab Baseline';
  RStrDefaultTabFont = 'Default Tab Font';
  RStrPleaseSelectACh = ' [Please select a child property]';
  RStrTabIndex = '   Tab Index: ';
  RStrMouseX = 'Mouse X';
  RStrMouseY = 'Mouse Y';
  RStrHitTestArea = 'Hit Test Area';
  RStrHitTestTabIndex = 'Hit Test Tab Index';
  RStrYes = 'Yes';
  RStrNo = 'No';
  RStrTabDrawState = 'Tab Draw State';
  RStrCloseButtonDrawSt = 'Close Button Draw State';
  RStrDragging = 'Dragging';
  RStrTabCaption = '   Tab Caption';
  RStrHorizontalOffset = '   Horizontal Offset';
  RStrVerticalOffset = '   Vertical Offset';
  RStrDropTabIndex = '   Drop Tab Index';
  RStrSourceControl = '   Source Control';
  RStrDockControl = '   Dock Control';
  RStrNone = 'None';
  RStrDragAndDropTabs = 'Drag and Drop tabs on this tab control.';
  RStrSpinners = 'Spinners';
  RStrDownload = 'Download';
  RStrUpload = 'Upload';

const
  EventNames: array [0 .. 18] of string = (
    'OnActiveTabChanging',
    'OnChange',
    'OnActiveTabChanged',
    'OnDebugLog',
    'OnButtonAddClick',
    'OnButtonCloseTabClick',
    'OnNeedDragImageControl',
    'OnCreateDragForm',
    'OnStateChange',
    'OnBeforeDrawItem',
    'OnAfterDrawItem',
    'OnGetControlPolygon',
    'OnShowHint',
    'OnTabDblClick',
    'OnTabDragStart',
    'OnTabDragOver',
    'OnTabDragDrop',
    '',
    'Total Repaints'
  );

{$R *.dfm}

procedure TfrmMain.ActionCopyLookAndFeelAsCodeExecute(Sender: TObject);
begin
  Clipboard.AsText := FCurrentTabs.LookAndFeelToCode;
end;

procedure TfrmMain.ActionCopyOptionsAsCodeExecute(Sender: TObject);
begin
  Clipboard.AsText := FCurrentTabs.OptionsToCode;
end;

procedure TfrmMain.ActionLoadLookAndFeelExecute(Sender: TObject);
begin
  if OpenDialogLookAndFeel.Execute then
  begin
    ChromeTabsTop.LoadLookAndFeel(OpenDialogLookAndFeel.FileName);

    RefreshLookAndFeelOptions;
  end;
end;

procedure TfrmMain.ActionLoadOptionsExecute(Sender: TObject);
begin
  if OpenDialogTabOptions.Execute then
  begin
    FCurrentTabs.LoadOptions(OpenDialogTabOptions.FileName);

    ChromeTabControlPropertiesToGUI(FCurrentTabs);

    ChromeTabsBottom.Options.Display.Tabs.Orientation := toBottom;
  end;
end;

procedure TfrmMain.ActionSaveLookandFeelExecute(Sender: TObject);
begin
  if SaveDialogLookAndFeel.Execute then
    ChromeTabsTop.SaveLookAndFeel(SaveDialogLookAndFeel.FileName);
end;

procedure TfrmMain.ActionSaveOptionsExecute(Sender: TObject);
begin
  if SaveDialogTabOptions.Execute then
    ChromeTabsTop.SaveOptions(SaveDialogTabOptions.FileName);
end;

function TfrmMain.AddTab(ChromeTabsTop: TChromeTabs32; const Text: string; ImageIndex: Integer): TChromeTab;
begin
  Result := ChromeTabsTop.Tabs.Add;

  Result.Caption := Text;
  Result.ImageIndex := ImageIndex;
end;

procedure TfrmMain.ApplicationEventsDeactivate(Sender: TObject);
begin
  EndColorPicking(False);
end;

procedure TfrmMain.EndColorPicking(Cancelled: Boolean);
begin
  if FCurrentColorPickerFrame <> nil then
  begin
    FCurrentColorPickerFrame.StopColorPicking(Cancelled);

    FCurrentColorPickerFrame := nil;

    SetFocus;

    BringToFront;

    FormStyle := fsNormal;
  end;
end;

procedure TfrmMain.ApplicationEventsMessage(var Msg: tagMSG;
  var Handled: Boolean);
begin
  case Msg.message of
    WM_LButtonDown: EndColorPicking(False);
    WM_KEYDOWN:
      if (FCurrentColorPickerFrame <> nil) and (Msg.wParam = 27) then
        EndColorPicking(True);
  end;
end;

procedure TfrmMain.ButtonMakeAllTabsVisibleClick(Sender: TObject);
var
  i: Integer;
begin
  FCurrentTabs.BeginUpdate;
  try
    for i := 0 to pred(FCurrentTabs.Tabs.Count) do
      FCurrentTabs.Tabs[i].Visible := True;
  finally
    FCurrentTabs.EndUpdate;
  end;
end;

procedure TfrmMain.ButtonOpenFormClick(Sender: TObject);
begin
  TfrmMain.Create(Application).Show;
end;

procedure TfrmMain.BuildLookAndFeelTree;

  function AddTreeNode(Parent: TTreeNode; const Text: string; ID: Integer): TTreeNode;
  begin
    Result := TreeViewLookAndFeelItems.Items.AddChild(Parent, Text);

    Result.StateIndex := ID;
  end;

var
  TabContainerNode, TabsNode, AddButtonNode, CloseButtonNode, ScrollButtonNode: TTreeNode;
begin
  TreeViewLookAndFeelItems.Items.Clear;

  TabContainerNode := AddTreeNode(nil, RStrTabContainer, 0);

  TabsNode := AddTreeNode(TabContainerNode, 'Tabs', 1);

  AddTreeNode(TabsNode, RStrBaseline, 11);
  AddTreeNode(TabsNode, RStrDefaultFont, 12);
  AddTreeNode(TabsNode, RStrModifiedGlow, 14);
  AddTreeNode(TabsNode, RStrMouseGlow, 15);
  AddTreeNode(TabsNode, RStrSpinners, 16);

  AddButtonNode := AddTreeNode(TabContainerNode, RStrAddButton, 2);
  AddTreeNode(AddButtonNode, RStrButton, 3);
  AddTreeNode(AddButtonNode, RStrPlusSymbol, 4);

  CloseButtonNode := AddTreeNode(TabContainerNode, RStrCloseButton, 5);
  AddTreeNode(CloseButtonNode, RStrCircle, 6);
  AddTreeNode(CloseButtonNode, RStrCross, 7);

  CloseButtonNode := AddTreeNode(TabContainerNode, RStrCloseButton, 5);
  AddTreeNode(CloseButtonNode, RStrCircle, 6);
  AddTreeNode(CloseButtonNode, RStrCross, 7);

  ScrollButtonNode := AddTreeNode(TabContainerNode, RStrScrollButtons, 8);
  AddTreeNode(ScrollButtonNode, RStrButton, 9);
  AddTreeNode(ScrollButtonNode, RStrArrow, 10);

  TreeViewLookAndFeelItems.FullExpand;
end;

procedure TfrmMain.ButtonScrollActiveTabIntoViewClick(Sender: TObject);
begin
  if FCurrentTabs.ActiveTab <> nil then
    FCurrentTabs.ScrollIntoView(FCurrentTabs.ActiveTab);
end;

procedure TfrmMain.ButtonDeleteActiveTabClick(Sender: TObject);
begin
  if FCurrentTabs.ActiveTab <> nil then
    FCurrentTabs.Tabs.DeleteTab(FCurrentTabs.ActiveTab.Index, False);
end;

procedure TfrmMain.ButtonHideTabClick(Sender: TObject);
begin
  if ChromeTabsTop.ActiveTab <> nil then
    ChromeTabsTop.ActiveTab.Visible := False;
end;

procedure TfrmMain.ComboBoxSelectTabsChange(Sender: TObject);
begin
  if ComboBoxSelectTabs.ItemIndex = 0 then
    FCurrentTabs := ChromeTabsTop
  else
    FCurrentTabs := ChromeTabsBottom;

  ChromeTabControlPropertiesToGUI(FCurrentTabs);

  RefreshLookAndFeelOptions;
end;

procedure TfrmMain.cbTabShapesChange(Sender: TObject);
begin
  FCurrentTabs.Refresh;
end;

procedure TfrmMain.CheckBoxEnableEventsClick(Sender: TObject);
begin
  if CheckBoxEnableEvents.Checked then
    HookEvents
  else
    UnHookEvents;
end;

procedure TfrmMain.CommonTabPropertyChange(Sender: TObject);
begin
  if FCurrentTabs.ActiveTabIndex <> -1 then
    GUIToTabProperties(FCurrentTabs.ActiveTab);
end;

function TfrmMain.CreateLog(AParent: TWinControl; const Columns: array of string;
  const ColumnWidths: array of Integer; AutoSizeIndex: Integer): TChromeTabs32Log;
var
  i: Integer;
begin
  Assert(high(Columns) = high(ColumnWidths), 'Columns and ColumnWidths arrays must be the same length');

  Result := TChromeTabs32Log.Create(AParent);
  Result.Parent := AParent;
  Result.Align := alClient;

  for i := Low(Columns) to High(Columns) do
    Result.AddColumn(Columns[i], ColumnWidths[i]);

  Result.SetAutoSizeIndex(AutoSizeIndex);
end;

procedure TfrmMain.CreateLogs;
begin
  FLogMouseMove := CreateLog(GroupBoxMouseMove, [''], [0], 0);
  FLogDragOver := CreateLog(GroupBoxDragOver, [''], [0], 0);
  FLogChange := CreateLog(GroupBoxChange, [''], [0], 0);
  FLogEvents := CreateLog(GroupBoxEvents, ['', ''], [150, 50], 0);
  FLogOtherEvents := CreateLog(GroupBoxOtherEvents, [''], [0], 0);
  FLogDebug := CreateLog(TabSheetDebug, [''], [0], 0);

  FLogDebug.SetAutoScroll(True);
  FLogOtherEvents.SetAutoScroll(True);
  FLogChange.SetAutoScroll(True);
end;

procedure TfrmMain.GUIToTabProperties(Tab: TChromeTab);
begin
  if (Tab <> nil) and (not FUpdatingProperties) then
  begin
    FCurrentTabs.BeginUpdate;
    try
      Tab.Caption := EditTabCaption.Text;
      Tab.ImageIndex := EditImageIndex.Value;
      Tab.ImageIndexOverlay := EditImageOverlayIndex.Value;
      Tab.Pinned := CheckBoxPinned.Checked;
      Tab.Modified := CheckBoxModified.Checked;
      Tab.SpinnerState := TChromeTabs32SpinnerState(ComboBoxSpinnerState.ItemIndex);
      Tab.HideCloseButton := CheckBoxHideClosebutton.Checked;
    finally
      FCurrentTabs.EndUpdate;
    end;
  end;
end;

procedure TfrmMain.TabPropertiesToGUI(Tab: TChromeTab);
begin
  FUpdatingProperties := True;
  try
    if Tab <> nil then
    begin
      EditTabCaption.Text := Tab.Caption;
      EditImageIndex.Value := Tab.ImageIndex;
      EditImageOverlayIndex.Value := Tab.ImageIndexOverlay;
      CheckBoxPinned.Checked := Tab.Pinned;
      CheckBoxModified.Checked := Tab.Modified;
      ComboBoxSpinnerState.ItemIndex := Integer(Tab.SpinnerState);
      CheckBoxHideClosebutton.Checked := Tab.HideCloseButton;
    end;
  finally
    FUpdatingProperties := False;
  end;
end;

procedure TfrmMain.TreeViewLookAndFeelItemsChange(Sender: TObject; Node: TTreeNode);
begin
  RefreshLookAndFeelOptions;
end;

procedure TfrmMain.RefreshLookAndFeelOptions;
begin
  if TreeViewLookAndFeelItems.Selected <> nil then
    UpdateLookAndFeelEditors(FCurrentTabs, TreeViewLookAndFeelItems.Selected.StateIndex);
end;

procedure TfrmMain.OnFrameSelectColorClick(Sender: TObject);
begin
  if FCurrentColorPickerFrame <> nil then
    FCurrentColorPickerFrame.StopColorPicking(True);

  if Sender is TframeChromeTabs32Style then
    FCurrentColorPickerFrame := TframeChromeTabs32Style(Sender);

  {$if CompilerVersion >= 18.0}
    FormStyle := fsStayOnTop; { TODO : This causes an exception in Delphi 7. Why? }
  {$ifend}
end;

procedure TfrmMain.UpdateLookAndFeelEditors(ChromeTabsTop: TChromeTabs32; Index: Integer);

  function NewStyleFrame(const Caption: string): TframeChromeTabs32Style;
  var
    GroupBox: TGroupBox;
  begin
    GroupBox := TGroupBox.Create(ScrollBox1);
    GroupBox.Parent := ScrollBox1;
    GroupBox.Left := 65535;
    GroupBox.Align := alLeft;
    GroupBox.Caption := Caption;

    Result := TframeChromeTabs32Style.Create(GroupBox, ChromeTabsTop);
    Result.Parent := GroupBox;
    Result.Align := alClient;
    Result.OnStartColorPicking := OnFrameSelectColorClick;

    {$if CompilerVersion >= 18.0}
      Result.AlignWithMargins := True;
    {$ifend}

    GroupBox.ClientWidth := Result.Width + 6;
  end;

  procedure AddChromeTabLookAndFeelStyle(const Caption: string; ChromeTabLookAndFeelStyle: TChromeTabs32LookAndFeelStyle);
  var
    frameChromeTabs32tyle: TframeChromeTabs32Style;
  begin
    frameChromeTabs32tyle := NewStyleFrame(Caption);

    frameChromeTabs32tyle.ChromeTabLookAndFeelStyle := ChromeTabLookAndFeelStyle;
  end;

  procedure AddChromeTabLookAndFeelPen(const Caption: string; ChromeTabLookAndFeelPen: TChromeTabs32LookAndFeelPen);
  var
    frameChromeTabs32tyle: TframeChromeTabs32Style;
  begin
    frameChromeTabs32tyle := NewStyleFrame(Caption);

    frameChromeTabs32tyle.ChromeTabLookAndFeelPen := ChromeTabLookAndFeelPen;
  end;

  procedure AddChromeTabLookAndFeelFont(const Caption: string; ChromeTabLookAndFeelFont: TChromeTabs32LookAndFeelBaseFont);
  var
    frameChromeTabs32tyle: TframeChromeTabs32Style;
  begin
    frameChromeTabs32tyle := NewStyleFrame(Caption);

    frameChromeTabs32tyle.ChromeTabFont := ChromeTabLookAndFeelFont;
  end;

  procedure AddChromeTabLookAndFeelStyleProperties(const Caption: string; ChromeTabLookAndFeelStyleProperties: TChromeTabs32LookAndFeelStyleProperties);
  var
    frameChromeTabs32tyle: TframeChromeTabs32Style;
  begin
    frameChromeTabs32tyle := NewStyleFrame(Caption);

    frameChromeTabs32tyle.ChromeTabLookAndFeelStyle := ChromeTabLookAndFeelStyleProperties.Style;
    frameChromeTabs32tyle.ChromeTabFont := ChromeTabLookAndFeelStyleProperties.Font;
  end;

  procedure AddChromeTabs32LookAndFeelTabModified(const Caption: string; ChromeTabs32LookAndFeelTabModified: TChromeTabs32LookAndFeelGlow);
  var
    frameChromeTabs32tyle: TframeChromeTabs32Style;
  begin
    frameChromeTabs32tyle := NewStyleFrame(Caption);

    frameChromeTabs32tyle.ChromeTabs32LookAndFeelTabModified := ChromeTabs32LookAndFeelTabModified;
  end;

  function GetLookAndFeelPathString: string;
  var
    TreeNode: TTreeNode;
  begin
    Result := '';

    TreeNode := TreeViewLookAndFeelItems.Selected;

    while TreeNode <> nil do
    begin
      if Result <> '' then
        Result := ' > ' + Result;

      Result := TreeNode.Text + Result;

      TreeNode := TreeNode.Parent;
    end;
  end;

var
  i: Integer;
begin
  PanelLookAndFeelPath.Caption := GetLookAndFeelPathString;

  ScrollBox1.Visible := False;

  // Clear the controls
  for i := pred(ScrollBox1.ControlCount) downto 0 do
    ScrollBox1.Controls[i].Free;

  if ChromeTabsTop <> nil then
  begin
    case Index of
      0: begin
           AddChromeTabLookAndFeelStyle(RStrBackground, ChromeTabsTop.LookAndFeel.TabsContainer);
         end;

      1: begin
           AddChromeTabLookAndFeelStyleProperties(RStrActive, ChromeTabsTop.LookAndFeel.Tabs.Active);
           AddChromeTabLookAndFeelStyleProperties(RStrNotActive, ChromeTabsTop.LookAndFeel.Tabs.NotActive);
           AddChromeTabLookAndFeelStyleProperties(RStrHot, ChromeTabsTop.LookAndFeel.Tabs.Hot);
         end;

      3: begin
           AddChromeTabLookAndFeelStyle(RStrNormal, ChromeTabsTop.LookAndFeel.AddButton.Button.Normal);
           AddChromeTabLookAndFeelStyle(RStrDown, ChromeTabsTop.LookAndFeel.AddButton.Button.Down);
           AddChromeTabLookAndFeelStyle(RStrHot, ChromeTabsTop.LookAndFeel.AddButton.Button.Hot);
         end;

      4: begin
           AddChromeTabLookAndFeelStyle(RStrNormal, ChromeTabsTop.LookAndFeel.AddButton.PlusSign.Normal);
           AddChromeTabLookAndFeelStyle(RStrDown, ChromeTabsTop.LookAndFeel.AddButton.PlusSign.Down);
           AddChromeTabLookAndFeelStyle(RStrHot, ChromeTabsTop.LookAndFeel.AddButton.PlusSign.Hot);
         end;

      6: begin
           AddChromeTabLookAndFeelStyle(RStrNormal, ChromeTabsTop.LookAndFeel.CloseButton.Circle.Normal);
           AddChromeTabLookAndFeelStyle(RStrDown, ChromeTabsTop.LookAndFeel.CloseButton.Circle.Down);
           AddChromeTabLookAndFeelStyle(RStrHot, ChromeTabsTop.LookAndFeel.CloseButton.Circle.Hot);
         end;

      7: begin
           AddChromeTabLookAndFeelPen(RStrNormal, ChromeTabsTop.LookAndFeel.CloseButton.Cross.Normal);
           AddChromeTabLookAndFeelPen(RStrDown, ChromeTabsTop.LookAndFeel.CloseButton.Cross.Down);
           AddChromeTabLookAndFeelPen(RStrHot, ChromeTabsTop.LookAndFeel.CloseButton.Cross.Hot);
         end;

      9: begin
           AddChromeTabLookAndFeelStyle(RStrNormal, ChromeTabsTop.LookAndFeel.ScrollButtons.Button.Normal);
           AddChromeTabLookAndFeelStyle(RStrDown, ChromeTabsTop.LookAndFeel.ScrollButtons.Button.Down);
           AddChromeTabLookAndFeelStyle(RStrHot, ChromeTabsTop.LookAndFeel.ScrollButtons.Button.Hot);
           AddChromeTabLookAndFeelStyle(RStrDisabled, ChromeTabsTop.LookAndFeel.ScrollButtons.Button.Disabled);
         end;

      10: begin
           AddChromeTabLookAndFeelStyle(RStrNormal, ChromeTabsTop.LookAndFeel.ScrollButtons.Arrow.Normal);
           AddChromeTabLookAndFeelStyle(RStrDown, ChromeTabsTop.LookAndFeel.ScrollButtons.Arrow.Down);
           AddChromeTabLookAndFeelStyle(RStrHot, ChromeTabsTop.LookAndFeel.ScrollButtons.Arrow.Hot);
           AddChromeTabLookAndFeelStyle(RStrDisabled, ChromeTabsTop.LookAndFeel.ScrollButtons.Arrow.Disabled);
         end;

      11: begin // Tabs Baseline
            AddChromeTabLookAndFeelPen(RStrTabBaseline, ChromeTabsTop.LookAndFeel.Tabs.BaseLine);
          end;

      12: begin // Default Font
            AddChromeTabLookAndFeelFont(RStrDefaultTabFont, ChromeTabsTop.LookAndFeel.Tabs.DefaultFont);
          end;

      14: begin // Modified Glow
            AddChromeTabs32LookAndFeelTabModified(RStrModifiedGlow, ChromeTabsTop.LookAndFeel.Tabs.Modified);
          end;

      15: begin // Mouse Glow
            AddChromeTabs32LookAndFeelTabModified(RStrMouseGlow, ChromeTabsTop.LookAndFeel.Tabs.MouseGlow);
          end;

      16: begin // Spinners
            AddChromeTabLookAndFeelPen(RStrUpload, ChromeTabsTop.LookAndFeel.Tabs.Spinners.Upload);
            AddChromeTabLookAndFeelPen(RStrDownload, ChromeTabsTop.LookAndFeel.Tabs.Spinners.Download);
          end;

      else
      begin
        PanelLookAndFeelPath.Caption := PanelLookAndFeelPath.Caption + RStrPleaseSelectACh;

        Exit;
      end;
    end;

    ScrollBox1.Visible := True;
    ScrollBox1.Width := ScrollBox1.Width + 1;
  end;
end;

procedure TfrmMain.FillEventList;
var
  i: Integer;
begin
  FLogEvents.Clear;

  for i := Low(EventNames) to High(EventNames) do
    if EventNames[i] = '' then
      FLogEvents.Log([''], i)
    else
      FLogEvents.Log([EventNames[i], '0'], i);
end;

procedure TfrmMain.IncrementEventListItemCount(Index: Integer);
begin
  FLogEvents.Log([FLogEvents.GetColumnText(0, Index), IntToStr(StrToInt(FLogEvents.GetColumnText(1, Index)) + 1)], Index);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  CreateLogs;

  {$IFNDEF USE_GLASS_FORM}
  CheckBoxDisplayTopTabsInTitleBar.Enabled := False;
  CheckBoxDisplayTopTabsInTitleBar.Checked := False;
  {$ENDIF}

  FUpdatingProperties := True;
  try
    PageControlMain.ActivePageIndex := 0;
    PageControlOptions.ActivePageIndex := 0;
    PageControlButtons.ActivePageIndex := 0;
    PageControlTabExtras.ActivePageIndex := 0;
    PageControlTabSpinners.ActivePageIndex := 0;

    ComboBoxFontName.Items.Assign(Screen.Fonts);

    UpdateCurrentControl;

    EditDragImageResize.Text := FloatToStr(0.5);

    EditGlassHeightTop.Value := FCurrentTabs.Height;

    EditGlassHeightBottom.MaxValue := ChromeTabsBottom.Height + 1;
    EditGlassHeightBottom.Value := EditGlassHeightBottom.MaxValue;

    ChromeTabControlPropertiesToGUI(FCurrentTabs);
    TabPropertiesToGUI(FCurrentTabs.ActiveTab);

    FixControls;

    BuildLookAndFeelTree;

    UpdateControls;

    TreeViewLookAndFeelItems.Items[0].Selected := True;
  finally
    FUpdatingProperties := False;
  end;

  ChromeTabControlPropertiesToGUI(FCurrentTabs);

  {$IFDEF USE_GLASS_FORM}
  Self.ChromeTabsTop := ChromeTabsTop;
  {$ENDIF}

  ChromeTabsTop.Tabs[0].Active := True;
end;

procedure TfrmMain.FixControls;
begin
  {$if CompilerVersion >= 18.0}
    ButtonOpenForm.Align := alRight;
    ButtonOpenForm.AlignWithMargins := True;

    ButtonLoadOptions.Align := alLeft;
    ButtonLoadOptions.AlignWithMargins := True;
    ButtonSaveOptions.Align := alLeft;
    ButtonSaveOptions.AlignWithMargins := True;
    ButtonCopyOptions.Align := alLeft;
    ButtonCopyOptions.AlignWithMargins := True;

    ButtonLoadLookAndFeel.Align := alLeft;
    ButtonLoadLookAndFeel.AlignWithMargins := True;
    ButtonSaveLookAndFeel.Align := alLeft;
    ButtonSaveLookAndFeel.AlignWithMargins := True;
    ButtonCopyLookAndFeel.Align := alLeft;
    ButtonCopyLookAndFeel.AlignWithMargins := True;
  {$ifend}
end;

procedure TfrmMain.OnCommonControlPropertyChange(Sender: TObject);
begin
  GUIToChromeTabControlProperties(FCurrentTabs);

  UpdateControls;
end;

procedure TfrmMain.OnCommonRadioClick(Sender: TObject);
begin
  UpdateCurrentControl;

  UpdateControls;
end;

procedure TfrmMain.ScrollBarScrollOffsetChange(Sender: TObject);
begin
  if not FUpdatingScrollbar then
  begin
    FCurrentTabs.ScrollOffset := ScrollBarScrollOffset.Position;

    UpdateScrollbarLabel;
  end;
end;

procedure TfrmMain.UpdateCurrentControl;
begin
  if FCurrentTabs <> nil then
    UnHookEvents;

  if ComboBoxSelectTabs.ItemIndex = 1 then
    FCurrentTabs := ChromeTabsBottom
  else
    FCurrentTabs := ChromeTabsTop;

  FillEventList;
end;

procedure TfrmMain.HookEvents;
begin
  FCurrentTabs.OnActiveTabChanged := ChromeTabs32ActiveTabChanged;
  FCurrentTabs.OnActiveTabChanging := ChromeTabs32ActiveTabChanging;
  FCurrentTabs.OnAfterDrawItem := ChromeTabs32AfterDrawItem;
  FCurrentTabs.OnButtonCloseTabClick := ChromeTabs32ButtonCloseTabClick;
  FCurrentTabs.OnCreateDragForm := ChromeTabs32CreateDragForm;
  FCurrentTabs.OnEnter := ChromeTabs32Enter;
  FCurrentTabs.OnExit := ChromeTabs32Exit;
  FCurrentTabs.OnGetControlPolygons := ChromeTabs32GetControlPolygons;
  FCurrentTabs.OnMouseDown := ChromeTabs32MouseDown;
  FCurrentTabs.OnMouseUp := ChromeTabs32MouseUp;
  FCurrentTabs.OnScroll := ChromeTabs32ScrollWidthChanged;
  FCurrentTabs.OnScrollWidthChanged := ChromeTabs32ScrollWidthChanged;
  FCurrentTabs.OnStateChange := ChromeTabs32StateChange;
  FCurrentTabs.OnTabDblClick := ChromeTabs32TabDblClick;
  FCurrentTabs.OnTabDragDrop := ChromeTabsTopTabDragDrop;
  FCurrentTabs.OnTabDragDropped := ChromeTabs32TabDragDropped;
  FCurrentTabs.OnTabDragOver := ChromeTabs32TabDragOver;
  FCurrentTabs.OnTabDragStart := ChromeTabs32TabDragStart;
  FCurrentTabs.OnMouseMove := ChromeTabs32MouseMove;
  FCurrentTabs.OnAnimateStyle := ChromeTabs32AnimateStyle;
  FCurrentTabs.OnAnimateMovement := ChromeTabs32AnimateMovement;
end;

procedure TfrmMain.UnHookEvents;
begin
  FCurrentTabs.OnActiveTabChanged := nil;
  FCurrentTabs.OnActiveTabChanging := nil;
  FCurrentTabs.OnAfterDrawItem := nil;
  FCurrentTabs.OnBeforeDrawItem := nil;
  FCurrentTabs.OnChange := nil;
  FCurrentTabs.OnCreateDragForm := nil;
  FCurrentTabs.OnEnter := nil;
  FCurrentTabs.OnExit := nil;
  FCurrentTabs.OnGetControlPolygons := nil;
  FCurrentTabs.OnMouseDown := nil;
  FCurrentTabs.OnMouseUp := nil;
  FCurrentTabs.OnMouseMove := nil;
  FCurrentTabs.OnResize := nil;
  FCurrentTabs.OnScroll := nil;
  FCurrentTabs.OnScrollWidthChanged := nil;
  FCurrentTabs.OnStateChange := nil;
  FCurrentTabs.OnTabDblClick := nil;
  FCurrentTabs.OnTabDragDrop := nil;
  FCurrentTabs.OnTabDragDropped := nil;
  FCurrentTabs.OnTabDragOver := nil;
  FCurrentTabs.OnTabDragStart := nil;
  FCurrentTabs.OnAnimateStyle := nil;
  FCurrentTabs.OnAnimateMovement := nil;
end;

procedure TfrmMain.ChromeTabControlPropertiesToGUI(ChromeTabsTop: TChromeTabs32);
begin
  if (ChromeTabsTop <> nil) and (not FUpdatingProperties) then
  try
    FUpdatingProperties := True;

    CheckBoxScrollOverlayButtons.Checked := ChromeTabsTop.Options.Display.TabContainer.OverlayButtons;

    ComboBoxCloseButtonVisibility.ItemIndex := Integer(ChromeTabsTop.Options.Display.CloseButton.Visibility);
    CheckBoxCloseButtonAutoHide.Checked := ChromeTabsTop.Options.Display.CloseButton.AutoHide;
    EditCloseButtonAutoHideWidth.Value := ChromeTabsTop.Options.Display.CloseButton.AutoHideWidth;
    EditCloseButtonVerticalOffset.Value := ChromeTabsTop.Options.Display.CloseButton.Offsets.Vertical;
    EditCloseButtonHorzOffset.Value := ChromeTabsTop.Options.Display.CloseButton.Offsets.Horizontal;
    EditCloseButtonHeight.Value := ChromeTabsTop.Options.Display.CloseButton.Height;
    EditCloseButtonWidth.Value := ChromeTabsTop.Options.Display.CloseButton.Width;
    EditCrossOffset.Value := ChromeTabsTop.Options.Display.CloseButton.CrossRadialOffset;

    ComboBoxAddButtonVisibility.ItemIndex := Integer(ChromeTabsTop.Options.Display.AddButton.Visibility);
    EditAddButtonVerticalOffset.Value := ChromeTabsTop.Options.Display.AddButton.Offsets.Vertical;
    EditAddButtonHorzOffset.Value := ChromeTabsTop.Options.Display.AddButton.Offsets.Horizontal;
    EditAddButtonFloatingHorzOffset.Value := ChromeTabsTop.Options.Display.AddButton.HorizontalOffsetFloating;
    EditAddButtonHeight.Value := ChromeTabsTop.Options.Display.AddButton.Height;
    EditAddButtonWidth.Value := ChromeTabsTop.Options.Display.AddButton.Width;

    CheckBoxShowPlus.Checked := ChromeTabsTop.Options.Display.AddButton.ShowPlusSign;

    EditLeftScrollButtonHeight.Value := ChromeTabsTop.Options.Display.ScrollButtonLeft.Height;
    EditLeftScrollButtonWidth.Value := ChromeTabsTop.Options.Display.ScrollButtonLeft.Width;
    EditLeftScrollButtonsVerticalOffset.Value := ChromeTabsTop.Options.Display.ScrollButtonLeft.Offsets.Vertical;
    EditLeftScrollButtonsHorzOffset.Value := ChromeTabsTop.Options.Display.ScrollButtonLeft.Offsets.Horizontal;

    EditRightScrollButtonHeight.Value := ChromeTabsTop.Options.Display.ScrollButtonRight.Height;
    EditRightScrollButtonWidth.Value := ChromeTabsTop.Options.Display.ScrollButtonRight.Width;
    EditRightScrollButtonVerticalOffset.Value := ChromeTabsTop.Options.Display.ScrollButtonRight.Offsets.Vertical;
    EditRightScrollButtonHorzOffset.Value := ChromeTabsTop.Options.Display.ScrollButtonRight.Offsets.Horizontal;

    CheckBoxTransparentBackground.Checked := ChromeTabsTop.Options.Display.TabContainer.TransparentBackground;
    EditContainerOffsetLeft.Value := ChromeTabsTop.Options.Display.TabContainer.PaddingLeft;
    EditContainerOffsetRight.Value := ChromeTabsTop.Options.Display.TabContainer.PaddingRight;

    ComboBoxModifiedGlowStyle.ItemIndex := Integer(ChromeTabsTop.Options.Display.TabModifiedGlow.Style);
    EditModifiedGlowVerticalOffset.Value := ChromeTabsTop.Options.Display.TabModifiedGlow.VerticalOffset;
    EditModifiedGlowHeight.Value := ChromeTabsTop.Options.Display.TabModifiedGlow.Height;
    EditModifiedGlowWidth.Value := ChromeTabsTop.Options.Display.TabModifiedGlow.Width;
    EditModifiedGlowAnimationPeriod.Value := ChromeTabsTop.Options.Display.TabModifiedGlow.AnimationPeriodMS;
    EditModifiedGlowAnimationUpdate.Value := ChromeTabsTop.Options.Display.TabModifiedGlow.AnimationUpdateMS;
    ComboBoxModifiedGlowEaseType.ItemIndex := Integer(ChromeTabsTop.Options.Display.TabModifiedGlow.EaseType);

    CheckBoxMouseGlowVisible.Checked := ChromeTabsTop.Options.Display.TabMouseGlow.Visible;
    EditMouseGlowVerticalOffset.Value := ChromeTabsTop.Options.Display.TabMouseGlow.Offsets.Vertical;
    EditMouseGlowHeight.Value := ChromeTabsTop.Options.Display.TabMouseGlow.Height;
    EditMouseGlowWidth.Value := ChromeTabsTop.Options.Display.TabMouseGlow.Width;
    EditMouseGlowHorzOffset.Value := ChromeTabsTop.Options.Display.TabMouseGlow.Offsets.Horizontal;

    EditTabContentMarginLeft.Value := ChromeTabsTop.Options.Display.Tabs.ContentOffsetLeft;
    EditTabContentMarginRight.Value := ChromeTabsTop.Options.Display.Tabs.ContentOffsetRight;
    ComboBoxBidiMode.ItemIndex := Integer(ChromeTabsTop.BiDiMode);

    EditPinnedWidth.Value := ChromeTabsTop.Options.Display.Tabs.PinnedWidth;
    EditMaxTabWidth.Value := ChromeTabsTop.Options.Display.Tabs.MaxWidth;
    EditMinTabWidth.Value := ChromeTabsTop.Options.Display.Tabs.MinWidth;
    EditTabHeight.Value := ChromeTabsTop.Height;
    EditTabOffsetTop.Value := ChromeTabsTop.Options.Display.Tabs.OffsetTop;
    EditTabOffsetLeft.Value := ChromeTabsTop.Options.Display.Tabs.OffsetLeft;
    EditTabOffsetBottom.Value := ChromeTabsTop.Options.Display.Tabs.OffsetBottom;
    EditTabOffsetRight.Value := ChromeTabsTop.Options.Display.Tabs.OffsetRight;
    CheckBoxTabWordWrap.Checked := ChromeTabsTop.Options.Display.Tabs.WordWrap;
    ComboBoxTextAlignment.ItemIndex := Integer(ChromeTabsTop.Options.Display.Tabs.TextAlignmentHorizontal);
    ComboBoxTextVerticalAlignment.ItemIndex := Integer(ChromeTabsTop.Options.Display.Tabs.TextAlignmentVertical);
    ComboBoxTextTrimming.ItemIndex := Integer(ChromeTabsTop.Options.Display.Tabs.TextTrimType);
    CheckBoxSetTabWidthsFromCaptions.Checked := ChromeTabsTop.Options.Display.Tabs.TabWidthFromContent;
    CheckBoxSeeThroughTabs.Checked := ChromeTabsTop.Options.Display.Tabs.SeeThroughTabs;
    EditTabOverlap.Value := ChromeTabsTop.Options.Display.Tabs.TabOverlap;
    CheckBoxShowTextOnPinnedTabs.Checked := ChromeTabsTop.Options.Display.Tabs.ShowPinnedTabText;

    ComboBoxFontName.Text := ChromeTabsTop.LookAndFeel.Tabs.DefaultFont.Name;
    EditFontSize.Value := ChromeTabsTop.LookAndFeel.Tabs.DefaultFont.Size;
    EditFontColor.Selected := ChromeTabsTop.LookAndFeel.Tabs.DefaultFont.Color;

    CheckBoxBackgroundDoubleClickMaximise.Checked := ChromeTabsTop.Options.Behaviour.BackgroundDblClickMaximiseRestoreForm;
    CheckBoxDraggingBackgoundMovesForm.Checked := ChromeTabsTop.Options.Behaviour.BackgroundDragMovesForm;
    CheckBoxSmartResize.Checked := ChromeTabsTop.Options.Behaviour.TabSmartDeleteResizing;
    EditCloseButtonMouseLeaveDelay.Value := ChromeTabsTop.Options.Behaviour.TabSmartDeleteResizeCancelDelay;
    CheckBoxRightClickSelect.Checked := ChromeTabsTop.Options.Behaviour.TabRightClickSelect;

    EditAnimationStepsMovement.Value := ChromeTabsTop.Options.Animation.DefaultMovementAnimationTimeMS;
    EditAnimationStepsStyle.Value := ChromeTabsTop.Options.Animation.DefaultStyleAnimationTimeMS;
    EditAnimationUpdate.Value := ChromeTabsTop.Options.Animation.AnimationTimerInterval;
    ComboBoxMovementEaseType.ItemIndex := Integer(ChromeTabsTop.Options.Animation.DefaultMovementEaseType);
    ComboBoxStyleEaseType.ItemIndex := Integer(ChromeTabsTop.Options.Animation.DefaultStyleEaseType);

    CheckBoxAddTabDefaults.Checked := (ChromeTabsTop.Options.Animation.MovementAnimations.TabAdd.UseDefaultEaseType) or (ChromeTabsTop.Options.Animation.MovementAnimations.TabAdd.UseDefaultAnimationTime);
    EditAddTabTime.Value := ChromeTabsTop.Options.Animation.MovementAnimations.TabAdd.AnimationTimeMS;
    ComboBoxAddTabEase.ItemIndex := Integer(ChromeTabsTop.Options.Animation.MovementAnimations.TabAdd.EaseType);

    CheckBoxDeleteTabDefaults.Checked := (ChromeTabsTop.Options.Animation.MovementAnimations.TabDelete.UseDefaultEaseType) or (ChromeTabsTop.Options.Animation.MovementAnimations.TabDelete.UseDefaultAnimationTime);
    EditDeleteTabTime.Value := ChromeTabsTop.Options.Animation.MovementAnimations.TabDelete.AnimationTimeMS;
    ComboBoxDeleteTabEase.ItemIndex := Integer(ChromeTabsTop.Options.Animation.MovementAnimations.TabDelete.EaseType);

    CheckBoxMoveTabDefaults.Checked := (ChromeTabsTop.Options.Animation.MovementAnimations.TabMove.UseDefaultEaseType) or (ChromeTabsTop.Options.Animation.MovementAnimations.TabMove.UseDefaultAnimationTime);
    EditMoveTabTime.Value := ChromeTabsTop.Options.Animation.MovementAnimations.TabMove.AnimationTimeMS;
    ComboBoxMoveTabEase.ItemIndex := Integer(ChromeTabsTop.Options.Animation.MovementAnimations.TabMove.EaseType);

    CheckBoxScrolling.Checked := ChromeTabsTop.Options.Scrolling.Enabled;
    ComboBoxScrollButtons.ItemIndex := Integer(ChromeTabsTop.Options.Scrolling.ScrollButtons);
    EditScrollSteps.Value := ChromeTabsTop.Options.Scrolling.ScrollStep;
    EditScrollRepeatDelay.Value := ChromeTabsTop.Options.Scrolling.ScrollRepeatDelay;
    CheckBoxAutoHideScrollButtons.Checked := ChromeTabsTop.Options.Scrolling.AutoHideButtons;
    CheckBoxScrollWhileDragging.Checked := ChromeTabsTop.Options.Scrolling.DragScroll;
    EditDragScrollEdge.Value := ChromeTabsTop.Options.Scrolling.DragScrollOffset;
    CheckBoxMouseWheelScrolling.Checked := ChromeTabsTop.Options.Scrolling.MouseWheelScroll;

    ComboBoxDragType.ItemIndex := Integer(ChromeTabsTop.Options.DragDrop.DragType);
    EditDragImageAapha.Value := ChromeTabsTop.Options.DragDrop.DragOutsideImageAlpha;
    EditDragAwayDistance.Value := ChromeTabsTop.Options.DragDrop.DragOutsideDistancePixels;
    EditDragStartPixels.Value := ChromeTabsTop.Options.DragDrop.DragStartPixels;
    EditDragImageResize.Text := FloatToStr(ChromeTabsTop.Options.DragDrop.DragControlImageResizeFactor);
    CheckBoxContrainDraggedTab.Checked := ChromeTabsTop.Options.DragDrop.ContrainDraggedTabWithinContainer;
    ComboBoxExternalDragDisplay.ItemIndex := Integer(ChromeTabsTop.Options.DragDrop.DragDisplay);

    EditSpinnerAnimationUpdate.Value := ChromeTabsTop.Options.Display.TabSpinners.AnimationUpdateMS;
    CheckBoxHideImagesWhenSpinnerActive.Checked := ChromeTabsTop.Options.Display.TabSpinners.HideImagesWhenSpinnerVisible;

    CheckBoxSpinnerUploadReverseDirection.Checked := ChromeTabsTop.Options.Display.TabSpinners.Upload.ReverseDirection;
    EditSpinnerUploadAnimationStep.Value := ChromeTabsTop.Options.Display.TabSpinners.Upload.RenderedAnimationStep;
    EditSpinnerUploadSweepAngle.Value := ChromeTabsTop.Options.Display.TabSpinners.Upload.SweepAngle;

    EditSpinnerUploadWidth.Value := ChromeTabsTop.Options.Display.TabSpinners.Upload.Position.Width;
    EditSpinnerUploadHeight.Value := ChromeTabsTop.Options.Display.TabSpinners.Upload.Position.Height;
    EditSpinnerUploadOffsetX.Value := ChromeTabsTop.Options.Display.TabSpinners.Upload.Position.Offsets.Horizontal;
    EditSpinnerUploadOffsetY.Value := ChromeTabsTop.Options.Display.TabSpinners.Upload.Position.Offsets.Vertical;

    CheckBoxSpinnerDownloadReverseDirection.Checked := ChromeTabsTop.Options.Display.TabSpinners.Download.ReverseDirection;
    EditSpinnerDownloadAnimationStep.Value := ChromeTabsTop.Options.Display.TabSpinners.Download.RenderedAnimationStep;
    EditSpinnerDownloadSweepAngle.Value := ChromeTabsTop.Options.Display.TabSpinners.Download.SweepAngle;

    EditSpinnerDownloadWidth.Value := ChromeTabsTop.Options.Display.TabSpinners.Download.Position.Width;
    EditSpinnerDownloadHeight.Value := ChromeTabsTop.Options.Display.TabSpinners.Download.Position.Height;
    EditSpinnerDownloadOffsetX.Value := ChromeTabsTop.Options.Display.TabSpinners.Download.Position.Offsets.Horizontal;
    EditSpinnerDownloadOffsetY.Value := ChromeTabsTop.Options.Display.TabSpinners.Download.Position.Offsets.Vertical;

    if ChromeTabsTop.Options.DragDrop.DragCursor = crDrag then
      ComboBoxDragCursor.ItemIndex := 1
    else
      ComboBoxDragCursor.ItemIndex := 0;
  finally
    FUpdatingProperties := False;
  end;
end;

procedure TfrmMain.GUIToChromeTabControlProperties(ChromeTabsTop: TChromeTabs32);
begin
  if (ChromeTabsTop <> nil) and (not FUpdatingProperties) then
  begin
    ChromeTabsTop.BeginUpdate;
    try
      ChromeTabsTop.Options.Display.TabContainer.OverlayButtons := CheckBoxScrollOverlayButtons.Checked;

      ChromeTabsTop.Options.Display.CloseButton.Visibility := TCloseButtonVisiblity(ComboBoxCloseButtonVisibility.ItemIndex);
      ChromeTabsTop.Options.Display.CloseButton.AutoHide := CheckBoxCloseButtonAutoHide.Checked;
      ChromeTabsTop.Options.Display.CloseButton.AutoHideWidth := EditCloseButtonAutoHideWidth.Value;
      ChromeTabsTop.Options.Display.CloseButton.Offsets.Vertical := EditCloseButtonVerticalOffset.Value;
      ChromeTabsTop.Options.Display.CloseButton.Offsets.Horizontal := EditCloseButtonHorzOffset.Value;
      ChromeTabsTop.Options.Display.CloseButton.Height := EditCloseButtonHeight.Value;
      ChromeTabsTop.Options.Display.CloseButton.Width := EditCloseButtonWidth.Value;
      ChromeTabsTop.Options.Display.CloseButton.CrossRadialOffset := EditCrossOffset.Value;

      ChromeTabsTop.Options.Display.AddButton.Visibility := TAddButtonVisibility(ComboBoxAddButtonVisibility.ItemIndex);
      ChromeTabsTop.Options.Display.AddButton.Offsets.Vertical := EditAddButtonVerticalOffset.Value;
      ChromeTabsTop.Options.Display.AddButton.Offsets.Horizontal := EditAddButtonHorzOffset.Value;
      ChromeTabsTop.Options.Display.AddButton.HorizontalOffsetFloating := EditAddButtonFloatingHorzOffset.Value;
      ChromeTabsTop.Options.Display.AddButton.Height := EditAddButtonHeight.Value;
      ChromeTabsTop.Options.Display.AddButton.Width := EditAddButtonWidth.Value;

      ChromeTabsTop.Options.Display.AddButton.ShowPlusSign:= CheckBoxShowPlus.Checked;

      ChromeTabsTop.Options.Display.ScrollButtonLeft.Height := EditLeftScrollButtonHeight.Value;
      ChromeTabsTop.Options.Display.ScrollButtonLeft.Width := EditLeftScrollButtonWidth.Value;
      ChromeTabsTop.Options.Display.ScrollButtonLeft.Offsets.Vertical := EditLeftScrollButtonsVerticalOffset.Value;
      ChromeTabsTop.Options.Display.ScrollButtonLeft.Offsets.Horizontal := EditLeftScrollButtonsHorzOffset.Value;

      ChromeTabsTop.Options.Display.ScrollButtonRight.Height := EditRightScrollButtonHeight.Value;
      ChromeTabsTop.Options.Display.ScrollButtonRight.Width := EditRightScrollButtonWidth.Value;
      ChromeTabsTop.Options.Display.ScrollButtonRight.Offsets.Vertical := EditRightScrollButtonVerticalOffset.Value;
      ChromeTabsTop.Options.Display.ScrollButtonRight.Offsets.Horizontal := EditRightScrollButtonHorzOffset.Value;

      ChromeTabsTop.Options.Display.TabContainer.TransparentBackground := CheckBoxTransparentBackground.Checked;
      ChromeTabsTop.Options.Display.TabContainer.PaddingLeft := EditContainerOffsetLeft.Value;
      ChromeTabsTop.Options.Display.TabContainer.PaddingRight := EditContainerOffsetRight.Value;

      ChromeTabsTop.Options.Display.TabModifiedGlow.Style := TChromeTabModifiedStyle(ComboBoxModifiedGlowStyle.ItemIndex);
      ChromeTabsTop.Options.Display.TabModifiedGlow.VerticalOffset := EditModifiedGlowVerticalOffset.Value;
      ChromeTabsTop.Options.Display.TabModifiedGlow.Height := EditModifiedGlowHeight.Value;
      ChromeTabsTop.Options.Display.TabModifiedGlow.Width := EditModifiedGlowWidth.Value;
      ChromeTabsTop.Options.Display.TabModifiedGlow.AnimationPeriodMS := EditModifiedGlowAnimationPeriod.Value;
      ChromeTabsTop.Options.Display.TabModifiedGlow.AnimationUpdateMS := EditModifiedGlowAnimationUpdate.Value;
      ChromeTabsTop.Options.Display.TabModifiedGlow.EaseType := TChromeTabs32EaseType(ComboBoxModifiedGlowEaseType.ItemIndex);

      ChromeTabsTop.Options.Display.TabMouseGlow.Visible := CheckBoxMouseGlowVisible.Checked;
      ChromeTabsTop.Options.Display.TabMouseGlow.Offsets.Vertical := EditMouseGlowVerticalOffset.Value;
      ChromeTabsTop.Options.Display.TabMouseGlow.Height := EditMouseGlowHeight.Value;
      ChromeTabsTop.Options.Display.TabMouseGlow.Width := EditMouseGlowWidth.Value;
      ChromeTabsTop.Options.Display.TabMouseGlow.Offsets.Horizontal := EditMouseGlowHorzOffset.Value;

      ChromeTabsTop.Options.Display.Tabs.ContentOffsetLeft := EditTabContentMarginLeft.Value;
      ChromeTabsTop.Options.Display.Tabs.ContentOffsetRight := EditTabContentMarginRight.Value;

      ChromeTabsTop.Options.Display.Tabs.PinnedWidth := EditPinnedWidth.Value;
      ChromeTabsTop.Options.Display.Tabs.MaxWidth := EditMaxTabWidth.Value;
      ChromeTabsTop.Options.Display.Tabs.MinWidth := EditMinTabWidth.Value;
      ChromeTabsTop.Height := EditTabHeight.Value;
      ChromeTabsTop.Options.Display.Tabs.OffsetTop := EditTabOffsetTop.Value;
      ChromeTabsTop.Options.Display.Tabs.OffsetLeft := EditTabOffsetLeft.Value;
      ChromeTabsTop.Options.Display.Tabs.OffsetBottom := EditTabOffsetBottom.Value;
      ChromeTabsTop.Options.Display.Tabs.OffsetRight := EditTabOffsetRight.Value;
      ChromeTabsTop.Options.Display.Tabs.WordWrap := CheckBoxTabWordWrap.Checked;
      ChromeTabsTop.Options.Display.Tabs.TextAlignmentHorizontal := TAlignment(ComboBoxTextAlignment.ItemIndex);
      ChromeTabsTop.Options.Display.Tabs.TextAlignmentVertical := TVerticalAlignment(ComboBoxTextVerticalAlignment.ItemIndex);
      ChromeTabsTop.Options.Display.Tabs.TextTrimType := TTextTrimType(ComboBoxTextTrimming.ItemIndex);
      ChromeTabsTop.Options.Display.Tabs.TabOverlap := EditTabOverlap.Value;
      ChromeTabsTop.Options.Display.Tabs.SeeThroughTabs := CheckBoxSeeThroughTabs.Checked;
      ChromeTabsTop.Options.Display.Tabs.TabWidthFromContent := CheckBoxSetTabWidthsFromCaptions.Checked;
      ChromeTabsTop.Options.Display.Tabs.ShowPinnedTabText := CheckBoxShowTextOnPinnedTabs.Checked;

      ChromeTabsTop.BiDiMode := TBiDiMode(ComboBoxBidiMode.ItemIndex);

      ChromeTabsTop.LookAndFeel.Tabs.DefaultFont.Name := ComboBoxFontName.Text;
      ChromeTabsTop.LookAndFeel.Tabs.DefaultFont.Size := EditFontSize.Value;
      ChromeTabsTop.LookAndFeel.Tabs.DefaultFont.Color := EditFontColor.Selected;

      ChromeTabsTop.Options.Behaviour.BackgroundDblClickMaximiseRestoreForm := CheckBoxBackgroundDoubleClickMaximise.Checked;
      ChromeTabsTop.Options.Behaviour.BackgroundDragMovesForm := CheckBoxDraggingBackgoundMovesForm.Checked;
      ChromeTabsTop.Options.Behaviour.TabSmartDeleteResizing := CheckBoxSmartResize.Checked;
      ChromeTabsTop.Options.Behaviour.TabSmartDeleteResizeCancelDelay := EditCloseButtonMouseLeaveDelay.Value;
      ChromeTabsTop.Options.Behaviour.TabRightClickSelect := CheckBoxRightClickSelect.Checked;

      ChromeTabsTop.Options.Animation.DefaultMovementAnimationTimeMS := EditAnimationStepsMovement.Value;
      ChromeTabsTop.Options.Animation.DefaultStyleAnimationTimeMS := EditAnimationStepsStyle.Value;
      ChromeTabsTop.Options.Animation.AnimationTimerInterval := EditAnimationUpdate.Value;
      ChromeTabsTop.Options.Animation.DefaultMovementEaseType := TChromeTabs32EaseType(ComboBoxMovementEaseType.ItemIndex);
      ChromeTabsTop.Options.Animation.DefaultStyleEaseType := TChromeTabs32EaseType(ComboBoxStyleEaseType.ItemIndex);

      ChromeTabsTop.Options.Animation.MovementAnimations.TabAdd.UseDefaultEaseType := CheckBoxAddTabDefaults.Checked;
      ChromeTabsTop.Options.Animation.MovementAnimations.TabAdd.UseDefaultAnimationTime := CheckBoxAddTabDefaults.Checked;
      ChromeTabsTop.Options.Animation.MovementAnimations.TabAdd.AnimationTimeMS := EditAddTabTime.Value;
      ChromeTabsTop.Options.Animation.MovementAnimations.TabAdd.EaseType := TChromeTabs32EaseType(ComboBoxAddTabEase.ItemIndex);

      ChromeTabsTop.Options.Animation.MovementAnimations.TabDelete.UseDefaultEaseType := CheckBoxDeleteTabDefaults.Checked;
      ChromeTabsTop.Options.Animation.MovementAnimations.TabDelete.UseDefaultAnimationTime := CheckBoxDeleteTabDefaults.Checked;
      ChromeTabsTop.Options.Animation.MovementAnimations.TabDelete.AnimationTimeMS := EditDeleteTabTime.Value;
      ChromeTabsTop.Options.Animation.MovementAnimations.TabDelete.EaseType := TChromeTabs32EaseType(ComboBoxDeleteTabEase.ItemIndex);

      ChromeTabsTop.Options.Animation.MovementAnimations.TabMove.UseDefaultEaseType := CheckBoxMoveTabDefaults.Checked;
      ChromeTabsTop.Options.Animation.MovementAnimations.TabMove.UseDefaultAnimationTime := CheckBoxMoveTabDefaults.Checked;
      ChromeTabsTop.Options.Animation.MovementAnimations.TabMove.AnimationTimeMS := EditMoveTabTime.Value;
      ChromeTabsTop.Options.Animation.MovementAnimations.TabMove.EaseType := TChromeTabs32EaseType(ComboBoxMoveTabEase.ItemIndex);

      ChromeTabsTop.Options.Scrolling.Enabled := CheckBoxScrolling.Checked;
      ChromeTabsTop.Options.Scrolling.ScrollButtons := TChromeTabs32crollButtons(ComboBoxScrollButtons.ItemIndex);
      ChromeTabsTop.Options.Scrolling.ScrollStep := EditScrollSteps.Value;
      ChromeTabsTop.Options.Scrolling.ScrollRepeatDelay := EditScrollRepeatDelay.Value;
      ChromeTabsTop.Options.Scrolling.AutoHideButtons := CheckBoxAutoHideScrollButtons.Checked;
      ChromeTabsTop.Options.Scrolling.DragScroll := CheckBoxScrollWhileDragging.Checked;
      ChromeTabsTop.Options.Scrolling.DragScrollOffset := EditDragScrollEdge.Value;
      ChromeTabsTop.Options.Scrolling.MouseWheelScroll := CheckBoxMouseWheelScrolling.Checked;

      ChromeTabsTop.Options.DragDrop.DragType := TChromeTabDragType(ComboBoxDragType.ItemIndex);
      ChromeTabsTop.Options.DragDrop.DragOutsideImageAlpha := EditDragImageAapha.Value;
      ChromeTabsTop.Options.DragDrop.DragOutsideDistancePixels := EditDragAwayDistance.Value;
      ChromeTabsTop.Options.DragDrop.DragStartPixels := EditDragStartPixels.Value;
      ChromeTabsTop.Options.DragDrop.DragControlImageResizeFactor := StrToFloatDef(EditDragImageResize.Text, 0.5);
      ChromeTabsTop.Options.DragDrop.DragDisplay := TChromeTabDragDisplay(ComboBoxExternalDragDisplay.ItemIndex);
      ChromeTabsTop.Options.DragDrop.ContrainDraggedTabWithinContainer := CheckBoxContrainDraggedTab.Checked;

      ChromeTabsTop.Options.Display.TabSpinners.AnimationUpdateMS := EditSpinnerAnimationUpdate.Value;
      ChromeTabsTop.Options.Display.TabSpinners.HideImagesWhenSpinnerVisible := CheckBoxHideImagesWhenSpinnerActive.Checked;

      ChromeTabsTop.Options.Display.TabSpinners.Upload.ReverseDirection := CheckBoxSpinnerUploadReverseDirection.Checked;
      ChromeTabsTop.Options.Display.TabSpinners.Upload.RenderedAnimationStep := EditSpinnerUploadAnimationStep.Value;
      ChromeTabsTop.Options.Display.TabSpinners.Upload.SweepAngle := EditSpinnerUploadSweepAngle.Value;

      ChromeTabsTop.Options.Display.TabSpinners.Upload.Position.Width := EditSpinnerUploadWidth.Value;
      ChromeTabsTop.Options.Display.TabSpinners.Upload.Position.Height := EditSpinnerUploadHeight.Value;
      ChromeTabsTop.Options.Display.TabSpinners.Upload.Position.Offsets.Horizontal := EditSpinnerUploadOffsetX.Value;
      ChromeTabsTop.Options.Display.TabSpinners.Upload.Position.Offsets.Vertical := EditSpinnerUploadOffsetY.Value;

      ChromeTabsTop.Options.Display.TabSpinners.Download.ReverseDirection := CheckBoxSpinnerDownloadReverseDirection.Checked;
      ChromeTabsTop.Options.Display.TabSpinners.Download.RenderedAnimationStep := EditSpinnerDownloadAnimationStep.Value;
      ChromeTabsTop.Options.Display.TabSpinners.Download.SweepAngle := EditSpinnerDownloadSweepAngle.Value;

      ChromeTabsTop.Options.Display.TabSpinners.Download.Position.Width := EditSpinnerDownloadWidth.Value;
      ChromeTabsTop.Options.Display.TabSpinners.Download.Position.Height := EditSpinnerDownloadHeight.Value;
      ChromeTabsTop.Options.Display.TabSpinners.Download.Position.Offsets.Horizontal := EditSpinnerDownloadOffsetX.Value;
      ChromeTabsTop.Options.Display.TabSpinners.Download.Position.Offsets.Vertical := EditSpinnerDownloadOffsetY.Value;

      if ComboBoxDragCursor.ItemIndex = 0 then
        ChromeTabsTop.Options.DragDrop.DragCursor := crDefault
      else
        ChromeTabsTop.Options.DragDrop.DragCursor := crDrag;

      {$IFDEF USE_GLASS_FORM}
      if CheckBoxDisplayTopTabsInTitleBar.Checked then
        Self.ChromeTabsTop := ChromeTabsTop
      else
      begin
        Self.ChromeTabsTop := nil;

        ChromeTabsTop.Align := alTop;
        ChromeTabsTop.Top := 0;
      end;
      {$ENDIF}

      ChromeTabsTop.Options.Behaviour.DebugMode := CheckBoxDebugLog.Checked;
    finally
      FUpdatingProperties := False;

      ChromeTabsTop.EndUpdate;
    end;
  end;

  PanelTop.Color := WinColor(ChromeTabsTop.LookAndFeel.Tabs.Active.Style.StopColor);

  {$IFDEF USE_GLASS_FORM}
  if not CheckBoxDisplayTopTabsInTitleBar.Checked then
  begin
    GlassFrame.Enabled := CheckBoxUseGlass.Checked;
    GlassFrame.Top := EditGlassHeightTop.Value;
  end;

  GlassFrame.Bottom := EditGlassHeightBottom.Value;
  {$ENDIF}
end;

procedure TfrmMain.SpinButton1DownClick(Sender: TObject);
begin
  FCurrentTabs.ScrollOffset := FCurrentTabs.ScrollOffset - 30;
end;

procedure TfrmMain.SpinButton1UpClick(Sender: TObject);
begin
  FCurrentTabs.ScrollOffset := FCurrentTabs.ScrollOffset + 30
end;

procedure TfrmMain.ChromeTabs32ActiveTabChanged(Sender: TObject; ATab: TChromeTab);
begin
  if FCurrentTabs = Sender then
  begin
    TabPropertiesToGUI(FCurrentTabs.ActiveTab);

    FLogOtherEvents.Log('OnActiveTabChanged [TabIndex = %d]', [ATab.Index]);
  end;
end;

procedure TfrmMain.ChromeTabs32ActiveTabChanging(Sender: TObject; AOldTab,
  ANewTab: TChromeTab; var Allow: Boolean);
begin
  if (AOldTab <> nil) and (ANewTab <> nil) then
    FLogOtherEvents.Log('OnActiveTabChanging [OldTabIndex = %d, NewTabIndex = %d]', [
      AOldTab.Index, ANewTab.Index]);
end;

procedure TfrmMain.ChromeTabs32AfterDrawItem(Sender: TObject;
  const TargetCanvas: TCanvas32; ItemRect: TRect; ItemType: TChromeTabItemType;
  TabIndex: Integer);
begin
  if (ComboBoxSelectTabs.ItemIndex = 0) and (CheckBoxEnableEvents.Checked) then
  begin
    IncrementEventListItemCount(8);

    if ItemType = itTabContainer then
      IncrementEventListItemCount(18);
  end;
end;

procedure TfrmMain.ChromeTabs32AnimateMovement(Sender: TObject;
  ChromeTabs32Control: TBaseChromeTabs32Control; var AnimationTimeMS: Cardinal;
  var EaseType: TChromeTabs32EaseType);
begin
  FLogOtherEvents.Log('OnAnimateMovement [Control = %s, AnimationTimeMS = %d, EaseType = %s]', [
    ChromeTabs32ControlTypeDescriptions[ChromeTabs32Control.ControlType],
    AnimationTimeMS,
    ChromeTabs32EaseTypeDestriptions[EaseType]]);
end;

procedure TfrmMain.ChromeTabs32AnimateStyle(Sender: TObject;
  ChromeTabs32Control: TBaseChromeTabs32Control; NewDrawState: TDrawState;
  var AnimationTimeMS: Cardinal; var EaseType: TChromeTabs32EaseType);
begin
  FLogOtherEvents.Log('OnAnimateStyle [Control = %s, OldState = %s, NewState = %s , AnimationTimeMS = %d, EaseType = %s]', [
    ChromeTabs32ControlTypeDescriptions[ChromeTabs32Control.ControlType],
    TabDrawStateDescriptions[ChromeTabs32Control.DrawState],
    TabDrawStateDescriptions[NewDrawState],
    AnimationTimeMS,
    ChromeTabs32EaseTypeDestriptions[EaseType]]);
end;

procedure TfrmMain.ChromeTabs32BeginTabDrag(Sender: TObject; ATab: TChromeTab;
  var Allow: Boolean);
begin
  FLogOtherEvents.Log('OnBeginTabDrag [TabIndex = %d]', [ATab.Index]);
end;

procedure TfrmMain.ChromeTabs32ButtonAddClick(Sender: TObject;
  var Handled: Boolean);
begin
  if CheckBoxEnableEvents.Checked then
    FLogOtherEvents.Log('OnButtonAddClick', []);

  GUIToTabProperties(AddTab(TChromeTabs32(Sender), EditTabCaption.Text, EditImageIndex.Value));

  Handled := True;
end;

procedure TfrmMain.ChromeTabs32ButtonCloseTabClick(Sender: TObject;
  ATab: TChromeTab; var Close: Boolean);
begin
  FLogOtherEvents.Log('OnButtonCloseTabClick [TabIndex = %d]', [ATab.Index]);
end;

procedure TfrmMain.ChromeTabs32Change(Sender: TObject; ATab: TChromeTab;
  TabChangeType: TTabChangeType);
var
  Text: string;
begin
  if (not (csLoading in ComponentState)) and
     (Sender = FCurrentTabs) then
  begin
    if (TabChangeType = tcAdded) and
       (FCurrentTabs <> nil) then
      GUIToTabProperties(ATab);

    if (CheckBoxEnableEvents.Checked) and
       ((not CheckBoxIgnorePropertyUpdated.Checked) or
        (TabChangeType <> tcPropertyUpdated)) then
    begin
      Text := TabChangeTypeDescriptions[TabChangeType];

      if ATab <> nil then
        Text := Text + RStrTabIndex + IntToStr(ATab.Index);

      FLogChange.Log(Text, []);
    end;
  end;
end;

procedure TfrmMain.UpdateScrollBar;
begin
  if FCurrentTabs <> nil then
  begin
    FUpdatingScrollbar := True;
    try
      ScrollBarScrollOffset.Min := 0;

      if FCurrentTabs.MaxScrollOffset > 0 then
        ScrollBarScrollOffset.Max := FCurrentTabs.MaxScrollOffset
      else
        ScrollBarScrollOffset.Max := 1;

      ScrollBarScrollOffset.Position := FCurrentTabs.ScrollOffset;

      UpdateScrollbarLabel;
    finally
      FUpdatingScrollbar := False;
    end;
  end;
end;

procedure TfrmMain.UpdateScrollbarLabel;
begin
  LabelScrollingScrollOffsetValue.Caption := IntToStr(FCurrentTabs.ScrollOffset) + ' / ' + IntToStr(FCurrentTabs.MaxScrollOffset);
end;

procedure TfrmMain.ChromeTabs32CreateDragForm(Sender: TObject; ATab: TChromeTab;
  var DragForm: TForm);
begin
  FLogOtherEvents.Log('OnCreateDragForm [TabIndex = %d]', [ATab.Index]);
end;

procedure TfrmMain.ChromeTabs32DebugLog(Sender: TObject; const Text: string);
begin
  if (Sender = FCurrentTabs) and (CheckBoxDebugLog.Checked) then
    FLogDebug.Log(Text, []);
end;

procedure TfrmMain.ChromeTabs32EndTabDrag(Sender: TObject;
  Destination: TCustomChromeTabs32; ATab: TChromeTab; var Cancel: Boolean);
begin
  FLogOtherEvents.Log('OnEndTabDrag [TabIndex = %d]', [ATab.Index]);
end;

procedure TfrmMain.ChromeTabs32Enter(Sender: TObject);
begin
  FLogOtherEvents.Log('OnEnter', []);
end;

procedure TfrmMain.ChromeTabs32Exit(Sender: TObject);
begin
  FLogOtherEvents.Log('OnExit', []);
end;

procedure TfrmMain.ChromeTabs32GetControlPolygons(Sender,
  ChromeTabs32Control: TObject; ItemRect: TRect; ItemType: TChromeTabItemType;
  Orientation: TTabOrientation; var Polygons: IChromeTabPolygons);
var
  ChromeTabControl: TBaseChromeTabs32Control;
  TabTop: Integer;
begin
  // A very basic demo of how to alter the shape of the tabs
  if (CheckBoxCustomTabShapes <> nil) and (CheckBoxCustomTabShapes.Checked) then
  begin
    if (ItemType = itTab) and
       (ChromeTabs32Control is TBaseChromeTabs32Control) then
    begin
      ChromeTabControl := ChromeTabs32Control as TBaseChromeTabs32Control;

      Polygons := TChromeTabPolygons.Create;

      TabTop := 0;

      if (ChromeTabControl is TChromeTabControl) and
         (not TChromeTabControl(ChromeTabControl).ChromeTab.GetActive) then
        Inc(TabTop, 3);

      Polygons.AddPolygon(ChromeTabControl.NewPolygon(ChromeTabControl.BidiControlRect,
                                                      [FloatPoint(0, RectHeight(ItemRect)),
                                                       FloatPoint(0, TabTop),
                                                       FloatPoint(RectWidth(ItemRect), TabTop),
                                                       FloatPoint(RectWidth(ItemRect), RectHeight(ItemRect))],
                                   Orientation),
                                   nil,
                                   nil);
    end;
  end;
end;

procedure TfrmMain.ChromeTabs32MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FLogOtherEvents.Log('OnMouseDown', []);
end;

procedure TfrmMain.ChromeTabs32MouseEnter(Sender: TObject);
begin
  FLogOtherEvents.Log('OnMouseEnter', []);
end;

procedure TfrmMain.ChromeTabs32MouseLeave(Sender: TObject);
begin
  FLogOtherEvents.Log('OnMouseLeave', []);
end;

procedure TfrmMain.ChromeTabs32MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);

  procedure AddLine(const Description: string; const Value: Variant);
  begin
    FLogMouseMove.Log(Description + ': ' + VarToStr(Value), []);
  end;

var
  HitTestResult: THitTestResult;
  TabControl: TChromeTabControl;
  Tabs: TChromeTabs32;
begin
  if (X <> FLastMouseX) or (Y <> FLastMouseY) then
  begin
    Tabs := TChromeTabs32(Sender);

    FLastMouseX := X;
    FLastMouseY := Y;

    HitTestResult := Tabs.HitTest(GR32.Point(X, Y));

    FLogMouseMove.BeginUpdate;
    try
      FLogMouseMove.Clear;

      AddLine(RStrMouseX, X);
      AddLine(RStrMouseY, Y);
      AddLine(RStrHitTestArea, HitTestDescriptions[HitTestResult.HitTestArea]);
      AddLine(RStrHitTestTabIndex, HitTestResult.TabIndex);

      TabControl := Tabs.TabControls[HitTestResult.TabIndex];

      if Assigned(TabControl) then
      begin
        AddLine(RStrTabDrawState, TabDrawStateDescriptions[TabControl.DrawState]);
        AddLine(RStrCloseButtonDrawSt, TabDrawStateDescriptions[TabControl.CloseButtonState]);
      end;
    finally
      FLogMouseMove.EndUpdate;
    end;
  end;
end;

procedure TfrmMain.ChromeTabs32MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FLogOtherEvents.Log('OnMouseUp', []);
end;

procedure TfrmMain.ChromeTabs32NeedDragImageControl(Sender: TObject;
  ATab: TChromeTab; var DragControl: TWinControl);
begin
  if CheckBoxEnableEvents.Checked then
    FLogOtherEvents.Log('OnNeedDragImageControl [TabIndex = %d]', [ATab.Index]);

  DragControl := PageControlMain;
end;

procedure TfrmMain.ChromeTabs32ScrollWidthChanged(Sender: TObject);
begin
  UpdateScrollBar;
end;

procedure TfrmMain.ChromeTabs32SetTabWidth(Sender: TObject;
  ATabControl: TChromeTabControl; var TabWidth: Integer);
begin
  FLogOtherEvents.Log('OnSetTabWidth [TabIndex = %d, TabWidth= %d]', [ATabControl.ChromeTab.GetIndex, TabWidth]);
end;

procedure TfrmMain.ChromeTabs32ShowHint(Sender: TObject;
  HitTestResult: THitTestResult; var HintText: string;
  var HintTimeout: Integer);
begin
  FLogOtherEvents.Log('OnShowHint [HitTestArea: %s, TabIndex = %d, HintText = %s, HintTimeout = %d]', [HitTestDescriptions[HitTestResult.HitTestArea],
                                                                                                        HitTestResult.TabIndex,
                                                                                                        HintText,
                                                                                                        HintTimeout]);
end;

procedure TfrmMain.ChromeTabs32StateChange(Sender: TObject; PreviousState,
  CurrentState: TChromeTabs32States);
begin
  if CurrentState = [] then
    EditStates.Text := 'None'
  else
    EditStates.Text := ChromeTabs32StatesToString(CurrentState);
end;

procedure TfrmMain.ChromeTabs32TabClientRectChanged(Sender: TObject);
begin
  UpdateScrollBar;
end;

procedure TfrmMain.ChromeTabs32TabDblClick(Sender: TObject; ATab: TChromeTab);
begin
  FLogOtherEvents.Log('OnTabDblClick [TabIndex = %d]', [ATab.Index]);
end;

procedure TfrmMain.ChromeTabsTopTabDragDrop(Sender: TObject; X, Y: Integer;
  DragTabObject: IDragTabObject; Cancelled: Boolean;
  var TabDropOptions: TTabDropOptions);
begin
  FLogOtherEvents.Log('OnTabDragDrop ', []);

  ListBoxTabDragOver.Clear;

  ProcessDroppedTab(Sender, X, Y, DragTabObject, Cancelled, TabDropOptions);
end;

procedure TfrmMain.ProcessDroppedTab(Sender: TObject; X, Y: Integer;
  DragTabObject: IDragTabObject; Cancelled: Boolean;
  var TabDropOptions: TTabDropOptions);
var
  WinX, WinY: Integer;
  NewForm: TfrmMain;
begin
  // Make sure that the drag drop hasn't been cancelled and that
  // we are not dropping on a TChromeTab control
  if (not Cancelled) and
     (DragTabObject.SourceControl <> DragTabObject.DockControl) and
     (DragTabObject.DockControl = nil) then
  begin
    // Find the drop position
    WinX := Mouse.CursorPos.X - DragTabObject.DragCursorOffset.X - ((Width - ClientWidth) div 2);
    WinY := Mouse.CursorPos.Y - DragTabObject.DragCursorOffset.Y - (Height - ClientHeight) + ((Width - ClientWidth) div 2);

    // Create a new form
    NewForm := TfrmMain.Create(Application);

    // Set the new form position
    NewForm.Position := poDesigned;
    NewForm.Left := WinX;
    NewForm.Top := WinY;

    // Show the form
    NewForm.Show;

    // Remove the original tab
    TabDropOptions := [tdDeleteDraggedTab];
  end;
end;

procedure TfrmMain.ChromeTabs32TabDragDropped(Sender: TObject;
  DragTabObject: IDragTabObject; NewTab: TChromeTab);
begin
  FLogOtherEvents.Log('OnTabDragDropped [NewTabIndex = %d]', [NewTab.Index]);
end;

procedure TfrmMain.ChromeTabs32TabDragOver(Sender: TObject; X, Y: Integer;
  State: TDragState; DragTabObject: IDragTabObject; var Accept: Boolean);

  procedure AddLine(const Description: string; const Value: Variant);
  begin
    FLogDragOver.Log(Description + ': ' + VarToStr(Value), []);
  end;

var
  HitTestResult: THitTestResult;
  Tabs: TChromeTabs32;
begin
  Tabs := TChromeTabs32(Sender);

  HitTestResult := Tabs.HitTest(GR32.Point(X, Y));

  FLogDragOver.BeginUpdate;
  try
    FLogDragOver.Clear;

    if Tabs.ActiveDragTabObject <> nil then
    begin
      AddLine(RStrDragging, RStrActive);
      AddLine(RStrTabCaption, Tabs.ActiveDragTabObject.DragTab.Caption);
      AddLine(RStrTabIndex, Tabs.ActiveDragTabObject.DragTab.Index);
      AddLine(RStrHorizontalOffset, Tabs.ActiveDragTabObject.DragCursorOffset.X);
      AddLine(RStrVerticalOffset, Tabs.ActiveDragTabObject.DragCursorOffset.Y);
      AddLine(RStrDropTabIndex, Tabs.ActiveDragTabObject.DropTabIndex);

      AddLine(RStrSourceControl, Tabs.ActiveDragTabObject.SourceControl.GetControl.Name);

      if Tabs.ActiveDragTabObject.DockControl = nil then
        AddLine(RStrDockControl, RStrNone)
      else
        AddLine(RStrDockControl, Tabs.ActiveDragTabObject.DockControl.GetControl.Name);
    end;
  finally
    FLogDragOver.EndUpdate;
  end;
end;

procedure TfrmMain.ChromeTabs32TabDragStart(Sender: TObject; ATab: TChromeTab;
  var Allow: Boolean);
begin
  FLogOtherEvents.Log('OnTabDragStart [TabIndex = %d]', [ATab.Index]);

  Allow := True;
end;

procedure TfrmMain.ChromeTabsBottomTabDragDrop(Sender: TObject; X, Y: Integer;
  DragTabObject: IDragTabObject; Cancelled: Boolean;
  var TabDropOptions: TTabDropOptions);
begin
  ProcessDroppedTab(Sender, X, Y, DragTabObject, Cancelled, TabDropOptions);
end;

procedure TfrmMain.UpdateControls;
begin
  EditGlassHeightTop.Enabled := CheckBoxUseGlass.Checked;
  EditGlassHeightBottom.Enabled := CheckBoxUseGlass.Checked;

  EnableControlAndChildren(PanelScroll, CheckBoxScrolling.Checked);
  EnableControlAndChildren(PanelDragDrop, ComboBoxDragType.ItemIndex > 0);
  EnableControlAndChildren(PanelMouseGlow, CheckBoxMouseGlowVisible.Checked);

  EditCloseButtonMouseLeaveDelay.Enabled := CheckBoxSmartResize.Checked;

  EditDragScrollEdge.Enabled := CheckBoxScrolling.Checked and CheckBoxScrollWhileDragging.Checked;

  EditAddTabTime.Enabled := not CheckBoxAddTabDefaults.Checked;
  ComboBoxAddTabEase.Enabled := not CheckBoxAddTabDefaults.Checked;

  EditDeleteTabTime.Enabled := not CheckBoxDeleteTabDefaults.Checked;
  ComboBoxDeleteTabEase.Enabled := not CheckBoxDeleteTabDefaults.Checked;

  EditMoveTabTime.Enabled := not CheckBoxMoveTabDefaults.Checked;
  ComboBoxMoveTabEase.Enabled := not CheckBoxMoveTabDefaults.Checked;
end;

end.
