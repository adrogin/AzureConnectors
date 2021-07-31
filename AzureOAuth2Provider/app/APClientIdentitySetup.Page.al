page 50250 "AP Client Identity Setup"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "AP Client Identity Setup";
    Caption = 'Client Identity Setup';

    layout
    {
        area(Content)
        {
            group(Setup)
            {
                Caption = 'Connection Setup';

                field(TenantID; Rec."Tenant ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Azure tenant ID where the requested resource is located.';
                }
                field(ClientID; Rec."Client ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Client ID or Application ID is the identifier assigned to the client application when it is registered in the Azure Active Directory.';
                }
                field(ClientSecret; Rec."Client Secret")
                {
                    ApplicationArea = All;
                    ToolTip = 'Once the client applicaiton is registered in AAD, you can generate a secret key in the Azure Portal under "Certificated and Secrets".';
                }
                field(ResourceUrl; Rec."Resource Url")
                {
                    ApplicationArea = All;
                    ToolTip = 'URL of the resource which you want to access';
                }
            }
        }
    }
}
