table 50250 "AP Client Identity Setup"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "Client ID"; Text[36])
        {
            Caption = 'Client ID';
        }
        field(3; "Client Secret"; Text[255])
        {
            Caption = 'Client Secret';
            ExtendedDatatype = Masked;
        }
        field(4; "Resource Url"; Text[255])
        {
            Caption = 'Resource URL';
        }
        field(5; "Tenant ID"; Text[36])
        {
            Caption = 'Tenant ID';
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