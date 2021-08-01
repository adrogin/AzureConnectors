table 50260 "AAD Client Identity Setup"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "Resource Url"; Text[255])
        {
            Caption = 'Resource URL';
        }
        field(3; "Resource Name"; Text[255])
        {
            Caption = 'Resource Name';
        }
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}