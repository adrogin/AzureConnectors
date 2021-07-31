codeunit 50250 "AP Bearer Token Auth. Provider" implements "AP Azure Auth. Provider"
{
    procedure GetAuthenticationHeaders(): Dictionary of [Text, Text]
    var
        ClientIdentity: Record "AP Client Identity";
        TokenValid: Boolean;
    begin
        if ClientIdentity.Get() then
            TokenValid := IsTokenValid(ClientIdentity);

        if not TokenValid then
            AcquireBearerToken(ClientIdentity);

        exit(PrepareBearerTokenAuthHeader(ClientIdentity));
    end;

    local procedure GetBearerTokenRequestBody(ClientIdentitySetup: Record "AP Client Identity Setup") RequestBody: Text
    begin
        RequestBody :=
             'grant_type=' + UrlEncode('client_credentials') +
             '&client_id=' + UrlEncode(ClientIdentitySetup."Client ID") +
             '&client_secret=' + UrlEncode(ClientIdentitySetup."Client Secret");

        ClientIdentitySetup.TestField("Resource Url");
        RequestBody := RequestBody + '&resource=' + UrlEncode(ClientIdentitySetup."Resource Url");
    end;

    local procedure GetBearerTokenRequestUrl(TenantId: Text): Text
    begin
        exit('https://login.microsoftonline.com/' + TenantId + '/oauth2/token');
    end;

    local procedure IsTokenValid(ClientIdentity: Record "AP Client Identity"): Boolean
    begin
        exit(ClientIdentity."Token Expiration DateTime" > CurrentDateTime());
    end;

    local procedure PrepareBearerTokenAuthHeader(ClientIdentity: Record "AP Client Identity") Header: Dictionary of [Text, Text]
    begin
        Header.Add('Authorization', 'Bearer ' + ClientIdentity.Token);
    end;

    local procedure AcquireBearerToken(var ClientIdentity: Record "AP Client Identity")
    var
        ClientIdentitySetup: Record "AP Client Identity Setup";
    begin
        if ClientIdentity.Get() then
            ClientIdentity.Delete(true);

        ClientIdentitySetup.Get();
        SaveBearerToken(ClientIdentity, RequestBearerToken(ClientIdentitySetup));
    end;

    local procedure RequestBearerToken(ClientIdentitySetup: Record "AP Client Identity Setup") ContentInStream: InStream
    var
        Content: HttpContent;
        Headers: HttpHeaders;
        Client: HttpClient;
        ResponseMsg: HttpResponseMessage;
    begin
        Content.WriteFrom(GetBearerTokenRequestBody(ClientIdentitySetup));

        Content.GetHeaders(Headers);
        Headers.Clear();
        Headers.Add('Content-Type', 'application/x-www-form-urlencoded');
        Headers.Add('charset', 'UTF-8');

        Client.Post(GetBearerTokenRequestUrl(ClientIdentitySetup."Tenant ID"), Content, ResponseMsg);

        VerifyHttpResponseMsg(ResponseMsg);

        ResponseMsg.Content.ReadAs(ContentInStream);
    end;

    local procedure SaveBearerToken(var ClientIdentity: Record "AP Client Identity"; ContentStream: InStream)
    var
        ResponseObject: JsonObject;
        JToken: JsonToken;
    begin
        ResponseObject.ReadFrom(ContentStream);

        ResponseObject.Get('access_token', JToken);
        ClientIdentity.Token := CopyStr(JToken.AsValue().AsText(), 1, MaxStrLen(ClientIdentity.Token));

        ResponseObject.Get('expires_in', JToken);
        // TODO: expiration date/time should be calculated from the token generation time
        ClientIdentity."Token Expiration DateTime" := CurrentDateTime() + JToken.AsValue().AsInteger() * 1000;

        ClientIdentity.Insert(true);
    end;

    local procedure UrlEncode(TextToEncode: Text): Text
    var
        TypeHelper: Codeunit "Type Helper";
    begin
        exit(TypeHelper.UrlEncode(TextToEncode));
    end;

    local procedure VerifyHttpResponseMsg(ResponseMsg: HttpResponseMessage)
    var
        ResponseText: Text;
        ErrorMessageErr: Label 'Server returned the error %1\%2', Comment = '%1: HTTP error code, %2: Error text.';
    begin
        if ResponseMsg.IsSuccessStatusCode() then
            exit;

        ResponseMsg.Content.ReadAs(ResponseText);
        Error(ErrorMessageErr, ResponseMsg.HttpStatusCode, ResponseText);
    end;
}