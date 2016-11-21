unit frameChromeTabs32StyleU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,
  Graphics, Controls, Forms, Dialogs, StdCtrls,
  Spin, ExtCtrls, Buttons,

  GDIPAPI,

  ChromeTabs32,
  ChromeTabs32Utils,
  ChromeTabs32Classes;

type
  TframeChromeTabs32Style = class(TFrame)
    ColorDialog1: TColorDialog;
    gbBrush: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    edtAlphaStart: TSpinEdit;
    edtAlphaStop: TSpinEdit;
    Button1: TBitBtn;
    Button2: TBitBtn;
    colStart: TPanel;
    colStop: TPanel;
    gbPen: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    edtOutlineWidth: TSpinEdit;
    edtOutlineAlpha: TSpinEdit;
    Button3: TBitBtn;
    colOutline: TPanel;
    gbFont: TGroupBox;
    chkUseDefaultFont: TCheckBox;
    pnlFont: TPanel;
    cbFontHintMode: TComboBox;
    edtFontAlpha: TSpinEdit;
    edtFontSize: TSpinEdit;
    cbFontName: TComboBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Button4: TBitBtn;
    colFont: TPanel;
    Label8: TLabel;
    gbModified: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    edtCentreAlpha: TSpinEdit;
    edtOutsideAlpha: TSpinEdit;
    Button5: TBitBtn;
    Button6: TBitBtn;
    colCentre: TPanel;
    colOutside: TPanel;
    Label17: TLabel;
    Timer1: TTimer;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    procedure OnSelectColorClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure colStartChange(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure chkUseDefaultFontClick(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure colStartClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
  private
    FOnStartColorPicking: TNotifyEvent;
    FUpdating: Boolean;
    FChromeTabLookAndFeelStyle: TChromeTabs32LookAndFeelStyle;
    FChromeTabLookAndFeelPen: TChromeTabs32LookAndFeelPen;
    FChromeTabFont: TChromeTabs32LookAndFeelBaseFont;
    FChromeTabs32LookAndFeelTabModified: TChromeTabs32LookAndFeelGlow;
    FPreviousColor: TColor;
    FColorPickPanel: TPanel;
    FChromeTabs32: TChromeTabs32;

    procedure SetColor(ColorPanel: TPanel; Color: TColor; UpdateChromeTabs32: Boolean);
    function SelectColor(ColorBox: TPanel): Boolean;
    procedure GUIToChromeTabLookAndFeelStyle;
    procedure ChromeTabLookAndFeelStyleToGUI;
    procedure SetChromeTabLookAndFeelStyle(const Value: TChromeTabs32LookAndFeelStyle);
    procedure SetChromeTabLookAndFeelPen(const Value: TChromeTabs32LookAndFeelPen);
    procedure SetChromeTabFont(const Value: TChromeTabs32LookAndFeelBaseFont);
    procedure UpdateControls;
    procedure SetChromeTabs32LookAndFeelTabModified(const Value: TChromeTabs32LookAndFeelGlow);
    procedure StartColourPicking(Panel: TPanel);
  public
    constructor Create(AOwner: TComponent; ChromeTabs32: TChromeTabs32); reintroduce; virtual;

    procedure StopColorPicking(Cancelled: Boolean);

    property ChromeTabLookAndFeelStyle: TChromeTabs32LookAndFeelStyle read FChromeTabLookAndFeelStyle write SetChromeTabLookAndFeelStyle;
    property ChromeTabLookAndFeelPen: TChromeTabs32LookAndFeelPen read FChromeTabLookAndFeelPen write SetChromeTabLookAndFeelPen;
    property ChromeTabFont: TChromeTabs32LookAndFeelBaseFont read FChromeTabFont write SetChromeTabFont;
    property ChromeTabs32LookAndFeelTabModified: TChromeTabs32LookAndFeelGlow read FChromeTabs32LookAndFeelTabModified write SetChromeTabs32LookAndFeelTabModified;

    property OnStartColorPicking: TNotifyEvent read FOnStartColorPicking write FOnStartColorPicking;
  end;

implementation

{$R *.dfm}

procedure TframeChromeTabs32Style.BitBtn1Click(Sender: TObject);
begin
  StartColourPicking(colStart);
end;

procedure TframeChromeTabs32Style.BitBtn2Click(Sender: TObject);
begin
  StartColourPicking(colStop);
end;

procedure TframeChromeTabs32Style.BitBtn3Click(Sender: TObject);
begin
  StartColourPicking(colOutline);
end;

procedure TframeChromeTabs32Style.BitBtn4Click(Sender: TObject);
begin
  StartColourPicking(colFont);
end;

procedure TframeChromeTabs32Style.BitBtn5Click(Sender: TObject);
begin
  StartColourPicking(colCentre);
end;

procedure TframeChromeTabs32Style.BitBtn6Click(Sender: TObject);
begin
  StartColourPicking(colOutside);
end;

procedure TframeChromeTabs32Style.Button2Click(Sender: TObject);
begin
  SelectColor(colStop);
end;

procedure TframeChromeTabs32Style.Button3Click(Sender: TObject);
begin
  SelectColor(colOutline);
end;

procedure TframeChromeTabs32Style.Button4Click(Sender: TObject);
begin
  SelectColor(colFont);
end;

procedure TframeChromeTabs32Style.Button5Click(Sender: TObject);
begin
  SelectColor(colCentre);
end;

procedure TframeChromeTabs32Style.Button6Click(Sender: TObject);
begin
  SelectColor(colOutside);
end;

procedure TframeChromeTabs32Style.chkUseDefaultFontClick(Sender: TObject);
begin
  UpdateControls;

  GUIToChromeTabLookAndFeelStyle;
end;

procedure TframeChromeTabs32Style.UpdateControls;
begin
  chkUseDefaultFont.Visible := FChromeTabFont is TChromeTabs32LookAndFeelFont;

  EnableControlAndChildren(pnlFont, (not chkUseDefaultFont.Checked) or (not chkUseDefaultFont.Visible));
end;

procedure TframeChromeTabs32Style.colStartChange(Sender: TObject);
begin
  GUIToChromeTabLookAndFeelStyle;
end;

function GetPixelColourAsColor(const PixelCoords: TPoint): TColor;
var
  dc: HDC;
begin
  // Get Device Context of windows desktop
  dc := GetDC(0);
  // Read the color of the pixel at the given coordinates
  Result := GetPixel(dc,PixelCoords.X,PixelCoords.Y);
end;

procedure TframeChromeTabs32Style.colStartClick(Sender: TObject);
begin
  StartColourPicking(TPanel(Sender));
end;

procedure TframeChromeTabs32Style.StartColourPicking(Panel: TPanel);
begin
  FPreviousColor := Panel.Color;
  FColorPickPanel := Panel;

  Timer1.Enabled := TRUE;

  if Assigned(FOnStartColorPicking) then
    FOnStartColorPicking(Self);
end;

constructor TframeChromeTabs32Style.Create(AOwner: TComponent; ChromeTabs32: TChromeTabs32);
begin
  inherited Create(AOwner);

  FChromeTabs32 := ChromeTabs32;

  cbFontName.Items.Assign(Screen.Fonts);
end;

procedure TframeChromeTabs32Style.StopColorPicking(Cancelled: Boolean);
begin
  Timer1.Enabled := FALSE;

  if Cancelled then
    SetColor(FColorPickPanel, FPreviousColor, FALSE)
  else
    GUIToChromeTabLookAndFeelStyle;
end;

procedure TframeChromeTabs32Style.ChromeTabLookAndFeelStyleToGUI;
begin
  if not FUpdating then
  begin
    FUpdating := TRUE;
    try
      if FChromeTabLookAndFeelStyle <> nil then
      begin
        SetColor(colStart, FChromeTabLookAndFeelStyle.StartColor, TRUE);
        SetColor(colStop, FChromeTabLookAndFeelStyle.StopColor, TRUE);
        edtAlphaStart.Value := FChromeTabLookAndFeelStyle.StartAlpha;
        edtAlphaStop.Value := FChromeTabLookAndFeelStyle.StopAlpha;
        SetColor(colOutline, FChromeTabLookAndFeelStyle.OutlineColor, TRUE);
        edtOutlineWidth.Value := Round(FChromeTabLookAndFeelStyle.OutlineSize);
        edtOutlineAlpha.Value := FChromeTabLookAndFeelStyle.OutlineAlpha;
      end;

      if FChromeTabLookAndFeelPen <> nil then
      begin
        SetColor(colOutline, FChromeTabLookAndFeelPen.Color, TRUE);
        edtOutlineWidth.Value := Round(FChromeTabLookAndFeelPen.Thickness);
        edtOutlineAlpha.Value := FChromeTabLookAndFeelPen.Alpha;
      end;

      if FChromeTabFont <> nil then
      begin
        cbFontHintMode.ItemIndex := Integer(FChromeTabFont.TextRendoringMode);
        cbFontName.Text := FChromeTabFont.Name;
        edtFontAlpha.Value := FChromeTabFont.Alpha;
        edtFontSize.Value := FChromeTabFont.Size;
        cbFontName.Text := FChromeTabFont.Name;
        SetColor(colFont, FChromeTabFont.Color, TRUE);

        if FChromeTabFont is TChromeTabs32LookAndFeelFont then
          chkUseDefaultFont.Checked := TChromeTabs32LookAndFeelFont(FChromeTabFont).UseDefaultFont
        else
        begin
          pnlFont.Align := alTop;
          chkUseDefaultFont.Visible := FALSE;
        end;

        UpdateControls;
      end;

      if FChromeTabs32LookAndFeelTabModified <> nil then
      begin
        SetColor(colCentre, FChromeTabs32LookAndFeelTabModified.CentreColor, TRUE);
        SetColor(colOutside, FChromeTabs32LookAndFeelTabModified.OutsideColor, TRUE);
        edtCentreAlpha.Value := FChromeTabs32LookAndFeelTabModified.CentreAlpha;
        edtOutsideAlpha.Value := FChromeTabs32LookAndFeelTabModified.OutsideAlpha;
      end;
    finally
      FUpdating := FALSE;
    end;
  end;
end;

procedure TframeChromeTabs32Style.GUIToChromeTabLookAndFeelStyle;
begin
  if not FUpdating then
  begin
    FChromeTabs32.BeginUpdate;
    try
      if FChromeTabLookAndFeelStyle <> nil then
      begin
        FChromeTabLookAndFeelStyle.StartColor := colStart.Color;
        FChromeTabLookAndFeelStyle.StopColor := colStop.Color;
        FChromeTabLookAndFeelStyle.StartAlpha := edtAlphaStart.Value;
        FChromeTabLookAndFeelStyle.StopAlpha := edtAlphaStop.Value;
        FChromeTabLookAndFeelStyle.OutlineColor := colOutline.Color;
        FChromeTabLookAndFeelStyle.OutlineSize := edtOutlineWidth.Value;
        FChromeTabLookAndFeelStyle.OutlineAlpha := edtOutlineAlpha.Value;
      end;

      if FChromeTabLookAndFeelPen <> nil then
      begin
        FChromeTabLookAndFeelPen.Color := colOutline.Color;
        FChromeTabLookAndFeelPen.Thickness := edtOutlineWidth.Value;
        FChromeTabLookAndFeelPen.Alpha := edtOutlineAlpha.Value;
      end;

      if FChromeTabFont <> nil then
      begin
        FChromeTabFont.TextRendoringMode := TTextRenderingHint(cbFontHintMode.ItemIndex);
        FChromeTabFont.Name := cbFontName.Text;
        FChromeTabFont.Alpha := edtFontAlpha.Value;
        FChromeTabFont.Size := edtFontSize.Value;
        FChromeTabFont.Name := cbFontName.Text;
        FChromeTabFont.Color := colFont.Color;

        if FChromeTabFont is TChromeTabs32LookAndFeelFont then
          TChromeTabs32LookAndFeelFont(FChromeTabFont).UseDefaultFont := chkUseDefaultFont.Checked;
      end;

      if FChromeTabs32LookAndFeelTabModified <> nil then
      begin
        FChromeTabs32LookAndFeelTabModified.CentreColor := colCentre.Color;
        FChromeTabs32LookAndFeelTabModified.OutsideColor := colOutside.Color;
        FChromeTabs32LookAndFeelTabModified.CentreAlpha := edtCentreAlpha.Value;
        FChromeTabs32LookAndFeelTabModified.OutsideAlpha := edtOutsideAlpha.Value;
      end;
    finally
      FChromeTabs32.EndUpdate;
    end;
  end;
end;

procedure TframeChromeTabs32Style.OnSelectColorClick(Sender: TObject);
begin
  SelectColor(colStart);
end;

function TframeChromeTabs32Style.SelectColor(ColorBox: TPanel): Boolean;
begin
  ColorDialog1.Color := ColorBox.Color;

  Result := ColorDialog1.Execute;

  if Result then
    SetColor(ColorBox, ColorDialog1.Color, TRUE);
end;

procedure TframeChromeTabs32Style.SetColor(ColorPanel: TPanel; Color: TColor; UpdateChromeTabs32: Boolean);
var
  r,g,b: Byte;
begin
  ColorPanel.Color := Color;

  // Convert the Delphi TColor value to it's RGB components
  r := Color and $FF;
  g := (Color shr 8) and $FF;
  b := (Color shr 16) and $FF;

  ColorPanel.Caption := '$00' + IntToHex(r, 2) + IntToHex(g, 2) + IntToHex(b, 2);
  ColorPanel.Color := Color;
  ColorPanel.Font.Color := ContrastingColor(Color);

  if UpdateChromeTabs32 then
    GUIToChromeTabLookAndFeelStyle;
end;

procedure TframeChromeTabs32Style.SetChromeTabFont(
  const Value: TChromeTabs32LookAndFeelBaseFont);
begin
  FChromeTabFont := Value;

  gbFont.Visible := TRUE;

  ChromeTabLookAndFeelStyleToGUI;
end;

procedure TframeChromeTabs32Style.SetChromeTabLookAndFeelPen(
  const Value: TChromeTabs32LookAndFeelPen);
begin
  FChromeTabLookAndFeelPen := Value;

  gbPen.Visible := TRUE;

  ChromeTabLookAndFeelStyleToGUI;
end;

procedure TframeChromeTabs32Style.SetChromeTabLookAndFeelStyle(
  const Value: TChromeTabs32LookAndFeelStyle);
begin
  FChromeTabLookAndFeelStyle := Value;

  gbBrush.Visible := TRUE;
  gbPen.Visible := TRUE;

  ChromeTabLookAndFeelStyleToGUI;
end;

procedure TframeChromeTabs32Style.SetChromeTabs32LookAndFeelTabModified(
  const Value: TChromeTabs32LookAndFeelGlow);
begin
  FChromeTabs32LookAndFeelTabModified := Value;

  gbModified.Visible := TRUE;

  ChromeTabLookAndFeelStyleToGUI;
end;

procedure TframeChromeTabs32Style.Timer1Timer(Sender: TObject);
var
  col: TColor;
begin
  Col := GetPixelColourAsColor(Mouse.CursorPos);

  SetColor(FColorPickPanel, Col, FALSE);
end;

end.
