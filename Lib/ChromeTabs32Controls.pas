unit ChromeTabs32Controls;

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
  System.SysUtils, System.Classes, System.Types, System.Math,
  Vcl.Controls, Vcl.ExtCtrls, Vcl.Forms, Vcl.GraphUtil, Vcl.ImgList,
  Vcl.Dialogs,
  WinApi.Windows, WinApi.Messages,
  Vcl.Graphics,
  {$ELSE}
  SysUtils, Classes,Math,
  Controls, ExtCtrls, Forms, GraphUtil, ImgList, Dialogs,
  Windows, Messages, Graphics,
  {$IFEND}

  GR32, GR32_Paths, GR32_Brushes, GR32_ColorGradients,

  ChromeTabs32Types,
  ChromeTabs32Utils,
  ChromeTabs32Classes;

type
  TBaseChromeTabs32Control = class(TObject)
  private
    FControlRect: TRect;
    FChromeTabs32: IChromeTabs32;
    FDrawState: TDrawState;
    FStartRect: TRect;
    FStartTicks: Cardinal;
    FCurrentTickCount: Cardinal;
    FEndRect: TRect;
    FPositionInitialised: Boolean;
    FScrollableControl: Boolean;
    FOverrideBidi: Boolean;
    FEaseType: TChromeTabs32EaseType;
    FAnimationTime: Cardinal;

    function GetBidiControlRect: TRect;
  protected
    FInvalidated: Boolean;
    FControlType: TChromeTabItemType;

    procedure DoChanged; virtual;

    procedure EndAnimation; virtual;
    procedure Invalidate; virtual;
    function ScrollRect(ARect: TRect): TRect;
    function BidiRect(ARect: TRect): TRect;
    property ChromeTabs32: IChromeTabs32 read FChromeTabs32;
  public
    constructor Create(ChromeTabs32: IChromeTabs32); virtual;

    procedure DrawTo(TabCanvas: TCanvas32; MouseX, MouseY: Integer; ClipPolygons: IChromeTabPolygons = nil); virtual; abstract;

    function InternalGetPolygons(ControlType: TChromeTabItemType; DefaultBrush: TSolidBrush; DefaultPen: TStrokeBrush): IChromeTabPolygons; virtual;
    function GetPolygons: IChromeTabPolygons; virtual; abstract;
    function AnimateMovement: Boolean; virtual;
    function AnimateStyle: Boolean; virtual;
    function ControlRectScrolled: TRect; virtual;
    function ContainsPoint(Pt: TPoint): Boolean; virtual;

    property ControlRect: TRect read FControlRect;
    property BiDiControlRect: TRect read GetBidiControlRect;
    function NewPolygon(ControlRect: TRect; const Polygon: array of TPoint; Orientation: TTabOrientation): TPolygon; virtual;
    function BidiPolygon(Polygon: TPolygon): TPolygon;

    property StartRect: TRect read FStartRect;
    property EndRect: TRect read FEndRect;

    procedure SetDrawState(const Value: TDrawState; AnimationTimeMS: Integer; EaseType: TChromeTabs32EaseType; ForceUpdate: Boolean = False); virtual;
    procedure SetPosition(ARect: TRect; AnimationTime: Cardinal; EaseType: TChromeTabs32EaseType); virtual;
    procedure SetHeight(const Value: Integer; AnimationTime: Cardinal; EaseType: TChromeTabs32EaseType); virtual;
    procedure SetWidth(const Value: Integer; AnimationTime: Cardinal; EaseType: TChromeTabs32EaseType); virtual;
    procedure SetLeft(const Value: Integer; AnimationTime: Cardinal; EaseType: TChromeTabs32EaseType); virtual;
    procedure SetTop(const Value: Integer; AnimationTime: Cardinal; EaseType: TChromeTabs32EaseType); virtual;

    property DrawState: TDrawState read FDrawState;
    property ControlType: TChromeTabItemType read FControlType;
    property ScrollableControl: Boolean read FScrollableControl write FScrollableControl;
    property OverrideBidi: Boolean read FOverrideBidi write FOverrideBidi;
  end;

  TChromeTabControlProperties = record
    FontColor: TColor;
    FontAlpha: Byte;
    FontName: String;
    FontSize: Integer;
//    TextRenderingMode: TTextRenderingHint;
    StartColor: TColor;
    StopColor: TColor;
    OutlineColor: TColor;
    OutlineSize: Single;
    OutlineAlpha: Integer;
    StartAlpha: Integer;
    StopAlpha: Integer;
  end;

  TChromeTabControlPropertyItems = class
  private
    FStartTickCount: Cardinal;
    FEndTickCount: Cardinal;
    FCurrentTickCount: Cardinal;
    FStartTabProperties: TChromeTabControlProperties;
    FStopTabProperties: TChromeTabControlProperties;
    FCurrentTabProperties: TChromeTabControlProperties;
    FEaseType: TChromeTabs32EaseType;
  public
    procedure SetProperties(Style: TChromeTabs32LookAndFeelStyle; StyleFont: TChromeTabs32LookAndFeelFont; DefaultFont: TChromeTabs32LookAndFeelBaseFont; EndTickCount: Cardinal; EaseType: TChromeTabs32EaseType);
    function TransformColors(ForceUpdate: Boolean): Boolean;
    procedure EndAnimation;

    property StartTabProperties: TChromeTabControlProperties read FStartTabProperties write FStartTabProperties;
    property StopTabProperties: TChromeTabControlProperties read FStopTabProperties write FStopTabProperties;
    property CurrentTabProperties: TChromeTabControlProperties read FCurrentTabProperties write FCurrentTabProperties;
    property StartTickCount: Cardinal read FStartTickCount;
    property EndTickCount: Cardinal read FEndTickCount;
    property CurrentTickCount: Cardinal read FCurrentTickCount;
  end;

  TChromeTabControl = class(TBaseChromeTabs32Control)
  private
    FChromeTab: IChromeTab;
    FBmp: TBitmap32;
    FCloseButtonState: TDrawState;
    FChromeTabControlPropertyItems: TChromeTabControlPropertyItems;
    FTabProperties: TChromeTabs32LookAndFeelStyleProperties;
    FTabFiller: TLinearGradientPolygonFiller;
    FTabBrush: TSolidBrush;
    FTabPen: TStrokeBrush;
    FModifiedPosition: Integer;
    FModifiedMovingLeft: Boolean;
    FPenInvalidated: Boolean;
    FBrushInvalidated: Boolean;
    FCloseButtonInvalidate: Boolean;
    FModifiedStartTicks: Cardinal;
    FSpinnerImageIndex: Integer;
    FSpinnerRenderedDegrees: Integer;

    function CloseButtonVisible: Boolean;
    function GetTabBrush: TSolidBrush;
    function GetTabPen: TStrokeBrush;
    function ImageVisible(ImageList: TCustomImageList; ImageIndex: Integer): Boolean;
    procedure CalculateRects(var ImageRect, TextRect, CloseButtonRect,
      CloseButtonCrossRect: TRect; var NormalImageVisible, OverlayImageVisible, SpinnerVisible,
      TextVisible: Boolean);
    function GetSpinnerImageList: TCustomImageList;
  protected
    procedure SetCloseButtonState(const Value: TDrawState); virtual;
    procedure EndAnimation; override;
  public
    constructor Create(ChromeTabs32: IChromeTabs32; TabInterface: IChromeTab); reintroduce;
    destructor Destroy; override;

    procedure Invalidate; override;
    function AnimateStyle: Boolean; override;
    function AnimateModified: Boolean; virtual;
    function AnimateSpinner: Boolean; virtual;
    procedure DrawTo(TabCanvas: TCanvas32; MouseX, MouseY: Integer; ClipPolygons: IChromeTabPolygons = nil); override;
    function GetPolygons: IChromeTabPolygons; override;
    function GetHitTestArea(MouseX, MouseY: Integer): THitTestArea;
    function GetCloseButonRect: TRect;
    function GetCloseButtonCrossRect: TRect;
    procedure SetDrawState(const Value: TDrawState; AnimationTimeMS: Integer; EaseType: TChromeTabs32EaseType; ForceUpdate: Boolean = False); override;
    function GetTabWidthByContent: Integer;

    property CloseButtonState: TDrawState read FCloseButtonState write SetCloseButtonState;
    property ChromeTab: IChromeTab read FChromeTab;
  end;

  TBaseChromeButtonControl = class(TBaseChromeTabs32Control)
  private
    FButtonGradient: TLinearGradientPolygonFiller;
    FButtonBrush: TSolidBrush;
    FButtonPen: TStrokeBrush;
    FSymbolGradient: TLinearGradientPolygonFiller;
    FSymbolBrush: TSolidBrush;
    FSymbolPen: TStrokeBrush;
  protected
    FButtonControlPropertyItems: TChromeTabControlPropertyItems;
    FSymbolControlPropertyItems: TChromeTabControlPropertyItems;

    FButtonStyle: TChromeTabs32LookAndFeelStyle;
    FSymbolStyle: TChromeTabs32LookAndFeelStyle;

    function GetButtonBrush: TSolidBrush; virtual;
    function GetButtonPen: TStrokeBrush; virtual;
    function GetSymbolBrush: TSolidBrush; virtual;
    function GetSymbolPen: TStrokeBrush; virtual;

    procedure SetStylePropertyClasses; virtual;
  public
    constructor Create(ChromeTabs32: IChromeTabs32); override;
    destructor Destroy; override;

    function AnimateStyle: Boolean; override;

    procedure Invalidate; override;

    procedure SetDrawState(const Value: TDrawState; AnimationTimeMS: Integer; EaseType: TChromeTabs32EaseType; ForceUpdate: Boolean = False); override;
  end;

  TAddButtonControl = class(TBaseChromeButtonControl)
  protected
    procedure SetStylePropertyClasses; override;
  public
    constructor Create(ChromeTabs32: IChromeTabs32); override;

    procedure DrawTo(TabCanvas: TCanvas32; MouseX, MouseY: Integer; ClipPolygons: IChromeTabPolygons = nil); override;
    function GetPolygons: IChromeTabPolygons; override;
  end;

  TScrollButtonControl = class(TBaseChromeButtonControl)
  protected
    procedure SetStylePropertyClasses; override;
    function GetArrowPolygons(Direction: TChromeTabDirection): IChromeTabPolygons;
  public
    procedure DrawTo(TabCanvas: TCanvas32; MouseX, MouseY: Integer; ClipPolygons: IChromeTabPolygons = nil); override;
  end;

  TScrollButtonLeftControl = class(TScrollButtonControl)
  public
    constructor Create(ChromeTabs32: IChromeTabs32); override;

    procedure DrawTo(TabCanvas: TCanvas32; MouseX, MouseY: Integer; ClipPolygons: IChromeTabPolygons = nil); override;
    function GetPolygons: IChromeTabPolygons; override;
  end;

  TScrollButtonRightControl = class(TScrollButtonControl)
  public
    constructor Create(ChromeTabs32: IChromeTabs32); override;

    procedure DrawTo(TabCanvas: TCanvas32; MouseX, MouseY: Integer; ClipPolygons: IChromeTabPolygons = nil); override;
    function GetPolygons: IChromeTabPolygons; override;
  end;

implementation

{ TBaseChromeTabControl }

function TBaseChromeTabs32Control.ScrollRect(ARect: TRect): TRect;
begin
  if FScrollableControl then
    Result := ChromeTabs32.ScrollRect(ARect)
  else
    Result := ARect;
end;

function TBaseChromeTabs32Control.BidiPolygon(Polygon: TPolygon): TPolygon;
begin
  if ChromeTabs32.GetBiDiMode in BidiRightToLeftTabModes then
    Result := HorzFlipPolygon(BidiControlRect, Polygon)
  else
    Result := Polygon;
end;

function TBaseChromeTabs32Control.BidiRect(ARect: TRect): TRect;
begin
  if ChromeTabs32.GetBiDiMode in BidiRightToLeftTabModes then
    Result := HorzFlipRect(BidiControlRect, HorzFlipRect(BidiControlRect, ChromeTabs32.BidiRect(ARect)))
  else
    Result := ARect;
end;

function TBaseChromeTabs32Control.NewPolygon(ControlRect: TRect; const Polygon: Array of TPoint; Orientation: TTabOrientation): TPolygon;
var
  ScrolledRect: TRect;
begin
  ScrolledRect := ScrollRect(ControlRect);

  Result := GeneratePolygon(ScrolledRect, Polygon, Orientation);
end;

function TBaseChromeTabs32Control.AnimateMovement: Boolean;
begin
  Result := (FStartTicks > 0) and (FCurrentTickCount < FAnimationTime);

  if Result then
  begin
    FCurrentTickCount := GetTickCount - FStartTicks;

    if FCurrentTickCount > FAnimationTime then
      FCurrentTickCount := FAnimationTime;

    FControlRect := TransformRect(FStartRect,
                                  FEndRect,
                                  FCurrentTickCount,
                                  FAnimationTime,
                                  FEaseType);
  end;
end;

function TBaseChromeTabs32Control.AnimateStyle: Boolean;
begin
  Result := False;
end;

function TBaseChromeTabs32Control.ContainsPoint(Pt: TPoint): Boolean;
var
  i: Integer;
  ChromeTabPolygons: IChromeTabPolygons;
begin
  Result := False;

  ChromeTabPolygons := GetPolygons;

  for i := 0 to pred(ChromeTabPolygons.PolygonCount) do
    if PointInPolygon(ChromeTabPolygons.Polygons[i].Polygon, Pt.X, Pt.Y) then
    begin
      Result := True;

      Break;
    end;
end;

function TBaseChromeTabs32Control.ControlRectScrolled: TRect;
begin
  Result := ChromeTabs32.ScrollRect(ControlRect);
end;

constructor TBaseChromeTabs32Control.Create(
  ChromeTabs32: IChromeTabs32);
begin
  FChromeTabs32 := ChromeTabs32;

  FPositionInitialised := False;
  FScrollableControl := False;
end;

procedure TBaseChromeTabs32Control.DoChanged;
begin
  FChromeTabs32.DoOnChange(nil, tcControlState);
end;

procedure TBaseChromeTabs32Control.EndAnimation;
begin
  // Override if required
end;

function TBaseChromeTabs32Control.GetBidiControlRect: TRect;
begin
  if FOverrideBidi then
    Result := FControlRect
  else
    Result := ChromeTabs32.BidiRect(FControlRect);
end;

function TBaseChromeTabs32Control.InternalGetPolygons(ControlType: TChromeTabItemType; DefaultBrush: TSolidBrush; DefaultPen: TStrokeBrush): IChromeTabPolygons;
var
  i: Integer;
begin
  Result := nil;

  ChromeTabs32.DoOnGetControlPolygons(Self, ControlRect, ControlType, ChromeTabs32.GetOptions.Display.Tabs.Orientation, Result);

  if Result <> nil then
  begin
    for i := 0 to pred(Result.PolygonCount) do
    begin
      if Result.Polygons[i].Brush = nil then
        Result.Polygons[i].Brush := DefaultBrush;

      if Result.Polygons[i].Pen = nil then
        Result.Polygons[i].Pen := DefaultPen;
    end;
  end;
end;

procedure TBaseChromeTabs32Control.Invalidate;
begin
  FInvalidated := True;
end;

procedure TBaseChromeTabs32Control.SetDrawState(const Value: TDrawState; AnimationTimeMS: Integer; EaseType: TChromeTabs32EaseType; ForceUpdate: Boolean);
begin
  // Override in descendants if animation is required
  if (ForceUpdate) or (FDrawState <> Value) then
  begin
    FDrawState := Value;

    DoChanged;
  end;
end;

procedure TBaseChromeTabs32Control.SetHeight(const Value: Integer; AnimationTime: Cardinal; EaseType: TChromeTabs32EaseType);
begin
  SetPosition(Rect(FControlRect.Left,
                   FControlRect.Top,
                   FControlRect.Right,
                   FControlRect.Top + Value),
              AnimationTime,
              EaseType);
end;

procedure TBaseChromeTabs32Control.SetLeft(const Value: Integer; AnimationTime: Cardinal; EaseType: TChromeTabs32EaseType);
begin
  SetPosition(Rect(Value,
                   FControlRect.Top,
                   RectWidth(FControlRect) + Value,
                   FControlRect.Bottom),
              AnimationTime,
              EaseType);
end;

procedure TBaseChromeTabs32Control.SetWidth(const Value: Integer; AnimationTime: Cardinal; EaseType: TChromeTabs32EaseType);
begin
  SetPosition(Rect(FControlRect.Left,
                   FControlRect.Top,
                   FControlRect.Left + Value,
                   FControlRect.Bottom),
              AnimationTime,
              EaseType);
end;

procedure TBaseChromeTabs32Control.SetTop(const Value: Integer; AnimationTime: Cardinal; EaseType: TChromeTabs32EaseType);
begin
  SetPosition(Rect(FControlRect.Left,
                   Value,
                   FControlRect.Right,
                   RectHeight(FControlRect) + Value),
              AnimationTime,
              EaseType);
end;

procedure TBaseChromeTabs32Control.SetPosition(ARect: TRect; AnimationTime: Cardinal; EaseType: TChromeTabs32EaseType);
begin
  FEaseType := EaseType;
  FAnimationTime := AnimationTime;

  if (FPositionInitialised) and
     (EaseType <> ttNone) then
  begin
    // If we want to animate, or we are curently animating,
    // set the destination Rect and calculate the animation increments
    if not SameRect(FEndRect, ARect) then
    begin
      FEndRect := ARect;
      FStartRect := FControlRect;

      FStartTicks := GetTickCount;
      FCurrentTickCount := 0;
    end;
  end
  else
  begin
    // Set the flag to indicate that we're set the initial position
    FPositionInitialised := True;

    EndAnimation;

    // Otherwise, set the destination Rect
    FControlRect := ARect;
    FStartRect := ARect;
    FEndRect := ARect;

    FStartTicks := FAnimationTime;
    FCurrentTickCount := FStartTicks;
  end;
end;


{ TAddButtonControl }

function TAddButtonControl.GetPolygons: IChromeTabPolygons;
var
  LeftOffset, TopOffset: Integer;
begin
  Result := InternalGetPolygons(itAddButton, GetButtonBrush, GetButtonPen);

  if Result = nil then
  begin
    Result := TChromeTabPolygons.Create;

    Result.AddPolygon(BidiPolygon(NewPolygon(BidiControlRect,
      [
        GR32.Point(7, RectHeight(BidiControlRect)),
        GR32.Point(4, RectHeight(BidiControlRect) - 2),
        GR32.Point(0, 2),
        GR32.Point(1, 0),
        GR32.Point(RectWidth(BidiControlRect) - 7, 0),
        GR32.Point(RectWidth(BidiControlRect) - 4, 2),
        GR32.Point(RectWidth(BidiControlRect), RectHeight(BidiControlRect) - 2),
        GR32.Point(RectWidth(BidiControlRect), RectHeight(BidiControlRect))
      ],
      ChromeTabs32.GetOptions.Display.Tabs.Orientation)),
      GetButtonBrush, GetButtonPen);

    if ChromeTabs32.GetOptions.Display.AddButton.ShowPlusSign then
    begin
      LeftOffset := (ChromeTabs32.GetOptions.Display.AddButton.Width div 2) - 4;
      TopOffset := (ChromeTabs32.GetOptions.Display.AddButton.Height div 2) - 4;

      Result.AddPolygon(BidiPolygon(NewPolygon(
        Rect(BidiControlRect.Left + LeftOffset,
          BidiControlRect.Top + TopOffset,
          BidiControlRect.Right - LeftOffset,
          BidiControlRect.Bottom - TopOffset),
      [
        GR32.Point(0, 3),
        GR32.Point(3, 3),
        GR32.Point(3, 0),
        GR32.Point(6, 0),
        GR32.Point(6, 3),
        GR32.Point(9, 3),
        GR32.Point(9, 6),
        GR32.Point(6, 6),
        GR32.Point(6, 9),
        GR32.Point(3, 9),
        GR32.Point(3, 6),
        GR32.Point(0, 6),
        GR32.Point(0, 3)
      ],
      ChromeTabs32.GetOptions.Display.Tabs.Orientation)),
      GetSymbolBrush,
      GetSymbolPen);
    end;
  end;
end;

procedure TAddButtonControl.SetStylePropertyClasses;
begin
  case FDrawState of
    dsDown:
      begin
        FButtonStyle := ChromeTabs32.GetLookAndFeel.AddButton.Button.Down;
        FSymbolStyle := ChromeTabs32.GetLookAndFeel.AddButton.PlusSign.Down;
      end;

    dsHot:
      begin
        FButtonStyle := ChromeTabs32.GetLookAndFeel.AddButton.Button.Hot;
        FSymbolStyle := ChromeTabs32.GetLookAndFeel.AddButton.PlusSign.Hot;
      end
  else
    begin
      FButtonStyle := ChromeTabs32.GetLookAndFeel.AddButton.Button.Normal;
      FSymbolStyle := ChromeTabs32.GetLookAndFeel.AddButton.PlusSign.Normal;
    end;
  end;
end;

constructor TAddButtonControl.Create(ChromeTabs32: IChromeTabs32);
begin
  inherited Create(ChromeTabs32);

  FControlType := itAddButton;

  FButtonStyle := ChromeTabs32.GetLookAndFeel.AddButton.Button.Normal;
  FSymbolStyle := ChromeTabs32.GetLookAndFeel.AddButton.PlusSign.Normal;
end;

procedure TAddButtonControl.DrawTo(TabCanvas: TCanvas32; MouseX, MouseY: Integer; ClipPolygons: IChromeTabPolygons);
var
  Handled: Boolean;
begin
  ChromeTabs32.DoOnBeforeDrawItem(TabCanvas, ControlRect, itAddButton, -1, Handled);

  if not Handled then
    GetPolygons.DrawTo(TabCanvas);

  ChromeTabs32.DoOnAfterDrawItem(TabCanvas, ControlRect, itAddButton, -1);
end;


{ TChromeTabControl }

constructor TChromeTabControl.Create(ChromeTabs32: IChromeTabs32; TabInterface: IChromeTab);
begin
  inherited Create(ChromeTabs32);

  FChromeTabControlPropertyItems := TChromeTabControlPropertyItems.Create;

  FBmp := TBitmap32.Create;

  FControlType := itTab;

  FChromeTab := TabInterface;

  FTabFiller := TLinearGradientPolygonFiller.Create;

  FScrollableControl := True;
end;

destructor TChromeTabControl.Destroy;
begin
  FreeAndNil(FTabBrush);
  FreeAndNil(FTabPen);

  FreeAndNil(FBmp);
  FreeAndNil(FChromeTabControlPropertyItems);

  inherited;
end;

function TChromeTabControl.GetHitTestArea(MouseX, MouseY: Integer): THitTestArea;
var
  TabPolygon: IChromeTabPolygons;
  CloseRect: TRect;
  i: Integer;
begin
  TabPolygon := GetPolygons;

  Result := htBackground;

  if CloseButtonVisible then
  begin
    CloseRect := ChromeTabs32.ScrollRect(BidiRect(GetCloseButonRect));

    if PtInRect(CloseRect, GR32.Point(MouseX, MouseY)) then
    begin
      Result := htCloseButton;

      Exit;
    end;
  end;

  for i := 0 to pred(TabPolygon.PolygonCount) do
  begin
    if PointInPolygon(TabPolygon.Polygons[i].Polygon, MouseX, MouseY) then
    begin
      Result := htTab;

      Break;
    end;
  end;
end;

function TChromeTabControl.AnimateModified: Boolean;
var
  TickCount: Cardinal;
  LowX, HighX: Integer;
  ScrolledRect: TRect;
  Distance: Integer;
begin
  Result := (FChromeTab.GetModified) and
            (ChromeTabs32.GetOptions.Display.TabModifiedGlow.Style <> msNone);

  if Result then
  begin
    TickCount := GetTickCount;

    if (FModifiedStartTicks = 0) or
       (TickCount - FModifiedStartTicks > Cardinal(ChromeTabs32.GetOptions.Display.TabModifiedGlow.AnimationPeriodMS)) then
    begin
      if TickCount - FModifiedStartTicks > Cardinal(ChromeTabs32.GetOptions.Display.TabModifiedGlow.AnimationPeriodMS) then
        FModifiedMovingLeft := not FModifiedMovingLeft;

      FModifiedStartTicks := TickCount;
    end;

    ScrolledRect := ScrollRect(ControlRect);

    LowX := ScrolledRect.Left - (ChromeTabs32.GetOptions.Display.TabModifiedGlow.Width);
    HighX := ScrolledRect.Right;

    Distance := Round(CalculateEase(TickCount - FModifiedStartTicks,
                                    0,
                                    HighX - LowX,
                                    ChromeTabs32.GetOptions.Display.TabModifiedGlow.AnimationPeriodMS,
                                    ChromeTabs32.GetOptions.Display.TabModifiedGlow.EaseType));

    if (ChromeTabs32.GetOptions.Display.TabModifiedGlow.Style = msRightToLeft) or
       ((ChromeTabs32.GetOptions.Display.TabModifiedGlow.Style = msKnightRider) and (FModifiedMovingLeft)) then
      FModifiedPosition := LowX + (HighX - LowX) - Distance
    else
      FModifiedPosition := LowX + Distance;
  end
  else
    FModifiedStartTicks := 0;
end;

function TChromeTabControl.GetSpinnerImageList: TCustomImageList;
begin
  case ChromeTab.GetSpinnerState of
    tssImageUpload: Result := ChromeTabs32.GetImagesSpinnerUpload;
    tssImageDownload: Result := ChromeTabs32.GetImagesSpinnerDownload;
  else
    Result := nil;
  end;
end;

function TChromeTabControl.AnimateSpinner: Boolean;

  procedure UpdateSpinnerAngle(SpinnerOptions: TChromeTabs32SpinnerOptions);
  begin
    if SpinnerOptions.ReverseDirection then
    begin
      Dec(FSpinnerRenderedDegrees, SpinnerOptions.RenderedAnimationStep);

      if FSpinnerRenderedDegrees < 0 then
        FSpinnerRenderedDegrees := 360 + FSpinnerRenderedDegrees;
    end
    else
    begin
      Inc(FSpinnerRenderedDegrees, SpinnerOptions.RenderedAnimationStep);

      if FSpinnerRenderedDegrees > 360 then
        FSpinnerRenderedDegrees := FSpinnerRenderedDegrees - 360;
    end;
  end;

var
  Images: TCustomImageList;
begin
  Images := GetSpinnerImageList;

  Result := (Images <> nil) or
            (ChromeTab.GetSpinnerState in [tssRenderedUpload, tssRenderedDownload]);

  if Result then
  begin
    case ChromeTab.GetSpinnerState of
      tssRenderedUpload:
        begin
          UpdateSpinnerAngle(ChromeTabs32.GetOptions.Display.TabSpinners.Upload);
        end;

      tssRenderedDownload:
        begin
          UpdateSpinnerAngle(ChromeTabs32.GetOptions.Display.TabSpinners.Download);
        end;

      tssImageUpload:
        begin
          Dec(FSpinnerImageIndex);

          if FSpinnerImageIndex < 0 then
            FSpinnerImageIndex := pred(Images.Count);
        end;

      tssImageDownload:
        begin
          Inc(FSpinnerImageIndex);

          if FSpinnerImageIndex >= Images.Count then
            FSpinnerImageIndex := 0;
        end;
    end;
  end;
end;

function TChromeTabControl.AnimateStyle: Boolean;
begin
  Result := FChromeTabControlPropertyItems.TransformColors(False);

  if Result then
    Invalidate;
end;

function TChromeTabControl.CloseButtonVisible: Boolean;
begin
  if (not ChromeTab.GetActive) and
     (RectWidth(ControlRect) -
      ChromeTabs32.GetOptions.Display.Tabs.ContentOffsetRight -
      ChromeTabs32.GetOptions.Display.Tabs.ContentOffsetLeft <= ChromeTabs32.GetOptions.Display.CloseButton.AutoHideWidth) then
    Result := False
  else
  begin
    // Hide the close button on all tabs if we have the hide close button override set
    if ChromeTab.GetHideCloseButton then
    begin
      Result := False;
    end
    else
    begin
      case ChromeTabs32.GetOptions.Display.CloseButton.Visibility of
        bvAll: Result := not ChromeTab.GetPinned;
        bvActive: Result := (not ChromeTab.GetPinned) and (FDrawState = dsActive);
      else
        Result := False;
      end;
    end;
  end;
end;

function TChromeTabControl.ImageVisible(ImageList: TCustomImageList; ImageIndex: Integer): Boolean;
begin
  Result :=
    (ChromeTabs32.GetOptions.Display.Tabs.ShowImages) and
    (ImageList <> nil) and
    (ImageIndex >= 0) and
    (ImageIndex < ImageList.Count);
end;

procedure TChromeTabControl.Invalidate;
begin
  inherited;

  FPenInvalidated := True;
  FBrushInvalidated := True;
  FCloseButtonInvalidate := True;
end;

function TChromeTabControl.GetPolygons: IChromeTabPolygons;
begin
  Result := InternalGetPolygons(itTab, GetTabBrush, GetTabPen);

  if Result = nil then
  begin
    Result := TChromeTabPolygons.Create;

    Result.AddPolygon(NewPolygon(BidiControlRect,
      [
        GR32.Point(0, RectHeight(ControlRect)),
        GR32.Point(4, RectHeight(ControlRect) - 3),
        GR32.Point(12, 3),
        GR32.Point(13, 2),
        GR32.Point(14, 1),
        GR32.Point(16, 0),
        GR32.Point(RectWidth(ControlRect) - 16, 0),
        GR32.Point(RectWidth(ControlRect) - 14, 1),
        GR32.Point(RectWidth(ControlRect) - 13, 2),
        GR32.Point(RectWidth(ControlRect) - 12, 3),
        GR32.Point(RectWidth(ControlRect) - 4, RectHeight(ControlRect) - 3),
        GR32.Point(RectWidth(ControlRect), RectHeight(ControlRect))
      ],
      ChromeTabs32.GetOptions.Display.Tabs.Orientation),
      GetTabBrush, GetTabPen);
  end;
end;

function TChromeTabControl.GetCloseButonRect: TRect;
begin
  Result.Left := ControlRect.Right -
    ChromeTabs32.GetOptions.Display.Tabs.ContentOffsetRight -
    ChromeTabs32.GetOptions.Display.CloseButton.Width -
    ChromeTabs32.GetOptions.Display.CloseButton.Offsets.Horizontal;
  Result.Top := ControlRect.Top +
    ChromeTabs32.GetOptions.Display.CloseButton.Offsets.Vertical;
  Result.Right := Result.Left +
    ChromeTabs32.GetOptions.Display.CloseButton.Width;
  Result.Bottom := Result.Top +
    ChromeTabs32.GetOptions.Display.CloseButton.Height;
end;

function TChromeTabControl.GetCloseButtonCrossRect: TRect;
begin
  Result := GetCloseButonRect;

  Result := Rect(
    Result.Left + ChromeTabs32.GetOptions.Display.CloseButton.CrossRadialOffset,
    Result.Top + ChromeTabs32.GetOptions.Display.CloseButton.CrossRadialOffset,
    Result.Right - ChromeTabs32.GetOptions.Display.CloseButton.CrossRadialOffset,
    Result.Bottom - ChromeTabs32.GetOptions.Display.CloseButton.CrossRadialOffset);
end;

function TChromeTabControl.GetTabBrush: TSolidBrush;
var
  ControlProperties: TChromeTabControlProperties;
begin
  if FBrushInvalidated then
  begin
    FBrushInvalidated := False;

    FreeAndNil(FTabBrush);
  end;

  if FTabBrush = nil then
  begin
    ControlProperties := FChromeTabControlPropertyItems.CurrentTabProperties;
    FTabBrush := TSolidBrush.Create(nil);
    FTabBrush.Filler := FTabFiller;
    FTabFiller.SimpleGradientY(
      ControlRect.Top, SetAlpha(Color32(ControlProperties.StartColor), ControlProperties.StartAlpha),
      ControlRect.Bottom, SetAlpha(ControlProperties.StopColor, ControlProperties.StopAlpha));
  end;

  Result := FTabBrush;
end;

function TChromeTabControl.GetTabPen: TStrokeBrush;
var
  ControlProperties: TChromeTabControlProperties;
begin
  if FPenInvalidated then
  begin
    FPenInvalidated := False;

    FreeAndNil(FTabPen);
  end;

  if FTabPen = nil then
  begin
    ControlProperties := FChromeTabControlPropertyItems.CurrentTabProperties;
    FTabPen := TStrokeBrush.Create(nil);
    FTabPen.FillColor := SetAlpha(Color32(ControlProperties.OutlineColor), ControlProperties.OutlineAlpha);
    FTabPen.StrokeWidth := ControlProperties.OutlineSize;
  end;

  Result := FTabPen;
end;

function TChromeTabControl.GetTabWidthByContent: Integer;
var
  TabCanvas: TCanvas32;
  FltRect: TFloatRect;
  Bitmap: TBitmap32;
  ImageRect, TextRect, CloseButtonRect, CloseButtonCrossRect: TRect;
  NormalImageVisible, OverlayImageVisible, SpinnerVisible, TextVisible: Boolean;
  RightOffset: Integer;
  ScrolledRect: TRect;
begin
  Bitmap := TBitmap32.Create;
  try
    Bitmap.Width := ChromeTabs32.GetOptions.Display.Tabs.MaxWidth;
    Bitmap.Height := RectHeight(ControlRect);

    TabCanvas := TCanvas32.Create(Bitmap);
    Bitmap.Font.Name := FChromeTabControlPropertyItems.StopTabProperties.FontName;
    Bitmap.Font.Size := FChromeTabControlPropertyItems.CurrentTabProperties.FontSize;
    try
      FltRect := TabCanvas.MeasureText(FloatRect(0, 0, 1000,
        RectHeight(ControlRect)), ChromeTab.GetCaption, 0);

      CalculateRects(ImageRect, TextRect, CloseButtonRect, CloseButtonCrossRect,
         NormalImageVisible, OverlayImageVisible, SpinnerVisible, TextVisible);

      ScrolledRect := ScrollRect(ControlRect);

      if NormalImageVisible or OverlayImageVisible or SpinnerVisible then
        RightOffset := ImageRect.Right
      else
        RightOffset := ScrolledRect.Left + ChromeTabs32.GetOptions.Display.Tabs.ContentOffsetLeft;

      Result :=
        Round(FltRect.Right - FltRect.Left) +
        (RightOffset - ScrolledRect.Left) +
        (ScrolledRect.Right - CloseButtonRect.Left) -
        (ChromeTabs32.GetOptions.Display.Tabs.TabOverlap);
    finally
      FreeAndNil(TabCanvas);
    end;
  finally
    FreeAndNil(Bitmap);
  end;
end;

procedure TChromeTabControl.CalculateRects(var ImageRect, TextRect,
  CloseButtonRect, CloseButtonCrossRect: TRect;
  var NormalImageVisible, OverlayImageVisible, SpinnerVisible, TextVisible: Boolean);
var
  LeftOffset, RightOffset, ImageWidth, ImageHeight: Integer;
begin
  // Get the close button rect
  CloseButtonRect := GetCloseButonRect;
  CloseButtonCrossRect := GetCloseButtonCrossRect;

  if CloseButtonVisible then
  begin
    RightOffset := CloseButtonRect.Left - 1
  end
  else
  begin
    RightOffset := ControlRect.Right - ChromeTabs32.GetOptions.Display.Tabs.ContentOffsetRight;
    CloseButtonRect.Left := CloseButtonRect.Right;
  end;

  // Get image size
  LeftOffset := ControlRect.Left + ChromeTabs32.GetOptions.Display.Tabs.ContentOffsetLeft;

  NormalImageVisible := ImageVisible(ChromeTabs32.GetImages, ChromeTab.GetImageIndex);
  OverlayImageVisible := ImageVisible(ChromeTabs32.GetImagesOverlay, ChromeTab.GetImageIndexOverlay);
  SpinnerVisible := (ChromeTab.GetSpinnerState <> tssNone) and (not (csDesigning in ChromeTabs32.GetComponentState));

  ImageWidth := 0;
  ImageHeight := 0;

  if SpinnerVisible then
  begin
    if ChromeTab.GetSpinnerState = tssRenderedUpload then
    begin
      ImageWidth := ChromeTabs32.GetOptions.Display.TabSpinners.Upload.Position.Width;
      ImageHeight := ChromeTabs32.GetOptions.Display.TabSpinners.Upload.Position.Height;
    end
    else
    begin
      ImageWidth := ChromeTabs32.GetOptions.Display.TabSpinners.Download.Position.Width;
      ImageHeight := ChromeTabs32.GetOptions.Display.TabSpinners.Download.Position.Height;
    end;
  end;

  if ((not SpinnerVisible) or
      (not ChromeTabs32.GetOptions.Display.TabSpinners.HideImagesWhenSpinnerVisible)) and
     (NormalImageVisible) or
     (OverlayImageVisible) then
  begin
    if ChromeTabs32.GetImages.Width > ImageWidth then
      ImageWidth := ChromeTabs32.GetImages.Width;

    if ChromeTabs32.GetImages.Height > ImageHeight then
      ImageHeight := ChromeTabs32.GetImages.Height;
  end;

  if OverlayImageVisible then
  begin
    if ChromeTabs32.GetImagesOverlay.Width > ChromeTabs32.GetImagesOverlay.Width then
      ImageWidth := ChromeTabs32.GetImagesOverlay.Width;

    if ChromeTabs32.GetImagesOverlay.Height > ChromeTabs32.GetImagesOverlay.Height then
      ImageHeight := ChromeTabs32.GetImagesOverlay.Height;
  end;

  // Does the image fit between the left margin and the close button?
  if LeftOffset + ImageWidth > RightOffset then
  begin
    NormalImageVisible := False;
    OverlayImageVisible := False;
    SpinnerVisible := False;
  end
  else
  begin
    // Should we centre the image?
    if (ChromeTab.GetPinned) and
       (not ChromeTabs32.GetOptions.Display.Tabs.ShowPinnedTabText) then
      ImageRect := Rect(ControlRect.Left + (RectWidth(ControlRect) div 2) - (ImageWidth div 2),
                        ControlRect.Top + (RectHeight(ControlRect) div 2) - (ImageHeight div 2),
                        ControlRect.Left + (RectWidth(ControlRect) div 2) - (RectWidth(CloseButtonRect) div 2) + ImageHeight,
                        (ControlRect.Top + (RectHeight(ControlRect) div 2) - (ImageHeight div 2)) + ImageHeight)
    else
    begin
      ImageRect := Rect(LeftOffset,
                        ControlRect.Top + (RectHeight(ControlRect) div 2) - (ImageHeight div 2),
                        LeftOffset + ImageWidth,
                        (ControlRect.Top + (RectHeight(ControlRect) div 2) - (ImageHeight div 2)) + ImageHeight);

      LeftOffset := LeftOffset + ImageWidth + 1;
    end;
  end;

  // Does the Text fit?
  TextVisible := ((not ChromeTab.GetPinned) or
                  (ChromeTabs32.GetOptions.Display.Tabs.ShowPinnedTabText)) and
                 (RightOffset - LeftOffset >= 5);

  if TextVisible then
  begin
    TextRect := Rect(LeftOffset,
                     ControlRect.Top,
                     RightOffset,
                     ControlRect.Bottom);
  end;

  if (CloseButtonVisible) and
     (not TextVisible) and
     (not NormalImageVisible) and
     (not OverlayImageVisible) and
     (not SpinnerVisible) then
  begin
    // If only the close button is visible, we need to centre it
    CloseButtonRect := Rect(ControlRect.Left + (RectWidth(ControlRect) div 2) - (RectWidth(CloseButtonRect) div 2),
                            CloseButtonRect.Top,
                            ControlRect.Left + (RectWidth(ControlRect) div 2) - (RectWidth(CloseButtonRect) div 2) + RectWidth(CloseButtonRect),
                            CloseButtonRect.Bottom);

    CloseButtonCrossRect := Rect(ControlRect.Left + (RectWidth(ControlRect) div 2) - (RectWidth(CloseButtonCrossRect) div 2),
                                 CloseButtonCrossRect.Top,
                                 ControlRect.Left + (RectWidth(ControlRect) div 2) - (RectWidth(CloseButtonCrossRect) div 2) + RectWidth(CloseButtonCrossRect),
                                 CloseButtonCrossRect.Bottom);
  end;

  ImageRect := ScrollRect(BidiRect(ImageRect));
  TextRect := ScrollRect(BidiRect(TextRect));
  CloseButtonRect := ScrollRect(BidiRect(CloseButtonRect));
  CloseButtonCrossRect := ScrollRect(BidiRect(CloseButtonCrossRect));
end;

procedure TChromeTabControl.DrawTo(TabCanvas: TCanvas32; MouseX, MouseY: Integer; ClipPolygons: IChromeTabPolygons);

(* TODO
  procedure DrawGDITextWithOffset(const Text: String; TextRect: TRect; OffsetX, OffsetY: Integer; FontColor: TColor; Alpha: Byte; TextHint: TextRenderingHint);
  const
    BlendFactorsNormal: array[0..2] of Single = (0.0, 0.0, 0.0);
  var
    TabsFont: TGPFont;
    GPRect: TGPRectF;
    TxtFormat: TGPStringFormat;
    TabsTxtBrush: TLinearGradientPolygonFiller;
    TextFormatFlags: Integer;
    TabText: String;
    TextSize: Integer;
    BlendPositions: array[0..2] of Single;
    BlendFactorsFade: array[0..2] of Single;
  begin
    if ChromeTabs32.GetOptions.Behaviour.DebugMode then
      TextSize := 7
    else
      TextSize := FChromeTabControlPropertyItems.CurrentTabProperties.FontSize;

    TabsFont := TGPFont.Create(FChromeTabControlPropertyItems.StopTabProperties.FontName, TextSize);
    try
      TabsTxtBrush := TLinearGradientPolygonFiller.Create(RectToGPRect(TextRect),
                                                    MakeGDIPColor(FontColor, Alpha),
                                                    MakeGDIPColor(FontColor, 0),
                                                    LinearGradientModeHorizontal);
      try
        GPRect.X := TextRect.Left + OffsetX;
        GPRect.Y := TextRect.Top + OffsetY;
        GPRect.Width := RectWidth(TextRect);
        GPRect.Height := RectHeight(TextRect);

        TxtFormat := TGPStringFormat.Create;
        try
          TabCanvas.SetTextRenderingHint(TextHint);

          BlendPositions[0] := 0.0;
          BlendPositions[2] := 1.0;

          BlendFactorsFade[1] := 0.0;;

          // Calculate the position at which we start to fade the text
          // A correction is made for text under 80 pixels
          if RectWidth(TextRect) > 80 then
            BlendPositions[1] := 0.85
          else
            BlendPositions[1] := 0.85 - ((80 - RectWidth(TextRect)) / 80);

          // Set the text trim mode
          if (ChromeTabs32.GetOptions.Display.Tabs.TabWidthFromContent) and
             (RectWidth(ControlRect) < ChromeTabs32.GetOptions.Display.Tabs.MaxWidth + ChromeTabs32.GetOptions.Display.Tabs.TabOverlap) then
          begin
            TxtFormat.SetTrimming(StringTrimmingNone);

            TabsTxtBrush.SetBlend(@BlendFactorsNormal[0], @BlendPositions[0], Length(BlendFactorsNormal));
          end else
          if ChromeTabs32.GetOptions.Display.Tabs.TextTrimType <> tttFade then
          begin
            TxtFormat.SetTrimming(TStringTrimming(ChromeTabs32.GetOptions.Display.Tabs.TextTrimType));

            TabsTxtBrush.SetBlend(@BlendFactorsNormal[0], @BlendPositions[0], Length(BlendFactorsNormal));
          end
          else
          begin
            // Set the fade blend factors to fade the end of the text
            TxtFormat.SetTrimming(StringTrimmingNone);

            if ChromeTabs32.GetBiDiMode in BidiRightTextAlignmentModes then
            begin
              BlendFactorsFade[0] := 1.0;
              BlendFactorsFade[2] := 0.0;

              BlendPositions[1] := 1 - BlendPositions[1];
            end
            else
            begin
              BlendFactorsFade[0] := 0.0;
              BlendFactorsFade[2] := 1.0;
            end;

            TabsTxtBrush.SetBlend(@BlendFactorsFade[0], @BlendPositions[0], Length(BlendFactorsFade));
          end;

          // Set the verrtical alignment
          case ChromeTabs32.GetOptions.Display.Tabs.TextAlignmentVertical of
            taAlignTop: TxtFormat.SetLineAlignment(StringAlignmentNear);

            taAlignBottom: TxtFormat.SetLineAlignment(StringAlignmentFar);

            taVerticalCenter: TxtFormat.SetLineAlignment(StringAlignmentCenter);
          end;

          // Set the horizontal alignment
          case ChromeTabs32.GetOptions.Display.Tabs.TextAlignmentHorizontal of
            taLeftJustify: if (ChromeTabs32.GetBidiMode in BidiLeftToRightTextModes) or
                              (ChromeTabs32.GetBidiMode in BidiRightTextAlignmentModes) then
                             TxtFormat.SetAlignment(StringAlignmentNear)
                           else
                             TxtFormat.SetAlignment(StringAlignmentFar);

            taRightJustify: if (ChromeTabs32.GetBidiMode in BidiLeftToRightTextModes) or
                               (ChromeTabs32.GetBidiMode in BidiRightTextAlignmentModes) then
                              TxtFormat.SetAlignment(StringAlignmentFar)
                            else
                              TxtFormat.SetAlignment(StringAlignmentNear);

            taCenter: TxtFormat.SetAlignment(StringAlignmentCenter);
          end;

          TextFormatFlags := 0;

          // Set other flags
          if not ChromeTabs32.GetOptions.Behaviour.DebugMode then
          begin
            if not ChromeTabs32.GetOptions.Display.Tabs.WordWrap then
              TextFormatFlags := TextFormatFlags + StringFormatFlagsNoWrap;

            if ChromeTabs32.GetBiDiMode in BidiRightToLeftTextModes then
              TextFormatFlags := TextFormatFlags + StringFormatFlagsDirectionRightToLeft;
          end;

          TxtFormat.SetFormatFlags(TextFormatFlags);

          // Debug mode text
          if ChromeTabs32.GetOptions.Behaviour.DebugMode then
            TabText := format('L: %d, T: %d, R: %d: B: %d W: %d H: %d',
                              [ControlRect.Left,
                               ControlRect.Top,
                               ControlRect.Right,
                               ControlRect.Bottom,
                               RectWidth(ControlRect),
                               RectHeight(ControlRect)])
          else
            TabText := ChromeTab.GetCaption;

          // Draw the text
          TabCanvas.DrawString(PChar(TabText),
                               Length(TabText),
                               TabsFont,
                               GPRect,
                               TxtFormat,
                               TabsTxtBrush);
        finally
          FreeAndNil(TxtFormat);
        end;
      finally
        FreeAndNil(TabsTxtBrush);
      end;
    finally
      FreeAndNil(TabsFont);
    end;
  end;

  procedure DrawGDIText(const Text: String; TextRect: TRect);
  begin
    DrawGDITextWithOffset(Text,
                          TextRect,
                          0,
                          0,
                          FChromeTabControlPropertyItems.CurrentTabProperties.FontColor,
                          FChromeTabControlPropertyItems.CurrentTabProperties.FontAlpha,
                          FChromeTabControlPropertyItems.StopTabProperties.TextRenderingMode);
  end;

  procedure DrawImage(Images: TCustomImageList; ImageIndex: Integer; ImageRect: TRect; ChromeTabItemType: TChromeTabItemType);
  var
    ImageBitmap: TGPImage;
    Handled: Boolean;
  begin
    ChromeTabs32.DoOnBeforeDrawItem(TabCanvas, ImageRect, ChromeTabItemType, ChromeTab.GetIndex, Handled);

    if not Handled then
    begin
      ImageBitmap := ImageListToTGPImage(Images, ImageIndex);
      try
        TabCanvas.DrawImage(ImageBitmap, ImageRect.Left, ImageRect.Top);
      finally
        FreeAndNil(ImageBitmap);
      end;
    end;

    ChromeTabs32.DoOnAfterDrawItem(TabCanvas, ImageRect, ChromeTabItemType, ChromeTab.GetIndex);
  end;

  procedure DrawGlow(GlowRect: TRect; CentreColor, OutsideColor: TColor; CentreAlpha, OutsideAlpha: Byte);
  var
    GPGraphicsPath: TCanvas32Path;
    GlowBrush: TGPPathGradientBrush;
    SurroundColors : array[0..0] of TGPColor;
    ColCount: Integer;
  begin
    GPGraphicsPath := TCanvas32Path.Create;
    try
      // Add the glow ellipse to the path
      GPGraphicsPath.AddEllipse(RectToGPRectF(GlowRect));

      // Create the glow brush
      GlowBrush := TGPPathGradientBrush.Create(GPGraphicsPath);
      try
        // Set the glow parameters
        GlowBrush.SetCenterGR32.Point(PointToGPGR32.Point(GR32.Point(GlowRect.Left +
                                                      (RectWidth(GlowRect) div 2),
                                                      GlowRect.Top +
                                                      (Rectheight(GlowRect) div 2))));

        GlowBrush.SetCenterColor(MakeGDIPColor(CentreColor,
                                               CentreAlpha));
        ColCount := 1;

        SurroundColors[0] := MakeGDIPColor(OutsideColor,
                                           OutsideAlpha);

        GlowBrush.SetSurroundColors(@SurroundColors[0],
                                    ColCount);

        // Draw the glow
        TabCanvas.FillPath(GlowBrush, GPGraphicsPath);
      finally
        FreeAndNil(GlowBrush);
      end;
    finally
      FreeAndNil(GPGraphicsPath);
    end;
  end;

  procedure DrawSpinner(ImageRect: TRect);
  var
    SpinnerImages: TCustomImageList;
    SpinPen: TStrokeBrush;
    SpinnerOptions: TChromeTabs32SpinnerOptions;
    SpinnerLookAndFeel: TChromeTabs32LookAndFeelPen;
    Offset: Real;
    Handled: Boolean;
  begin
    ChromeTabs32.DoOnBeforeDrawItem(TabCanvas, ImageRect, itTabImageSpinner, ChromeTab.GetIndex, Handled);

    if not Handled then
    begin
      if ChromeTab.GetSpinnerState in [tssRenderedUpload, tssRenderedDownload] then
      begin
        if ChromeTab.GetSpinnerState = tssRenderedUpload then
        begin
          SpinnerOptions := ChromeTabs32.GetOptions.Display.TabSpinners.Upload;
          SpinnerLookAndFeel := ChromeTabs32.GetLookAndFeel.Tabs.Spinners.Upload;
        end
        else
        begin
          SpinnerOptions := ChromeTabs32.GetOptions.Display.TabSpinners.Download;
          SpinnerLookAndFeel := ChromeTabs32.GetLookAndFeel.Tabs.Spinners.Download;
        end;

        Offset := SpinnerLookAndFeel.Thickness / 2;

        SpinPen := TStrokeBrush.Create(MakeGDIPColor(SpinnerLookAndFeel.Color, SpinnerLookAndFeel.Alpha), SpinnerLookAndFeel.Thickness);
        try
          TabCanvas.DrawArc(SpinPen,
                            ImageRect.Left + Offset + SpinnerOptions.Position.Offsets.Horizontal,
                            ImageRect.Top + Offset + SpinnerOptions.Position.Offsets.Vertical,
                            SpinnerOptions.Position.Width - (Offset * 2),
                            SpinnerOptions.Position.Height - (Offset * 2),
                            FSpinnerRenderedDegrees,
                            SpinnerOptions.SweepAngle);
        finally
          FreeAndNil(SpinPen);
        end;
      end
      else
      begin
        SpinnerImages := GetSpinnerImageList;

        if SpinnerImages <> nil then
        begin
          DrawImage(SpinnerImages, FSpinnerImageIndex, ImageRect, itTabImageSpinner);
        end;
      end;
    end;
  end;
*)

var
  CloseButtonStyle: TChromeTabs32LookAndFeelStyle;
  CloseButtonCrossPen: TStrokeBrush;
  ImageRect, TextRect, ButtonRect, CrossRect: TRect;
  NormalImageVisible, OverlayImageVisible, SpinnerVisible, TextVisible: Boolean;
  Handled: Boolean;
  ChromeTabPolygons: IChromeTabPolygons;
//  OriginalClipRegion: TGPRegion;
  i: Integer;
  ModifiedTop: Integer;
begin
  if (FTabProperties <> nil) and (ChromeTabs32 <> nil) then
  begin
(* TODO
    OriginalClipRegion := TGPRegion.Create;
    try
      // Save the current clip region of the GPGraphics
      if ClipPolygons <> nil then
        for i := 0 to pred(ClipPolygons.PolygonCount) do
          SetTabClipRegionFromPolygon(TabCanvas, ClipPolygons.Polygons[i].Polygon, CombineModeExclude);

      TabCanvas.GetClip(OriginalClipRegion);

      ChromeTabPolygons := GetPolygons;

      // Calculate the positions and visibilty of the controls
      CalculateRects(ImageRect, TextRect, ButtonRect, CrossRect, NormalImageVisible, OverlayImageVisible, SpinnerVisible, TextVisible);

      // Fire the before draw event
      ChromeTabs32.DoOnBeforeDrawItem(TabCanvas, ControlRect, itTab, ChromeTab.GetIndex, Handled);

      // Only continue if the drawing hasn't already been handled
      if not Handled then
      begin
        // Draw the tab background
        ChromeTabPolygons.DrawTo(TabCanvas, dfBrush);
      end;

      // Set the clip region to that the glows stay within the tab
      SetTabClipRegionFromPolygon(TabCanvas, ChromeTabPolygons.Polygons[0].Polygon, CombineModeIntersect);

      // Draw the modified glow
      if (FChromeTab.GetModified) and
         (ChromeTabs32.GetOptions.Display.TabModifiedGlow.Style <> msNone) then
      begin
        // Fire before draw event
        ChromeTabs32.DoOnBeforeDrawItem(TabCanvas, ControlRect, itTabModifiedGlow, ChromeTab.GetIndex, Handled);

        if not Handled then
        begin
          case ChromeTabs32.GetOptions.Display.Tabs.Orientation of
            toTop: ModifiedTop := ChromeTabs32.GetOptions.Display.TabModifiedGlow.VerticalOffset;
          else
            ModifiedTop := ControlRect.Bottom - ChromeTabs32.GetOptions.Display.TabModifiedGlow.VerticalOffset;
          end;

          DrawGlow(BidiRect(Rect(FModifiedPosition,
                        ModifiedTop,
                        ChromeTabs32.GetOptions.Display.TabModifiedGlow.Width + FModifiedPosition,
                        ChromeTabs32.GetOptions.Display.TabModifiedGlow.Height + ChromeTabs32.GetOptions.Display.TabModifiedGlow.VerticalOffset)),
                        ChromeTabs32.GetLookAndFeel.Tabs.Modified.CentreColor,
                        ChromeTabs32.GetLookAndFeel.Tabs.Modified.OutsideColor,
                        ChromeTabs32.GetLookAndFeel.Tabs.Modified.CentreAlpha,
                        ChromeTabs32.GetLookAndFeel.Tabs.Modified.OutsideAlpha);
        end;
      end;

      // Draw the mouse glow
      if (ChromeTabs32.GetOptions.Display.TabMouseGlow.Visible) and
         (not ChromeTabs32.IsDragging) and
         (PointInPolygon(ChromeTabPolygons.Polygons[0].Polygon, MouseX, MouseY)) then
      begin
        // Fire before draw event
        ChromeTabs32.DoOnBeforeDrawItem(TabCanvas, ControlRect, itTabMouseGlow, ChromeTab.GetIndex, Handled);

        if not Handled then
        begin
          DrawGlow(Rect(MouseX - (ChromeTabs32.GetOptions.Display.TabMouseGlow.Width div 2),
                        MouseY - (ChromeTabs32.GetOptions.Display.TabMouseGlow.Height div 2),
                        MouseX + (ChromeTabs32.GetOptions.Display.TabMouseGlow.Width div 2),
                        MouseY + (ChromeTabs32.GetOptions.Display.TabMouseGlow.Height div 2)),
                        ChromeTabs32.GetLookAndFeel.Tabs.MouseGlow.CentreColor,
                        ChromeTabs32.GetLookAndFeel.Tabs.MouseGlow.OutsideColor,
                        ChromeTabs32.GetLookAndFeel.Tabs.MouseGlow.CentreAlpha,
                        ChromeTabs32.GetLookAndFeel.Tabs.MouseGlow.OutsideAlpha);
        end;
      end;

      // Reset the clip region
      TabCanvas.SetClip(OriginalClipRegion);

      // Draw the text
      if TextVisible then
      begin
        ChromeTabs32.DoOnBeforeDrawItem(TabCanvas, TextRect, itTabText, ChromeTab.GetIndex, Handled);

        if not Handled then
          DrawGDIText(ChromeTab.GetCaption, TextRect);

        ChromeTabs32.DoOnAfterDrawItem(TabCanvas, TextRect, itTabText, ChromeTab.GetIndex);
      end;

      // Fire before draw event
      ChromeTabs32.DoOnBeforeDrawItem(TabCanvas, ControlRect, itTabOutline, ChromeTab.GetIndex, Handled);

      if not Handled then
      begin
        // Draw the border after the modified glow and text
        ChromeTabPolygons.DrawTo(TabCanvas, dfPen);
      end;

      // Draw the close button
      if CloseButtonVisible then
      begin
        ChromeTabs32.DoOnBeforeDrawItem(TabCanvas, ButtonRect, itTabCloseButton, ChromeTab.GetIndex, Handled);

        if not Handled then
        begin
          case FCloseButtonState of
            dsDown:
              begin
                CloseButtonStyle := ChromeTabs32.GetLookAndFeel.CloseButton.Circle.Down;
                CloseButtonCrossPen := ChromeTabs32.GetLookAndFeel.CloseButton.Cross.Down.GetPen;
              end;

            dsHot:
              begin
                CloseButtonStyle := ChromeTabs32.GetLookAndFeel.CloseButton.Circle.Hot;
                CloseButtonCrossPen := ChromeTabs32.GetLookAndFeel.CloseButton.Cross.Hot.GetPen;
              end;

            else
              begin
                CloseButtonStyle := ChromeTabs32.GetLookAndFeel.CloseButton.Circle.Normal;
                CloseButtonCrossPen := ChromeTabs32.GetLookAndFeel.CloseButton.Cross.Normal.GetPen;
              end;
          end;

          // Draw the circle
          TabCanvas.FillEllipse(CloseButtonStyle.GetBrush(ButtonRect),
                                                          ButtonRect.Left,
                                                          ButtonRect.Top,
                                                          RectWidth(ButtonRect),
                                                          RectHeight(ButtonRect));

          TabCanvas.DrawEllipse(CloseButtonStyle.GetPen,
                                ButtonRect.Left,
                                ButtonRect.Top,
                                RectWidth(ButtonRect),
                                RectHeight(ButtonRect));

          // Draw the cross
          TabCanvas.DrawLine(CloseButtonCrossPen, CrossRect.Left, CrossRect.Top, CrossRect.Right, CrossRect.Bottom);
          TabCanvas.DrawLine(CloseButtonCrossPen, CrossRect.Left, CrossRect.Bottom, CrossRect.Right, CrossRect.Top);
        end;

        ChromeTabs32.DoOnAfterDrawItem(TabCanvas, ButtonRect, itTabCloseButton, ChromeTab.GetIndex);
      end;

      // Draw the normal and overlay images
      if (not SpinnerVisible) or
         (not ChromeTabs32.GetOptions.Display.TabSpinners.HideImagesWhenSpinnerVisible) then
      begin
        if NormalImageVisible then
          DrawImage(ChromeTabs32.GetImages, ChromeTab.GetImageIndex, ImageRect, itTabImage);

        if OverlayImageVisible then
          DrawImage(ChromeTabs32.GetImagesOverlay, ChromeTab.GetImageIndexOverlay, ImageRect, itTabImageOverlay);
      end;

      // Draw the spinner image
      if SpinnerVisible then
        DrawSpinner(ImageRect);
    finally
      FreeAndNil(OriginalClipRegion);
    end;
*)

    ChromeTabs32.DoOnAfterDrawItem(TabCanvas, ControlRect, itTab, ChromeTab.GetIndex);
  end;
end;

procedure TChromeTabControl.EndAnimation;
begin
  FChromeTabControlPropertyItems.EndAnimation;

  AnimateStyle;
end;

procedure TChromeTabControl.SetCloseButtonState(const Value: TDrawState);
begin
  if FCloseButtonState <> Value then
  begin
    FCloseButtonState := Value;

    FCloseButtonInvalidate := True;

    FChromeTabs32.DoOnChange(FChromeTab.GetTab, tcControlState);
  end;
end;

procedure TChromeTabControl.SetDrawState(const Value: TDrawState; AnimationTimeMS: Integer; EaseType: TChromeTabs32EaseType; ForceUpdate: Boolean);
var
  DefaultFont: TChromeTabs32LookAndFeelBaseFont;
begin
  // Only update if the state has changed
  if (ForceUpdate) or (Value <> FDrawState) then
  begin
    // Retrieve the properties for the current state
    case Value of
      dsActive: FTabProperties := ChromeTabs32.GetLookAndFeel.Tabs.Active;
      dsHot: FTabProperties := ChromeTabs32.GetLookAndFeel.Tabs.Hot
    else
      FTabProperties := ChromeTabs32.GetLookAndFeel.Tabs.NotActive;
    end;

    if FTabProperties.Font.UseDefaultFont then
      DefaultFont := ChromeTabs32.GetLookAndFeel.Tabs.DefaultFont
    else
      DefaultFont := nil;

    FChromeTabControlPropertyItems.SetProperties(
      FTabProperties.Style, FTabProperties.Font, DefaultFont,
      AnimationTimeMS, EaseType);

    Invalidate;
  end;

  inherited;
end;


{ TScrollButtonControl }

procedure TScrollButtonControl.DrawTo(TabCanvas: TCanvas32; MouseX, MouseY: Integer; ClipPolygons: IChromeTabPolygons);
begin
  GetPolygons.DrawTo(TabCanvas);
end;

function TScrollButtonControl.GetArrowPolygons(
  Direction: TChromeTabDirection): IChromeTabPolygons;
begin
  case Direction of
    drLeft:  Result := InternalGetPolygons(itScrollLeftButton, GetButtonBrush, GetButtonPen);
    drRight: Result := InternalGetPolygons(itScrollRightButton, GetButtonBrush, GetButtonPen);
  end;

  if Result = nil then
  begin
    Result := TChromeTabPolygons.Create;

    Result.AddPolygon(BidiPolygon(NewPolygon(BidiControlRect,
      [
        GR32.Point(0, RectHeight(ControlRect)),
        GR32.Point(0, 0),
        GR32.Point(RectWidth(ControlRect), 0),
        GR32.Point(RectWidth(ControlRect), RectHeight(ControlRect))
      ],
      ChromeTabs32.GetOptions.Display.Tabs.Orientation)),
      GetButtonBrush, GetButtonPen);

    case Direction of
      drLeft:
        begin
          Result.AddPolygon(BidiPolygon(NewPolygon(BidiControlRect,
            [
              GR32.Point(3, RectHeight(ControlRect) div 2),
              GR32.Point(RectWidth(ControlRect) - 3, 2),
              GR32.Point(RectWidth(ControlRect) - 3, RectHeight(ControlRect) - 2),
              GR32.Point(3, RectHeight(ControlRect) div 2)
            ], ChromeTabs32.GetOptions.Display.Tabs.Orientation)),
            GetSymbolBrush, GetSymbolPen);
        end;

      drRight:
        begin
          Result.AddPolygon(BidiPolygon(NewPolygon(BidiControlRect,
            [
              GR32.Point(RectWidth(ControlRect) - 3, RectHeight(ControlRect) div 2),
              GR32.Point(3, 2),
              GR32.Point(3, RectHeight(ControlRect) - 2),
              GR32.Point(RectWidth(ControlRect) - 3, RectHeight(ControlRect) div 2)
            ],
            ChromeTabs32.GetOptions.Display.Tabs.Orientation)),
            GetSymbolBrush, GetSymbolPen);
        end;
    end;
  end;
end;

procedure TScrollButtonControl.SetStylePropertyClasses;
begin
  case FDrawState of
    dsDown:
      begin
        FButtonStyle := ChromeTabs32.GetLookAndFeel.ScrollButtons.Button.Down;
        FSymbolStyle := ChromeTabs32.GetLookAndFeel.ScrollButtons.Arrow.Down;
      end;

    dsHot:
      begin
        FButtonStyle := ChromeTabs32.GetLookAndFeel.ScrollButtons.Button.Hot;
        FSymbolStyle := ChromeTabs32.GetLookAndFeel.ScrollButtons.Arrow.Hot;
      end;

    dsDisabled:
      begin
        FButtonStyle := ChromeTabs32.GetLookAndFeel.ScrollButtons.Button.Disabled;
        FSymbolStyle := ChromeTabs32.GetLookAndFeel.ScrollButtons.Arrow.Disabled;
      end;
  else
    begin
      FButtonStyle := ChromeTabs32.GetLookAndFeel.ScrollButtons.Button.Normal;
      FSymbolStyle := ChromeTabs32.GetLookAndFeel.ScrollButtons.Arrow.Normal;
    end;
  end;
end;


{ TScrollButtonLeftControl }

constructor TScrollButtonLeftControl.Create(
  ChromeTabs32: IChromeTabs32);
begin
  inherited;

  FControlType := itScrollLeftButton;
end;

procedure TScrollButtonLeftControl.DrawTo(TabCanvas: TCanvas32; MouseX, MouseY: Integer; ClipPolygons: IChromeTabPolygons);
var
  Handled: Boolean;
begin
  ChromeTabs32.DoOnBeforeDrawItem(TabCanvas, ControlRect, itScrollLeftButton, -1, Handled);

  if not Handled then
    inherited;

  ChromeTabs32.DoOnAfterDrawItem(TabCanvas, ControlRect, itScrollLeftButton, -1);
end;

function TScrollButtonLeftControl.GetPolygons: IChromeTabPolygons;
begin
  Result := GetArrowPolygons(drLeft);
end;


{ TScrollButtonRightControl }

constructor TScrollButtonRightControl.Create(
  ChromeTabs32: IChromeTabs32);
begin
  inherited;

  FControlType := itScrollRightButton;
end;

procedure TScrollButtonRightControl.DrawTo(TabCanvas: TCanvas32; MouseX, MouseY: Integer; ClipPolygons: IChromeTabPolygons);
var
  Handled: Boolean;
begin
  ChromeTabs32.DoOnBeforeDrawItem(TabCanvas, ControlRect, itScrollRightButton, -1, Handled);

  if not Handled then
    inherited;

  ChromeTabs32.DoOnAfterDrawItem(TabCanvas, ControlRect, itScrollRightButton, -1);
end;

function TScrollButtonRightControl.GetPolygons: IChromeTabPolygons;
begin
  Result := GetArrowPolygons(drRight);
end;


{ TChromeTabControlPropertyItems }

procedure TChromeTabControlPropertyItems.EndAnimation;
begin
  FCurrentTickCount := FEndTickCount;
end;

procedure TChromeTabControlPropertyItems.SetProperties(Style: TChromeTabs32LookAndFeelStyle;
  StyleFont: TChromeTabs32LookAndFeelFont; DefaultFont: TChromeTabs32LookAndFeelBaseFont;
  EndTickCount: Cardinal; EaseType: TChromeTabs32EaseType);
var
  Dst: TChromeTabControlProperties;
  Font: TChromeTabs32LookAndFeelBaseFont;
  FontCreated: Boolean;
begin
  FEaseType := EaseType;

  if DefaultFont <> nil then
    Font := DefaultFont
  else
    Font := StyleFont;

  FontCreated := False;
  if Font = nil then
  begin
    Font := TChromeTabs32LookAndFeelBaseFont.Create(nil);
    FontCreated := True;
  end;

  // Copy the property values to the record
  Dst.FontColor := Font.Color;
  Dst.FontAlpha := Font.Alpha;
  Dst.FontName := Font.Name;
  Dst.FontSize := Font.Size;
  if FontCreated then
    FreeAndNil(Font);

  Dst.StartColor := Style.StartColor;
  Dst.StopColor := Style.StopColor;
  Dst.OutlineColor := Style.OutlineColor;
  Dst.OutlineSize := Style.OutlineSize;
  Dst.OutlineAlpha := Style.OutlineAlpha;
  Dst.StartAlpha := Style.StartAlpha;
  Dst.StopAlpha := Style.StopAlpha;

  FStopTabProperties := Dst;
  FStartTabProperties := CurrentTabProperties;

  // then start the animation sequence
  FStartTickCount := GetTickCount;
  FCurrentTickCount := 0;

  if EaseType = ttNone then
  begin
    FEndTickCount := 0;
    FCurrentTickCount := FEndTickCount;

    TransformColors(True);
  end
  else
    FEndTickCount := EndTickCount;
end;

function TChromeTabControlPropertyItems.TransformColors(ForceUpdate: Boolean): Boolean;
var
  TransformPct: Integer;
begin
  Result := False;

  if (ForceUpdate) or
     ((FStartTickCount > 0) and
      (FCurrentTickCount < FEndTickCount)) then
  begin
    Result := True;

    if ForceUpdate then
    begin
      TransformPct := 100;
    end
    else
    begin
      FCurrentTickCount := GetTickCount - FStartTickCount;

      if FCurrentTickCount > FEndTickCount then
        FCurrentTickCount := FEndTickCount;

      TransformPct := Round(CalculateEase(FCurrentTickCount, 0, 100, FEndTickCount, FEaseType));
    end;

    FCurrentTabProperties.FontColor := ColorBetween(FStartTabProperties.FontColor, FStopTabProperties.FontColor, TransformPct);
    FCurrentTabProperties.FontAlpha := IntegerBetween(FStartTabProperties.FontAlpha, FStopTabProperties.FontAlpha, TransformPct);
    FCurrentTabProperties.FontSize := IntegerBetween(FStartTabProperties.FontSize, FStopTabProperties.FontSize, TransformPct);

    FCurrentTabProperties.StartColor := ColorBetween(FStartTabProperties.StartColor, FStopTabProperties.StartColor, TransformPct);
    FCurrentTabProperties.StopColor := ColorBetween(FStartTabProperties.StopColor, FStopTabProperties.StopColor, TransformPct);
    FCurrentTabProperties.OutlineColor := ColorBetween(FStartTabProperties.OutlineColor, FStopTabProperties.OutlineColor, TransformPct);
    FCurrentTabProperties.OutlineSize := SingleBetween(FStartTabProperties.OutlineSize, FStopTabProperties.OutlineSize, TransformPct);
    FCurrentTabProperties.StartAlpha := IntegerBetween(FStartTabProperties.StartAlpha, FStopTabProperties.StartAlpha, TransformPct);
    FCurrentTabProperties.StopAlpha := IntegerBetween(FStartTabProperties.StopAlpha, FStopTabProperties.StopAlpha, TransformPct);
    FCurrentTabProperties.OutlineAlpha := IntegerBetween(FStartTabProperties.OutlineAlpha, FStopTabProperties.OutlineAlpha, TransformPct);
  end;
end;

{ TBaseChromeButtonControl }

function TBaseChromeButtonControl.AnimateStyle: Boolean;
var
  SymbolResult: Boolean;
begin
  Result := FButtonControlPropertyItems.TransformColors(False);

  if Result then
  begin
    FreeAndNil(FButtonBrush);
    FreeAndNil(FButtonPen);

    SymbolResult := FSymbolControlPropertyItems.TransformColors(False);

    if SymbolResult then
    begin
      FreeAndNil(FSymbolBrush);
      FreeAndNil(FSymbolPen);
    end;

    Result := Result or SymbolResult;
  end;

  if Result then
    Invalidate;
end;

constructor TBaseChromeButtonControl.Create(ChromeTabs32: IChromeTabs32);
begin
  inherited Create(ChromeTabs32);

  FButtonGradient := TLinearGradientPolygonFiller.Create;
  FSymbolGradient := TLinearGradientPolygonFiller.Create;

  FButtonControlPropertyItems := TChromeTabControlPropertyItems.Create;
  FSymbolControlPropertyItems := TChromeTabControlPropertyItems.Create;
end;

destructor TBaseChromeButtonControl.Destroy;
begin
  FreeAndNil(FButtonBrush);
  FreeAndNil(FButtonPen);
  FreeAndNil(FSymbolBrush);
  FreeAndNil(FSymbolPen);

  FreeAndNil(FButtonControlPropertyItems);
  FreeAndNil(FSymbolControlPropertyItems);

  Invalidate;

  inherited;
end;

function TBaseChromeButtonControl.GetButtonBrush: TSolidBrush;
var
  ControlProperties: TChromeTabControlProperties;
begin
  if FButtonBrush = nil then
  begin
    ControlProperties := FButtonControlPropertyItems.CurrentTabProperties;
    FButtonBrush := TSolidBrush.Create(nil);
    FButtonBrush.Filler := FButtonGradient;
    FButtonGradient.SimpleGradientX(
      ControlRect.Top, SetAlpha(Color32(ControlProperties.StartColor), ControlProperties.StartAlpha),
      ControlRect.Bottom, SetAlpha(Color32(ControlProperties.StopColor), ControlProperties.StopAlpha));
  end;

  Result := FButtonBrush;
end;

function TBaseChromeButtonControl.GetButtonPen: TStrokeBrush;
var
  ControlProperties: TChromeTabControlProperties;
begin
  if FButtonPen = nil then
  begin
    ControlProperties := FButtonControlPropertyItems.CurrentTabProperties;
    FButtonPen := TStrokeBrush.Create(nil);
    FButtonPen.FillColor := SetAlpha(Color32(ControlProperties.OutlineColor), ControlProperties.OutlineAlpha);
    FButtonPen.StrokeWidth := ControlProperties.OutlineSize
  end;

  Result := FButtonPen;
end;

function TBaseChromeButtonControl.GetSymbolBrush: TSolidBrush;
var
  ControlProperties: TChromeTabControlProperties;
begin
  if FSymbolBrush = nil then
  begin
    ControlProperties := FSymbolControlPropertyItems.CurrentTabProperties;
    FSymbolBrush := TSolidBrush.Create(nil);
    FSymbolBrush.Filler := FSymbolGradient;
    FSymbolGradient.SimpleGradientX(
      ControlRect.Top, SetAlpha(Color32(ControlProperties.StartColor), ControlProperties.StartAlpha),
      ControlRect.Bottom, SetAlpha(Color32(ControlProperties.StopColor), ControlProperties.StopAlpha));
  end;

  Result := FSymbolBrush;
end;

function TBaseChromeButtonControl.GetSymbolPen: TStrokeBrush;
var
  ControlProperties: TChromeTabControlProperties;
begin
  if FSymbolPen = nil then
  begin
    ControlProperties := FSymbolControlPropertyItems.CurrentTabProperties;
    FSymbolPen := TStrokeBrush.Create(nil);
    FSymbolPen.FillColor := SetAlpha(Color32(ControlProperties.OutlineColor), ControlProperties.OutlineAlpha);
    FSymbolPen.StrokeWidth := ControlProperties.OutlineSize
  end;

  Result := FSymbolPen;
end;

procedure TBaseChromeButtonControl.Invalidate;
begin
  FreeAndNil(FButtonBrush);
  FreeAndNil(FButtonPen);
  FreeAndNil(FSymbolBrush);
  FreeAndNil(FSymbolPen);
end;

procedure TBaseChromeButtonControl.SetDrawState(const Value: TDrawState;
  AnimationTimeMS: Integer; EaseType: TChromeTabs32EaseType; ForceUpdate: Boolean);
begin
  // Only update if the state has changed
  if (ForceUpdate) or (Value <> FDrawState) then
  begin
    FDrawState := Value;

    SetStylePropertyClasses;

    FButtonControlPropertyItems.SetProperties(FButtonStyle, nil, nil, AnimationTimeMS, EaseType);
    FSymbolControlPropertyItems.SetProperties(FSymbolStyle, nil, nil, AnimationTimeMS, EaseType);

    Invalidate;
  end;

  inherited;
end;

procedure TBaseChromeButtonControl.SetStylePropertyClasses;
begin
  // Override
end;

end.
