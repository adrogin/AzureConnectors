page 50250 "AP Client Identity Setup"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "AP Client Identity Setup";
    Caption = 'Client Identity Setup';

    layout
    {
        area(Content)
        {
            repeater(Setup)
            {
                field(TenantID; Rec."Tenant ID")
                {
                    ApplicationArea = All;
                }
                field(ClientID; Rec."Client ID")
                {
                    ApplicationArea = All;
                }
                field(ClientSecret; Rec."Client Secret")
                {
                    ApplicationArea = All;
                }
                field(ResourceUrl; Rec."Resource Url")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}