codeunit 50260 "AAD Authentication Provider" implements "AP Azure Auth. Provider"
{
    procedure GetAuthenticationHeaders(): Dictionary of [Text, Text]
    var
        AADClientIdentitySetup: Record "AAD Client Identity Setup";
        AzureADAccessDialog: Page "Azure AD Access Dialog";
        Header: Dictionary of [Text, Text];
        AuthCode: Text;
    begin
        AADClientIdentitySetup.Get();
        AuthCode := AzureADAccessDialog.GetAuthorizationCode(AADClientIdentitySetup."Resource Url", AADClientIdentitySetup."Resource Name");
        Header.Add('Authorization', 'Bearer ' + AuthCode);

        exit(Header);
    end;
}