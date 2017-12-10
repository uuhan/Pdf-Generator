#include <string.h>
#include <stdio.h>
#include "hpdf.h"

void
draw_image(HPDF_Doc pdf, const char* filename, float x, float y,
           const char* text)
{
    const char* FILE_SEPARATOR = "/";
    char        filename1[255];

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
            HPDF_Page_SetLineWidth(page, 0.5);
        else {
            if (HPDF_Page_GetLineWidth(page) != 0.25)
                HPDF_Page_SetLineWidth(page, 0.25);
        }

        HPDF_Page_MoveTo(page, x, 0);
        HPDF_Page_LineTo(page, x, height);
        HPDF_Page_Stroke(page);

        if (x % 50 == 0 && x > 0) {
            HPDF_Page_SetGrayStroke(page, 0.5);

            HPDF_Page_MoveTo(page, x, 0);
            HPDF_Page_LineTo(page, x, 5);
            HPDF_Page_Stroke(page);

            HPDF_Page_MoveTo(page, x, height);
            HPDF_Page_LineTo(page, x, height - 5);
            HPDF_Page_Stroke(page);

            HPDF_Page_SetGrayStroke(page, 0.8);
        }

        x += 5;
    }

    y = 0;
    while (y < height) {
        if (y % 10 == 0 && y > 0) {
            char buf[12];

            HPDF_Page_BeginText(page);
            HPDF_Page_MoveTextPos(page, 5, y - 2);
            snprintf(buf, 12, "%u", y);
            HPDF_Page_ShowText(page, buf);
            HPDF_Page_EndText(page);
        }

        y += 5;
    }


    x = 0;
    while (x < width) {
        if (x % 50 == 0 && x > 0) {
            char buf[12];

            HPDF_Page_BeginText(page);
            HPDF_Page_MoveTextPos(page, x, 5);
            snprintf(buf, 12, "%u", x);
            HPDF_Page_ShowText(page, buf);
            HPDF_Page_EndText(page);

            HPDF_Page_BeginText(page);
            HPDF_Page_MoveTextPos(page, x, height - 10);
            HPDF_Page_ShowText(page, buf);
            HPDF_Page_EndText(page);
        }

        x += 5;
    }

    HPDF_Page_SetGrayFill(page, 0);
    HPDF_Page_SetGrayStroke(page, 0);
}

static const int PAGE_WIDTH = 420;
static const int PAGE_HEIGHT = 400;
static const int CELL_WIDTH = 20;
static const int CELL_HEIGHT = 20;
static const int CELL_HEADER = 10;

void
draw_graph(HPDF_Page page)
{
    char buf[50];
    int  i;

    /* Draw 16 X 15 cells */

    /* Draw vertical lines. */
    HPDF_Page_SetLineWidth(page, 0.5);

    for (i = 0; i <= 17; i++) {
        int x = i * CELL_WIDTH + 40;

        HPDF_Page_MoveTo(page, x, PAGE_HEIGHT - 60);
        HPDF_Page_LineTo(page, x, 40);
        HPDF_Page_Stroke(page);

        if (i > 0 && i <= 16) {
            HPDF_Page_BeginText(page);
            HPDF_Page_MoveTextPos(page, x + 5, PAGE_HEIGHT - 75);
            snprintf(buf, 5, "%X", i - 1);
            HPDF_Page_ShowText(page, buf);
            HPDF_Page_EndText(page);
        }
    }

    /* Draw horizontal lines. */
    for (i = 0; i <= 15; i++) {
        int y = i * CELL_HEIGHT + 40;

        HPDF_Page_MoveTo(page, 40, y);
        HPDF_Page_LineTo(page, PAGE_WIDTH - 40, y);
        HPDF_Page_Stroke(page);

        if (i < 14) {
            HPDF_Page_BeginText(page);
            HPDF_Page_MoveTextPos(page, 45, y + 5);
            snprintf(buf, 5, "%X", 15 - i);
            HPDF_Page_ShowText(page, buf);
            HPDF_Page_EndText(page);
        }
    }
}

void
draw_fonts(HPDF_Page page)
{
    int i;
    int j;

    HPDF_Page_BeginText(page);

    /* Draw all character from 0x20 to 0xFF to the canvas. */
    for (i = 1; i < 17; i++) {
        for (j = 1; j < 17; j++) {
            unsigned char buf[2];
            int           y = PAGE_HEIGHT - 55 - ((i - 1) * CELL_HEIGHT);
            int           x = j * CELL_WIDTH + 50;

            buf[1] = 0x00;

            buf[0] = (i - 1) * 16 + (j - 1);
            if (buf[0] >= 32) {
                double d;

                d = x - HPDF_Page_TextWidth(page, (char*)buf) / 2;
                HPDF_Page_TextOut(page, d, y, (char*)buf);
            }
        }
    }

    HPDF_Page_EndText(page);
}
