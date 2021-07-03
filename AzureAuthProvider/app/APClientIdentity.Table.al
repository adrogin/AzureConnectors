table 50251 "AP Client Identity"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(6; Token; Text[255])
        {
            Caption = 'Token';
            ExtendedDatatype = Masked;
        }
        field(7; "Token Acquisition DateTime"; DateTime)
        {
            Caption = 'Token Acquisition Date/Time';
        }
        field(8; "Token Expiration DateTime"; DateTime)
        {
            Caption = 'Token Expiration Date/Time';
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