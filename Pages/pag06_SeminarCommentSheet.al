page 50106 "CSD Seminar Comment Sheet"
// CSD1.00 - 2018-01-01 - D. E. Veloper
// Chapter 5 - Lab 2-2
{
    Caption = 'Seminar Comment Sheet';
    PageType = List;
    SourceTable = "CSD Seminar Comment Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Date;rec.Date)
                {
                    ApplicationArea = All;
                }
                field(Code;rec.Code)
                {
                    Visible=false;
                    ApplicationArea = All;
                }
                field(Comment;rec.Comment)
                {    
                    ApplicationArea = All;
                }
            }
        }
    }
}
