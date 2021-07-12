enum 70220 "AP Azure Auth. Provider" implements "AP Azure Auth. Provider"
{
    Extensible = true;

    value(0; Anonymous)
    {
        Caption = 'Anonymous';
        Implementation = "AP Azure Auth. Provider" = "AP Anonymous Logon";
    }
}