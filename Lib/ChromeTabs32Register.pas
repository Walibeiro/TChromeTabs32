unit ChromeTabs32Register;

interface

uses
  ToolsApi,
  {$IF CompilerVersion >= 23.0}
  System.SysUtils, System.Classes,
  Vcl.Controls,
  Vcl.Dialogs, Vcl.Menus, Vcl.ActnList,
  WinApi.Windows,
  {$ELSE}
  SysUtils, Classes,
  Controls, ActnList,
  Windows,
  {$ifend}
  DesignIntf, DesignEditors,

  ChromeTabs32,
  ChromeTabs32Design;

  procedure Register;

implementation

resourcestring
  StrTChromeTabs32Every = 'TChromeTabs32 - Every tab you''ll ever need';

{$R 'Icon.dcr'}

const
  PropertySection = 'Chrome Tabs';
  TChromeTabs32Name = 'TChromeTabs32';

procedure Register;
begin
  RegisterComponents(PropertySection, [TChromeTabs32]);

  // Property Editors
  RegisterComponentEditor(TChromeTabs32, TChromeTabEditor);
end;

{$IF CompilerVersion >= 18.0}

procedure RegisterSplashScreen;
var
  ProductImage: HBITMAP;
begin
  if Assigned(SplashScreenServices) then
  begin
    ProductImage := LoadBitmap(
      FindResourceHInstance(HInstance),
      'TChromeTabs32');

    SplashScreenServices.AddPluginBitmap(
      TChromeTabs32Name,
      ProductImage,
      False,
      StrTChromeTabs32Every);
  end;
end;

initialization

  RegisterSplashScreen;

finalization

{$IFEND}

end.
