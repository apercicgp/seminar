pageextension 50100 "CSD ResourceCardEx" extends "Resource Card"
// CSD1.00 - 2018-02-01 - D. E. Veloper
{
    layout
    {
        addlast(General)
        {
            field("CSD Resource Type"; rec."CSD Resource Type")
            {
                ApplicationArea = all;
            }
            field("CSD Quantity Per Day"; rec."CSD Quantity Per Day")
            {
                ApplicationArea = all;
            }
        }
        addafter("Personal Data")
        {
            group("CSD Room")
            {
                Visible = ShowMaxField;
                Caption = 'Room';

                field("CSD Maximum Participants"; rec."CSD Maximum Participants")
                {
                    ApplicationArea = all;
                }
            }
        }
    }



    trigger OnAfterGetRecord();
    begin
        ShowMaxField := (rec.Type = rec.Type::Machine);
        CurrPage.Update(false);
    end;

    var
        ShowMaxField: Boolean;
}