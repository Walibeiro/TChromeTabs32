unit ChromeTabs32Log;

interface

{.$DEFINE USE_VIRTUALTREES}

uses
  {$IFDEF USE_VIRTUALTREES}
    VirtualTrees, // <-- If you receive an error here, comment out the {$DEFINE USE_VIRTUALTREES} line above
  {$ENDIF}        //     Note that if you do not use VirtualTrees, the GUI event updates will be slow.

  SysUtils, classes, Contnrs, ComCtrls, Forms;

type
  {$IFDEF USE_VIRTUALTREES}
  TChromeTabs32Log = class(TVirtualStringTree)
  private
    FLogStrings: TObjectList;
    FAutoScroll: Boolean;
  protected
    procedure DoGetText(Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;  var Text: UnicodeString); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure Clear; override;

    procedure AddColumn(const Text: String; ColumnWidth: Integer);
    procedure Log(const ColumnText: Array of String; Row: Integer = -1); overload;
    procedure Log(const Text: String; Args: Array of const; Row: Integer = -1); overload;
    procedure SetAutoSizeIndex(Value: Integer);
    procedure SetAutoScroll(Value: Boolean);
    function GetColumnText(AColumn, ARow: Integer): String;
  end;
  {$ELSE}
  TChromeTabs32Log = class(TListView)
  private
    FAutoScroll: Boolean;
  public
    constructor Create(AOwner: TComponent); override;

    procedure AddColumn(const Text: String; ColumnWidth: Integer);
    procedure Log(const ColumnText: Array of String; Row: Integer = -1); overload;
    procedure Log(const Text: String; Args: Array of const; Row: Integer = -1); overload;
    procedure SetAutoSizeIndex(Value: Integer);
    procedure SetAutoScroll(Value: Boolean);
    function GetColumnText(AColumn, ARow: Integer): String;
    procedure BeginUpdate;
    procedure EndUpdate;
  end;
  {$ENDIF}

implementation

{ TChromeTabLog }

procedure TChromeTabs32Log.Log(const Text: String; Args: Array of const; Row: Integer);
begin
  if Self <> nil then
    Log([format(Text, Args)], Row);
end;

{$IFDEF USE_VIRTUALTREES}
constructor TChromeTabs32Log.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FLogStrings := TObjectList.Create;

  BorderStyle := bsNone;

  TreeOptions.PaintOptions := TreeOptions.PaintOptions - [toShowRoot, toShowTreeLines, toShowButtons];
  TreeOptions.SelectionOptions := TreeOptions.SelectionOptions + [toFullRowSelect];
end;

destructor TChromeTabs32Log.Destroy;
begin
  inherited;

  FreeAndNil(FLogStrings);
end;

procedure TChromeTabs32Log.DoGetText(Node: PVirtualNode; Column: TColumnIndex;
  TextType: TVSTTextType; var Text: UnicodeString);
begin
  inherited;

  Text := GetColumnText(Column, Node.Index);
end;

procedure TChromeTabs32Log.AddColumn(const Text: String; ColumnWidth: Integer);
var
  Column: TVirtualTreeColumn;
begin
  Column := Header.Columns.Add;

  Column.Text := Text;
  Column.Width := ColumnWidth;
end;

function TChromeTabs32Log.GetColumnText(AColumn, ARow: Integer): String;
begin
  if AColumn < 0 then
    AColumn := 0;

  if (ARow < FLogStrings.Count) and
     (AColumn < TStringList(FLogStrings[ARow]).Count) then
    Result := TStringList(FLogStrings[ARow])[AColumn]
  else
    Result := '';
end;

procedure TChromeTabs32Log.Clear;
begin
  inherited;

  FLogStrings.Clear;
end;

procedure TChromeTabs32Log.Log(const ColumnText: Array of String; Row: Integer);
var
  i: Integer;
begin
  if Self <> nil then
  begin
    BeginUpdate;
    try
      if Row = -1 then
        Row := FLogStrings.Count;

      while Row >= FLogStrings.Count do
        FLogStrings.Add(TStringList.Create);

      for i := Low(ColumnText) to High(ColumnText) do
      begin
        if i >= Header.Columns.Count then
          Header.Columns.Add;

        if i >= TStringList(FLogStrings[Row]).Count then
          TStringList(FLogStrings[Row]).Add('');

        TStringList(FLogStrings[Row])[i] := ColumnText[i];

        if i <= 10 then
          Header.AutoFitColumns(FALSE);
      end;

      RootNodeCount := FLogStrings.Count;

      if (not Focused) and (FAutoScroll) then
        ScrollIntoView(GetLast, FALSE);

      Invalidate;
    finally
      EndUpdate;
    end;
  end;
end;

procedure TChromeTabs32Log.SetAutoScroll(Value: Boolean);
begin
  FAutoScroll := Value;
end;

procedure TChromeTabs32Log.SetAutoSizeIndex(Value: Integer);
begin
  Header.AutoSizeIndex := Value;
  Header.Options := Header.Options + [hoAutoResize];
end;
{$ENDIF}

{$IFNDEF USE_VIRTUALTREES}
constructor TChromeTabs32Log.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  ViewStyle := vsReport;
  ShowColumnHeaders := FALSE;
  ReadOnly := TRUE;
end;

procedure TChromeTabs32Log.Log(const ColumnText: Array of String; Row: Integer);
var
  i: Integer;
begin
  BeginUpdate;
  try
    if Row = -1 then
      Row := Items.Count;

    while Row >= Items.Count do
      Items.Add;

    for i := Low(ColumnText) to High(ColumnText) do
    begin
      if i >= Columns.Count then
        Columns.Add;

      if Items[Row].SubItems.Count < pred(length(ColumnText)) then
        Items[Row].SubItems.Add('');

      if i = 0 then
        Items[Row].Caption := ColumnText[i]
      else
        Items[Row].SubItems[i - 1] := ColumnText[i]
    end;

    if (Items.Count > 0) and (not Focused) and (FAutoScroll) then
      Items[Items.Count - 1].MakeVisible(FALSE);
  finally
    EndUpdate;
  end;
end;

function TChromeTabs32Log.GetColumnText(AColumn, ARow: Integer): String;
begin
  if (ARow < Items.Count) and
     ((AColumn = 0) or
      (AColumn - 1 < Items[ARow].SubItems.Count)) then
  begin
    if AColumn = 0 then
      Result := Items[ARow].Caption
    else
      Result := Items[ARow].SubItems[AColumn - 1];
  end
  else
    Result := '';
end;

procedure TChromeTabs32Log.AddColumn(const Text: String; ColumnWidth: Integer);
var
  Column: TListColumn;
begin
  Column := Columns.Add;

  Column.Caption := Text;

  if ColumnWidth = 0 then
    Column.Width := ClientWidth
  else
    Column.Width := ColumnWidth;
end;

procedure TChromeTabs32Log.SetAutoScroll(Value: Boolean);
begin
  FAutoScroll := Value;
end;

procedure TChromeTabs32Log.SetAutoSizeIndex(Value: Integer);
begin
  //
end;

procedure TChromeTabs32Log.BeginUpdate;
begin
  Items.BeginUpdate;
end;

procedure TChromeTabs32Log.EndUpdate;
begin
  Items.EndUpdate;
end;

{$ENDIF}

end.
