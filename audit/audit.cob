IDENTIFICATION DIVISION.
PROGRAM-ID. SimpleAudit.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT InputFile ASSIGN TO 'transactions.txt'
        ORGANIZATION IS LINE SEQUENTIAL.
    SELECT ReportFile ASSIGN TO 'rapport_audit.txt'
        ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD InputFile.
01 InputLine       PIC X(80).

FD ReportFile.
01 ReportLine      PIC X(80).

WORKING-STORAGE SECTION.
01 EOF             PIC X VALUE 'N'.
01 LigneDate       PIC X(10).
01 LigneDesc       PIC X(30).
01 LigneMontant    PIC S9(5)V99.
01 TotalMontant    PIC S9(7)V99 VALUE 0. *> stocke le total calculé
01 TotalMontantAffiche PIC Z(5)9.99. *> format d’affichage propre


PROCEDURE DIVISION.
    OPEN INPUT InputFile
    OPEN OUTPUT ReportFile

    PERFORM UNTIL EOF = 'Y'
        READ InputFile
            AT END
                MOVE 'Y' TO EOF
            NOT AT END
                UNSTRING InputLine DELIMITED BY SPACE
                    INTO LigneDate, LigneDesc, LigneMontant
                END-UNSTRING

                ADD LigneMontant TO TotalMontant

                MOVE InputLine TO ReportLine
                WRITE ReportLine
        END-READ
    END-PERFORM

    MOVE "-----------------------------" TO ReportLine
    WRITE ReportLine

    MOVE TotalMontant To TotalMontantAffiche       
    MOVE SPACES TO ReportLine
    STRING "TOTAL : " DELIMITED BY SIZE
           TotalMontantAffiche DELIMITED BY SIZE
           INTO ReportLine
    WRITE ReportLine

    CLOSE InputFile
    CLOSE ReportFile
    STOP RUN.
