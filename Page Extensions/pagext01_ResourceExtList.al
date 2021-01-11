pageextension 50101 "CSD ResourceListExt" extends "Resource List"
{
    layout
    {
        modify(Type)
        {
            Visible = Showtype;
        }
        addafter("Type")

        {
            field("CSD Resource Type"; rec."CSD Resource Type")
            {
                ApplicationArea = All;
            }
            field("CSD Maximum Participants"; rec."CSD Maximum Participants")
            {
                Visible = ShowMaxField;
                ApplicationArea = All;
            }
        }
    }


    trigger OnOpenPage();
    begin
        ShowType := (rec.GetFilter(Type) = '');
        ShowMaxField :=
            (rec.GetFilter(Type) = format(rec.Type::machine));
    end;

    var
        [InDataSet]
        ShowMaxField: Boolean;
        [InDataSet]
        Showtype: Boolean;

}