program Project2;

var
  archivo: textFile;
  linea: string;
begin
  AssignFile(archivo, 'file.txt');
  Reset(archivo);
  while not EOF(archivo) do begin
    readln(archivo, linea);
    writeln(linea);
  end;
  CloseFile(archivo);
  readln;
end.
