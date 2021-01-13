codeunit 50139 EventSubscriptions
// CSD1.00 - 2018-01-01 - D. E. Veloper
// Chapter 7 - Lab 2-1
{
    [EventSubscriber(ObjectType::Codeunit, 212, 'OnBeforeResLedgEntryInsert', '', true, true)]
    local procedure PostResJnlLineOnBeforeResLedgEntryInsert(var ResLedgerEntry: Record "Res. Ledger Entry"; ResJournalLine: Record "Res. Journal Line");
    var
        c: Codeunit "Res. Jnl.-Post Line";
    begin
        ResLedgerEntry."CSD Seminar No." := ResJournalLine."CSD Seminar No.";
        ResLedgerEntry."CSD Seminar Registration No." := ResJournalLine."CSD Seminar Registration No.";
    end;

    [EventSubscriber(ObjectType::Page, Page::Navigate, 'OnAfterNavigateFindRecords', '', true, true)]
    local procedure ExtendNavigateOnAfterNavigateFindRecords(var DocumentEntry: Record "Document Entry"; DocNoFilter: Text; PostingDateFilter: Text)
    var
        SeminarLedgerEntry: record "CSD Seminar Ledger Entry";
        PostedSeminarRegHeader: record "CSD Posted Seminar Reg. Header";
        DocNoOfRecords: Boolean;
        NextEntryNo: Integer;
    begin
    end;

    [EventSubscriber(ObjectType::Page, 344, 'OnAfterNavigateShowRecords', '', true, true)]
    local procedure ExtendNavigateOnAfterNavigateShowFindRecords
    (TableID: Integer;
    DocNoFilter: Text;
    PostingDateFilter: Text;
    ItemTrackingSearch: Boolean);
    var
        SeminarLedgerEntry: record "CSD Seminar Ledger Entry";
        PostedSeminarRegHeader: record "CSD Posted Seminar Reg. Header";
    begin
        begin
            case TableID of
                Database::"CSD Posted Seminar Reg. Header":
                    begin
                        PostedSeminarRegHeader.SetFilter("No.", DocNoFilter);
                        PostedSeminarRegHeader.SetFilter("Posting Date", PostingDateFilter);
                        Page.Run(0, PostedSeminarRegHeader);
                    end;
                Database::"CSD Seminar Ledger Entry":
                    begin
                        SeminarLedgerEntry.SetFilter("Document No.", DocNoFilter);
                        SeminarLedgerEntry.SetFilter("Posting Date", PostingDateFilter);
                        Page.Run(0, SeminarLedgerEntry);
                    end;
            end;
        end
    end;


}

