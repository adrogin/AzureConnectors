enumextension 50250 "AP OAuth2 Bearer Token Provider" extends "AP Azure Auth. Provider"
{
    value(1; OAuth2)
    {
        Caption = 'OAuth2';
        Implementation = "AP Azure Auth. Provider" = "AP Bearer Token Auth. Provider";
    }
}