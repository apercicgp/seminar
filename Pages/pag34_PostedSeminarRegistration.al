page 50134 "CSD Posted Seminar Reg."
{
    // CSD1.00 - 2018-01-01 - D. E. Veloper
    //   Chapter 7 - Lab 3
    //     - Created new page

    Caption = 'Posted Seminar Registration';
    Editable = false;
    PageType = Document;
    SourceTable = "CSD Posted Seminar Reg. Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Starting Date"; rec."Starting Date")
                {
                    ApplicationArea = All;
                }
                field("Seminar No."; rec."Seminar No.")
                {
                    ApplicationArea = All;
                }
                field("Seminar Name"; rec."Seminar Name")
                {
                    ApplicationArea = All;
                }
                field("Instructor Resource No."; rec."Instructor Resource No.")
                {
                    ApplicationArea = All;
                }
                field("Instructor Name"; rec."Instructor Name")
                {
                    ApplicationArea = All;
                }
                field("Posting Date"; rec."Posting Date")
                {
                    ApplicationArea = All;
                }
                field("Document Date"; rec."Document Date")
                {
                    ApplicationArea = All;
                }
                field(Status; rec.Status)
                {
                    ApplicationArea = All;
                }
                field(Duration; rec.Duration)
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
            part(SeminarRegistrationLines; "CSD Post Seminar Reg. Subpage")
            {
                SubPageLink = "Document No." = Field("No.");
                ApplicationArea = All;
            }
            group("Seminar Room")
            {
                field("Room Resource No."; rec."Room Resource No.")
                {
                    ApplicationArea = All;
                }
                field("Room Name"; rec."Room Name")
                {
                    ApplicationArea = All;
                }
                field("Room Address"; rec."Room Address")
                {
                    ApplicationArea = All;
                }
                field("Room Address 2"; rec."Room Address 2")
                {
                    ApplicationArea = All;
                }
                field("Room Post Code"; rec."Room Post Code")
                {
                    ApplicationArea = All;
                }
                field("Room City"; rec."Room City")
                {
                    ApplicationArea = All;
                }
                field("Room Country/Reg. Code"; rec."Room Country/Reg. Code")
                {
                    ApplicationArea = All;
                }
                field("Room County"; rec."Room County")
                {
                    ApplicationArea = All;
                }
            }
            group(Invoicing)
            {
                field("Gen. Prod. Posting Group"; rec."Gen. Prod. Posting Group")
                {
                    ApplicationArea = All;
                }
                field("VAT Prod. Posting Group"; rec."VAT Prod. Posting Group")
                {
                    ApplicationArea = All;
                }
                field("Seminar Price"; rec."Seminar Price")
                {
                    ApplicationArea = All;
                }
            }
        }
        area(factboxes)
        {
            part("Seminar Details FactBox"; "CSD Seminar Details FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "No." = Field("Seminar No.");
            }
            part("Customer Details FactBox"; "Customer Details FactBox")
            {
                Provider = SeminarRegistrationLines;
                SubPageLink = "No." = Field("Bill-to Customer No.");
                ApplicationArea = All;
            }
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
        area(navigation)
        {
            group("&Seminar Registration")
            {
                Caption = '&Seminar Registration';
                action("Co&mments")
                {
                    Caption = 'Co&mments';
                    Image = Comment;
                    RunObject = page "CSD Seminar Comment List";
                    RunPageLink = "No." = Field("No.");
                    RunPageView = where("Table Name" = const("Posted Seminar Registration"));
                    ApplicationArea = All;
                }
                action("&Charges")
                {
                    Caption = '&Charges';
                    Image = Costs;
                    RunObject = Page "CSD Posted Seminar Charges";
                    RunPageLink = "Document No." = Field("No.");
                    ApplicationArea = All;
                }
            }
        }
        area(Processing)
        {
            action("&Navigate")
            {
                Caption = '&Navigate';
                Image = Navigate;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction();

                var
                    Navigate: page Navigate;

                begin
                    Navigate.SetDoc("Posting Date", "No.");
                    Navigate.RUN;
                end;
            }

        }
    }
}