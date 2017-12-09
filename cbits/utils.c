#include <string.h>
#include <stdio.h>
#include "hpdf.h"

void
draw_image(HPDF_Doc pdf, const char* filename, float x, float y,
           const char* text)
{
#ifdef __WIN32__
    const char* FILE_SEPARATOR = "\\";
#else
    const char* FILE_SEPARATOR = "/";
#endif
    char filename1[255];

    HPDF_Page  page = HPDF_GetCurrentPage(pdf);
    HPDF_Image image;

    strcpy(filename1, "pngsuite");
    strcat(filename1, FILE_SEPARATOR);
    strcat(filename1, filename);

    image = HPDF_LoadPngImageFromFile(pdf, filename1);

    /* Draw image to the canvas. */
    HPDF_Page_DrawImage(page, image, x, y, HPDF_Image_GetWidth(image),
                        HPDF_Image_GetHeight(image));

    /* Print the text. */
    HPDF_Page_BeginText(page);
    HPDF_Page_SetTextLeading(page, 16);
    HPDF_Page_MoveTextPos(page, x, y);
    HPDF_Page_ShowTextNextLine(page, filename);
    HPDF_Page_ShowTextNextLine(page, text);
    HPDF_Page_EndText(page);
}

void
error_handler(HPDF_STATUS error_no, HPDF_STATUS detail_no, void* user_data)
{
    printf("ERROR: error_no=%04X, detail_no=%u\n", (HPDF_UINT)error_no,
           (HPDF_UINT)detail_no);
}

void
show_description(HPDF_Page page, float x, float y, const char* text)
{
    char buf[255];

    HPDF_Page_MoveTo(page, x, y - 10);
    HPDF_Page_LineTo(page, x, y + 10);
    HPDF_Page_MoveTo(page, x - 10, y);
    HPDF_Page_LineTo(page, x + 10, y);
    HPDF_Page_Stroke(page);

    HPDF_Page_SetFontAndSize(page, HPDF_Page_GetCurrentFont(page), 8);
    HPDF_Page_SetRGBFill(page, 0, 0, 0);

    HPDF_Page_BeginText(page);

    snprintf(buf, 255, "(x=%d,y=%d)", (int)x, (int)y);
    HPDF_Page_MoveTextPos(page, x - HPDF_Page_TextWidth(page, buf) - 5, y - 10);
    HPDF_Page_ShowText(page, buf);
    HPDF_Page_EndText(page);

    HPDF_Page_BeginText(page);
    HPDF_Page_MoveTextPos(page, x - 20, y - 25);
    HPDF_Page_ShowText(page, text);
    HPDF_Page_EndText(page);
}

void
print_grid(HPDF_Doc pdf, HPDF_Page page)
{
    HPDF_REAL height = HPDF_Page_GetHeight(page);
    HPDF_REAL width = HPDF_Page_GetWidth(page);
    HPDF_Font font = HPDF_GetFont(pdf, "Helvetica", NULL);
    HPDF_UINT x, y;

    HPDF_Page_SetFontAndSize(page, font, 5);
    HPDF_Page_SetGrayFill(page, 0.5);
    HPDF_Page_SetGrayStroke(page, 0.8);

    y = 0;
    while (y < height) {
        if (y % 10 == 0) {
            HPDF_Page_SetLineWidth(page, 0.5);
        } else {
            if (HPDF_Page_GetLineWidth(page) != 0.25)
                HPDF_Page_SetLineWidth(page, 0.25);
        }
        HPDF_Page_MoveTo(page, 0, y);
        HPDF_Page_LineTo(page, width, y);
        HPDF_Page_Stroke(page);

        if (y % 10 == 0 && y > 0) {
            HPDF_Page_SetGrayStroke(page, 0.5);

            HPDF_Page_MoveTo(page, 0, y);
            HPDF_Page_LineTo(page, 5, y);
            HPDF_Page_Stroke(page);

            HPDF_Page_SetGrayStroke(page, 0.8);
        }

        y += 5;
    }

    x = 0;
    while (x < width) {
        if (x % 10 == 0)
            HPDF_Page_SetLineWidth (page, 0.5);
        else {
            if (HPDF_Page_GetLineWidth (page) != 0.25)
                HPDF_Page_SetLineWidth (page, 0.25);
        }

        HPDF_Page_MoveTo (page, x, 0);
        HPDF_Page_LineTo (page, x, height);
        HPDF_Page_Stroke (page);

        if (x % 50 == 0 && x > 0) {
            HPDF_Page_SetGrayStroke (page, 0.5);

            HPDF_Page_MoveTo (page, x, 0);
            HPDF_Page_LineTo (page, x, 5);
            HPDF_Page_Stroke (page);

            HPDF_Page_MoveTo (page, x, height);
            HPDF_Page_LineTo (page, x, height - 5);
            HPDF_Page_Stroke (page);

            HPDF_Page_SetGrayStroke (page, 0.8);
        }

        x += 5;
    }

    y = 0;
    while (y < height) {
        if (y % 10 == 0 && y > 0) {
            char buf[12];

            HPDF_Page_BeginText (page);
            HPDF_Page_MoveTextPos (page, 5, y - 2);
            snprintf (buf, 12, "%u", y);
            HPDF_Page_ShowText (page, buf);
            HPDF_Page_EndText (page);
        }

        y += 5;
    }


    x = 0;
    while (x < width) {
        if (x % 50 == 0 && x > 0) {
            char buf[12];

            HPDF_Page_BeginText (page);
            HPDF_Page_MoveTextPos (page, x, 5);
            snprintf (buf, 12, "%u", x);
            HPDF_Page_ShowText (page, buf);
            HPDF_Page_EndText (page);

            HPDF_Page_BeginText (page);
            HPDF_Page_MoveTextPos (page, x, height - 10);
            HPDF_Page_ShowText (page, buf);
            HPDF_Page_EndText (page);
        }

        x += 5;
    }

    HPDF_Page_SetGrayFill (page, 0);
    HPDF_Page_SetGrayStroke (page, 0);
}
