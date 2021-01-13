page 50102 "CSD Seminar List"
// CSD1.00 - 2018-01-01 - D. E. Veloper
// Chapter 5 - Lab 3-6
{
    Caption = 'Seminar List';
    PageType = List;
    SourceTable = "CSD Seminar";
    Editable = false;
    CardPageId = 50101;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; rec."No.")
                {
                    ApplicationArea = All;
                }
                field(Name; rec.Name)
                {
                    ApplicationArea = All;
                }
                field("Seminar Duration"; rec."Seminar Duration")
                {
                    ApplicationArea = All;
                }
                field("Seminar Price"; rec."Seminar Price")
                {
                    ApplicationArea = All;
                }
                field("Minimum Participants"; rec."Minimum Participants")
                {
                    ApplicationArea = All;
                }
                field("Maximum Participants"; rec."Maximum Participants")
                {
                    ApplicationArea = All;
                }
            }
        }
        area(FactBoxes)
        {
            systempart("Links"; Links)
            {
                ApplicationArea = All;
            }
            systempart("Notes"; Notes)
            {
                ApplicationArea = All;
            }
        }

    }

    actions
    {
        area(Navigation)
        {
            group("&Seminar")
            {
                action("Co&mments")
                {
                    RunObject = page "CSD Seminar Comment Sheet";
                    RunPageLink = "Table Name" = const(Seminar), "No." = field("No.");
                    Image = Comment;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ApplicationArea = All;
                }
                // >> Lab 8 1-2
            }
            action("Ledger Entries")
            {
                Caption = 'Ledger Entries';
                RunObject = page "CSD Seminar Ledger Entries";
                RunPageLink = "Seminar No." = field("No.");
                Promoted = true;
                PromotedCategory = Process;
                ShortcutKey = "Ctrl+F7";
                Image = WarrantyLedger;
            }
            // >> Lab 8 1-2 
            action("&Registrations")
            {
                Caption = '&Registrations';
                RunObject = page "CSD Seminar Registration List";
                RunPageLink = "Seminar No." = field("No.");
                Image = Timesheet;
                Promoted = true;
                PromotedCategory = Process;
            }
            // << Lab 8 1-2
        }
        area(Processing)
        {
            action("Seminar Registration")
            {
                RunObject = page "CSD Seminar Registration";
                RunPageLink = "Seminar No." = field("No.");
                RunPageMode = Create;
                Image = NewTimesheet;
                Promoted = true;
                PromotedCategory = New;
            }
        }
        // << Lab 8 1-2
    }
}


