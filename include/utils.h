#include "hpdf.h"

void draw_image(HPDF_Doc pdf, const char* filename, float x, float y,
                const char* text);

void error_handler(HPDF_STATUS error_no, HPDF_STATUS detail_no,
                   void* user_data);

void show_description(HPDF_Page page, float x, float y, const char* text);

void print_grid(HPDF_Doc pdf, HPDF_Page page);
