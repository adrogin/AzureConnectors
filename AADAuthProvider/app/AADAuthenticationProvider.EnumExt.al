enumextension 50260 "AAD Authentication Provider" extends "AP Azure Auth. Provider"
{
    value(3; AAD)
    {
        Caption = 'Azure Active Directory';
        Implementation = "AP Azure Auth. Provider" = "AAD Authentication Provider";
    }
}
