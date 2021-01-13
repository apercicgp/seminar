report 50101 "CSD SeminarRegParticipantList"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = './Layouts/SeminarRegParticipantList.rdl';
    Caption = 'Seminar Reg Participant List';
    dataset
    {
        dataitem("CSD Seminar Reg. Header"; "CSD Seminar Reg. Header")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.", "Seminar No.";
            column(No_; "No.")
            {
                IncludeCaption = true;
            }
            column(Seminar_No_; "Seminar No.")
            {
                IncludeCaption = true;
            }
            column(Seminar_Name; "Seminar Name")
            {
                IncludeCaption = true;
            }
            column(Starting_Date; "Starting Date")
            {
                IncludeCaption = true;
            }
            column(Duration; Duration)
            {
                IncludeCaption = true;
            }
            column(Instructor_Name; "Instructor Name")
            {
                IncludeCaption = true;
            }
            column(Room_Name; "Room Name")
            {
                IncludeCaption = true;
            }
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(Name; SourceExpression)
                    {
                        ApplicationArea = All;

                    }
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    var
        myInt: Integer;
}