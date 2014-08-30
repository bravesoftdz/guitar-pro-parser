unit GP3Tests;

interface

uses
  TestFramework;

type

  // Test methods for unit Geo.pas

  TGP3UnitTest = class(TTestCase)
  private
  public
  published
    procedure GetVersionTest;

  end;

implementation

uses Math, uGPFileParser;

procedure TGP3UnitTest.GetVersionTest;
var
  Filename :string;
  GP : TGPFileParser;
begin
  Filename := '..\files\test.gp3';
  GP := TGPFileParserFactory.Execute(Filename);
  try
    GP.Execute;
    CheckEquals('FICHIER GUITAR PRO v3.00', GP.Version, 'Not GP 3 File');
  finally
    GP.Free;
  end;
end;


initialization
  // Register any test cases with the test runner
  RegisterTest(TGP3UnitTest.Suite);
end.
