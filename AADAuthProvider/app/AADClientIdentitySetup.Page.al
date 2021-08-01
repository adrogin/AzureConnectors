page 50260 "AAD Client Identity Setup"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "AAD Client Identity Setup";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(ResourceUrl; Rec."Resource Url")
                {
                    ApplicationArea = All;
                    ToolTip = 'URL of the resource you want to access';
                }
                field(ResourceName; Rec."Resource Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'User-friendly name of the resource';
                }
            }
        }
    }
}