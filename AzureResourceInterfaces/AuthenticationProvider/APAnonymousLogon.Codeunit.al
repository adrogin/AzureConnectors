codeunit 70220 "AP Anonymous Logon" implements "AP Azure Auth. Provider"
{
    procedure GetAuthenticationHeaders(): Dictionary of [Text, Text]
    var
        EmptyHeader: Dictionary of [Text, Text];
    begin
        exit(EmptyHeader);
    end;
}