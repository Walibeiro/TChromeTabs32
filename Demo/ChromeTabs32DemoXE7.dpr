program ChromeTabsDemoXE7;

uses
  Forms,
  frmMainU in 'frmMainU.pas' {frmMain},
  frameChromeTabsStyleU in 'frameChromeTabsStyleU.pas' {frameChromeTabsStyleU: TFrame},
  ChromeTabs32Classes in '..\Lib\ChromeTabs32Classes.pas',
  ChromeTabs32Controls in '..\Lib\ChromeTabs32Controls.pas',
  ChromeTabs32GlassForm in '..\Lib\ChromeTabs32GlassForm.pas',
  ChromeTabs32Log in '..\Lib\ChromeTabs32Log.pas',
  ChromeTabs32ThreadTimer in '..\Lib\ChromeTabs32ThreadTimer.pas',
  ChromeTabs32Types in '..\Lib\ChromeTabs32Types.pas',
  ChromeTabs32Utils in '..\Lib\ChromeTabs32Utils.pas',
  ChromeTabs32 in '..\Lib\ChromeTabs32.pas';

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
