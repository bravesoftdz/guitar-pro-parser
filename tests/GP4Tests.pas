unit GP4Tests;

interface

uses
  TestFramework, uGPFileParser;

type

  // Test methods for unit Geo.pas

  TGP4UnitTest = class(TTestCase)
  private
    GP : TGPFileParser;
   public
     procedure SetUp; override;
     procedure TearDown; override;
  published
    procedure GetVersionTest;
    procedure GetTitleTest;
    procedure GetSubTitleTest;
    procedure GetArtistTest;
    procedure GetAlbumTest;
    procedure GetCopyrightTest;
    procedure GetInterpretTest;
    procedure GetTranscriberTest;
    procedure GetInstructionalTest;
    procedure GetNotesTest;

    procedure GetTripletFeelTest;
    procedure GetLyricsTest;
    procedure GetTempoTest;
    procedure GetKeyTest;
    procedure GetOctaveTest;
    procedure GetTablatureTest;
  end;

implementation

uses Math;

procedure TGP4UnitTest.SetUp;
var
  Filename :string;
begin
  Filename := '..\files\test.gp4';
  GP := TGPFileParserFactory.Execute(Filename);
  GP.Execute;
end;

procedure TGP4UnitTest.TearDown;
begin
 GP := nil;
end;

procedure TGP4UnitTest.GetVersionTest;
begin
  CheckEquals('FICHIER GUITAR PRO v4.00', GP.Version, 'Not GP 4 File');
end;

procedure TGP4UnitTest.GetTablatureTest;
begin
  //CheckEquals('4 hands', GP.Ta, 'Incorrect Title');
end;

procedure TGP4UnitTest.GetTempoTest;
begin
 CheckEquals(111, GP.Tempo, 'Incorrect Tempo');
end;

procedure TGP4UnitTest.GetTitleTest;
begin
  CheckEquals('4 hands', GP.Title, 'Incorrect Title');
end;

procedure TGP4UnitTest.GetSubTitleTest;
begin
  CheckEquals('cancion para 4 manos...y dos instrumentos', GP.SubTitle, 'Incorrect Subtitle');
end;

procedure TGP4UnitTest.GetArtistTest;
begin
  CheckEquals('Mauricio Gracia Gutierrez', GP.Artist, 'Incorrect Artist');
end;

procedure TGP4UnitTest.GetAlbumTest;
begin
  CheckEquals('none', GP.Album, 'Incorrect Album');
end;

procedure TGP4UnitTest.GetCopyrightTest;
begin
  CheckEquals('', GP.Copyright, 'Incorrect Copyright');
end;

procedure TGP4UnitTest.GetInterpretTest;
begin
  CheckEquals('Mauricio Gracia Gutierrez', GP.Interpret, 'Incorrect Interpret');
end;

procedure TGP4UnitTest.GetKeyTest;
begin
  CheckEquals(TGPKey.D.KeyMode, GP.Key.KeyMode, 'Incorrect Key');
end;

procedure TGP4UnitTest.GetLyricsTest;
begin
  CheckEquals(0, GP.TrackLyrics.TrackNumber, 'Incorrect Lyric Count')
end;

procedure TGP4UnitTest.GetTranscriberTest;
begin
  CheckEquals('', GP.Transcriber, 'Incorrect Artist');
end;

procedure TGP4UnitTest.GetTripletFeelTest;
begin
CheckEquals(False, GP.IsTripletFeel, 'Incorrect Triplet Feel');
end;

procedure TGP4UnitTest.GetInstructionalTest;
begin
  CheckEquals('guitar & flaute', GP.Instructional, 'Incorrect Instructions');
end;

procedure TGP4UnitTest.GetNotesTest;
begin
  CheckEquals('', GP.Notes.Text, 'Incorrect Notes');
end;

procedure TGP4UnitTest.GetOctaveTest;
begin
  CheckEquals(False, GP.IsOctave, 'Incorrect Octave');
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TGP4UnitTest.Suite);
end.

