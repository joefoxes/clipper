// Filename:      SCREEN.PRG
// Module:        Text Screen Functions Library
// Date-Written:  November 27, 1991
// Last-Update:   December 06, 1991

*#define FILL_CHAR chr(176)             // Screen background design.
*#define BKGND_SCREEN "   "+FILL_CHAR+"   "+FILL_CHAR+FILL_CHAR

/***************************************************************************/
/* CHAR function BkgndScreen(NIL)                                          */
/* --> paints the background screen blue with white foreground and creates */
/*   a heading and message bar.                                            */
/*                                                                         */
/* NIL  function RestoreScreen(cSavedScreen)                               */
/* -->  restores the original screen attribute.                            */
/* CHAR cSavedScreen - the screen buffer of a previously saved screen.     */
/*                                                                         */
/*                                                                         */
/* NIL  function Header(cHeading1,cHeading2)                               */
/* -->  displays a 2 headings at the top row of the screen.                */
/* CHAR  cHeading1, cHeading2 - strings to display.                        */
/*                                                                         */
/* NIL  function Message(cMessage)                                         */
/* -->  displays a message at the bottom row of the screen (message bar).  */
/* CHAR  cMessage - string to display (maximum length is 79).              */
/***************************************************************************/

function BkgndScreen()
local cSaveScreen
   // Save original screen to buffer.
   cSaveScreen:=SaveScreen(00,00,24,79)
   // Display screen with white dots on blue background.
   SetColor("W+/N")                  // Change color to White on Blue.
   @ 00,00 clear to 24,79            // Clear entire screen.
*   SetColor("N/W+")                  // Change color to Black on White.
*   @ 00,00 say " "+chr(240)+" "
*   @ 01,00 clear to 01,79            // Clear the top row.
*   SetColor("W+/B")                  // Change back to White on Blue.
return cSaveScreen                   // Value returned: CHAR cSaveScreen

function RestoreScreen(cSavedScreen)
   RestScreen(00,00,24,79,cSavedScreen)  // Restore previously saved screen.
return nil                               // Value returned: NIL

function Heading(cTitle)
local cSaveColor
   cSaveColor:=SetColor("W+/N")        // Change color to White on Blue.
   // Display title on center-top row.
   @ 00,40-(Len(cTitle) / 2) say cTitle
   SetColor(cSaveColor)                // Return original color.
return nil                             // Value returned: NIL

function Message(cMessage)
local cSaveColor
   if Len(cMessage)>79                 // Is string > 79 characters?
      cMessage:=SubStr(cMessage,1,79)  // Yes -- truncate to 79 chars only.
   endif
   cSaveColor:=SetColor(if(iscolor(),"N/BG","N/W")) // Change color to White on Cyan.
   @ 24,00 clear to 24,79              // Clear bottom row.
   @ 24,01 say cMessage                // Display message on bottom row.
   SetColor(cSaveColor)                // Return original color.
return nil                             // Value returned: NIL

/***
*  STI_Logo()  --> NIL
*  Clear Screen Display the STI's logo
*/

FUNCTION STI_Logo()
local col
 col:=setcolor(if(Iscolor(),"R/N","W/N"))
 @ 02, 00 say ""
 @ row()+1, 00 say "   �                                                                          "
 @ row()+1, 00 say "   �                                                                          "
 @ row()+1, 00 say "   �                               ����  ��  �� �����  ����� �����           "
 @ row()+1, 00 say "   �      ���                     ��  �� ��  �� ��  �� ��    ��  ��          "
 @ row()+1, 00 say "   �     ������                    ����  ��  �� ������ ����  ������          "
 @ row()+1, 00 say "   �      �������                 ��  �� ��  �� ��     ��    ��  ��          "
 @ row()+1, 00 say "   �        �������                ����   ����  ��     ����� ��  ��          "
 @ row()+1, 00 say "   �          �������             ������ �����   ����  ��  �� ����� ��       "
 @ row()+1, 00 say "   �            �������             ��   ��  �� ��  �� ��  �� ��    ��       "
 @ row()+1, 00 say "   �              �������           ��   ������ ������ ��  �� ����  ��       "
 @ row()+1, 00 say "   �                ������          ��   ��  �� ��  ��  ����  ��    ��       "
 @ row()+1, 00 say "   �                  ���           ��   ��  �� ��  ��   ��   ����� �����    "
 @ row()+1, 00 say "   �                               ���� �   ��  ����                         "
 @ row()+1, 00 say "   �                                ��  ��� �� ��  ��                        "
 @ row()+1, 00 say "   �          ����                  ��  ������ ��                            "
 @ row()+1, 00 say "   �        ��������                ��  �� ��� ��  ��                        "
 @ row()+1, 00 say "   �        ��������               ���� ��   �  ����  �                      "
 @ row()+1, 00 say "   �          ����                                                           "
 @ row()+1, 00 say "   �                                                                         "
 @ row()+1, 00 say "   ����������������������������                                              "
setcolor("W+/N")
 @ 03,04,21,31 Box "��������"
 @       4, 15 say "  ���� "
 @ row()+1, 15 say "��������"
 @ row()+1, 15 say "�������� "
 @ row()+1, 15 say "  ���� "
 @ row()+3, 10 say "���"
 @ row()+1, 09 say "������"
 @ row()+1, 10 say "�������"
 @ row()+1, 12 say "�������"
 @ row()+1, 14 say "�������"
 @ row()+1, 16 say "�������"
 @ row()+1, 18 say "�������"
 @ row()+1, 20 say "������"
 @ row()+1, 22 say "���"
 @ 2,0 to 23,79 double
 setcolor(col)
return nil


// end-of-file