unit ChromeTabs32Classes;

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
  System.SysUtils, System.Classes, System.Types, System.Math, System.Contnrs,
  System.UITypes,
  Vcl.Graphics, Vcl.Controls, Vcl.ExtCtrls, Vcl.Forms, Vcl.GraphUtil,
  Vcl.ImgList, Vcl.Dialogs,
  WinApi.Windows, WinApi.Messages,
  {$ELSE}
  SysUtils, Classes, Math, Contnrs,
  Graphics, Controls, ExtCtrls, Forms, GraphUtil, ImgList, Dialogs,
  Windows, Messages,
  {$IFEND}

  GR32, GR32_Polygons, GR32_Brushes, GR32_ColorGradients, GR32_Paths,

  ChromeTabs32Utils,
  ChromeTabs32Types;

type
  TChromeTab = class;
  TChromeTabs32LookAndFeelStyle = class;
  IChromeTabs32 = interface;
  IDragTabObject = interface;

  IChromeTab = interface
    ['{B1B1F10B-3E5C-4A9E-B62F-8C322C803902}']
    function GetCaption: TCaption;
    function GetImageIndex: {$IF CompilerVersion >= 23.0}System.UITypes.{$IFEND}TImageIndex;
    function GetImageIndexOverlay: {$IF CompilerVersion >= 23.0}System.UITypes.{$IFEND}TImageIndex;
    function GetActive: Boolean;
    function GetPinned: Boolean;
    function GetIndex: Integer;
    function GetModified: Boolean;
    function GetTab: TChromeTab;
    function GetMarkedForDeletion: Boolean;
    function GetSpinnerState: TChromeTabs32SpinnerState;
    function GetHideCloseButton: Boolean;
    function GetData: Pointer;
    procedure SetData(const Value: Pointer);
    property Data: Pointer read GetData write SetData;
  end;

  TChromeTabPolygon = class(TObject)
  private
    FPolygon: TArrayOfFloatPoint;
    FPen: TStrokeBrush;
    FFiller: TCustomPolygonFiller;
  public
    property Polygon: TArrayOfFloatPoint read FPolygon write FPolygon;
    property Filler: TCustomPolygonFiller read FFiller write FFiller;
    property Pen: TStrokeBrush read FPen write FPen;
  end;

  IChromeTabPolygons = interface
    ['{F8B75D11-75AE-4871-90CC-EDC298F2CE8D}']
    function GetPolygonCount: Integer;
    function GetPolygons(Index: Integer): TChromeTabPolygon;

    function AddPolygon(Polygon: TArrayOfFloatPoint; Filler: TCustomPolygonFiller; Pen: TStrokeBrush): IChromeTabPolygons;
    procedure DrawTo(TargetCanvas: TCanvas32; DrawToFunctions: TDrawToFunctions = dfBrushAndPen);

    property PolygonCount: Integer read GetPolygonCount;
    property Polygons[Index: Integer]: TChromeTabPolygon read GetPolygons;
  end;

  TChromeTabPolygons = class(TInterfacedObject, IChromeTabPolygons)
  private
    FPolygons: TObjectList;

    function GetPolygonCount: Integer;
    function GetPolygons(Index: Integer): TChromeTabPolygon;
  public
    constructor Create; virtual;
    destructor Destroy; override;

    function AddPolygon(Polygon: TArrayOfFloatPoint; Filler: TCustomPolygonFiller; Pen: TStrokeBrush): IChromeTabPolygons; virtual;
    procedure DrawTo(TargetCanvas: TCanvas32; DrawToFunctions: TDrawToFunctions = dfBrushAndPen); virtual;

    property PolygonCount: Integer read GetPolygonCount;
    property Polygons[Index: Integer]: TChromeTabPolygon read GetPolygons;
  end;

  TChromeTab = class(TCollectionItem, IChromeTab)
  private
    // These dummy functions are required so we can implement an interface
    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
  private
    FCollection: TCollection;
    FCaption: TCaption;
    FData: Pointer;
    FImageIndex: {$IF CompilerVersion >= 23.0}System.UITypes.{$IFEND}TImageIndex;
    FImageIndexOverlay: {$IF CompilerVersion >= 23.0}System.UITypes.{$IFEND}TImageIndex;
    FTag: integer;
    FPinned: Boolean;
    FTabControl: TObject;
    FActive: Boolean;
    FVisible: Boolean;
    FModified: Boolean;
    FMarkedForDeletion: Boolean;
    FSpinnerState: TChromeTabs32SpinnerState;
    FHideCloseButton: Boolean;

    procedure SetActive(Value: boolean);
    procedure SetCaption(Value: TCaption);
    procedure SetImageIndex(Value: {$IF CompilerVersion >= 23.0}System.UITypes.{$IFEND}TImageIndex);
    procedure SetTag(const Value: integer);
    procedure SetPinned(const Value: Boolean);
    procedure SetImageIndexOverlay(const Value: {$IF CompilerVersion >= 23.0}System.UITypes.{$IFEND}TImageIndex);
    procedure SetVisible(const Value: Boolean);
    procedure SetModified(const Value: Boolean);
    procedure SetSpinnerState(const Value: TChromeTabs32SpinnerState);
    procedure SetHideCloseButton(const Value: Boolean);
    procedure SetTabControl(const Value: TObject);
    procedure SetData(const Value: Pointer);

    function GetDisplayCaption: String;
    function GetCaption: TCaption;
    function GetImageIndex: {$IF CompilerVersion >= 23.0}System.UITypes.{$IFEND}TImageIndex;
    function GetImageIndexOverlay: {$IF CompilerVersion >= 23.0}System.UITypes.{$IFEND}TImageIndex;
    function GetActive: boolean;
    function GetPinned: Boolean;
    function GetIndex: Integer;
    function GetTag: integer;
    function GetVisible: Boolean;
    function GetModified: Boolean;
    function GetTab: TChromeTab;
    function GetMarkedForDeletion: Boolean;
    function GetSpinnerState: TChromeTabs32SpinnerState;
    function GetHideCloseButton: Boolean;
    function GetData: Pointer;
  protected
    procedure DoChanged(ChangeType: TTabChangeType = tcPropertyUpdated); virtual;
    function GetDisplayName: string; override;
    function GetChromeTabInterface: IChromeTabs32;
    procedure SetCollection(Value: TCollection); override;
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;

    function ImageIsVisible: Boolean;

    property Data: Pointer read GetData write SetData;
    property DisplayCaption: String read GetDisplayCaption;

    property TabControl: TObject read FTabControl write SetTabControl;
    property MarkedForDeletion: Boolean read GetMarkedForDeletion;
  published
    property Caption: TCaption read GetCaption write SetCaption;
    property Active: boolean read GetActive write SetActive;
    property Tag: integer read GetTag write SetTag;
    property ImageIndex: {$IF CompilerVersion >= 23.0}System.UITypes.{$IFEND}TImageIndex read GetImageIndex write SetImageIndex;
    property ImageIndexOverlay: {$IF CompilerVersion >= 23.0}System.UITypes.{$IFEND}TImageIndex read GetImageIndexOverlay write SetImageIndexOverlay;
    property Pinned: Boolean read GetPinned write SetPinned;
    property Visible: Boolean read GetVisible write SetVisible;
    property Modified: Boolean read GetModified write SetModified;
    property SpinnerState: TChromeTabs32SpinnerState read GetSpinnerState write SetSpinnerState;
    property HideCloseButton: Boolean read GetHideCloseButton write SetHideCloseButton;
  end;

  TChromeTabClass = class of TChromeTab;

  TChromeTabs32List = class(TOwnedCollection)
  private
    function GetActiveTab: TChromeTab;
    procedure SetActiveTab(const Value: TChromeTab);
  protected
    procedure SetItem(Index: Integer; Value: TChromeTab);
    function GetItem(Index: Integer): TChromeTab;

    procedure Notify(Item: TCollectionItem; Action: TCollectionNotification); override;

    function GetChromeTabInterface: IChromeTabs32; virtual;
  public
    constructor Create(AOwner: TComponent);

    function IndexOf(ATab: TChromeTab): integer;
    property Items[Index: Integer]: TChromeTab read GetItem write SetItem; default;
    procedure Move(OldIndex, NewIndex: Integer);
    procedure Assign(Source: TPersistent); override;
    procedure DeleteTab(Index: Integer; DeleteNow: Boolean);
    function Add: TChromeTab; virtual;

    property ActiveTab: TChromeTab read GetActiveTab write SetActiveTab;
  end;

  TChromeTabs32Persistent = class(TPersistent)
  private
    FOwner: TPersistent;
  protected
    function GetOwner: TPersistent; override;
    procedure DoChanged; virtual;
  public
    constructor Create(AOwner: TPersistent); virtual;

    property Owner: TPersistent read FOwner;
  end;

  TChromeTabs32LookAndFeelStyle = class(TChromeTabs32Persistent)
  private
    FFiller: TLinearGradientPolygonFiller;
    FPen: TStrokeBrush;

    procedure SetStartColor(const Value: TColor32);
    procedure SetStopColor(const Value: TColor32);
    procedure SetOutlineColor(const Value: TColor32);
    procedure SetOutlineSize(const Value: Single);
    function GetOutlineColor: TColor32;
    function GetOutlineSize: Single;
    function GetStartColor: TColor32;
    function GetStopColor: TColor32;
  public
    function GetPolygonFiller(ClientRect: TRect): TLinearGradientPolygonFiller;
  published
    constructor Create(AOwner: TPersistent); override;
    destructor Destroy; override;

    property StartColor: TColor32 read GetStartColor write SetStartColor;
    property StopColor: TColor32 read GetStopColor write SetStopColor;
    property OutlineColor: TColor32 read GetOutlineColor write SetOutlineColor;
    property OutlineSize: Single read GetOutlineSize write SetOutlineSize;
  end;

  TChromeTabs32LookAndFeelPen = class(TChromeTabs32Persistent)
  private
    FPen: TStrokeBrush;
  private
    procedure SetColor(const Value: TColor32);
    procedure SetThickness(const Value: Single);
    function GetThickness: Single;
    function GetColor: TColor32;
  public
    constructor Create(AOwner: TPersistent); override;
    destructor Destroy; override;
  published
    property Color: TColor32 read GetColor write SetColor;
    property Thickness: Single read GetThickness write SetThickness;
    property Pen: TStrokeBrush read FPen;
  end;

  TChromeTabs32LookAndFeelBaseFont = class(TChromeTabs32Persistent)
  private
    FName: TFontName;
    FColor: TColor32;
    FSize: Integer;

    procedure SetColor(const Value: TColor32);
    procedure SetName(const Value: TFontName);
    procedure SetSize(const Value: Integer);
  public
    constructor Create(AOwner: TPersistent); override;
  published
    property Name: TFontName read FName write SetName;
    property Color: TColor32 read FColor write SetColor;
    property Size: Integer read FSize write SetSize;
  end;

  TChromeTabs32LookAndFeelFont = class(TChromeTabs32LookAndFeelBaseFont)
  private
    FUseDefaultFont: Boolean;

    procedure SetUseDefaultFont(const Value: Boolean);
  public
    constructor Create(AOwner: TPersistent); override;
  published
    property UseDefaultFont: Boolean read FUseDefaultFont write SetUseDefaultFont;
  end;

  TChromeTabs32LookAndFeelStyleProperties = class(TChromeTabs32Persistent)
  private
    FFont: TChromeTabs32LookAndFeelFont;
    FStyle: TChromeTabs32LookAndFeelStyle;

    procedure SetFont(const Value: TChromeTabs32LookAndFeelFont);
    procedure SetStyle(const Value: TChromeTabs32LookAndFeelStyle);
  public
    constructor Create(AOwner: TPersistent); override;
    destructor Destroy; override;
  published
    property Font: TChromeTabs32LookAndFeelFont read FFont write SetFont;
    property Style: TChromeTabs32LookAndFeelStyle read FStyle write SetStyle;
  end;

  TChromeTabs32CustomLookAndFeelStylePropertyItems = class(TChromeTabs32Persistent)
  private
    FStyleProperty1: TChromeTabs32LookAndFeelStyleProperties;
    FStyleProperty2: TChromeTabs32LookAndFeelStyleProperties;
    FStyleProperty3: TChromeTabs32LookAndFeelStyleProperties;
  protected
    procedure SetStyleProperty2(const Value: TChromeTabs32LookAndFeelStyleProperties);
    procedure SetStyleProperty3(const Value: TChromeTabs32LookAndFeelStyleProperties);
    procedure SetStyleProperty1(const Value: TChromeTabs32LookAndFeelStyleProperties);
  public
    constructor Create(AOwner: TPersistent); override;
    destructor Destroy; override;
  protected
    property Active: TChromeTabs32LookAndFeelStyleProperties read FStyleProperty1 write SetStyleProperty1;
    property NotActive: TChromeTabs32LookAndFeelStyleProperties read FStyleProperty2 write SetStyleProperty2;
    property Hot: TChromeTabs32LookAndFeelStyleProperties read FStyleProperty3 write SetStyleProperty3;
  end;

  TChromeTabs32LookAndFeelGlow = class(TChromeTabs32Persistent)
  private
    FCenterColor: TColor32;
    FOutsideColor: TColor32;

    procedure SetCenterColor(const Value: TColor32);
    procedure SetOutsideColor(const Value: TColor32);
  public
    constructor Create(AOwner: TPersistent); override;
  published
    property CenterColor: TColor32 read FCenterColor write SetCenterColor;
    property OutsideColor: TColor32 read FOutsideColor write SetOutsideColor;
  end;

  TChromeTabs32LookAndFeelSpinners = class(TChromeTabs32Persistent)
  private
    FUpload: TChromeTabs32LookAndFeelPen;
    FDownload: TChromeTabs32LookAndFeelPen;

    procedure SetDownload(const Value: TChromeTabs32LookAndFeelPen);
    procedure SetUpload(const Value: TChromeTabs32LookAndFeelPen);
  public
    constructor Create(AOwner: TPersistent); override;
    destructor Destroy; override;
  published
    property Upload: TChromeTabs32LookAndFeelPen read FUpload write SetUpload;
    property Download: TChromeTabs32LookAndFeelPen read fDownload write SetDownload;
  end;

  TChromeTabs32LookAndFeelTab = class(TChromeTabs32CustomLookAndFeelStylePropertyItems)
  private
    FBaseLine: TChromeTabs32LookAndFeelPen;
    FModified: TChromeTabs32LookAndFeelGlow;
    FDefaultFont: TChromeTabs32LookAndFeelBaseFont;
    FMouseGlow: TChromeTabs32LookAndFeelGlow;
    FSpinners: TChromeTabs32LookAndFeelSpinners;

    procedure SetBaseLine(const Value: TChromeTabs32LookAndFeelPen);
    procedure SetModified(const Value: TChromeTabs32LookAndFeelGlow);
    procedure SetDefaultFont(const Value: TChromeTabs32LookAndFeelBaseFont);
    procedure SetMouseGlow(const Value: TChromeTabs32LookAndFeelGlow);
    procedure SetSpinners(const Value: TChromeTabs32LookAndFeelSpinners);
  public
    constructor Create(AOwner: TPersistent); override;
    destructor Destroy; override;
  published
    property BaseLine: TChromeTabs32LookAndFeelPen read FBaseLine write SetBaseLine;
    property Modified: TChromeTabs32LookAndFeelGlow read FModified write SetModified;
    property DefaultFont: TChromeTabs32LookAndFeelBaseFont read FDefaultFont write SetDefaultFont;
    property MouseGlow: TChromeTabs32LookAndFeelGlow read FMouseGlow write SetMouseGlow;
    property Spinners: TChromeTabs32LookAndFeelSpinners read FSpinners write SetSpinners;
    property Active;
    property NotActive;
    property Hot;
  end;

  TChromeTabs32LookAndFeelCustomStyleItems = class(TChromeTabs32Persistent)
  protected
    FStyleProperty1: TChromeTabs32LookAndFeelStyle;
    FStyleProperty2: TChromeTabs32LookAndFeelStyle;
    FStyleProperty3: TChromeTabs32LookAndFeelStyle;

    procedure SetStyleProperty1(const Value: TChromeTabs32LookAndFeelStyle);
    procedure SetStyleProperty2(const Value: TChromeTabs32LookAndFeelStyle);
    procedure SetStyleProperty3(const Value: TChromeTabs32LookAndFeelStyle);
  public
    constructor Create(AOwner: TPersistent); override;
    destructor Destroy; override;
  protected
    property Normal: TChromeTabs32LookAndFeelStyle read FStyleProperty1 write SetStyleProperty1;
    property Down: TChromeTabs32LookAndFeelStyle read FStyleProperty2 write SetStyleProperty2;
    property Hot: TChromeTabs32LookAndFeelStyle read FStyleProperty3 write SetStyleProperty3;
  end;

  TChromeTabs32CustomLookAndFeelPenItem = class(TChromeTabs32Persistent)
  protected
    FPen1: TChromeTabs32LookAndFeelPen;
    FPen2: TChromeTabs32LookAndFeelPen;
    FPen3: TChromeTabs32LookAndFeelPen;

    procedure SetPen1(const Value: TChromeTabs32LookAndFeelPen);
    procedure SetPen2(const Value: TChromeTabs32LookAndFeelPen);
    procedure SetPen3(const Value: TChromeTabs32LookAndFeelPen);
  public
    constructor Create(AOwner: TPersistent); override;
    destructor Destroy; override;
  protected
    property Pen1: TChromeTabs32LookAndFeelPen read FPen1 write SetPen1;
    property Pen2: TChromeTabs32LookAndFeelPen read FPen2 write SetPen2;
    property Pen3: TChromeTabs32LookAndFeelPen read FPen3 write SetPen3;
  end;

  TChromeTabs32LookAndFeelPenItem = class(TChromeTabs32CustomLookAndFeelPenItem)
  published
    property Normal: TChromeTabs32LookAndFeelPen read FPen1 write SetPen1;
    property Down: TChromeTabs32LookAndFeelPen read FPen2 write SetPen2;
    property Hot: TChromeTabs32LookAndFeelPen read FPen3 write SetPen3;
  end;

  TChromeTabs32LookAndFeelButtonItems = class(TChromeTabs32LookAndFeelCustomStyleItems)
  published
    property Normal;
    property Down;
    property Hot;
  end;

  TChromeTabs32LookAndFeelDisabledButton = class(TChromeTabs32LookAndFeelButtonItems)
  private
    FDisabled: TChromeTabs32LookAndFeelStyle;
  protected
    procedure SetDisabled(const Value: TChromeTabs32LookAndFeelStyle);
  public
    constructor Create(AOwner: TPersistent); override;
    destructor Destroy; override;
  published
    property Disabled: TChromeTabs32LookAndFeelStyle read FDisabled write SetDisabled;
  end;

  TChromeTabs32LookAndFeelAddButton = class(TChromeTabs32Persistent)
  private
    FButton: TChromeTabs32LookAndFeelButtonItems;
    FPlusSign: TChromeTabs32LookAndFeelButtonItems;
  private
    procedure SetButton(const Value: TChromeTabs32LookAndFeelButtonItems);
    procedure SetPlusSign(const Value: TChromeTabs32LookAndFeelButtonItems);
  public
    constructor Create(AOwner: TPersistent); override;
    destructor Destroy; override;
  published
    property Button: TChromeTabs32LookAndFeelButtonItems read FButton write SetButton;
    property PlusSign: TChromeTabs32LookAndFeelButtonItems read FPlusSign write SetPlusSign;
  end;

  TChromeTabs32LookAndFeelCloseButton = class(TChromeTabs32Persistent)
  private
    FCross: TChromeTabs32LookAndFeelPenItem;
    FCircle: TChromeTabs32LookAndFeelButtonItems;

    procedure SetCircle(const Value: TChromeTabs32LookAndFeelButtonItems);
    procedure SetCross(const Value: TChromeTabs32LookAndFeelPenItem);
  public
    constructor Create(AOwner: TPersistent); override;
    destructor Destroy; override;
  published
    property Cross: TChromeTabs32LookAndFeelPenItem read FCross write SetCross;
    property Circle: TChromeTabs32LookAndFeelButtonItems read FCircle write SetCircle;
  end;

  TChromeTabs32LookAndFeelScrollButton = class(TChromeTabs32Persistent)
  private
    FButton: TChromeTabs32LookAndFeelDisabledButton;
    FArrow: TChromeTabs32LookAndFeelDisabledButton;

    procedure SetArrow(const Value: TChromeTabs32LookAndFeelDisabledButton);
    procedure SetButton(const Value: TChromeTabs32LookAndFeelDisabledButton);
  public
    constructor Create(AOwner: TPersistent); override;
    destructor Destroy; override;
  published
    property Button: TChromeTabs32LookAndFeelDisabledButton read FButton write SetButton;
    property Arrow: TChromeTabs32LookAndFeelDisabledButton read FArrow write SetArrow;
  end;

  TChromeTabs32LookAndFeel = class(TChromeTabs32Persistent)
  private
    FTabs: TChromeTabs32LookAndFeelTab;
    FTabsContainer: TChromeTabs32LookAndFeelStyle;
    FCloseButton: TChromeTabs32LookAndFeelCloseButton;
    FAddButton: TChromeTabs32LookAndFeelAddButton;
    FScrollButtons: TChromeTabs32LookAndFeelScrollButton;

    procedure SetTabsContainer(const Value: TChromeTabs32LookAndFeelStyle);
    procedure SetScrollButtons(const Value: TChromeTabs32LookAndFeelScrollButton);
    procedure SetAddButton(const Value: TChromeTabs32LookAndFeelAddButton);
    procedure SetCloseButton(const Value: TChromeTabs32LookAndFeelCloseButton);
    procedure SetTabs(const Value: TChromeTabs32LookAndFeelTab);
  public
    constructor Create(AOwner: TPersistent); override;
    destructor Destroy; override;
  published
    property TabsContainer: TChromeTabs32LookAndFeelStyle read FTabsContainer write SetTabsContainer;
    property Tabs: TChromeTabs32LookAndFeelTab read FTabs write SetTabs;
    property CloseButton: TChromeTabs32LookAndFeelCloseButton read FCloseButton write SetCloseButton;
    property AddButton: TChromeTabs32LookAndFeelAddButton read FAddButton write SetAddButton;
    property ScrollButtons: TChromeTabs32LookAndFeelScrollButton read FScrollButtons write SetScrollButtons;
  end;

  IChromeTabDockControl = interface
    ['{CFC0D4E4-C0AE-4713-B424-2D5DE4FC5EF9}']
    function GetControl: TWinControl;
    procedure TabDragOver(Sender: TObject; X, Y: Integer; State: TDragState; DragTabObject: IDragTabObject; var Accept: Boolean);
    procedure TabDragDrop(Sender: TObject; X, Y: Integer; DragTabObject: IDragTabObject; Cancelled: Boolean; var TabDropOptions: TTabDropOptions);
    function InsertDroppedTab: TChromeTab;
    procedure FireScrollTimer;
    procedure DragCompleted(MouseX, MouseY: Integer; Cancelled: Boolean);
    function GetBidiMode: TBiDiMode;
  end;

  IDragTabObject = interface
    ['{688BB6B4-6286-4488-815A-920D32E60B1F}']
    function GetDragCursorOffset: TPoint;
    function GetDragForm: TForm;
    function GetDragFormOffset: TPoint;
    function GetDragPoint: TPoint;
    function GetDragTab: TChromeTab;
    function GetDropTabIndex: Integer;
    function GetHideAddButton: Boolean;
    function GetOriginalControlRect: TRect;
    function GetSourceControl: IChromeTabDockControl;
    function GetDockControl: IChromeTabDockControl;
    function GetOriginalCursor: TCursor;
    function GetDragOverType: TDragOverType;

    procedure SetDragCursorOffset(const Value: TPoint);
    procedure SetDragForm(const Value: TForm);
    procedure SetDragFormOffset(const Value: TPoint);
    procedure SetDragPoint(const Value: TPoint);
    procedure SetDragTab(const Value: TChromeTab);
    procedure SetDropTabIndex(const Value: Integer);
    procedure SetHideAddButton(const Value: Boolean);
    procedure SetOriginalControlRect(const Value: TRect);
    procedure SetSourceControl(const Value: IChromeTabDockControl);
    procedure SetDockControl(const Value: IChromeTabDockControl);
    procedure SetOriginalCursor(const Value: TCursor);
    procedure SetDragOverType(const Value: TDragOverType);

    property DragTab: TChromeTab read GetDragTab write SetDragTab;
    property DragCursorOffset: TPoint read GetDragCursorOffset write SetDragCursorOffset;
    property DragFormOffset: TPoint read GetDragFormOffset write SetDragFormOffset;
    property DragPoint: TPoint read GetDragPoint write SetDragPoint;
    property HideAddButton: Boolean read GetHideAddButton write SetHideAddButton;
    property OriginalControlRect: TRect read GetOriginalControlRect write SetOriginalControlRect;
    property DropTabIndex: Integer read GetDropTabIndex write SetDropTabIndex;
    property DragForm: TForm read GetDragForm write SetDragForm;
    property SourceControl: IChromeTabDockControl read GetSourceControl write SetSourceControl;
    property DockControl: IChromeTabDockControl read GetDockControl write SetDockControl;
    property OriginalCursor: TCursor read GetOriginalCursor write SetOriginalCursor;
    property DragOverType: TDragOverType read GetDragOverType write SetDragOverType;
  end;

  TDragTabObject = class(TInterfacedObject, IDragTabObject)
  private
    FDragTab: TChromeTab;
    FDragCursorOffset: TPoint;
    FDragFormOffset: TPoint;
    FDragPoint: TPoint;
    FHideAddButton: Boolean;
    FOriginalControlRect: TRect;
    FDropTabIndex: Integer;
    FDragForm: TForm;
    FSourceControl: IChromeTabDockControl;
    FDockControl: IChromeTabDockControl;
    FOriginalCursor: TCursor;
    FDragOverType: TDragOverType;

    function GetDragCursorOffset: TPoint;
    function GetDragForm: TForm;
    function GetDragFormOffset: TPoint;
    function GetDragPoint: TPoint;
    function GetDragTab: TChromeTab;
    function GetDropTabIndex: Integer;
    function GetHideAddButton: Boolean;
    function GetOriginalControlRect: TRect;
    function GetSourceControl: IChromeTabDockControl;
    function GetDockControl: IChromeTabDockControl;
    function GetOriginalCursor: TCursor;
    function GetDragOverType: TDragOverType;

    procedure SetDragCursorOffset(const Value: TPoint);
    procedure SetDragForm(const Value: TForm);
    procedure SetDragFormOffset(const Value: TPoint);
    procedure SetDragPoint(const Value: TPoint);
    procedure SetDragTab(const Value: TChromeTab);
    procedure SetDropTabIndex(const Value: Integer);
    procedure SetHideAddButton(const Value: Boolean);
    procedure SetOriginalControlRect(const Value: TRect);
    procedure SetSourceControl(const Value: IChromeTabDockControl);
    procedure SetDockControl(const Value: IChromeTabDockControl);
    procedure SetOriginalCursor(const Value: TCursor);
    procedure SetDragOverType(const Value: TDragOverType);
  public
    destructor Destroy; override;

    property DragTab: TChromeTab read GetDragTab write SetDragTab;
    property DragCursorOffset: TPoint read GetDragCursorOffset write SetDragCursorOffset;
    property DragFormOffset: TPoint read GetDragFormOffset write SetDragFormOffset;
    property DragPoint: TPoint read GetDragPoint write SetDragPoint;
    property HideAddButton: Boolean read GetHideAddButton write SetHideAddButton;
    property OriginalControlRect: TRect read GetOriginalControlRect write SetOriginalControlRect;
    property DropTabIndex: Integer read GetDropTabIndex write SetDropTabIndex;
    property DragForm: TForm read GetDragForm write SetDragForm;
    property SourceControl: IChromeTabDockControl read GetSourceControl write SetSourceControl;
    property DockControl: IChromeTabDockControl read GetDockControl write SetDockControl;
    property OriginalCursor: TCursor read GetOriginalCursor write SetOriginalCursor;
    property DragOverType: TDragOverType read GetDragOverType write SetDragOverType;
  end;

  TChromeTabs32Offsets = class(TChromeTabs32Persistent)
  private
    FVertical: Integer;
    FHorizontal: Integer;
  private
    procedure SetHorizontal(const Value: Integer);
    procedure SetVertical(const Value: Integer);
  public
    constructor Create(AOwner: TPersistent); override;
  published
    property Vertical: Integer read FVertical write SetVertical;
    property Horizontal: Integer read FHorizontal write SetHorizontal;
  end;

  TChromeTabs32ControlPosition = class(TChromeTabs32Persistent)
  private
    FOffsets: TChromeTabs32Offsets;
    FHeight: Integer;
    FWidth: Integer;
  private
    procedure SetHeight(const Value: Integer);
    procedure SetOffsets(const Value: TChromeTabs32Offsets);
    procedure SetWidth(const Value: Integer);
  public
    constructor Create(AOwner: TPersistent); override;
    destructor Destroy; override;
  published
    property Offsets: TChromeTabs32Offsets read FOffsets write SetOffsets;
    property Height: Integer read FHeight write SetHeight;
    property Width: Integer read FWidth write SetWidth;
  end;

  TChromeTabs32ControlPropertiesEx = class(TChromeTabs32ControlPosition)
  private
    FVisible: Boolean;
  private
    procedure SetVisible(const Value: Boolean);
  public
    constructor Create(AOwner: TPersistent); override;
  published
    property Visible: Boolean read FVisible write SetVisible;
  end;

  TChromeTabs32AddButtonProperties = class(TChromeTabs32ControlPosition)
  private
    FShowPlusSign: Boolean;
    FVisibility: TAddButtonVisibility;
    FHorizontalOffsetFloating: Integer;
  private
    procedure SetShowPlusSign(const Value: Boolean);
    procedure SetVisibility(const Value: TAddButtonVisibility);
    procedure SetHorizontalOffsetFloating(const Value: Integer);
  public
    constructor Create(AOwner: TPersistent); override;
    destructor Destroy; override;
  published
    property ShowPlusSign: Boolean read FShowPlusSign write SetShowPlusSign;
    property Visibility: TAddButtonVisibility read FVisibility write SetVisibility;
    property HorizontalOffsetFloating: Integer read FHorizontalOffsetFloating write SetHorizontalOffsetFloating;
  end;

  TChromeTabs32CloseButtonProperties = class(TChromeTabs32ControlPosition)
  private
    FAutoHide: Boolean;
    FVisibility: TCloseButtonVisiblity;
    FAutoHideWidth: Integer;
    FCrossRadialOffset: Integer;
  private
    procedure SetAutoHide(const Value: Boolean);
    procedure SetVisibility(const Value: TCloseButtonVisiblity);
    procedure SetAutoHideWidth(const Value: Integer);
    procedure SetCrossRadialOffset(const Value: Integer);
  public
    constructor Create(AOwner: TPersistent); override;
    destructor Destroy; override;
  published
    property AutoHide: Boolean read FAutoHide write SetAutoHide;
    property Visibility: TCloseButtonVisiblity read FVisibility write SetVisibility;
    property AutoHideWidth: Integer read FAutoHideWidth write SetAutoHideWidth;
    property CrossRadialOffset: Integer read FCrossRadialOffset write SetCrossRadialOffset;
  end;

  TChromeTabModifiedDisplayOptions = class(TChromeTabs32Persistent)
  private
    FStyle: TChromeTabModifiedStyle;
    FVerticalOffset: Integer;
    FHeight: Integer;
    FWidth: Integer;
    FAnimationPeriodMS: Integer;
    FAnimationUpdateMS: Integer;
    FEaseType: TChromeTabs32EaseType;

    procedure SetHeight(const Value: Integer);
    procedure SetStyle(const Value: TChromeTabModifiedStyle);
    procedure SetVerticalOffset(const Value: Integer);
    procedure SetWidth(const Value: Integer);
    procedure SetAnimationPeriodMS(const Value: Integer);
    procedure SetAnimationUpdateMS(const Value: Integer);
    procedure SetEaseType(const Value: TChromeTabs32EaseType);
  public
    constructor Create(AOwner: TPersistent); override;
  published
    property Style: TChromeTabModifiedStyle read FStyle write SetStyle;
    property VerticalOffset: Integer read FVerticalOffset write SetVerticalOffset;
    property Height: Integer read FHeight write SetHeight;
    property Width: Integer read FWidth write SetWidth;
    property AnimationPeriodMS: Integer read FAnimationPeriodMS write SetAnimationPeriodMS;
    property EaseType: TChromeTabs32EaseType read FEaseType write SetEaseType;
    property AnimationUpdateMS: Integer read FAnimationUpdateMS write SetAnimationUpdateMS;
  end;

  TChromeTabs32DragOptions = class(TChromeTabs32Persistent)
  private
    FDragType: TChromeTabDragType;
    FDragOutsideImageAlpha: Byte;
    FDragOutsideDistancePixels: Integer;
    FDragStartPixels: Integer;
    FDragControlImageResizeFactor: Real;
    FDragCursor: TCursor;
    FDragDisplay: TChromeTabDragDisplay;
    FDragFormBorderWidth: Integer;
    FDragFormBorderColor: Integer;
    FContrainDraggedTabWithinContainer: Boolean;

    procedure SetDragOutsideDistancePixels(const Value: Integer);
    procedure SetDragOutsideImageAlpha(const Value: Byte);
    procedure SetDragStartPixels(const Value: Integer);
    procedure SetDragControlImageResizeFactor(const Value: Real);
    procedure SetDragType(const Value: TChromeTabDragType);
    procedure SetDragCursor(const Value: TCursor);
    procedure SetDragDisplay(const Value: TChromeTabDragDisplay);
    procedure SetDragFormBorderColor(const Value: Integer);
    procedure SetDragFormBorderWidth(const Value: Integer);
    procedure SetContrainDraggedTabWithinContainer(const Value: Boolean);
  public
    constructor Create(AOwner: TPersistent); override;
  published
    property DragType: TChromeTabDragType read FDragType write SetDragType;
    property DragOutsideImageAlpha: Byte read FDragOutsideImageAlpha write SetDragOutsideImageAlpha;
    property DragOutsideDistancePixels: Integer read FDragOutsideDistancePixels write SetDragOutsideDistancePixels;
    property DragStartPixels: Integer read FDragStartPixels write SetDragStartPixels;
    property DragControlImageResizeFactor: Real read FDragControlImageResizeFactor write SetDragControlImageResizeFactor;
    property DragCursor: TCursor read FDragCursor write SetDragCursor;
    property DragDisplay: TChromeTabDragDisplay read FDragDisplay write SetDragDisplay;
    property DragFormBorderWidth: Integer read FDragFormBorderWidth write SetDragFormBorderWidth;
    property DragFormBorderColor: Integer read FDragFormBorderColor write SetDragFormBorderColor;
    property ContrainDraggedTabWithinContainer: Boolean read FContrainDraggedTabWithinContainer write SetContrainDraggedTabWithinContainer;
  end;

  TChromeTabs32MovementAnimationTypes = class(TChromeTabs32Persistent)
  private
    FUseDefaultEaseType: Boolean;
    FUseDefaultAnimationTime: Boolean;
    FEaseType: TChromeTabs32EaseType;
    FAnimationTimeMS: Integer;

    procedure SetAnimationTimeMS(const Value: Integer);
    procedure SetEaseType(const Value: TChromeTabs32EaseType);
    procedure SetUseDefaultAnimationTime(const Value: Boolean);
    procedure SetUseDefaultEaseType(const Value: Boolean);
  published
    constructor Create(AOwner: TPersistent); override;

    property UseDefaultEaseType: Boolean read FUseDefaultEaseType write SetUseDefaultEaseType;
    property UseDefaultAnimationTime: Boolean read FUseDefaultAnimationTime write SetUseDefaultAnimationTime;
    property EaseType: TChromeTabs32EaseType read FEaseType write SetEaseType;
    property AnimationTimeMS: Integer read FAnimationTimeMS write SetAnimationTimeMS;
  end;

  TChromeTabs32MovementAnimations = class(TChromeTabs32Persistent)
  private
    FTabAdd: TChromeTabs32MovementAnimationTypes;
    FTabDelete: TChromeTabs32MovementAnimationTypes;
    FTabMove: TChromeTabs32MovementAnimationTypes;

    procedure SetTabAdd(const Value: TChromeTabs32MovementAnimationTypes);
    procedure SetTabDelete(const Value: TChromeTabs32MovementAnimationTypes);
    procedure SetTabMove(const Value: TChromeTabs32MovementAnimationTypes);
  public
    constructor Create(AOwner: TPersistent); override;
    destructor Destroy; override;
  published
    property TabAdd: TChromeTabs32MovementAnimationTypes read FTabAdd write SetTabAdd;
    property TabDelete: TChromeTabs32MovementAnimationTypes read FTabDelete write SetTabDelete;
    property TabMove: TChromeTabs32MovementAnimationTypes read FTabMove write SetTabMove;
  end;

  TChromeTabs32AnimationOptions = class(TChromeTabs32Persistent)
  private
    FMovementEasing: TChromeTabs32MovementAnimations;
    FDefaultMovementAnimationTimeMS: Cardinal;
    FDefaultStyleAnimationTimeMS: Cardinal;
    FAnimationTimerInterval: Integer;
    FMinimumTabAnimationWidth: Integer;
    FDefaultMovementEaseType: TChromeTabs32EaseType;
    FDefaultStyleEaseType: TChromeTabs32EaseType;
  private
    procedure SetMovementAnimationTimeMS(const Value: Cardinal);
    procedure SetStyleAnimationTimeMS(const Value: Cardinal);
    procedure SetAnimationTimerInterval(const Value: Integer);
    procedure SetMinimumTabAnimationWidth(const Value: Integer);
    procedure SetMovementEaseType(const Value: TChromeTabs32EaseType);
    procedure SetStyleEaseType(const Value: TChromeTabs32EaseType);
    procedure SetMovementEasing(const Value: TChromeTabs32MovementAnimations);
  public
    constructor Create(AOwner: TPersistent); override;
    destructor Destroy; override;

    function GetMovementAnimationEaseType(AnimationTypes: TChromeTabs32MovementAnimationTypes): TChromeTabs32EaseType;
    function GetMovementAnimationTime(AnimationTypes: TChromeTabs32MovementAnimationTypes): Cardinal;
  published
    property DefaultMovementAnimationTimeMS: Cardinal read FDefaultMovementAnimationTimeMS write SetMovementAnimationTimeMS;
    property DefaultStyleAnimationTimeMS: Cardinal read FDefaultStyleAnimationTimeMS write SetStyleAnimationTimeMS;
    property AnimationTimerInterval: Integer read FAnimationTimerInterval write SetAnimationTimerInterval;
    property MinimumTabAnimationWidth: Integer read FMinimumTabAnimationWidth write SetMinimumTabAnimationWidth;
    property DefaultMovementEaseType: TChromeTabs32EaseType read FDefaultMovementEaseType write SetMovementEaseType;
    property DefaultStyleEaseType: TChromeTabs32EaseType read FDefaultStyleEaseType write SetStyleEaseType;
    property MovementAnimations: TChromeTabs32MovementAnimations read FMovementEasing write SetMovementEasing;
  end;

  TChromeTabs32BehaviourOptions = class(TChromeTabs32Persistent)
  private
    FBackgroundDblClickMaximiseRestoreForm: Boolean;
    FBackgroundDragMovesForm: Boolean;
    FIgnoreDoubleClicksWhileAnimatingMovement: Boolean;
    FTabSmartDeleteResizing: Boolean;
    FTabSmartDeleteResizeCancelDelay: Integer;
    FUseBuiltInPopupMenu: Boolean;
    FTabRightClickSelect: Boolean;
    FActivateNewTab: Boolean;
    FDebugMode: Boolean;
  private
    procedure SetTabRightClickSelect(const Value: Boolean);
    procedure SetTabSmartDeleteResizeCancelDelay(const Value: Integer);
    procedure SetTabSmartDeleteResizing(const Value: Boolean);
    procedure SetBackgroundDblClickMaximiseRestoreForm(const Value: Boolean);
    procedure SetUseBuiltInPopupMenu(const Value: Boolean);
    procedure SetActivateNewTab(const Value: Boolean);
    procedure SetDebugMode(const Value: Boolean);
    procedure SetBackgroundDragMovesForm(const Value: Boolean);
    procedure SetIgnoreDoubleClicksWhileAnimatingMovement(const Value: Boolean);
  public
    constructor Create(AOwner: TPersistent); override;
  published
    property BackgroundDblClickMaximiseRestoreForm: Boolean read FBackgroundDblClickMaximiseRestoreForm write SetBackgroundDblClickMaximiseRestoreForm;
    property BackgroundDragMovesForm: Boolean read FBackgroundDragMovesForm write SetBackgroundDragMovesForm;
    property TabSmartDeleteResizing: Boolean read FTabSmartDeleteResizing write SetTabSmartDeleteResizing;
    property TabSmartDeleteResizeCancelDelay: Integer read FTabSmartDeleteResizeCancelDelay write SetTabSmartDeleteResizeCancelDelay;
    property UseBuiltInPopupMenu: Boolean read FUseBuiltInPopupMenu write SetUseBuiltInPopupMenu;
    property TabRightClickSelect: Boolean read FTabRightClickSelect write SetTabRightClickSelect;
    property ActivateNewTab: Boolean read FActivateNewTab write SetActivateNewTab;
    property DebugMode: Boolean read FDebugMode write SetDebugMode;
    property IgnoreDoubleClicksWhileAnimatingMovement: Boolean read FIgnoreDoubleClicksWhileAnimatingMovement write SetIgnoreDoubleClicksWhileAnimatingMovement;
  end;

  TChromeTabs32Options = class(TChromeTabs32Persistent)
  private
    FSeeThroughTabs: Boolean;
    FTabOverlap: Integer;
    FOffsetLeft: Integer;
    FOffsetTop: Integer;
    FOffsetRight: Integer;
    FOffsetBottom: Integer;
    FMinWidth: Integer;
    FMaxWidth: Integer;
    FTabWidthFromContent: Boolean;
    FPinnedWidth: Integer;
    FImageOffsetLeft: Integer;
    FTextTrimType: TTextTrimType;
    FOrientation: TTabOrientation;
    FContentOffsetLeft: Integer;
    FContentOffsetRight: Integer;
    FBaseLineTabRegionOnly: Boolean;
    FWordWrap: Boolean;
    FTextHorizontalAlignment: TAlignment;
    FTextAlignmentVertical: TVerticalAlignment;
    FShowImages: Boolean;
    FShowPinnedTabText: Boolean;
  private
    procedure SetSeeThroughTabs(const Value: Boolean);
    procedure SetOverlap(const Value: Integer);
    procedure SetContentOffsetLeft(const Value: Integer);
    procedure SetOffsetLeft(const Value: Integer);
    procedure SetOffsetTop(const Value: Integer);
    procedure SetMaxWidth(const Value: Integer);
    procedure SetMinWidth(const Value: Integer);
    procedure SetPinnedWidth(const Value: Integer);
    procedure SetImageOffsetLeft(const Value: Integer);
    procedure SetTextTrimType(const Value: TTextTrimType);
    procedure SetOrientation(const Value: TTabOrientation);
    procedure SetOffsetBottom(const Value: Integer);
    procedure SetContentOffsetRight(const Value: Integer);
    procedure SetOffsetRight(const Value: Integer);
    procedure SetBaseLineTabRegionOnly(const Value: Boolean);
    procedure SetWordWrap(const Value: Boolean);
    procedure SetTextAlignmentHorizontal(const Value: TAlignment);
    procedure SetTextAlignmentVertical(const Value: TVerticalAlignment);
    procedure SetShowImages(const Value: Boolean);
    procedure SetTabWidthFromContent(const Value: Boolean);
    procedure SetShowPinnedTabText(const Value: Boolean);
  public
    constructor Create(AOwner: TPersistent); override;
  published
    property SeeThroughTabs: Boolean read FSeeThroughTabs write SetSeeThroughTabs;
    property TabOverlap: Integer read FTabOverlap write SetOverlap;
    property ContentOffsetLeft: Integer read FContentOffsetLeft write SetContentOffsetLeft;
    property ContentOffsetRight: Integer read FContentOffsetRight write SetContentOffsetRight;
    property OffsetLeft: Integer read FOffsetLeft write SetOffsetLeft;
    property OffsetTop: Integer read FOffsetTop write SetOffsetTop;
    property OffsetRight: Integer read FOffsetRight write SetOffsetRight;
    property OffsetBottom: Integer read FOffsetBottom write SetOffsetBottom;
    property MinWidth: Integer read FMinWidth write SetMinWidth;
    property MaxWidth: Integer read FMaxWidth write SetMaxWidth;
    property TabWidthFromContent: Boolean read FTabWidthFromContent write SetTabWidthFromContent;
    property PinnedWidth: Integer read FPinnedWidth write SetPinnedWidth;
    property ImageOffsetLeft: Integer read FImageOffsetLeft write SetImageOffsetLeft;
    property TextTrimType: TTextTrimType read FTextTrimType write SetTextTrimType;
    property Orientation: TTabOrientation read FOrientation write SetOrientation;
    property BaseLineTabRegionOnly: Boolean read FBaseLineTabRegionOnly write SetBaseLineTabRegionOnly;
    property WordWrap: Boolean read FWordWrap write SetWordWrap;
    property TextAlignmentHorizontal: TAlignment read FTextHorizontalAlignment write SetTextAlignmentHorizontal;
    property TextAlignmentVertical: TVerticalAlignment read FTextAlignmentVertical write SetTextAlignmentVertical;
    property ShowImages: Boolean read FShowImages write SetShowImages;
    property ShowPinnedTabText: Boolean read FShowPinnedTabText write SetShowPinnedTabText;
  end;

  TChromeTabs32ScrollOptions = class(TChromeTabs32Persistent)
  private
    FEnabled: Boolean;
    FScrollButtons: TChromeTabs32crollButtons;
    FScrollStep: Integer;
    FScrollRepeatDelay: Integer;
    FAutoHideButtons: Boolean;
    FDragScroll: Boolean;
    FDragScrollOffset: Integer;
    FMouseWheelScroll: Boolean;
  private
    procedure SetEnabled(const Value: Boolean);
    procedure SetScrollButtons(const Value: TChromeTabs32crollButtons);
    procedure SetScrollStep(const Value: Integer);
    procedure SetScrollRepeatDelay(const Value: Integer);
    procedure SetAutoHideButtons(const Value: Boolean);
    procedure SetDragScroll(const Value: Boolean);
    procedure SetDragScrollOffset(const Value: Integer);
    procedure SetMouseWheelScroll(const Value: Boolean);
  public
    constructor Create(AOwner: TPersistent); override;
    destructor Destroy; override;
  published
    property Enabled: Boolean read FEnabled write SetEnabled;
    property ScrollButtons: TChromeTabs32crollButtons read FScrollButtons write SetScrollButtons;
    property ScrollStep: Integer read FScrollStep write SetScrollStep;
    property ScrollRepeatDelay: Integer read FScrollRepeatDelay write SetScrollRepeatDelay;
    property AutoHideButtons: Boolean read FAutoHideButtons write SetAutoHideButtons;
    property DragScroll: Boolean read FDragScroll write SetDragScroll;
    property DragScrollOffset: Integer read FDragScrollOffset write SetDragScrollOffset;
    property MouseWheelScroll: Boolean read FMouseWheelScroll write SetMouseWheelScroll;
  end;

  TChromeTabs32ContainerOptions = class(TChromeTabs32Persistent)
  private
    FPaddingLeft: Integer;
    FPaddingRight: Integer;
    FTransparentBackground: Boolean;
    FOverlayButtons: Boolean;

    procedure SetOverlayButtons(const Value: Boolean);
    procedure SetTransparentBackground(const Value: Boolean);
    procedure SetPaddingLeft(const Value: Integer);
    procedure SetPaddingRight(const Value: Integer);
  published
    property TransparentBackground: Boolean read FTransparentBackground write SetTransparentBackground;
    property OverlayButtons: Boolean read FOverlayButtons write SetOverlayButtons;
    property PaddingLeft: Integer read FPaddingLeft write SetPaddingLeft;
    property PaddingRight: Integer read FPaddingRight write SetPaddingRight;
  end;

  TChromeTabs32SpinnerOptions = class(TChromeTabs32Persistent)
  private
    FReverseDirection: Boolean;
    FRenderedAnimationStep: Integer;
    FPosition: TChromeTabs32ControlPosition;
    FSweepAngle: Word;

    procedure SetRenderedAnimationStep(const Value: Integer);
    procedure SetReverseDirection(const Value: Boolean);
    procedure SetSweepAngle(const Value: Word);
    procedure SetPosition(const Value: TChromeTabs32ControlPosition);
  public
    constructor Create(AOwner: TPersistent); override;
    destructor Destroy; override;
  published
    property ReverseDirection: Boolean read FReverseDirection write SetReverseDirection;
    property RenderedAnimationStep: Integer read FRenderedAnimationStep write SetRenderedAnimationStep;
    property Position: TChromeTabs32ControlPosition read FPosition write SetPosition;
    property SweepAngle: Word read FSweepAngle write SetSweepAngle;
  end;

  TChromeTabs32SpinnersOptions = class(TChromeTabs32Persistent)
  private
    FUpload: TChromeTabs32SpinnerOptions;
    FDownload: TChromeTabs32SpinnerOptions;
    FAnimationUpdateMS: Cardinal;
    FHideImagesWhenSpinnerVisible: Boolean;

    procedure SetDownload(const Value: TChromeTabs32SpinnerOptions);
    procedure SetUpload(const Value: TChromeTabs32SpinnerOptions);
    procedure SetAnimationUpdateMS(const Value: Cardinal);
    procedure SetHideImagesWhenSpinnerVisible(const Value: Boolean);
  published
    constructor Create(AOwner: TPersistent); override;
    destructor Destroy; override;

    property Upload: TChromeTabs32SpinnerOptions read FUpload write SetUpload;
    property Download: TChromeTabs32SpinnerOptions read FDownload write SetDownload;
    property AnimationUpdateMS: Cardinal read FAnimationUpdateMS write SetAnimationUpdateMS;
    property HideImagesWhenSpinnerVisible: Boolean read FHideImagesWhenSpinnerVisible write SetHideImagesWhenSpinnerVisible;
  end;

  TChromeTabs32DisplayOptions = class(TChromeTabs32Persistent)
  private
    FCloseButton: TChromeTabs32CloseButtonProperties;
    FAddButton: TChromeTabs32AddButtonProperties;
    FScrollButtonLeft: TChromeTabs32ControlPosition;
    FScrollButtonRight: TChromeTabs32ControlPosition;
    FTabModifiedGlow: TChromeTabModifiedDisplayOptions;
    FTabs: TChromeTabs32Options;
    FTabContainer: TChromeTabs32ContainerOptions;
    FTabMouseGlow: TChromeTabs32ControlPropertiesEx;
    FTabSpinners: TChromeTabs32SpinnersOptions;
  private
    procedure SetCloseButton(const Value: TChromeTabs32CloseButtonProperties);
    procedure SetAddButton(const Value: TChromeTabs32AddButtonProperties);
    procedure SetScrollButtonLeft(const Value: TChromeTabs32ControlPosition);
    procedure SetScrollButtonRight(const Value: TChromeTabs32ControlPosition);
    procedure SetTabModifiedGlow(const Value: TChromeTabModifiedDisplayOptions);
    procedure SetTabs(const Value: TChromeTabs32Options);
    procedure SetTabContainer(const Value: TChromeTabs32ContainerOptions);
    procedure SetTabMouseGlow(const Value: TChromeTabs32ControlPropertiesEx);
    procedure SetTabSpinners(const Value: TChromeTabs32SpinnersOptions);
  public
    constructor Create(AOwner: TPersistent); override;
    destructor Destroy; override;
  published
    property CloseButton: TChromeTabs32CloseButtonProperties read FCloseButton write SetCloseButton;
    property AddButton: TChromeTabs32AddButtonProperties read FAddButton write SetAddButton;
    property ScrollButtonLeft: TChromeTabs32ControlPosition read FScrollButtonLeft write SetScrollButtonLeft;
    property ScrollButtonRight: TChromeTabs32ControlPosition read FScrollButtonRight write SetScrollButtonRight;
    property TabModifiedGlow: TChromeTabModifiedDisplayOptions read FTabModifiedGlow write SetTabModifiedGlow;
    property Tabs: TChromeTabs32Options read FTabs write SetTabs;
    property TabContainer: TChromeTabs32ContainerOptions read FTabContainer write SetTabContainer;
    property TabMouseGlow: TChromeTabs32ControlPropertiesEx read FTabMouseGlow write SetTabMouseGlow;
    property TabSpinners: TChromeTabs32SpinnersOptions read FTabSpinners write SetTabSpinners;
  end;

  TOptions = class(TChromeTabs32Persistent)
  private
    FDisplay: TChromeTabs32DisplayOptions;
    FDragDrop: TChromeTabs32DragOptions;
    FAnimation: TChromeTabs32AnimationOptions;
    FBehaviour: TChromeTabs32BehaviourOptions;
    FScrolling: TChromeTabs32ScrollOptions;
  private
    function GetDisplay: TChromeTabs32DisplayOptions;
    procedure SetDisplay(const Value: TChromeTabs32DisplayOptions);
    function GetDragDrop: TChromeTabs32DragOptions;
    procedure SetDragDrop(const Value: TChromeTabs32DragOptions);
    procedure SetAnimation(const Value: TChromeTabs32AnimationOptions);
    function GetAnimation: TChromeTabs32AnimationOptions;
    function GetBehaviour: TChromeTabs32BehaviourOptions;
    procedure SetBehaviour(const Value: TChromeTabs32BehaviourOptions);
    procedure SetScrolling(const Value: TChromeTabs32ScrollOptions);
  public
    constructor Create(AOwner: TPersistent); override;
    destructor Destroy; override;
  published
    property Display: TChromeTabs32DisplayOptions read GetDisplay write SetDisplay;
    property DragDrop: TChromeTabs32DragOptions read GetDragDrop write SetDragDrop;
    property Animation: TChromeTabs32AnimationOptions read GetAnimation write SetAnimation;
    property Behaviour: TChromeTabs32BehaviourOptions read GetBehaviour write SetBehaviour;
    property Scrolling: TChromeTabs32ScrollOptions read FScrolling write SetScrolling;
  end;

  IChromeTabs32 = interface
    ['{7392951B-B33C-4ECD-8255-9A746F5E0901}']
    function GetLastPinnedIndex: Integer;
    function GetActiveTab: TChromeTab;
    function GetPreviousTabPolygons(Index: Integer): IChromeTabPolygons;

    procedure DoOnBeforeDrawItem(TargetCanvas: TCanvas32; ItemRect: TRect; ItemType: TChromeTabItemType; TabIndex: Integer; var Handled: Boolean);
    procedure DoOnAfterDrawItem(const TargetCanvas: TCanvas32; ItemRect: TRect; ItemType: TChromeTabItemType; TabIndex: Integer);
    procedure DoOnGetControlPolygons(ChromeTabs32Control: TObject; ItemRect: TRect; ItemType: TChromeTabItemType; Orientation: TTabOrientation; var Polygons: IChromeTabPolygons);
    procedure DoOnDebugLog(const Text: String; Args: Array of const);
    procedure DoOnActiveTabChanging(AOldTab, ANewTab: TChromeTab; var Allow: Boolean);
    procedure DoOnChange(ATab: TChromeTab; TabChangeType: TTabChangeType);
    function ScrollRect(ALeft, ATop, ARight, ABottom: Integer): TRect; overload;
    function ScrollRect(ARect: TRect): TRect; overload;
    function BidiRect(ARect: TRect): TRect;
    function GetBiDiMode: TBiDiMode;
    procedure Invalidate;
    function GetComponentState: TComponentState;
    function IsDragging: Boolean;

    function GetLookAndFeel: TChromeTabs32LookAndFeel;
    function GetOptions: TOptions;

    function GetImages: TCustomImageList;
    function GetImagesOverlay: TCustomImageList;
    function GetImagesSpinnerDownload: TCustomImageList;
    function GetImagesSpinnerUpload: TCustomImageList;
  end;

  TTabsLookAndFeel = class(TComponent)
  private
    FLookAndFeel: TPersistent;
  published
    property LookAndFeel: TPersistent read FLookAndFeel write FLookAndFeel;
  end;

  TTabsOptions = class(TComponent)
  private
    FOptions: TPersistent;
  published
    property Options: TPersistent read FOptions write FOptions;
  end;

implementation

uses
  GR32_VectorUtils;

{ TChromeTab }

constructor TChromeTab.Create(Collection: TCollection);
begin
  FCollection := Collection;
  FImageIndex := -1;
  FImageIndexOverlay := -1;
  FVisible := True;

  // Inherited needs to be here so the property values are
  // set before it is called
  inherited;
end;

destructor TChromeTab.Destroy;
begin
  inherited;

  if FTabControl <> nil then
    FTabControl.Free;
end;

procedure TChromeTab.SetPinned(const Value: Boolean);
var
  LastPinned: Integer;
begin
  if FPinned <> Value then
  begin
    LastPinned := GetChromeTabInterface.GetLastPinnedIndex;

    if Value then
      Index := LastPinned + 1
    else
      Index := LastPinned;

    FPinned := Value;

    DoChanged(tcPinned);

    Active := True;
  end;
end;

procedure TChromeTab.SetSpinnerState(const Value: TChromeTabs32SpinnerState);
begin
  if Value <> FSpinnerState then
  begin
    FSpinnerState := Value;

    DoChanged;
  end;
end;

procedure TChromeTab.SetActive(Value: boolean);
var
  i: integer;
  Allow: Boolean;
begin
  if FActive <> Value then
  begin
    Allow := True;

    if Value then
    begin
      GetChromeTabInterface.DoOnActiveTabChanging(GetChromeTabInterface.GetActiveTab, Self, Allow);

      if Allow then
        FModified := False;
    end;

    if Allow then
    begin
      FActive := Value;

      if FActive then
      begin
        with (GetOwner as TChromeTabs32List) do
        begin
          for i := 0 to Count - 1 do
          begin
            // Only one can be selected
            if (Items[i] <> Self) and
               (Items[i].Active) then
            begin
              Items[i].Active := False;
            end;
          end;
        end;

        GetChromeTabInterface.DoOnChange(Self, tcActivated);
      end
      else
      begin
        GetChromeTabInterface.DoOnChange(Self, tcDeactivated);
      end;

      DoChanged;
    end;
  end;
end;

procedure TChromeTab.SetTabControl(const Value: TObject);
begin
  FTabControl := Value;
end;

procedure TChromeTab.SetTag(const Value: integer);
begin
  FTag := Value;
end;

procedure TChromeTab.SetVisible(const Value: Boolean);
begin
  FVisible := Value;

  if (not Value) and (Active) then
    Active := False;

  DoChanged(tcVisibility);
end;

function TChromeTab._AddRef: Integer;
begin
  // Do nothing
  Result := 0;
end;

function TChromeTab._Release: Integer;
begin
  // Do nothing
  Result := 0;
end;

function TChromeTab.GetCaption: TCaption;
begin
  Result := FCaption;
end;

function TChromeTab.GetData: Pointer;
begin
  Result := FData;
end;

function TChromeTab.GetDisplayCaption: String;
begin
  if FPinned then
    Result := ''
  else
    Result := FCaption;
end;

function TChromeTab.GetDisplayName: string;
begin
  if FCaption <> '' then
    Result := FCaption
  else
    Result := inherited GetDisplayName;
end;

function TChromeTab.GetHideCloseButton: Boolean;
begin
  Result := FHideCloseButton;
end;

function TChromeTab.GetImageIndex: {$IF CompilerVersion >= 23.0}System.UITypes.{$IFEND}TImageIndex;
begin
  Result := FImageIndex;
end;

function TChromeTab.GetImageIndexOverlay: {$IF CompilerVersion >= 23.0}System.UITypes.{$IFEND}TImageIndex;
begin
  Result := FImageIndexOverlay;
end;

function TChromeTab.GetIndex: Integer;
begin
  Result := Index;
end;

function TChromeTab.GetMarkedForDeletion: Boolean;
begin
  Result := FMarkedForDeletion;
end;

function TChromeTab.GetModified: Boolean;
begin
  Result := FModified;
end;

function TChromeTab.GetPinned: Boolean;
begin
  Result := FPinned;
end;

function TChromeTab.GetSpinnerState: TChromeTabs32SpinnerState;
begin
  Result := FSpinnerState;
end;

function TChromeTab.GetTab: TChromeTab;
begin
  Result := Self;
end;

function TChromeTab.GetTag: integer;
begin
  Result := FTag;
end;

function TChromeTab.GetVisible: Boolean;
begin
  Result := FVisible;
end;

function TChromeTab.GetActive: boolean;
begin
  Result := FActive;
end;

function TChromeTab.GetChromeTabInterface: IChromeTabs32;
begin
  if FCollection <> nil then
    Supports(FCollection.Owner, IChromeTabs32, Result)
  else
    Result := nil;
end;

procedure TChromeTab.SetCollection(Value: TCollection);
var
  OldCollection: TOwnedCollection;
begin
  if (GetChromeTabInterface <> nil) and
     (csDesigning in GetChromeTabInterface.GetComponentState) then
  begin
    OldCollection := Collection as TOwnedCollection;

    inherited;

    if (OldCollection <> Value) and
       (Assigned(OldCollection)) then
      DoChanged(tcPropertyUpdated);
  end
  else
    inherited;
end;

procedure TChromeTab.SetData(const Value: Pointer);
begin
  FData := Value;
end;

procedure TChromeTab.SetHideCloseButton(const Value: Boolean);
begin
  if FHideCloseButton <> Value then
  begin
    FHideCloseButton := Value;

    DoChanged;
  end;
end;

function TChromeTab.ImageIsVisible: Boolean;
begin
  Result := (FImageIndex <> -1) or (FImageIndexOverlay <> -1);
end;

function TChromeTab.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  // Do nothing
  Result := 0;
end;

procedure TChromeTab.DoChanged(ChangeType: TTabChangeType);
begin
  GetChromeTabInterface.DoOnChange(Self, ChangeType);
end;

procedure TChromeTab.SetCaption(Value: TCaption);
begin
  if FCaption <> Value then
  begin
    FCaption := Value;

    DoChanged;
  end;
end;

procedure TChromeTab.SetImageIndex(Value: {$IF CompilerVersion >= 23.0}System.UITypes.{$IFEND}TImageIndex);
begin
  if FImageIndex <> Value then
  begin
    FImageIndex := Value;

    DoChanged;
  end;
end;

procedure TChromeTab.SetImageIndexOverlay(const Value: {$IF CompilerVersion >= 23.0}System.UITypes.{$IFEND}TImageIndex);
begin
  if FImageIndexOverlay <> Value then
  begin
    FImageIndexOverlay := Value;

    DoChanged;
  end;
end;

procedure TChromeTab.SetModified(const Value: Boolean);
begin
  if FModified <> Value then
  begin
    FModified := Value;

    DoChanged;
  end;
end;


{ TChromeTabs32List }

function TChromeTabs32List.Add: TChromeTab;
begin
  Result := TChromeTab(inherited Add);
end;

procedure TChromeTabs32List.Assign(Source: TPersistent);
begin
  inherited;

  GetChromeTabInterface.DoOnChange(nil, tcPropertyUpdated);
end;

constructor TChromeTabs32List.Create(AOwner: TComponent);
var
  ChromeTabClass: TChromeTabClass;
begin
  ChromeTabClass := TChromeTab;

  inherited Create(AOwner, ChromeTabClass);
end;

procedure TChromeTabs32List.DeleteTab(Index: Integer; DeleteNow: Boolean);
var
  NewIdx: Integer;
begin
  // Has this tab already been marked for deletion? If so, remove it now
  if Items[Index].FMarkedForDeletion then
  begin
    inherited Delete(Index);
  end
  else
  begin
    if not Items[Index].Active then
      NewIdx := -1 else

    if Index < pred(Count) then
    begin
      NewIdx := Index;

      if (GetChromeTabInterface.GetOptions.Animation.GetMovementAnimationEaseType(GetChromeTabInterface.GetOptions.Animation.MovementAnimations.TabDelete) <> ttNone) and
         (not DeleteNow) then
      begin
        if NewIdx < pred(Count) then
          Inc(NewIdx)
        else
          Dec(NewIdx);
      end;
    end else
    if Index > 0 then
      NewIdx := Index - 1
    else
      NewIdx := -1;

    GetChromeTabInterface.DoOnChange(Items[Index], tcDeleting);

    if (not DeleteNow) and
       (GetChromeTabInterface.GetOptions.Animation.GetMovementAnimationEaseType(GetChromeTabInterface.GetOptions.Animation.MovementAnimations.TabDelete) <> ttNone) then
    begin
      Items[Index].FMarkedForDeletion := True;

      GetChromeTabInterface.DoOnChange(Items[Index], tcDeleted);
    end
    else
    begin
      inherited Delete(Index);

      GetChromeTabInterface.DoOnChange(nil, tcDeleted);
    end;

    if NewIdx > Count - 1 then
      NewIdx := Count - 1;

    while ((NewIdx <> -1)) and (not(Items[NewIdx].Visible)) do
      Dec(NewIdx);

    if NewIdx <> -1 then
      Items[NewIdx].Active := True;
  end;
end;

procedure TChromeTabs32List.SetActiveTab(const Value: TChromeTab);
var
  i: Integer;
begin
  for i := 0 to pred(Count) do
    if Items[i] = Value then
    begin
      Items[i].Active := True;

      Break;
    end;
end;

procedure TChromeTabs32List.SetItem(Index: Integer; Value: TChromeTab);
begin
  inherited SetItem(Index, Value);

  GetChromeTabInterface.DoOnChange(Value, tcAdded);
end;

function TChromeTabs32List.GetActiveTab: TChromeTab;
var
  i: Integer;
begin
  Result := nil;

  for i := 0 to pred(Count) do
    if Items[i].Active then
    begin
     Result := Items[i];

      Break;
    end;
end;

function TChromeTabs32List.GetItem(Index: Integer): TChromeTab;
begin
  Result := inherited GetItem(Index) as TChromeTab;
end;

function TChromeTabs32List.GetChromeTabInterface: IChromeTabs32;
begin
  Supports(Owner, IChromeTabs32, Result);

  Assert(Result <> nil, 'Collection owner must support IChromeTabInterface');
end;

function TChromeTabs32List.IndexOf(ATab: TChromeTab): integer;
var
  i, c: integer;
begin
  c := Count;
  for i := 0 to c - 1 do
    if Items[i] = ATab then begin
      Result := i;
      Exit;
    end;
  Result := -1;
end;

procedure TChromeTabs32List.Move(OldIndex, NewIndex: Integer);
begin
  Items[OldIndex].Index := NewIndex;

  GetChromeTabInterface.DoOnChange(Items[NewIndex], tcMoved);
end;

procedure TChromeTabs32List.Notify(Item: TCollectionItem;
  Action: TCollectionNotification);
begin
  inherited;

  if GetChromeTabInterface <> nil then
    case Action of
      //cnDeleting: GetChromeTabInterface.Invalidate;
      cnAdded: GetChromeTabInterface.DoOnChange(TChromeTab(Item), tcAdded);
    end;
end;


{ TChromeTabs32Options }

constructor TChromeTabs32Options.Create(AOwner: TPersistent);
begin
  inherited;

  FSeeThroughTabs := False;
  FTabOverlap := 15;
  FContentOffsetLeft := 18;
  FContentOffsetRight := 16;
  FOffsetLeft := 0;
  FOffsetTop := 0;
  FMinWidth := 20;
  FMaxWidth := 200;
  FPinnedWidth := 39;
  FImageOffsetLeft := 13;
  FTextHorizontalAlignment := taLeftJustify;
  FTextAlignmentVertical := taVerticalCenter;
  FShowImages := True;
  FShowPinnedTabText := False;

  FTextTrimType := tttFade;

  FOffsetRight := 0;
end;

procedure TChromeTabs32Options.SetOffsetRight(const Value: Integer);
begin
  FOffsetRight := Value;

  DoChanged;
end;

procedure TChromeTabs32Options.SetSeeThroughTabs(const Value: Boolean);
begin
  FSeeThroughTabs := Value;

  DoChanged;
end;

procedure TChromeTabs32Options.SetShowImages(const Value: Boolean);
begin
  FShowImages := Value;

  DoChanged;
end;

procedure TChromeTabs32Options.SetShowPinnedTabText(const Value: Boolean);
begin
  FShowPinnedTabText := Value;

  DoChanged;
end;

procedure TChromeTabs32Options.SetBaseLineTabRegionOnly(const Value: Boolean);
begin
  FBaseLineTabRegionOnly := Value;

  DoChanged;
end;

procedure TChromeTabs32Options.SetContentOffsetLeft(const Value: Integer);
begin
  FContentOffsetLeft := Value;

  DoChanged;
end;

procedure TChromeTabs32Options.SetContentOffsetRight(const Value: Integer);
begin
  FContentOffsetRight := Value;

  DoChanged;
end;

procedure TChromeTabs32Options.SetImageOffsetLeft(const Value: Integer);
begin
  FImageOffsetLeft := Value;

  DoChanged;
end;

procedure TChromeTabs32Options.SetMaxWidth(const Value: Integer);
begin
  if Value < FMinWidth then
    FMaxWidth := FMinWidth
  else
    FMaxWidth := Value;

  DoChanged;
end;

procedure TChromeTabs32Options.SetMinWidth(const Value: Integer);
begin
  FMinWidth := Value;

  DoChanged;
end;

procedure TChromeTabs32Options.SetOffsetBottom(const Value: Integer);
begin
  FOffsetBottom := Value;

  DoChanged;
end;

procedure TChromeTabs32Options.SetOffsetLeft(const Value: Integer);
begin
  FOffsetLeft := Value;

  DoChanged;
end;

procedure TChromeTabs32Options.SetOffsetTop(const Value: Integer);
begin
  FOffsetTop := Value;

  DoChanged;
end;

procedure TChromeTabs32Options.SetOrientation(const Value: TTabOrientation);
begin
  FOrientation := Value;

  DoChanged;
end;

procedure TChromeTabs32Options.SetOverlap(const Value: Integer);
begin
  FTabOverlap := Value;

  DoChanged;
end;

procedure TChromeTabs32Options.SetPinnedWidth(const Value: Integer);
begin
  FPinnedWidth := Value;

  DoChanged;
end;

procedure TChromeTabs32Options.SetTabWidthFromContent(const Value: Boolean);
begin
  FTabWidthFromContent := Value;

  DoChanged;
end;

procedure TChromeTabs32Options.SetTextAlignmentHorizontal(const Value: TAlignment);
begin
  FTextHorizontalAlignment := Value;

  DoChanged;
end;

procedure TChromeTabs32Options.SetTextTrimType(const Value: TTextTrimType);
begin
  FTextTrimType := Value;

  DoChanged;
end;


procedure TChromeTabs32Options.SetTextAlignmentVertical(
  const Value: TVerticalAlignment);
begin
  FTextAlignmentVertical := Value;

  DoChanged;
end;

procedure TChromeTabs32Options.SetWordWrap(const Value: Boolean);
begin
  FWordWrap := Value;

  DoChanged;
end;

{ TChromeTabs32Persistent }

constructor TChromeTabs32Persistent.Create(AOwner: TPersistent);
begin
  inherited Create;

  FOwner := AOwner;
end;

procedure TChromeTabs32Persistent.DoChanged;
var
  ChromeTabInterface: IChromeTabs32;
  Owner: TPersistent;
begin
  Owner := FOwner;

  while Owner <> nil do
  begin
    if Supports(Owner, IChromeTabs32, ChromeTabInterface) then
    begin
      ChromeTabInterface.DoOnChange(nil, tcPropertyUpdated);

      Break;
    end
    else
    if Owner is TChromeTabs32Persistent then
      Owner := TChromeTabs32Persistent(Owner).Owner else
    if Owner is TComponent then
      Owner := TChromeTabs32Persistent(Owner).Owner
    else
      Owner := nil;
  end;
end;

function TChromeTabs32Persistent.GetOwner: TPersistent;
begin
  if FOwner is TPersistent then
    Result := TPersistent(FOwner)
  else
    Result := nil;
end;


{ TOptions }

constructor TOptions.Create(AOwner: TPersistent);
begin
  inherited;

  FDisplay := TChromeTabs32DisplayOptions.Create(Self);
  FDragDrop := TChromeTabs32DragOptions.Create(Self);
  FAnimation := TChromeTabs32AnimationOptions.Create(Self);
  FBehaviour := TChromeTabs32BehaviourOptions.Create(Self);
  FScrolling := TChromeTabs32ScrollOptions.Create(Self);
end;

destructor TOptions.Destroy;
begin
  FreeAndNil(FDisplay);
  FreeAndNil(FDragDrop);
  FreeAndNil(FAnimation);
  FreeAndNil(FBehaviour);
  FreeAndNil(FScrolling);

  inherited;
end;

function TOptions.GetAnimation: TChromeTabs32AnimationOptions;
begin
  Result := FAnimation;
end;

function TOptions.GetBehaviour: TChromeTabs32BehaviourOptions;
begin
  Result := FBehaviour;
end;

function TOptions.GetDragDrop: TChromeTabs32DragOptions;
begin
  Result := FDragDrop;
end;

function TOptions.GetDisplay: TChromeTabs32DisplayOptions;
begin
  Result := FDisplay;
end;

procedure TOptions.SetAnimation(const Value: TChromeTabs32AnimationOptions);
begin
  FAnimation.Assign(Value);
end;

procedure TOptions.SetBehaviour(const Value: TChromeTabs32BehaviourOptions);
begin
  FBehaviour.AssignTo(Value);
end;

procedure TOptions.SetDragDrop(const Value: TChromeTabs32DragOptions);
begin
  FDragDrop.Assign(Value);
end;

procedure TOptions.SetDisplay(const Value: TChromeTabs32DisplayOptions);
begin
  FDisplay.Assign(Value);
end;

procedure TOptions.SetScrolling(const Value: TChromeTabs32ScrollOptions);
begin
  FScrolling.Assign(Value);
end;

{ TChromeTabs32LookAndFeelStyleProperties }

constructor TChromeTabs32LookAndFeelStyleProperties.Create(AOwner: TPersistent);
begin
  inherited;

  FFont := TChromeTabs32LookAndFeelFont.Create(Self);
  FStyle := TChromeTabs32LookAndFeelStyle.Create(AOwner);
end;

destructor TChromeTabs32LookAndFeelStyleProperties.Destroy;
begin
  FreeAndNil(FFont);
  FreeAndNil(FStyle);

  inherited;
end;

procedure TChromeTabs32LookAndFeelStyleProperties.SetFont(const Value: TChromeTabs32LookAndFeelFont);
begin
  FFont.Assign(Value);

  DoChanged;
end;


procedure TChromeTabs32LookAndFeelStyleProperties.SetStyle(const Value: TChromeTabs32LookAndFeelStyle);
begin
  FStyle.Assign(Value);

  DoChanged;
end;


{ TChromeTabLookAndFeelStyle }

constructor TChromeTabs32LookAndFeelStyle.Create(AOwner: TPersistent);
begin
  inherited;

  FFiller := TLinearGradientPolygonFiller.Create;
  FFiller.SimpleGradient(
    FloatPoint(0, 0), StartColor,
    FloatPoint(0, 9), StopColor);

  FPen := TStrokeBrush.Create(nil);
  FPen.FillColor := clGray32;
  FPen.StrokeWidth := 1;
end;

destructor TChromeTabs32LookAndFeelStyle.Destroy;
begin
  FreeAndNil(FPen);
  FreeAndNil(FFiller);

  inherited;
end;

function TChromeTabs32LookAndFeelStyle.GetPolygonFiller(
  ClientRect: TRect): TLinearGradientPolygonFiller;
begin
  FFiller.SetPoints(
    FloatPoint(0, ClientRect.Top),
    FloatPoint(0, ClientRect.Bottom));

  Result := FFiller;
end;

function TChromeTabs32LookAndFeelStyle.GetStartColor: TColor32;
begin
  Result := FFiller.Gradient.GradientEntry[0].Color32;
end;

function TChromeTabs32LookAndFeelStyle.GetStopColor: TColor32;
begin
  Result := FFiller.Gradient.GradientEntry[1].Color32;
end;

procedure TChromeTabs32LookAndFeelStyle.SetOutlineColor(const Value: TColor32);
begin
  FPen.FillColor := Value;

  DoChanged;
end;

function TChromeTabs32LookAndFeelStyle.GetOutlineColor: TColor32;
begin
  Result := FPen.FillColor;
end;

procedure TChromeTabs32LookAndFeelStyle.SetOutlineSize(const Value: Single);
begin
  FPen.StrokeWidth := Value;

  DoChanged;
end;

function TChromeTabs32LookAndFeelStyle.GetOutlineSize: Single;
begin
  Result := FPen.StrokeWidth;
end;

procedure TChromeTabs32LookAndFeelStyle.SetStartColor(const Value: TColor32);
begin
  FFiller.Gradient.StartColor := Value;

  DoChanged;
end;

procedure TChromeTabs32LookAndFeelStyle.SetStopColor(const Value: TColor32);
begin
  FFiller.Gradient.EndColor := Value;

  DoChanged;
end;


{ TChromeTabs32LookAndFeelCloseButton }

constructor TChromeTabs32LookAndFeelCloseButton.Create(AOwner: TPersistent);
begin
  Inherited;

  FCircle := TChromeTabs32LookAndFeelButtonItems.Create(Self);
  FCross := TChromeTabs32LookAndFeelPenItem.Create(Self);

  FCross.Normal.Color := $00A9AFB8;
  FCross.Hot.Color := SetAlpha(clWhite, 240);
  FCross.Down.Color := clRed32;

  FCircle.Normal.StartColor := clWhite;
  FCircle.Normal.StopColor := FCircle.Normal.StartColor;
  FCircle.Normal.OutlineColor := $00FFFFFF;

  FCircle.Hot.StartColor := $00c13535;
  FCircle.Hot.StopColor := FCircle.Hot.StartColor;
  FCircle.Hot.OutlineColor := $00FFFFFF;

  FCircle.Down.StartColor := $00c13535;
  FCircle.Down.StopColor := FCircle.Down.StartColor;
  FCircle.Down.OutlineColor := $00FFFFFF;
end;

destructor TChromeTabs32LookAndFeelCloseButton.Destroy;
begin
  FreeAndNil(FCircle);
  FreeAndNil(FCross);

  inherited;
end;

procedure TChromeTabs32LookAndFeelCloseButton.SetCircle(const Value: TChromeTabs32LookAndFeelButtonItems);
begin
  FCircle.Assign(Value);

  DoChanged;
end;

procedure TChromeTabs32LookAndFeelCloseButton.SetCross(
  const Value: TChromeTabs32LookAndFeelPenItem);
begin
  FCross := Value;

  DoChanged;
end;


{ TChromeTabs32LookAndFeelAddButton }

constructor TChromeTabs32LookAndFeelAddButton.Create(AOwner: TPersistent);
begin
  inherited;

  FButton := TChromeTabs32LookAndFeelButtonItems.Create(Self);
  FPlusSign := TChromeTabs32LookAndFeelButtonItems.Create(Self);
end;

destructor TChromeTabs32LookAndFeelAddButton.Destroy;
begin
  FreeAndNil(FButton);
  FreeAndNil(FPlusSign);

  inherited;
end;


procedure TChromeTabs32LookAndFeelAddButton.SetButton(
  const Value: TChromeTabs32LookAndFeelButtonItems);
begin
  FButton.Assign(Value);
end;

procedure TChromeTabs32LookAndFeelAddButton.SetPlusSign(
  const Value: TChromeTabs32LookAndFeelButtonItems);
begin
  FPlusSign.Assign(Value);
end;


{ TChromeTabs32LookAndFeel }

constructor TChromeTabs32LookAndFeel.Create(AOwner: TPersistent);
begin
  inherited Create(AOwner);

  FTabs := TChromeTabs32LookAndFeelTab.Create(Self);
  FTabsContainer := TChromeTabs32LookAndFeelStyle.Create(Self);
  FCloseButton := TChromeTabs32LookAndFeelCloseButton.Create(Self);
  FAddButton := TChromeTabs32LookAndFeelAddButton.Create(Self);
  FScrollButtons := TChromeTabs32LookAndFeelScrollButton.Create(Self);

  FTabsContainer.OutlineSize := 0;
end;

destructor TChromeTabs32LookAndFeel.Destroy;
begin
  FreeAndNil(FCloseButton);
  FreeAndNil(FTabsContainer);
  FreeAndNil(FAddButton);
  FreeAndNil(FTabs);
  FreeAndNil(FScrollButtons);

  inherited;
end;

procedure TChromeTabs32LookAndFeel.SetTabsContainer(const Value: TChromeTabs32LookAndFeelStyle);
begin
  FTabsContainer.Assign(Value);

  DoChanged;
end;

procedure TChromeTabs32LookAndFeel.SetCloseButton(const Value: TChromeTabs32LookAndFeelCloseButton);
begin
  FCloseButton.Assign(Value);

  DoChanged;
end;

procedure TChromeTabs32LookAndFeel.SetScrollButtons(
  const Value: TChromeTabs32LookAndFeelScrollButton);
begin
  FScrollButtons.Assign(Value);

  DoChanged;
end;

procedure TChromeTabs32LookAndFeel.SetTabs(
  const Value: TChromeTabs32LookAndFeelTab);
begin
  FTabs.Assign(Value);

  DoChanged;
end;

procedure TChromeTabs32LookAndFeel.SetAddButton(
  const Value: TChromeTabs32LookAndFeelAddButton);
begin
  FAddButton.Assign(Value);

  DoChanged;
end;


{ TChromeTabs32AnimationOptions }

constructor TChromeTabs32AnimationOptions.Create(AOwner: TPersistent);
begin
  inherited;

  FMovementEasing := TChromeTabs32MovementAnimations.Create(Self);

  FDefaultMovementAnimationTimeMS := 100;
  FDefaultStyleAnimationTimeMS := 300;
  FAnimationTimerInterval := 25;
  FMinimumTabAnimationWidth := 40;
  FDefaultMovementEaseType := ttLinearTween;
  FDefaultStyleEaseType := ttLinearTween;
end;

procedure TChromeTabs32AnimationOptions.SetMovementAnimationTimeMS(const Value: Cardinal);
begin
  FDefaultMovementAnimationTimeMS := Value;
end;

procedure TChromeTabs32AnimationOptions.SetStyleAnimationTimeMS(const Value: Cardinal);
begin
  FDefaultStyleAnimationTimeMS := Value;
end;

procedure TChromeTabs32AnimationOptions.SetAnimationTimerInterval(const Value: Integer);
begin
  FAnimationTimerInterval := Value;
end;

procedure TChromeTabs32AnimationOptions.SetMovementEaseType(
  const Value: TChromeTabs32EaseType);
begin
  FDefaultMovementEaseType := Value;
end;

procedure TChromeTabs32AnimationOptions.SetMovementEasing(
  const Value: TChromeTabs32MovementAnimations);
begin
  FMovementEasing.Assign(Value);
end;

procedure TChromeTabs32AnimationOptions.SetStyleEaseType(
  const Value: TChromeTabs32EaseType);
begin
  FDefaultStyleEaseType := Value;
end;

procedure TChromeTabs32AnimationOptions.SetMinimumTabAnimationWidth(
  const Value: Integer);
begin
  FMinimumTabAnimationWidth := Value;
end;

destructor TChromeTabs32AnimationOptions.Destroy;
begin
  FreeAndNil(FMovementEasing);

  inherited;
end;

function TChromeTabs32AnimationOptions.GetMovementAnimationEaseType(AnimationTypes: TChromeTabs32MovementAnimationTypes): TChromeTabs32EaseType;
begin
  if AnimationTypes.UseDefaultEaseType then
    Result := FDefaultMovementEaseType
  else
    Result := AnimationTypes.EaseType;
end;

function TChromeTabs32AnimationOptions.GetMovementAnimationTime(AnimationTypes: TChromeTabs32MovementAnimationTypes): Cardinal;
begin
  if AnimationTypes.UseDefaultEaseType then
    Result := FDefaultMovementAnimationTimeMS
  else
    Result := AnimationTypes.FAnimationTimeMS;
end;


{ TChromeTabs32DragOptions }

constructor TChromeTabs32DragOptions.Create(AOwner: TPersistent);
begin
  inherited;

  FDragType := dtBetweenContainers;
  FDragOutsideImageAlpha := 120;
  FDragOutsideDistancePixels := 30;
  FDragStartPixels := 2;
  FDragControlImageResizeFactor := 0.5;
  FDragCursor := crDefault;
  FDragDisplay := ddTabAndControl;
  FDragFormBorderWidth := 2;
  FDragFormBorderColor := clGray;
  FContrainDraggedTabWithinContainer := True;
end;

procedure TChromeTabs32DragOptions.SetDragType(
  const Value: TChromeTabDragType);
begin
  FDragType := Value;
end;

procedure TChromeTabs32DragOptions.SetContrainDraggedTabWithinContainer(
  const Value: Boolean);
begin
  FContrainDraggedTabWithinContainer := Value;
end;

procedure TChromeTabs32DragOptions.SetDragControlImageResizeFactor(
  const Value: Real);
begin
  FDragControlImageResizeFactor := Value;
end;

procedure TChromeTabs32DragOptions.SetDragCursor(const Value: TCursor);
begin
  FDragCursor := Value;
end;

procedure TChromeTabs32DragOptions.SetDragDisplay(
  const Value: TChromeTabDragDisplay);
begin
  FDragDisplay := Value;
end;

procedure TChromeTabs32DragOptions.SetDragFormBorderColor(const Value: Integer);
begin
  FDragFormBorderColor := Value;
end;

procedure TChromeTabs32DragOptions.SetDragFormBorderWidth(const Value: Integer);
begin
  FDragFormBorderWidth := Value;
end;

procedure TChromeTabs32DragOptions.SetDragOutsideDistancePixels(const Value: Integer);
begin
  FDragOutsideDistancePixels := Value;
end;

procedure TChromeTabs32DragOptions.SetDragOutsideImageAlpha(const Value: Byte);
begin
  FDragOutsideImageAlpha := Value;
end;

procedure TChromeTabs32DragOptions.SetDragStartPixels(const Value: Integer);
begin
  FDragStartPixels := Value;
end;


{ TDragTabObject }

destructor TDragTabObject.Destroy;
begin
  if FDragForm <> nil then
    FDragForm.Release;

  inherited;
end;

function TDragTabObject.GetDockControl: IChromeTabDockControl;
begin
  Result := FDockControl;
end;

function TDragTabObject.GetDragCursorOffset: TPoint;
begin
  Result := FDragCursorOffset;
end;

function TDragTabObject.GetDragForm: TForm;
begin
  Result := FDragForm;
end;

function TDragTabObject.GetDragFormOffset: TPoint;
begin
  Result := FDragFormOffset;
end;

function TDragTabObject.GetDragOverType: TDragOverType;
begin
  Result := FDragOverType;
end;

function TDragTabObject.GetDragPoint: TPoint;
begin
  Result := FDragPoint;
end;

function TDragTabObject.GetDragTab: TChromeTab;
begin
  Result := FDragTab;
end;

function TDragTabObject.GetDropTabIndex: Integer;
begin
  Result := FDropTabIndex;
end;

function TDragTabObject.GetHideAddButton: Boolean;
begin
  Result := FHideAddButton;
end;

function TDragTabObject.GetOriginalControlRect: TRect;
begin
  Result := FOriginalControlRect;
end;

function TDragTabObject.GetOriginalCursor: TCursor;
begin
  Result := FOriginalCursor;
end;

function TDragTabObject.GetSourceControl: IChromeTabDockControl;
begin
  Result := FSourceControl;
end;

procedure TDragTabObject.SetDockControl(const Value: IChromeTabDockControl);
begin
  FDockControl := Value;
end;

procedure TDragTabObject.SetDragCursorOffset(const Value: TPoint);
begin
  FDragCursorOffset := Value;
end;

procedure TDragTabObject.SetDragForm(const Value: TForm);
begin
  FDragForm := Value;
end;

procedure TDragTabObject.SetDragFormOffset(const Value: TPoint);
begin
  FDragFormOffset := Value;
end;

procedure TDragTabObject.SetDragOverType(const Value: TDragOverType);
begin
  FDragOverType := Value;
end;

procedure TDragTabObject.SetDragPoint(const Value: TPoint);
begin
  FDragPoint := Value;
end;

procedure TDragTabObject.SetDragTab(const Value: TChromeTab);
begin
  FDragTab := Value;
end;

procedure TDragTabObject.SetDropTabIndex(const Value: Integer);
begin
  FDropTabIndex := Value;
end;

procedure TDragTabObject.SetHideAddButton(const Value: Boolean);
begin
  FHideAddButton := Value;
end;

procedure TDragTabObject.SetOriginalControlRect(const Value: TRect);
begin
  FOriginalControlRect := Value;
end;

procedure TDragTabObject.SetOriginalCursor(const Value: TCursor);
begin
  FOriginalCursor := Value;
end;

procedure TDragTabObject.SetSourceControl(const Value: IChromeTabDockControl);
begin
  FSourceControl := Value;
end;

{ TChromeTabs32DisplayOptions }

constructor TChromeTabs32DisplayOptions.Create(AOwner: TPersistent);
begin
  inherited;

  FCloseButton := TChromeTabs32CloseButtonProperties.Create(Self);
  FAddButton := TChromeTabs32AddButtonProperties.Create(Self);
  FScrollButtonLeft := TChromeTabs32ControlPosition.Create(Self);
  FScrollButtonRight := TChromeTabs32ControlPosition.Create(Self);
  FTabModifiedGlow := TChromeTabModifiedDisplayOptions.Create(Self);
  FTabs := TChromeTabs32Options.Create(Self);
  FTabContainer := TChromeTabs32ContainerOptions.Create(Self);
  FTabMouseGlow := TChromeTabs32ControlPropertiesEx.Create(Self);
  FTabSpinners := TChromeTabs32SpinnersOptions.Create(Self);

  FScrollButtonLeft.Height := 15;
  FScrollButtonLeft.Width := 15;
  FScrollButtonLeft.Offsets.Vertical := 10;

  FScrollButtonRight.Height := 15;
  FScrollButtonRight.Width := 15;
  FScrollButtonRight.Offsets.Vertical := 10;

  FTabMouseGlow.Height := 70;
  FTabMouseGlow.Width := 70;
end;

destructor TChromeTabs32DisplayOptions.Destroy;
begin
  FreeAndNil(FAddButton);
  FreeAndNil(FCloseButton);
  FreeAndNil(FScrollButtonLeft);
  FreeAndNil(FScrollButtonRight);
  FreeAndNil(FTabModifiedGlow);
  FreeAndNil(FTabs);
  FreeAndNil(FTabContainer);
  FreeAndNil(FTabMouseGlow);
  FreeAndNil(FTabSpinners);

  inherited;
end;

procedure TChromeTabs32DisplayOptions.SetAddButton(
  const Value: TChromeTabs32AddButtonProperties);
begin
  FAddButton.Assign(Value);

  DoChanged;
end;

procedure TChromeTabs32DisplayOptions.SetScrollButtonLeft(
  const Value: TChromeTabs32ControlPosition);
begin
  FScrollButtonLeft.Assign(Value);
end;

procedure TChromeTabs32DisplayOptions.SetScrollButtonRight(
  const Value: TChromeTabs32ControlPosition);
begin
  FScrollButtonRight.Assign(Value);
end;

procedure TChromeTabs32DisplayOptions.SetCloseButton(
  const Value: TChromeTabs32CloseButtonProperties);
begin
  FCloseButton.Assign(Value);
end;

procedure TChromeTabs32DisplayOptions.SetTabModifiedGlow(
  const Value: TChromeTabModifiedDisplayOptions);
begin
  FTabModifiedGlow.Assign(Value);

  DoChanged;
end;

procedure TChromeTabs32DisplayOptions.SetTabMouseGlow(
  const Value: TChromeTabs32ControlPropertiesEx);
begin
  FTabMouseGlow.Assign(Value);

  DoChanged;
end;

procedure TChromeTabs32DisplayOptions.SetTabContainer(
  const Value: TChromeTabs32ContainerOptions);
begin
  FTabContainer.Assign(Value);

  DoChanged;
end;

procedure TChromeTabs32DisplayOptions.SetTabs(const Value: TChromeTabs32Options);
begin
  FTabs.Assign(Value);

  DoChanged;
end;


procedure TChromeTabs32DisplayOptions.SetTabSpinners(
  const Value: TChromeTabs32SpinnersOptions);
begin
  FTabSpinners.Assign(Value);
end;

{ TChromeTabs32BehaviourOptions }

constructor TChromeTabs32BehaviourOptions.Create(AOwner: TPersistent);
begin
  inherited;

  FBackgroundDblClickMaximiseRestoreForm := False;
  FBackgroundDragMovesForm := False;
  FTabSmartDeleteResizing := True;
  FTabSmartDeleteResizeCancelDelay := 700;
  FUseBuiltInPopupMenu := True;
  FTabRightClickSelect := True;
  FActivateNewTab := True;
  FIgnoreDoubleClicksWhileAnimatingMovement := True;
end;

procedure TChromeTabs32BehaviourOptions.SetActivateNewTab(const Value: Boolean);
begin
  FActivateNewTab := Value;
end;

procedure TChromeTabs32BehaviourOptions.SetDebugMode(const Value: Boolean);
begin
  FDebugMode := Value;
end;

procedure TChromeTabs32BehaviourOptions.SetIgnoreDoubleClicksWhileAnimatingMovement(
  const Value: Boolean);
begin
  FIgnoreDoubleClicksWhileAnimatingMovement := Value;
end;

procedure TChromeTabs32BehaviourOptions.SetTabRightClickSelect(
  const Value: Boolean);
begin
  FTabRightClickSelect := Value;
end;

procedure TChromeTabs32BehaviourOptions.SetTabSmartDeleteResizeCancelDelay(
  const Value: Integer);
begin
  FTabSmartDeleteResizeCancelDelay := Value;
end;

procedure TChromeTabs32BehaviourOptions.SetTabSmartDeleteResizing(
  const Value: Boolean);
begin
  FTabSmartDeleteResizing := Value;
end;

procedure TChromeTabs32BehaviourOptions.SetBackgroundDblClickMaximiseRestoreForm(
  const Value: Boolean);
begin
  FBackgroundDblClickMaximiseRestoreForm := Value;
end;

procedure TChromeTabs32BehaviourOptions.SetBackgroundDragMovesForm(
  const Value: Boolean);
begin
  FBackgroundDragMovesForm := Value;
end;

procedure TChromeTabs32BehaviourOptions.SetUseBuiltInPopupMenu(
  const Value: Boolean);
begin
  FUseBuiltInPopupMenu := Value;
end;

{ TChromeTabs32ScrollOptions }

constructor TChromeTabs32ScrollOptions.Create(AOwner: TPersistent);
begin
  inherited;

  FScrollStep := 20;
  FScrollRepeatDelay := 20;
  FAutoHideButtons := True;

  FDragScroll := True;
  FDragScrollOffset := 50;

  FMouseWheelScroll := True;

  FScrollButtons := csbRight;
end;

destructor TChromeTabs32ScrollOptions.Destroy;
begin
  inherited;
end;

procedure TChromeTabs32ScrollOptions.SetAutoHideButtons(const Value: Boolean);
begin
  FAutoHideButtons := Value;

  DoChanged;
end;

procedure TChromeTabs32ScrollOptions.SetDragScroll(const Value: Boolean);
begin
  FDragScroll := Value;

  DoChanged;
end;

procedure TChromeTabs32ScrollOptions.SetDragScrollOffset(const Value: Integer);
begin
  FDragScrollOffset := Value;

  DoChanged;
end;

procedure TChromeTabs32ScrollOptions.SetEnabled(const Value: Boolean);
begin
  FEnabled := Value;

  DoChanged;
end;

procedure TChromeTabs32ScrollOptions.SetMouseWheelScroll(const Value: Boolean);
begin
  FMouseWheelScroll := Value;

  DoChanged;
end;

procedure TChromeTabs32ScrollOptions.SetScrollButtons(
  const Value: TChromeTabs32crollButtons);
begin
  FScrollButtons := Value;

  DoChanged;
end;

procedure TChromeTabs32ScrollOptions.SetScrollRepeatDelay(const Value: Integer);
begin
  FScrollRepeatDelay := Value;

  DoChanged;
end;

procedure TChromeTabs32ScrollOptions.SetScrollStep(const Value: Integer);
begin
  FScrollStep := Value;

  DoChanged;
end;

{ TChromeTabs32ControlPosition }

constructor TChromeTabs32ControlPosition.Create(AOwner: TPersistent);
begin
  FOffsets := TChromeTabs32Offsets.Create(Self);

  inherited;
end;

destructor TChromeTabs32ControlPosition.Destroy;
begin
  FreeAndNil(FOffsets);

  inherited;
end;

procedure TChromeTabs32ControlPosition.SetHeight(const Value: Integer);
begin
  FHeight := Value;

  DoChanged;
end;

procedure TChromeTabs32ControlPosition.SetOffsets(const Value: TChromeTabs32Offsets);
begin
  FOffsets.Assign(Value);
end;

procedure TChromeTabs32ControlPosition.SetWidth(const Value: Integer);
begin
  FWidth := Value;

  DoChanged;
end;

{ TChromeTabs32Offsets }

constructor TChromeTabs32Offsets.Create(AOwner: TPersistent);
begin
  inherited;

  FVertical := 0;
  FHorizontal := 0;
end;

procedure TChromeTabs32Offsets.SetHorizontal(const Value: Integer);
begin
  FHorizontal := Value;

  DoChanged;
end;

procedure TChromeTabs32Offsets.SetVertical(const Value: Integer);
begin
  FVertical := Value;

  DoChanged;
end;

{ TChromeTabs32ControlPropertiesEx }

constructor TChromeTabs32ControlPropertiesEx.Create(AOwner: TPersistent);
begin
  inherited;

  FVisible := True;
end;

procedure TChromeTabs32ControlPropertiesEx.SetVisible(const Value: Boolean);
begin
  FVisible := Value;

  DoChanged;
end;

{ TChromeTabs32CloseButtonProperties }

constructor TChromeTabs32CloseButtonProperties.Create(AOwner: TPersistent);
begin
  inherited;

  FAutoHide := True;
  FVisibility := bvAll;

  FAutoHideWidth := 20;
  Offsets.Vertical := 6;
  Width := 13;
  Height := 13;
  FCrossRadialOffset := 4
end;

destructor TChromeTabs32CloseButtonProperties.Destroy;
begin
  inherited;
end;

procedure TChromeTabs32CloseButtonProperties.SetAutoHide(const Value: Boolean);
begin
  FAutoHide := Value;

  DoChanged;
end;

procedure TChromeTabs32CloseButtonProperties.SetAutoHideWidth(
  const Value: Integer);
begin
  FAutoHideWidth := Value;

  DoChanged;
end;

procedure TChromeTabs32CloseButtonProperties.SetCrossRadialOffset(
  const Value: Integer);
begin
  FCrossRadialOffset := Value;

  DoChanged;
end;

procedure TChromeTabs32CloseButtonProperties.SetVisibility(
  const Value: TCloseButtonVisiblity);
begin
  FVisibility := Value;

  DoChanged;
end;

{ TChromeTabs32AddButtonProperties }

constructor TChromeTabs32AddButtonProperties.Create(AOwner: TPersistent);
begin
  inherited;

  FShowPlusSign := True;
  FVisibility := avRightFloating;

  Offsets.Vertical := 9;
  FHorizontalOffsetFloating := 0;
  Height := 14;
  Width := 25;
end;

destructor TChromeTabs32AddButtonProperties.Destroy;
begin

  inherited;
end;

procedure TChromeTabs32AddButtonProperties.SetHorizontalOffsetFloating(
  const Value: Integer);
begin
  FHorizontalOffsetFloating := Value;

  DoChanged;
end;

procedure TChromeTabs32AddButtonProperties.SetShowPlusSign(
  const Value: Boolean);
begin
  FShowPlusSign := Value;

  DoChanged;
end;

procedure TChromeTabs32AddButtonProperties.SetVisibility(
  const Value: TAddButtonVisibility);
begin
  FVisibility := Value;

  DoChanged;
end;

{ TChromeTabs32LookAndFeelCustomStyleItems }

constructor TChromeTabs32LookAndFeelCustomStyleItems.Create(AOwner: TPersistent);
begin
  inherited;

  FStyleProperty1 := TChromeTabs32LookAndFeelStyle.Create(Self);
  FStyleProperty2 := TChromeTabs32LookAndFeelStyle.Create(Self);
  FStyleProperty3 := TChromeTabs32LookAndFeelStyle.Create(Self);
end;

destructor TChromeTabs32LookAndFeelCustomStyleItems.Destroy;
begin
  FreeAndNil(FStyleProperty1);
  FreeAndNil(FStyleProperty2);
  FreeAndNil(FStyleProperty3);

  inherited;
end;

procedure TChromeTabs32LookAndFeelCustomStyleItems.SetStyleProperty2(
  const Value: TChromeTabs32LookAndFeelStyle);
begin
  FStyleProperty2.Assign(Value);

  DoChanged;
end;

procedure TChromeTabs32LookAndFeelCustomStyleItems.SetStyleProperty3(
  const Value: TChromeTabs32LookAndFeelStyle);
begin
  FStyleProperty3.Assign(Value);

  DoChanged;
end;

procedure TChromeTabs32LookAndFeelCustomStyleItems.SetStyleProperty1(
  const Value: TChromeTabs32LookAndFeelStyle);
begin
  FStyleProperty1.Assign(Value);

  DoChanged;
end;


{ TChromeTabs32CustomLookAndFeelStylePropertyItems }

constructor TChromeTabs32CustomLookAndFeelStylePropertyItems.Create(AOwner: TPersistent);
begin
  inherited;

  FStyleProperty1 := TChromeTabs32LookAndFeelStyleProperties.Create(Self);
  FStyleProperty2 := TChromeTabs32LookAndFeelStyleProperties.Create(Self);
  FStyleProperty3 := TChromeTabs32LookAndFeelStyleProperties.Create(Self);
end;

destructor TChromeTabs32CustomLookAndFeelStylePropertyItems.Destroy;
begin
  FreeAndNil(FStyleProperty1);
  FreeAndNil(FStyleProperty2);
  FreeAndNil(FStyleProperty3);

  inherited;
end;

procedure TChromeTabs32CustomLookAndFeelStylePropertyItems.SetStyleProperty1(
  const Value: TChromeTabs32LookAndFeelStyleProperties);
begin
  FStyleProperty1.AssignTo(Value);
end;

procedure TChromeTabs32CustomLookAndFeelStylePropertyItems.SetStyleProperty2(
  const Value: TChromeTabs32LookAndFeelStyleProperties);
begin
  FStyleProperty2.AssignTo(Value);
end;

procedure TChromeTabs32CustomLookAndFeelStylePropertyItems.SetStyleProperty3(
  const Value: TChromeTabs32LookAndFeelStyleProperties);
begin
  FStyleProperty3.AssignTo(Value);
end;


{ TChromeTabs32LookAndFeelPen }

constructor TChromeTabs32LookAndFeelPen.Create(AOwner: TPersistent);
begin
  inherited;

  FPen := TStrokeBrush.Create(nil);
  FPen.FillColor := clBlack32;
  FPen.StrokeWidth := 1;
end;

destructor TChromeTabs32LookAndFeelPen.Destroy;
begin
  FreeAndNil(FPen);

  inherited;
end;

function TChromeTabs32LookAndFeelPen.GetColor: TColor32;
begin
  Result := FPen.FillColor;
end;

function TChromeTabs32LookAndFeelPen.GetThickness: Single;
begin
  Result := FPen.StrokeWidth;
end;

procedure TChromeTabs32LookAndFeelPen.SetColor(const Value: TColor32);
begin
  FPen.FillColor := Value;

  DoChanged;
end;

procedure TChromeTabs32LookAndFeelPen.SetThickness(const Value: Single);
begin
  FPen.StrokeWidth := Value;

  DoChanged;
end;


{ TChromeTabs32CustomLookAndFeelPenItem }

constructor TChromeTabs32CustomLookAndFeelPenItem.Create(AOwner: TPersistent);
begin
  inherited;

  FPen1 := TChromeTabs32LookAndFeelPen.Create(Self);
  FPen2 := TChromeTabs32LookAndFeelPen.Create(Self);
  FPen3 := TChromeTabs32LookAndFeelPen.Create(Self);
end;

destructor TChromeTabs32CustomLookAndFeelPenItem.Destroy;
begin
  FreeAndNil(FPen1);
  FreeAndNil(FPen2);
  FreeAndNil(FPen3);

  inherited;
end;

procedure TChromeTabs32CustomLookAndFeelPenItem.SetPen1(
  const Value: TChromeTabs32LookAndFeelPen);
begin
  FPen1.Assign(Value);

  DoChanged;
end;

procedure TChromeTabs32CustomLookAndFeelPenItem.SetPen2(
  const Value: TChromeTabs32LookAndFeelPen);
begin
  FPen2.Assign(Value);

  DoChanged;
end;

procedure TChromeTabs32CustomLookAndFeelPenItem.SetPen3(
  const Value: TChromeTabs32LookAndFeelPen);
begin
  FPen3.Assign(Value);

  DoChanged;
end;


{ TChromeTabs32LookAndFeelDisabledButton }

constructor TChromeTabs32LookAndFeelDisabledButton.Create(
  AOwner: TPersistent);
begin
  inherited;

  FDisabled := TChromeTabs32LookAndFeelStyle.Create(Self);
end;

destructor TChromeTabs32LookAndFeelDisabledButton.Destroy;
begin
  FreeAndNil(FDisabled);

  inherited;
end;

procedure TChromeTabs32LookAndFeelDisabledButton.SetDisabled(
  const Value: TChromeTabs32LookAndFeelStyle);
begin
  FDisabled.Assign(Value);

  DoChanged;
end;


{ TChromeTabs32LookAndFeelTab }

constructor TChromeTabs32LookAndFeelTab.Create(AOwner: TPersistent);
begin
  inherited;

  FBaseLine := TChromeTabs32LookAndFeelPen.Create(Self);
  FModified := TChromeTabs32LookAndFeelGlow.Create(Self);
  FDefaultFont := TChromeTabs32LookAndFeelBaseFont.Create(Self);
  FMouseGlow := TChromeTabs32LookAndFeelGlow.Create(Self);
  FSpinners := TChromeTabs32LookAndFeelSpinners.Create(Self);

  FBaseLine.Color := clGray32;
  FBaseLine.Thickness := 2;
end;

destructor TChromeTabs32LookAndFeelTab.Destroy;
begin
  FreeAndNil(FBaseLine);
  FreeAndNil(FModified);
  FreeandNil(FMouseGlow);
  FreeandNil(FDefaultFont);
  FreeAndNil(FSpinners);

  inherited;
end;

procedure TChromeTabs32LookAndFeelTab.SetBaseLine(
  const Value: TChromeTabs32LookAndFeelPen);
begin
  FBaseLine.Assign(Value);

  DoChanged;
end;

procedure TChromeTabs32LookAndFeelTab.SetDefaultFont(
  const Value: TChromeTabs32LookAndFeelBaseFont);
begin
  FDefaultFont.Assign(Value);

  DoChanged;
end;

procedure TChromeTabs32LookAndFeelTab.SetModified(
  const Value: TChromeTabs32LookAndFeelGlow);
begin
  FModified.Assign(Value);

  DoChanged;
end;

procedure TChromeTabs32LookAndFeelTab.SetMouseGlow(
  const Value: TChromeTabs32LookAndFeelGlow);
begin
  FMouseGlow.Assign(Value);

  DoChanged;
end;

procedure TChromeTabs32LookAndFeelTab.SetSpinners(
  const Value: TChromeTabs32LookAndFeelSpinners);
begin
  FSpinners.Assign(Value);
end;


{ TChromeTabPolygons }

function TChromeTabPolygons.AddPolygon(Polygon: TArrayOfFloatPoint;
  Filler: TCustomPolygonFiller; Pen: TStrokeBrush): IChromeTabPolygons;
var
  ChromeTabPolygon: TChromeTabPolygon;
begin
  Result := Self;

  ChromeTabPolygon := TChromeTabPolygon.Create;
  FPolygons.Add(ChromeTabPolygon);

  ChromeTabPolygon.Polygon := Polygon;
  ChromeTabPolygon.Filler := Filler;
  ChromeTabPolygon.Pen := Pen;
end;

constructor TChromeTabPolygons.Create;
begin
  FPolygons := TObjectList.Create(True);
end;

destructor TChromeTabPolygons.Destroy;
begin
  FreeAndNil(FPolygons);

  inherited;
end;

procedure TChromeTabPolygons.DrawTo(TargetCanvas: TCanvas32; DrawToFunctions: TDrawToFunctions);
var
  i: Integer;
begin
  for i := 0 to FPolygons.Count - 1 do
  begin
    TargetCanvas.Brushes.Clear;

    if Assigned(Polygons[i].Filler) and (DrawToFunctions in [dfBrush, dfBrushAndPen]) then
      PolygonFS(TargetCanvas.Bitmap, Polygons[i].Polygon, Polygons[i].Filler);

    if (DrawToFunctions in [dfPen, dfBrushAndPen]) then
      PolylineFS(TargetCanvas.Bitmap, Polygons[i].Polygon,
        Polygons[i].Pen.FillColor, True, Polygons[i].Pen.StrokeWidth);
  end;
end;

function TChromeTabPolygons.GetPolygonCount: Integer;
begin
  Result := FPolygons.Count;
end;

function TChromeTabPolygons.GetPolygons(Index: Integer): TChromeTabPolygon;
begin
  Result := TChromeTabPolygon(FPolygons[Index]);
end;


{ TChromeTabs32LookAndFeelScrollButton }

constructor TChromeTabs32LookAndFeelScrollButton.Create(AOwner: TPersistent);
begin
  inherited;

  FButton := TChromeTabs32LookAndFeelDisabledButton.Create(Self);
  FArrow := TChromeTabs32LookAndFeelDisabledButton.Create(Self);
end;

destructor TChromeTabs32LookAndFeelScrollButton.Destroy;
begin
  FreeAndNil(FButton);
  FreeAndNil(FArrow);

  inherited;
end;

procedure TChromeTabs32LookAndFeelScrollButton.SetArrow(
  const Value: TChromeTabs32LookAndFeelDisabledButton);
begin
  FArrow.Assign(Value);

  DoChanged;
end;

procedure TChromeTabs32LookAndFeelScrollButton.SetButton(
  const Value: TChromeTabs32LookAndFeelDisabledButton);
begin
  FButton.Assign(Value);

  DoChanged;
end;


{ TChromeTabModifiedDisplayOptions }

constructor TChromeTabModifiedDisplayOptions.Create(AOwner: TPersistent);
begin
  inherited;

  FStyle := msRightToLeft;
  FVerticalOffset := -6;
  FHeight := 30;
  FWidth := 100;
  FAnimationPeriodMS := 4000;
  FAnimationUpdateMS := 50;
  FEaseType := ttEaseInOutQuad;
end;

procedure TChromeTabModifiedDisplayOptions.SetHeight(const Value: Integer);
begin
  FHeight := Value;

  DoChanged;
end;

procedure TChromeTabModifiedDisplayOptions.SetAnimationPeriodMS(const Value: Integer);
begin
  FAnimationPeriodMS := Value;

  DoChanged;
end;

procedure TChromeTabModifiedDisplayOptions.SetAnimationUpdateMS(
  const Value: Integer);
begin
  FAnimationUpdateMS := Value;

  DoChanged;
end;

procedure TChromeTabModifiedDisplayOptions.SetEaseType(
  const Value: TChromeTabs32EaseType);
begin
  FEaseType := Value;

  DoChanged;
end;

procedure TChromeTabModifiedDisplayOptions.SetStyle(
  const Value: TChromeTabModifiedStyle);
begin
  FStyle := Value;

  DoChanged;
end;

procedure TChromeTabModifiedDisplayOptions.SetVerticalOffset(const Value: Integer);
begin
  FVerticalOffset := Value;

  DoChanged;
end;

procedure TChromeTabModifiedDisplayOptions.SetWidth(const Value: Integer);
begin
  FWidth := Value;

  DoChanged;
end;

{ TChromeTabs32LookAndFeelTabModified }

constructor TChromeTabs32LookAndFeelGlow.Create(AOwner: TPersistent);
begin
  inherited;

  FCenterColor := SetAlpha(clWhite32, 180);
  FOutsideColor := SetAlpha(clWhite32, 0);
end;

procedure TChromeTabs32LookAndFeelGlow.SetCenterColor(const Value: TColor32);
begin
  FCenterColor := Value;

  DoChanged;
end;

procedure TChromeTabs32LookAndFeelGlow.SetOutsideColor(const Value: TColor32);
begin
  FOutsideColor := Value;

  DoChanged;
end;


{ TChromeTabs32ContainerOptions }

procedure TChromeTabs32ContainerOptions.SetOverlayButtons(const Value: Boolean);
begin
  FOverlayButtons := Value;

  DoChanged;
end;

procedure TChromeTabs32ContainerOptions.SetPaddingLeft(const Value: Integer);
begin
  FPaddingLeft := Value;

  DoChanged;
end;

procedure TChromeTabs32ContainerOptions.SetPaddingRight(const Value: Integer);
begin
  FPaddingRight := Value;

  DoChanged;
end;

procedure TChromeTabs32ContainerOptions.SetTransparentBackground(
  const Value: Boolean);
begin
  FTransparentBackground := Value;

  DoChanged;
end;

{ TChromeTabs32LookAndFeelBaseFont }

constructor TChromeTabs32LookAndFeelBaseFont.Create(AOwner: TPersistent);
begin
  inherited;

  FName := 'Segoe UI';
  FColor := clBlack32;
  FSize := 9;
end;

procedure TChromeTabs32LookAndFeelBaseFont.SetColor(const Value: TColor32);
begin
  FColor := Value;

  DoChanged;
end;

procedure TChromeTabs32LookAndFeelBaseFont.SetName(const Value: TFontName);
begin
  FName := Value;

  DoChanged;
end;

procedure TChromeTabs32LookAndFeelBaseFont.SetSize(const Value: Integer);
begin
  FSize := Value;

  DoChanged;
end;


{ TChromeTabs32LookAndFeelFont }

constructor TChromeTabs32LookAndFeelFont.Create(AOwner: TPersistent);
begin
  inherited;

  FUseDefaultFont := True;
end;

procedure TChromeTabs32LookAndFeelFont.SetUseDefaultFont(const Value: Boolean);
begin
  FUseDefaultFont := Value;

  DoChanged;
end;

{ TChromeTabs32MovementAnimationEasing }

constructor TChromeTabs32MovementAnimations.Create(AOwner: TPersistent);
begin
  inherited Create(AOwner);

  FTabAdd := TChromeTabs32MovementAnimationTypes.Create(Self);
  FTabDelete := TChromeTabs32MovementAnimationTypes.Create(Self);
  FTabMove := TChromeTabs32MovementAnimationTypes.Create(Self);

  FTabMove.FUseDefaultEaseType := False;
  FTabMove.FUseDefaultAnimationTime := False;
  FTabMove.EaseType := ttEaseOutExpo;
  FTabMove.AnimationTimeMS := 500;
end;

destructor TChromeTabs32MovementAnimations.Destroy;
begin
  FreeAndNil(FTabAdd);
  FreeAndNil(FTabDelete);
  FreeAndNil(FTabMove);

  inherited;
end;

procedure TChromeTabs32MovementAnimations.SetTabAdd(
  const Value: TChromeTabs32MovementAnimationTypes);
begin
  FTabAdd.Assign(Value);

  DoChanged;
end;

procedure TChromeTabs32MovementAnimations.SetTabDelete(
  const Value: TChromeTabs32MovementAnimationTypes);
begin
  FTabDelete.Assign(Value);

  DoChanged;
end;

procedure TChromeTabs32MovementAnimations.SetTabMove(
  const Value: TChromeTabs32MovementAnimationTypes);
begin
  FTabMove.Assign(Value);

  DoChanged;
end;

{ TChromeTabs32MovementAnimationTypes }

constructor TChromeTabs32MovementAnimationTypes.Create(AOwner: TPersistent);
begin
  inherited;

  FUseDefaultEaseType := True;
  FUseDefaultAnimationTime := True;
  FEaseType := ttLinearTween;
  FAnimationTimeMS := 200;
end;

procedure TChromeTabs32MovementAnimationTypes.SetAnimationTimeMS(
  const Value: Integer);
begin
  FAnimationTimeMS := Value;
end;

procedure TChromeTabs32MovementAnimationTypes.SetEaseType(
  const Value: TChromeTabs32EaseType);
begin
  FEaseType := Value;
end;

procedure TChromeTabs32MovementAnimationTypes.SetUseDefaultAnimationTime(
  const Value: Boolean);
begin
  FUseDefaultAnimationTime := Value;
end;

procedure TChromeTabs32MovementAnimationTypes.SetUseDefaultEaseType(
  const Value: Boolean);
begin
  FUseDefaultEaseType := Value;
end;

{ TChromeTabs32SpinnersOptions }

constructor TChromeTabs32SpinnersOptions.Create(AOwner: TPersistent);
begin
  inherited;

  FUpload := TChromeTabs32SpinnerOptions.Create(Self);
  FDownload := TChromeTabs32SpinnerOptions.Create(Self);

  FUpload.ReverseDirection := True;
  FUpload.FRenderedAnimationStep := 2;
  FUpload.Position.Width := 16;
  FUpload.Position.Height := 16;
  FUpload.SweepAngle := 135;

  FDownload.ReverseDirection := False;
  FDownload.FRenderedAnimationStep := 5;
  FDownload.Position.Width := 16;
  FDownload.Position.Height := 16;
  FDownload.SweepAngle := 135;

  FAnimationUpdateMS := 50;
  FHideImagesWhenSpinnerVisible := True;
end;

destructor TChromeTabs32SpinnersOptions.Destroy;
begin
  FreeAndNil(FUpload);
  FreeAndNil(FDownload);

  inherited;
end;

procedure TChromeTabs32SpinnersOptions.SetAnimationUpdateMS(
  const Value: Cardinal);
begin
  FAnimationUpdateMS := Value;
end;

procedure TChromeTabs32SpinnersOptions.SetDownload(
  const Value: TChromeTabs32SpinnerOptions);
begin
  FDownload.Assign(Value);
end;

procedure TChromeTabs32SpinnersOptions.SetHideImagesWhenSpinnerVisible(
  const Value: Boolean);
begin
  FHideImagesWhenSpinnerVisible := Value;

  DoChanged;
end;

procedure TChromeTabs32SpinnersOptions.SetUpload(
  const Value: TChromeTabs32SpinnerOptions);
begin
  FUpload.Assign(Value);
end;

{ TChromeTabs32SpinnerOptions }

procedure TChromeTabs32SpinnerOptions.SetPosition(
  const Value: TChromeTabs32ControlPosition);
begin
  FPosition.Assign(Value);
end;

procedure TChromeTabs32SpinnerOptions.SetRenderedAnimationStep(
  const Value: Integer);
begin
  FRenderedAnimationStep := Value;

  DoChanged;
end;

procedure TChromeTabs32SpinnerOptions.SetReverseDirection(const Value: Boolean);
begin
  FReverseDirection := Value;

  DoChanged;
end;

constructor TChromeTabs32SpinnerOptions.Create(AOwner: TPersistent);
begin
  inherited;

  FPosition := TChromeTabs32ControlPosition.Create(Self);
end;

destructor TChromeTabs32SpinnerOptions.Destroy;
begin
  FreeAndNil(FPosition);

  inherited;
end;

procedure TChromeTabs32SpinnerOptions.SetSweepAngle(const Value: Word);
begin
  FSweepAngle := Value;

  DoChanged;
end;


{ TChromeTabs32LookAndFeelSpinners }

constructor TChromeTabs32LookAndFeelSpinners.Create(AOwner: TPersistent);
begin
  inherited;

  FUpload := TChromeTabs32LookAndFeelPen.Create(Self);
  FDownload := TChromeTabs32LookAndFeelPen.Create(Self);

  FUpload.Color := $FFA7B3C2;
  FUpload.Thickness := 2.5;

  FDownload.Color := $FF488bdb;
  FDownload.Thickness := 2.5;
end;

destructor TChromeTabs32LookAndFeelSpinners.Destroy;
begin
  FreeAndNil(FUpload);
  FreeAndNil(FDownload);

  inherited;
end;

procedure TChromeTabs32LookAndFeelSpinners.SetDownload(
  const Value: TChromeTabs32LookAndFeelPen);
begin
  FDownload.Assign(Value);

  DoChanged;
end;

procedure TChromeTabs32LookAndFeelSpinners.SetUpload(
  const Value: TChromeTabs32LookAndFeelPen);
begin
  FUpload.Assign(Value);

  DoChanged;
end;

end.
