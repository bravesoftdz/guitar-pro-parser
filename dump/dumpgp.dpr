program dumpgp;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Graphics,
  uGPFileParser in '..\units\uGPFileParser.pas';

var
  GP : TGPFileParser;
  Filename : string;
  i : integer;
  Measure : TGPMeasure;
begin

  if ParamCount <> 1 then begin
    Writeln('Expecting a filename as a parameter');
    Exit;
  end;

  Filename := ParamStr(1);
  if not FileExists(Filename) then begin
    Writeln(Format('Paramater : %s, is not a valid filename', [Filename]));
    Exit;
  end;

  try
    GP := TGPFileParserFactory.Execute(Filename);
    try
      GP.Execute;
      // Dump the Values
      Writeln(Format('GP Version          : %s', [GP.Version]));
      Writeln(Format('Title               : %s', [GP.Title]));
      Writeln(Format('Subtitle            : %s', [GP.SubTitle]));
      Writeln(Format('Artist              : %s', [GP.Artist]));
      Writeln(Format('Album               : %s', [GP.Album]));
      Writeln(Format('Copyright           : %s', [GP.Copyright]));
      Writeln(Format('Interpret           : %s', [GP.Interpret]));
      Writeln(Format('Transcriber         : %s', [GP.Transcriber]));
      Writeln(Format('Instructional       : %s', [GP.Instructional]));
      Writeln(Format('Notes               : %s', [GP.Notes.Text]));
      Writeln(Format('Triplet             : %s', [BoolToStr(GP.IsTripletFeel, true)]));
      Writeln(Format('Tempo               : %d', [GP.Tempo]));
      Writeln(Format('Lyric Track Number  : %d', [GP.TrackLyrics.TrackNumber]));

      Writeln(Format('Number Of Measures  : %d', [GP.NumberOfMeasures]));
      Writeln(Format('Number of Tracks    : %d', [GP.NumberOfTracks]));

      for i := 0  to GP.Measures.Count - 1 do begin
        Writeln(Format('Measure Number      : %d', [GP.Measures[i].MeasureNumber]));
        Writeln(Format('Measure Marker      : %s', [GP.Measures[i].MarkersName]));
      end;

      for i := 0  to GP.Tracks.Count - 1 do begin
        Writeln(Format('Track Number        : %d', [GP.Tracks[i].TrackNumber]));
        Writeln(Format('Track Name          : %s', [GP.Tracks[i].Name]));
        Writeln(Format('Track String Count  : %d', [GP.Tracks[i].NumberOfStrings]));
        Writeln(Format('Track Fret Count    : %d', [GP.Tracks[i].NumberOfFrets]));
        Writeln(Format('Track Capo Fret     : %d', [GP.Tracks[i].HeightOfCapo]));
        Writeln(Format('Track Colour        : %s', [ColorToString(GP.Tracks[i].Colour)]));
      end;

    finally
      GP.Free;
    end;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
