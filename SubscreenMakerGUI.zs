#option SHORT_CIRCUIT on
#option HEADER_GUARD on
#include "TypeAString.zh"
#include "VenrobKeyboardManager.zh"

namespace Venrob::SubscreenEditor
{
	//start Palette
	enum Color
	{
		TRANS = 0x00,
		//System UI colors; these don't change
		WHITE = 0xEF,
		BLACK = 0xE0,
		DGRAY = 0xEC,
		GRAY = 0xED,
		LGRAY = 0xEE,
		PURPLE = 0xE6,
		BLUE = 0xE7,
		MBLUE = 0xE8,
		LBLUE = 0xE9,
		SYS_BLACK = 0xF1,
		SYS_DGRAY = 0xF2,
		SYS_GRAY = 0xF3,
		SYS_LGRAY = 0xF4,
		SYS_WHITE = 0xF5,
		SYS_BLUE = 0xF0
	};
	DEFINE PAL_SIZE = 0x10;
	const Color PAL[PAL_SIZE];
	enum PalIndex
	{
		//0x00
		COL_NULL, //The color to use for blank area. *NOT* Color 0! Should probably be black?
		COL_DISABLED, //Disabled objects/text ("greyed out")
		COL_TEXT_MAIN, //Text against main backgrounds
		COL_TEXT_TITLE_BAR, //The color for the text in the bar of dialogue windows
		//0x04
		COL_TITLE_BAR, //The color for the bar of dialogue windows
		COL_BODY_MAIN_LIGHT, //The main GUI body color, light.
		COL_BODY_MAIN_MED, //The main GUI body color, medium.
		COL_BODY_MAIN_DARK, //The main GUI body color, dark.
		//0x08
		COL_TEXT_FIELD, //Text against fields (X's in checkboxes, text in type fields)
		COL_FIELD_BG, //The color for fields, such as text entry and checkboxes.
		COL_HIGHLIGHT, //The color used to highlight your cursor (i.e. selected object)
		COL_CURSOR, //The color of the provided cursor
		//
		COL_MAX = PAL_SIZE
	};
	
	bool getPalName(char32 buf, int palIndex)
	{
		switch(palIndex)
		{
			case COL_TEXT_MAIN:
				strcat(buf, "Text(Main)");
				break;
			case COL_DISABLED:
				strcat(buf, "Disabled(Grey)");
				break;
			case COL_TEXT_FIELD:
				strcat(buf, "Text(Field)");
				break;
			case COL_BODY_MAIN_LIGHT:
				strcat(buf, "Body(Light)");
				break;
			case COL_BODY_MAIN_MED:
				strcat(buf, "Body(Med)");
				break;
			case COL_BODY_MAIN_DARK:
				strcat(buf, "Body(Dark)");
				break;
			case COL_FIELD_BG:
				strcat(buf, "BG(Field)");
				break;
			case COL_CURSOR:
				strcat(buf, "Cursor");
				break;
			case COL_HIGHLIGHT:
				strcat(buf, "Highlighted");
				break;
			case COL_TITLE_BAR:
				strcat(buf, "Title Bar");
				break;
			case COL_NULL:
				strcat(buf, "Emptiness");
				break;
			case COL_TEXT_TITLE_BAR:
				strcat(buf, "Text(Title)");
				break;
			default:
				strcat(buf, "--");
				return false;
		}
		return true;
	}
	
	//start Default Palettes
	void loadClassicPal(Color Palette)
	{
		Palette[COL_TEXT_MAIN] = BLACK;
		Palette[COL_DISABLED] = GRAY;
		Palette[COL_TEXT_FIELD] = BLACK;
		Palette[COL_BODY_MAIN_LIGHT] = WHITE;
		Palette[COL_BODY_MAIN_MED] = LGRAY;
		Palette[COL_BODY_MAIN_DARK] = DGRAY;
		Palette[COL_FIELD_BG] = WHITE;
		Palette[COL_CURSOR] = GRAY;
		Palette[COL_HIGHLIGHT] = BLUE;
		Palette[COL_TITLE_BAR] = GRAY;
		Palette[COL_NULL] = BLACK;
		Palette[COL_TEXT_TITLE_BAR] = WHITE;
	}
	void loadClassicDarkPal(Color Palette)
	{
		Palette[COL_TEXT_MAIN] = LBLUE;
		Palette[COL_DISABLED] = GRAY;
		Palette[COL_TEXT_FIELD] = LBLUE;
		Palette[COL_BODY_MAIN_LIGHT] = GRAY;
		Palette[COL_BODY_MAIN_MED] = DGRAY;
		Palette[COL_BODY_MAIN_DARK] = BLACK;
		Palette[COL_FIELD_BG] = BLACK;
		Palette[COL_CURSOR] = WHITE;
		Palette[COL_HIGHLIGHT] = BLUE;
		Palette[COL_TITLE_BAR] = DGRAY;
		Palette[COL_NULL] = BLACK;
		Palette[COL_TEXT_TITLE_BAR] = LBLUE;
	}
	void loadBasicPal(Color Palette)
	{
		Palette[COL_TEXT_MAIN] = SYS_BLACK;
		Palette[COL_DISABLED] = SYS_GRAY;
		Palette[COL_TEXT_FIELD] = SYS_BLACK;
		Palette[COL_BODY_MAIN_LIGHT] = SYS_WHITE;
		Palette[COL_BODY_MAIN_MED] = SYS_LGRAY;
		Palette[COL_BODY_MAIN_DARK] = SYS_DGRAY;
		Palette[COL_FIELD_BG] = SYS_WHITE;
		Palette[COL_CURSOR] = SYS_GRAY;
		Palette[COL_HIGHLIGHT] = SYS_BLUE;
		Palette[COL_TITLE_BAR] = SYS_GRAY;
		Palette[COL_NULL] = SYS_BLACK;
		Palette[COL_TEXT_TITLE_BAR] = SYS_WHITE;
	}
	void loadBasicDarkPal(Color Palette)
	{
		Palette[COL_TEXT_MAIN] = SYS_WHITE;
		Palette[COL_DISABLED] = SYS_GRAY;
		Palette[COL_TEXT_FIELD] = SYS_WHITE;
		Palette[COL_BODY_MAIN_LIGHT] = SYS_LGRAY;
		Palette[COL_BODY_MAIN_MED] = SYS_DGRAY;
		Palette[COL_BODY_MAIN_DARK] = SYS_BLACK;
		Palette[COL_FIELD_BG] = SYS_BLACK;
		Palette[COL_CURSOR] = SYS_WHITE;
		Palette[COL_HIGHLIGHT] = SYS_BLUE;
		Palette[COL_TITLE_BAR] = SYS_GRAY;
		Palette[COL_NULL] = SYS_BLACK;
		Palette[COL_TEXT_TITLE_BAR] = SYS_BLACK;
	} //end
	//end 
		
	namespace DIALOG
	{
		DEFINE DIA_FONT = FONT_Z3SMALL;
		DEFINE DIA_CLOSING_DELAY = 4;
		DEFINE GEN_BUTTON_WIDTH = 48, GEN_BUTTON_HEIGHT = 12;
		namespace PARTS //start Individual procs
		{
			//Deco type procs: purely visual
			//start Deco: Generic
			void rect(bitmap bit, int x1, int y1, int x2, int y2, int color) //start
			{
				bit->Rectangle(0, x1, y1, x2, y2, color, 1, 0, 0, 0, true, OP_OPAQUE);
			} //end
			void h_rect(bitmap bit, int x1, int y1, int x2, int y2, int color) //start
			{
				bit->Rectangle(0, x1, y1, x2, y2, color, 1, 0, 0, 0, false, OP_OPAQUE);
			} //end
			void circ(bitmap bit, int x, int y, int rad, int color) //start
			{
				bit->Circle(0, x, y, rad, color, 1, 0, 0, 0, true, OP_OPAQUE);
			} //end
			void tri(bitmap bit, int x1, int y1, int x2, int y2, int x3, int y3, int color) //start
			{
				bit->Triangle(0, x1, y1, x2, y2, x3, y3, 0, 0, color, 0, 0, 0, NULL);
			} //end
			void text(bitmap bit, int x, int y, int tf, char32 str, int color)  //start No width; straight draw
			{
				bit->DrawString(0, x, y, DIA_FONT, color, -1, tf, str, OP_OPAQUE);
			} //end
			void text(bitmap bit, int x, int y, int tf, char32 str, int color, int width) //start Width; will wrap to next line
			{
				DrawStringsBitmap(bit, 0, x, y, DIA_FONT, color, -1, tf, str, OP_OPAQUE, Text->FontHeight(DIA_FONT)/2, width);
			} //end
			int shortcuttext_width(char32 str, int font) //start
			{
				int pos = _strchr(str, 0, '%');
				if(pos<0) return Text->StringWidth(str, font);
				char32 buf[256];
				strcpy(buf, str);
				int remlen = 1;
				if(buf[pos+1]=='%')
				{
					++remlen;
					int end = _strchr(buf, pos+2, '%');
					if(end>-1)
					{
						remlen += (end-pos);
					}
				}
				remnchr(buf, pos, remlen);
				for(int pos = _strchr(buf, 0, '%'); pos>-1; pos = _strchr(buf, 0, '%'))
				{
					remnchr(buf, pos, 1);
				}
				return Text->StringWidth(buf, font);
			} //end
			int shortcut_text(bitmap bit, int x, int y, char32 str, int color) //start Character following a % will be underlined
			{
				int pos = _strchr(str, 0, '%');
				if(pos<0)
				{
					text(bit, x, y, TF_NORMAL, str, color);
					return NULL;
				}
				char32 c;
				int key;
				char32 buf[256];
				strcpy(buf, str);
				int remlen = 1;
				if(buf[pos+1]=='%')
				{
					int end = _strchr(buf, pos+2, '%');
					if(end>-1)
					{
						remlen += (end-pos);
						char32 ibuf[16];
						strncpy(ibuf, 0, buf, pos+2, end-(pos+2));
						key = atoi(ibuf);
					}
				}
				remnchr(buf, pos, remlen);
				if(key)
				{
					pos = _strchr(buf, 0, '%');
					unless(pos<0)
					{
						remnchr(buf, pos, 1);
						int pos2 = _strchr(buf, pos, '%');
						unless(pos2<0)
						{
							remnchr(buf, pos2, 1);
							char32 t_buf[256];
							strncpy(t_buf, buf, pos);
							bit->DrawString(0, x, y, DIA_FONT, color, -1, TF_NORMAL, t_buf, OP_OPAQUE);
							int wid1 = Text->StringWidth(t_buf, DIA_FONT);
							remchr(t_buf, 0);
							strncpy(t_buf, 0, buf, pos, pos2-pos);
							bit->DrawString(0, x+wid1, y, DIA_FONT, color, -1, TF_NORMAL, t_buf, OP_OPAQUE);
							int wid2 = Text->StringWidth(t_buf, DIA_FONT);
							remchr(t_buf, 0);
							strncpy(t_buf, 0, buf, pos2, strlen(buf)-pos2);
							bit->DrawString(0, x+wid1+wid2, y, DIA_FONT, color, -1, TF_NORMAL, t_buf, OP_OPAQUE);
							int strhei = Text->FontHeight(DIA_FONT);
							line(bit, x+wid1, y+strhei, x+wid1+wid2-2, y+strhei, color);
							return key;
						}
					}
					bit->DrawString(0, x, y, DIA_FONT, color, -1, TF_NORMAL, buf, OP_OPAQUE);
					return key;
				}
				else
				{
					char32 t_buf[256];
					strncpy(t_buf, buf, pos);
					int strwid = Text->StringWidth(t_buf, DIA_FONT), strhei = Text->FontHeight(DIA_FONT);
					bit->DrawString(0, x, y, DIA_FONT, color, -1, TF_NORMAL, buf, OP_OPAQUE);
					c = buf[pos];
					line(bit, x+strwid, y+strhei, x+strwid+Text->CharWidth(c, DIA_FONT)-2, y+strhei, color);
					return isAlphabetic(c) ? (LowerToUpper(c)-'A'+KEY_A) : (isNumber(c) ? (c-'0'+KEY_0) : NULL);
				}
				return NULL;
			} //end
			void line(bitmap bit, int x, int y, int x2, int y2, int color) //start
			{
				bit->Line(0, x, y, x2, y2, color, 1, 0, 0, 0, OP_OPAQUE);
			}
			void x(bitmap bit, int x, int y, int len, int color)
			{
				int x2 = x+len-1, y2 = y+len-1;
				line(bit, x, y, x2, y2, color);
				line(bit, x, y2, x2, y, color);
			} //end
			void pix(bitmap bit, int x, int y, int color) //start
			{
				bit->PutPixel(0, x, y, color, 0, 0, 0, OP_OPAQUE);
			} //end
			void tile(bitmap bit, int x, int y, int tile, int cset) //start
			{
				bit->FastTile(0, x, y, tile, cset, OP_OPAQUE);
			} //end
			void tilebl(bitmap bit, int x, int y, int tile, int cset, int wid, int hei) //start
			{
				bit->DrawTile(0, x, y, tile, wid, hei, cset, -1, -1, 0, 0, 0, FLIP_NONE, true, OP_OPAQUE);
			} //end
			void combo(bitmap bit, int x, int y, int combo, int cset) //start
			{
				bit->FastCombo(0, x, y, combo, cset, OP_OPAQUE);
			} //end
			void minitile(bitmap bit, int x, int y, int tile, int cset, int corner) //start
			{
				unless(<bitmap>(g_arr[MINITILE_BITMAP])->isValid())
				{
					<bitmap>(g_arr[MINITILE_BITMAP])->Free();
					g_arr[MINITILE_BITMAP] = Game->CreateBitmap(16,16);
				}
				<bitmap>(g_arr[MINITILE_BITMAP])->Clear(0);
				tile(g_arr[MINITILE_BITMAP], 0, 0, tile, cset);
				<bitmap>(g_arr[MINITILE_BITMAP])->Blit(0, bit, (corner&01b)?8:0, (corner&10b)?8:0, 8, 8, x, y, 8, 8, 0, 0, 0, 0, 0, true);
			} //end
			void itm(bitmap bit, int x, int y, int id) //start
			{
				itemdata id = Game->LoadItemData(id);
				int aspeedtime = (Max(1,id->ASpeed*id->AFrames));
				int tmr = SubEditorData[SED_GLOBAL_TIMER] % (aspeedtime+id->Delay);
				int frm = (tmr - aspeedtime >= 0) ? 0 : Div(tmr, Max(1,id->ASpeed));
				bit->FastTile(0, x, y, id->Tile + frm, id->CSet, OP_OPAQUE);
			} //end
			//end
			//start Deco: Special
			void corner_border_effect(bitmap bit, int corner_x, int corner_y, int len, int corner_dir, int color)
			{	//A triangle, with a curve cut out of the hypotenuse. Right, Equilateral triangles only.
				int x1 = corner_x + (remY(corner_dir)==DIR_RIGHT ? -len : len),
				    y1 = corner_y,
					x2 = corner_x,
				    y2 = corner_y + (remX(corner_dir)==DIR_DOWN ? -len : len);
				bitmap sub = create(bit->Width, bit->Height);
				sub->Clear(0);
				tri(sub, corner_x, corner_y, x1, y1, x2, y2, color);
				circ(sub, x1, y2, len, 0x00);
				fullblit(0, bit, sub);
				sub->Free();
			}
			void frame_rect(bitmap bit, int x1, int y1, int x2, int y2, int margin, int FillCol, int ULCol, int DRCol)
			{
				rect(bit, x1, y1, x1+(margin-1), y2, ULCol);
				rect(bit, x2, y2, x1, y2-(margin-1), DRCol);
				rect(bit, x2, y2, x2-(margin-1), y1, DRCol);
				rect(bit, x1, y1, x2, y1+(margin-1), ULCol);
				
				rect(bit, x1+margin, y1+margin, x2-margin, y2-margin, FillCol);
			}
			void frame_rect(bitmap bit, int x1, int y1, int x2, int y2, int margin, int FillCol)
			{
				frame_rect(bit, x1, y1, x2, y2, margin, FillCol, PAL[COL_BODY_MAIN_LIGHT], PAL[COL_BODY_MAIN_DARK]);
			}
			void inv_frame_rect(bitmap bit, int x1, int y1, int x2, int y2, int margin, int FillCol)
			{
				frame_rect(bit, x1, y1, x2, y2, margin, FillCol, PAL[COL_BODY_MAIN_DARK], PAL[COL_BODY_MAIN_LIGHT]);
			}
			void frame_rect(bitmap bit, int x1, int y1, int x2, int y2, int margin)
			{
				frame_rect(bit, x1, y1, x2, y2, margin, PAL[COL_BODY_MAIN_MED]);
			}
			void inv_frame_rect(bitmap bit, int x1, int y1, int x2, int y2, int margin)
			{
				inv_frame_rect(bit, x1, y1, x2, y2, margin, PAL[COL_BODY_MAIN_MED]);
			}
			//end
			//Active type procs: functional
			//start components
			ProcRet x_out(bitmap bit, int x, int y, int len, untyped dlgdata) //start
			{
				ProcRet ret = PROC_NULL;
				int x2 = x+len-1, y2 = y+len-1;
				if(SubEditorData[SED_LCLICKED] && DLGCursorBox(x,y,x2,y2,dlgdata))
				{
					ret = PROC_CANCEL;
					inv_frame_rect(bit, x, y, x2, y2, 1);
				}
				else frame_rect(bit, x, y, x2, y2, 1);
				x(bit, x+1, y+1, len-2, PAL[COL_TEXT_MAIN]);
				return ret;
			} //end
			ProcRet checkbox(bitmap bit, int x, int y, int len, bool checked, untyped dlgdata, int flags) //start
			{
				bool disabled = flags&FLAG_DISABLE;
				ProcRet ret = PROC_NULL;
				int x2 = x+len-1, y2 = y+len-1;
				if(!disabled && SubEditorData[SED_LCLICKED] && DLGCursorBox(x,y,x2,y2,dlgdata))
				{
					checked = !checked;
					ret = checked ? PROC_UPDATED_TRUE : PROC_UPDATED_FALSE;
				}
				
				frame_rect(bit, x, y, x2, y2, 1, (disabled ? PAL[COL_BODY_MAIN_MED] : PAL[COL_FIELD_BG]));
				if(checked) x(bit, x+1, y+1, len-2, (disabled ? PAL[COL_DISABLED] : PAL[COL_TEXT_MAIN]));
				return ret;
			} //end
			ProcRet insta_button(bitmap bit, int x, int y, int wid, int hei, char32 btnText, untyped dlgdata, int flags) //start
			{
				bool disabled = flags&FLAG_DISABLE;
				ProcRet ret = PROC_NULL;
				int x2 = x + wid - 1, y2 = y + hei - 1;
				if(!disabled && SubEditorData[SED_LCLICKED] && DLGCursorBox(x,y,x2,y2,dlgdata))
				{
					ret = PROC_CONFIRM;
				}
				
				frame_rect(bit, x, y, x2, y2, 1);
				
				text(bit, x+(wid/2), y+Ceiling((hei-Text->FontHeight(DIA_FONT))/2), TF_CENTERED, btnText, disabled ? PAL[COL_DISABLED] : PAL[COL_TEXT_MAIN]);
				
				return ret;
			} //end
			ProcRet button(bitmap bit, int x, int y, int wid, int hei, char32 btnText, untyped dlgdata, untyped proc_data, int proc_indx, int flags) //start
			{
				int was_held = proc_data[proc_indx];
				DEFINE FLAG_HELD_MOUSE = 01b;
				DEFINE FLAG_HELD_KEY = 10b;
				bool disabled = flags&FLAG_DISABLE;
				bool isDefault = flags&FLAG_DEFAULT;
				ProcRet ret = PROC_NULL;
				int x2 = x + wid - 1, y2 = y + hei - 1;
				bool indented = false;
				bitmap tbit = create(dlgdata[DLG_DATA_WID], dlgdata[DLG_DATA_HEI]);
				tbit->Clear(0);
				int key = shortcut_text(tbit, x+((wid-shortcuttext_width(btnText, DIA_FONT))/2), y+Ceiling((hei-Text->FontHeight(DIA_FONT))/2), btnText, disabled ? PAL[COL_DISABLED] : PAL[COL_TEXT_MAIN]);
				if(!disabled)
				{
					bool cursor = DLGCursorBox(x,y,x2,y2,dlgdata);
					
					if(cursor&&SubEditorData[SED_LCLICKED])
					{
						was_held |= FLAG_HELD_MOUSE;
						indented = true;
					}
					else if((was_held & FLAG_HELD_MOUSE) && (cursor&&SubEditorData[SED_LCLICKING]))
					{
						indented = true;
					}
					else if(was_held & FLAG_HELD_MOUSE)
					{
						was_held = 0;
						if(cursor) ret = PROC_CONFIRM; //If you slid the cursor off the button, don't register it as a click!
					}
					
					if(key&&keyprocp(key) || (isDefault&&DefaultButtonP()))
					{
						was_held |= FLAG_HELD_KEY;
						indented = true;
					}
					else if((was_held & FLAG_HELD_KEY) && ((key&&keyproc(key)) || (isDefault&&DefaultButton())))
					{
						indented = true;
					}
					else if(was_held & FLAG_HELD_KEY)
					{
						was_held = 0;
						ret = PROC_CONFIRM;
					}
				}
				if(indented) inv_frame_rect(bit, x, y, x2, y2, isDefault ? 2 : 1);
				else frame_rect(bit, x, y, x2, y2, isDefault ? 2 : 1);
				
				fullblit(0, bit, tbit);
				tbit->Free();
				
				proc_data[proc_indx] = was_held;
				return ret;
			}
			ProcRet button(bitmap bit, int x, int y, int wid, int hei, char32 btnText, untyped dlgdata, untyped proc_data, int proc_indx)
			{
				button(bit, x, y, wid, hei, btnText, dlgdata, proc_data, proc_indx, 0);
			} //end
			Color pal_swatch(bitmap bit, int x, int y, int wid, int hei, Color swatch_color, untyped dlgdata) //start
			{
				int x2 = x+wid-1, y2 = y+hei-1;
				if(SubEditorData[SED_LCLICKED] && DLGCursorBox(x, y, x2, y2, dlgdata))
				{
					swatch_color = pick_color(swatch_color);
				}
				frame_rect(bit, x, y, x2, y2, 1, swatch_color);
				return swatch_color;
			}//end
			void tile_swatch(bitmap bit, int x, int y, int wid, int hei, int arr, untyped dlgdata) //start
			{
				int x2 = x+wid-1, y2 = y+hei-1;
				if(SubEditorData[SED_LCLICKED] && DLGCursorBox(x, y, x2, y2, dlgdata))
				{
					pick_tile(arr);
				}
				frame_rect(bit, x, y, x2, y2, 1);
				tile(bit, x+1, y+1, arr[0], arr[1]);
			}//end
			int dropdown_proc(bitmap bit, int x, int y, int wid, int indx, untyped dlgdata, char32 strings, int num_opts, int NUM_VIS_OPTS, bitmap lastframe, int flags)
			{
				if(num_opts <= 0) num_opts = SizeOfArray(strings);
				char32 num_buf[12];
				itoa(num_buf,indx+1);
				bool disabled = flags&FLAG_DISABLE;
				int hei = 2 + 2 + Text->FontHeight(DIA_FONT);
				frame_rect(bit, x, y, x+wid-1, y+hei-1, 1, disabled ? PAL[COL_BODY_MAIN_MED] : PAL[COL_FIELD_BG]);
				text(bit, x+2, y+2, TF_NORMAL, strings ? strings[indx] : num_buf, disabled ? PAL[COL_DISABLED] : PAL[COL_TEXT_FIELD]);
				//
				DEFINE BTN_HEIGHT = hei, BTN_WIDTH = hei;
				int bx = x + (wid - BTN_WIDTH);
				frame_rect(bit, bx, y, bx+BTN_WIDTH-1, y+BTN_HEIGHT-1, 1);
				line(bit, bx + 2, y + 5, (bx + BTN_WIDTH/2)-1, y+(BTN_HEIGHT/2)+2, disabled ? PAL[COL_DISABLED] : PAL[COL_TEXT_MAIN]);
				line(bit, bx + BTN_WIDTH - 2 - 1, y + 5, (bx + BTN_WIDTH/2), y+(BTN_HEIGHT/2)+2, (disabled ? PAL[COL_DISABLED] : PAL[COL_TEXT_MAIN]));
				//
				if(SubEditorData[SED_LCLICKED] && DLGCursorBox(x, y, x+wid-1, y+hei-1, dlgdata))
				{
					indx = dropdown_open(lastframe, x, y+hei, wid, indx, dlgdata, strings, num_opts, NUM_VIS_OPTS);
				}
				return indx;
			}
			//end
			//start compounds
			ProcRet title_bar(bitmap bit, int margin, int barheight, char32 title, untyped dlgdata, char32 descstr, bool buttons) //start
			{
				--barheight;
				rect(bit, margin, margin, dlgdata[DLG_DATA_WID]-margin-margin, barheight, PAL[COL_TITLE_BAR]);
				text(bit, margin+margin, margin+((barheight - Text->FontHeight(DIA_FONT))/2), TF_NORMAL, title, PAL[COL_TEXT_TITLE_BAR]);
				line(bit, margin, barheight, dlgdata[DLG_DATA_WID]-margin, barheight, PAL[COL_BODY_MAIN_DARK]);
				line(bit, margin, barheight+1, dlgdata[DLG_DATA_WID]-margin, barheight+1, PAL[COL_BODY_MAIN_LIGHT]);
				if(buttons)
				{
					i_proc(bit, dlgdata[DLG_DATA_WID]-19, 2, descstr, dlgdata, true);
					return x_out(bit, dlgdata[DLG_DATA_WID]-margin-1-(barheight-2), margin+1, barheight-3, dlgdata);
				}
				else return PROC_NULL;
			} //end
			ProcRet title_bar(bitmap bit, int margin, int barheight, char32 title, untyped dlgdata, char32 descstr) //start
			{
				return title_bar(bit, margin, barheight, title, dlgdata, descstr, true);
			} //end
			ProcRet title_bar(bitmap bit, int margin, int barheight, char32 title, untyped dlgdata) //start
			{
				title_bar(bit, margin, barheight, title, dlgdata, "");
			} //end
			Color colorgrid(bitmap bit, int x, int y, Color clr, int len, untyped dlgdata, untyped proc_data, int proc_indx) //start
			{
				DEFINE MAX_COLOR = 0xFF, MAX_CSET = MAX_COLOR>>4, NUM_CSET = MAX_CSET+1, MAX_C_IN_CSET = 0xF, NUM_C_PER_CSET = MAX_C_IN_CSET+1, START_LAST_CSET = MAX_CSET<<4;
				int did_clicked = -1;
				int active_swatch = clr;
				if(SubEditorData[SED_LCLICKED])
				{
					if(DLGCursorBox(x, y, x+(NUM_C_PER_CSET*len)-1, y+(NUM_CSET*len), dlgdata))
					{
						proc_data[proc_indx] = 1;
						int clicked_on = ((DLGMouseX(dlgdata)-x)/len) | (((DLGMouseY(dlgdata)-y)/len)<<4);
						if(clicked_on <= MAX_COLOR) active_swatch = clicked_on;
					}
					else
					{
						proc_data[proc_indx] = 0;
					}
				}
				int wid = NUM_C_PER_CSET*len, hei = NUM_CSET*len;
				frame_rect(bit, x-1, y-1, x+wid+1, y+hei+1, 1);
				for(int q = 0x00; q <= MAX_COLOR; ++q)
				{
					int tx1 = x+((q&0xF)*len), ty1 = y+((q>>4)*len),
					    tx2 = tx1+len-1, ty2 = ty1+len-1;
					rect(bit, tx1, ty1, tx2, ty2, q);
				}
				if(proc_data[proc_indx])
				{
					if(Input->Press[CB_UP])
					{
						if(active_swatch>MAX_C_IN_CSET) active_swatch-=0x10;
					}
					else if(Input->Press[CB_DOWN])
					{
						if(active_swatch<START_LAST_CSET) active_swatch+=0x10;
					}
					if(Input->Press[CB_LEFT])
					{
						if((active_swatch&MAX_C_IN_CSET)>0) --active_swatch;
					}
					else if(Input->Press[CB_RIGHT])
					{
						if((active_swatch&MAX_C_IN_CSET)<MAX_C_IN_CSET) ++active_swatch;
					}
				}
				
				int tx1 = x+((active_swatch&MAX_C_IN_CSET)*len), ty1 = y+((active_swatch>>4)*len),
					tx2 = tx1+len-1, ty2 = ty1+len-1;
				h_rect(bit, tx1, ty1, tx2, ty2, PAL[COL_HIGHLIGHT]);
				return <Color>active_swatch;
			} //end
			ProcRet titled_checkbox(bitmap bit, int x, int y, int len, bool checked, untyped dlgdata, int flags, char32 title) //start
			{
				text(bit, x+len+2, y+((len-1-Text->FontHeight(DIA_FONT))/2)+1, TF_NORMAL, title, (flags&FLAG_DISABLE ? PAL[COL_DISABLED] : PAL[COL_TEXT_MAIN]));
				return checkbox(bit, x, y, len, checked, dlgdata, flags);
			} //end
			ProcRet desc_titled_checkbox(bitmap bit, int x, int y, int len, bool checked, untyped dlgdata, int flags, char32 title, char32 desc_str) //start
			{
				i_proc(bit, x + Text->StringWidth(title, DIA_FONT) + len + 3, y, (flags&FLAG_DISABLE ? "" : desc_str), dlgdata);
				return titled_checkbox(bit, x, y, len, checked, dlgdata, flags, title);
			} //end
			ProcRet r_titled_checkbox(bitmap bit, int x, int y, int len, bool checked, untyped dlgdata, int flags, char32 title) //start
			{
				text(bit, x, y+((len-1-Text->FontHeight(DIA_FONT))/2)+1, TF_NORMAL, title, (flags&FLAG_DISABLE ? PAL[COL_DISABLED] : PAL[COL_TEXT_MAIN]));
				return checkbox(bit, x+Text->StringWidth(title,DIA_FONT), y, len, checked, dlgdata, flags);
			} //end
			ProcRet r_desc_titled_checkbox(bitmap bit, int x, int y, int len, bool checked, untyped dlgdata, int flags, char32 title, char32 desc_str) //start
			{
				i_proc(bit, x + Text->StringWidth(title, DIA_FONT) + len + 3, y, (flags&FLAG_DISABLE ? "" : desc_str), dlgdata);
				return r_titled_checkbox(bit, x, y, len, checked, dlgdata, flags, title);
			} //end
			void titled_text_field(bitmap bit, int x, int y, int wid, char32 buf, int maxchar, TypeAString::TMode tm, untyped dlgdata, int tf_indx, int flags, char32 title) //start
			{
				text(bit, x-2, y+2, TF_RIGHT, title, (flags&FLAG_DISABLE) ? PAL[COL_DISABLED] : PAL[COL_TEXT_MAIN]);
				text_field(bit, x, y, wid, buf, maxchar, tm, dlgdata, tf_indx, flags);
			} //end
			void titled_inc_text_field(bitmap bit, int x, int y, int wid, char32 buf, int maxchar, bool can_neg, untyped dlgdata, int tf_indx, int flags, char32 title) //start
			{
				text(bit, x-2, y+2, TF_RIGHT, title, (flags&FLAG_DISABLE) ? PAL[COL_DISABLED] : PAL[COL_TEXT_MAIN]);
				inc_text_field(bit, x, y, wid, buf, maxchar, can_neg, dlgdata, tf_indx, flags);
			} //end
			void titled_inc_text_field(bitmap bit, int x, int y, int wid, char32 buf, int maxchar, bool can_neg, untyped dlgdata, int tf_indx, int flags, int min, int max, char32 title) //start
			{
				text(bit, x-2, y+2, TF_RIGHT, title, (flags&FLAG_DISABLE) ? PAL[COL_DISABLED] : PAL[COL_TEXT_MAIN]);
				inc_text_field(bit, x, y, wid, buf, maxchar, can_neg, dlgdata, tf_indx, flags, min, max);
			} //end
			void inc_text_field(bitmap bit, int x, int y, int wid, char32 buf, int maxchar, bool can_neg, untyped dlgdata, int tf_indx, int flags) //start
			{
				inc_text_field(bit, x, y, wid, buf, maxchar, can_neg, dlgdata, tf_indx, flags, 0, 0); //Since min==max, no bounding occurs
			} //end
			void inc_text_field(bitmap bit, int x, int y, int wid, char32 buf, int maxchar,  bool can_neg, untyped dlgdata, int tf_indx, int flags, int min, int max) //start
			{
				TypeAString::TMode tm = can_neg ? TypeAString::TMODE_NUMERIC : TypeAString::TMODE_NUMERIC_POSITIVE;
				bool doBound = min < max;
				text_field(bit, x, y, wid, buf, maxchar, tm, dlgdata, tf_indx, flags);
				bool disabled = flags & FLAG_DISABLE;
				DEFINE HEIGHT = 2+2+Text->FontHeight(DIA_FONT), WIDTH = 12;
				int ux1 = x+wid-WIDTH, ux2 = x+wid-1, uy1 = y, uy2 = y+(HEIGHT/2)-1,
				    dx1 = ux1, dx2 = ux2, dy1 = y+(HEIGHT/2), dy2 = y+HEIGHT-1;
				int clicked;
				if(SubEditorData[SED_LCLICKED] && !disabled)
				{
					if(DLGCursorBox(ux1, uy1, ux2, uy2, dlgdata))
					{
						int a = atoi(buf)+1;
						remchr(buf, 0);
						itoa(buf, doBound ? VBound(a,max,min) : a);
						clicked = 1;
					}
					else if(DLGCursorBox(dx1, dy1, dx2, dy2, dlgdata))
					{
						int a = atoi(buf)-1;
						remchr(buf, 0);
						itoa(buf, doBound ? VBound(a,max,min) : a);
						clicked = 2;
					}
				}
				if(clicked==1) inv_frame_rect(bit, ux1, uy1, ux2, uy2, 1);
				else frame_rect(bit, ux1, uy1, ux2, uy2, 1);
				if(clicked==2) inv_frame_rect(bit, dx1, dy1, dx2, dy2, 1);
				else frame_rect(bit, dx1, dy1, dx2, dy2, 1);	
				line(bit, x+wid-WIDTH+2, y+(HEIGHT/2)-1-1, x+wid-(WIDTH/2)-1, y+1, disabled ? PAL[COL_DISABLED] : PAL[COL_TEXT_MAIN]);
				line(bit, x+wid-WIDTH+2, y+(HEIGHT/2)+1, x+wid-(WIDTH/2)-1, y+HEIGHT-1-1, disabled ? PAL[COL_DISABLED] : PAL[COL_TEXT_MAIN]);
				line(bit, x+wid-1-2, y+(HEIGHT/2)-1-1, x+wid-(WIDTH/2), y+1, disabled ? PAL[COL_DISABLED] : PAL[COL_TEXT_MAIN]);
				line(bit, x+wid-1-2, y+(HEIGHT/2)+1, x+wid-(WIDTH/2), y+HEIGHT-1-1, disabled ? PAL[COL_DISABLED] : PAL[COL_TEXT_MAIN]);
				if(clicked) dlgdata[DLG_DATA_ACTIVE_TEXTFIELD] = 0;
			} //end
			void text_field(bitmap bit, int x, int y, int wid, char32 buf, int maxchar, TypeAString::TMode tm, untyped dlgdata, int tf_indx, int flags) //start
			{
				bool disabled = flags & FLAG_DISABLE;
				DEFINE HEIGHT = 2+2+Text->FontHeight(DIA_FONT);
				int x2 = x+wid-1, y2 = y+HEIGHT-1;
				frame_rect(bit, x, y, x2, y2, 1, disabled ? PAL[COL_BODY_MAIN_MED] :PAL[COL_FIELD_BG]);
				int txt_x = x+2, txt_y = y+2;
				bool typing = dlgdata[DLG_DATA_ACTIVE_TEXTFIELD]==tf_indx;
				if(typing && !disabled)
				{
					grabType(buf, maxchar, tm); //Grab this frame's keyboard typing, by the set rules.
				}
				
				if(SubEditorData[SED_LCLICKED] && !disabled)
				{
					if(DLGCursorBox(x, y, x2, y2, dlgdata))
					{
						dlgdata[DLG_DATA_ACTIVE_TEXTFIELD]=tf_indx;
					}
					else if(dlgdata[DLG_DATA_ACTIVE_TEXTFIELD]==tf_indx)
					{
						dlgdata[DLG_DATA_ACTIVE_TEXTFIELD]=0;
					}
				}
				
				text(bit, txt_x, txt_y, TF_NORMAL, buf, disabled ? PAL[COL_DISABLED] : PAL[COL_TEXT_FIELD]);
				if(typing && !disabled)
				{
					unless((SubEditorData[SED_GLOBAL_TIMER]%32)&16)
					{
						text(bit, txt_x+Text->StringWidth(buf, DIA_FONT), txt_y, TF_NORMAL, "|", PAL[COL_TEXT_FIELD]);
					}
				}
			} //end
			void i_proc(bitmap bit, int x, int y, char32 info, untyped dlgdata) //start
			{
				i_proc(bit, x, y, info, dlgdata, false);
			} //end
			void i_proc(bitmap bit, int x, int y, char32 info, untyped dlgdata, bool help) //start
			{
				bool disabled = !strlen(info);
				int col = disabled ? PAL[COL_DISABLED] : PAL[COL_TEXT_MAIN];
				ProcRet p = insta_button(bit, x, y, 7, 7, "", dlgdata, 0);
				pix(bit, x+3, y+1, col);
				pix(bit, x+2, y+3, col);
				line(bit, x+3, y+3, x+3, y+5, col);
				line(bit, x+2, y+5, x+4, y+5, col);
				if(!disabled && (PROC_CONFIRM==p || (help&&HelpButton())))
				{
					msg_dlg("Information", info);
				}
			} //end
			//end
		} //end
		//start Key procs
		bool keyproc(int key)
		{
			return KeyInput(key);
			//printf("KeyProc'ing key %d (%s?): %s\n", key, {key-KEY_A+'A', 0}, ret?"true":"false");
		}
		bool keyprocp(int key)
		{
			return KeyPressed(key);
		}
		void killkey(int key)
		{
			KeyPressed(key, false);
			KeyInput(key, false);
		}
		bool DefaultButton()
		{
			return KeyInput(SubEditorData[SED_DEFAULTBTN]) || KeyInput(SubEditorData[SED_DEFAULTBTN2]);
		}
		bool DefaultButtonP()
		{
			return KeyPressed(SubEditorData[SED_DEFAULTBTN]) || KeyPressed(SubEditorData[SED_DEFAULTBTN2]);
		}
		bool CancelButton()
		{
			return KeyInput(SubEditorData[SED_CANCELBTN]);
		}
		bool CancelButtonP()
		{
			return KeyPressed(SubEditorData[SED_CANCELBTN]);
		}
		bool HelpButton()
		{
			return Input->ReadKey[KEY_F1];
		}
		void KillDLGButtons()
		{
			KillAllKeyboard();
		}
		//end 
		//Flagsets
		DEFINE FLAG_DISABLE = 00000001b;
		DEFINE FLAG_DEFAULT = 00000010b;
		//DLG Data Organization
		enum
		{
			DLG_DATA_XOFFS, DLG_DATA_YOFFS, //ints; positional data
			DLG_DATA_WID, DLG_DATA_HEI,
			DLG_DATA_ACTIVE_TEXTFIELD,
			
			DLG_DATA_SZ
		};
		//ProcData s- for global misc storage for the main GUI screen.
		untyped main_proc_data[MAX_INT];
		
		bool delwarn() //start
		{
			return !sys_settings[SSET_DELWARN] || yesno_dlg("Are you sure you want to delete this?") == PROC_CONFIRM;
		} //end
		void gen_startup() //start
		{
			KillClicks();
			KillDLGButtons();
			KillButtons();
		} //end
		void gen_final() //start
		{
			null_screen();
			KillDLGButtons();
		} //end
		//Full DLGs
		//start Edit Object
		void editObj(untyped module_arr, int mod_indx, bool active)
		{
			gen_startup();
			//start setup
			DEFINE WIDTH = 256//-32
			     , HEIGHT = 224//-32
				 , BAR_HEIGHT = 11
				 , MARGIN_WIDTH = 1
				 , FRAME_X = MARGIN_WIDTH+2
				 , FRAME_Y = MARGIN_WIDTH+BAR_HEIGHT+2
				 ;
			int old_indx = mod_indx;
			bitmap bit = create(WIDTH, HEIGHT);
			bit->ClearToColor(0, PAL[COL_NULL]);
			
			char32 title[128] = "Edit Object #%d - %s";
			char32 module_name[64];
			get_module_name(module_name, module_arr[M_TYPE]);
			
			untyped data[DLG_DATA_SZ];
			data[DLG_DATA_WID] = WIDTH;
			data[DLG_DATA_HEI] = HEIGHT;
			
			char32 buf_x[4];
			itoa(buf_x, module_arr[M_X]);
			char32 buf_y[4];
			itoa(buf_y, module_arr[M_Y]);
			char32 buf_lyr[2];
			itoa(buf_lyr, module_arr[M_LAYER]);
			char32 buf_pos[3];
			itoa(buf_pos, mod_indx);
			
			
			char32 argbuf1[16];
			char32 argbuf2[16];
			char32 argbuf3[16];
			char32 argbuf4[16];
			char32 argbuf5[16];
			char32 argbuf6[16];
			char32 argbuf7[16];
			char32 argbuf8[16];
			char32 argbuf9[16];
			char32 argbuf10[16];
			char32 argbuf[11] = {argbuf1, argbuf2, argbuf3, argbuf4, argbuf5, argbuf6, argbuf7, argbuf8, argbuf9, argbuf10, -1};
			for(int q = MODULE_META_SIZE; q < module_arr[M_SIZE] && argbuf[q-MODULE_META_SIZE] != -1; ++q)
			{
				itoa(argbuf[q-MODULE_META_SIZE], module_arr[q]);
			}
			
			//
			null_screen();
			draw_dlg(bit, data);
			KillButtons();
			Waitframe();
			//
			center_dlg(bit, data);
			
			bool running = true;
			bool do_save_changes = false;
			//end
			untyped proc_data[MAX_INT];
			int LItem = Game->LItems[Game->GetCurLevel()];
			Game->LItems[Game->GetCurLevel()] = LI_COMPASS | LI_MAP;
			int prev = 0;
			while(running)
			{
				++g_arr[active ? ACTIVE_TIMER : PASSIVE_TIMER];
				g_arr[active ? ACTIVE_TIMER : PASSIVE_TIMER] %= 100000000000000000b;
				
				bit->ClearToColor(0, PAL[COL_NULL]);
				//Deco
				frame_rect(bit, 0, 0, WIDTH-1, HEIGHT-1, MARGIN_WIDTH);
				//Func
				char32 TITLEBUF[1024];
				sprintf(TITLEBUF, title, mod_indx, module_name);
				char32 DESCBUF[1024];
				get_module_desc(DESCBUF, module_arr[M_TYPE]);
				if(title_bar(bit, MARGIN_WIDTH, BAR_HEIGHT, TITLEBUF, data, DESCBUF)==PROC_CANCEL || CancelButtonP())
					running = false;
				
				if(DEBUG && PROC_CONFIRM==button(bit, WIDTH-(9*3)-1, 2, 7, 7, "D", data, proc_data, 1)) //start
				{
					printf("Debug Printout (%d)\n", mod_indx);
					for(int q = 0; q < module_arr[M_SIZE]; ++q)
					{
						switch(q)
						{
							case MODULE_META_SIZE:
								TraceNL();
								printf("%d: %d\n", q, module_arr[q]);
								break;
							
							case M_META_SIZE:
								if(module_arr[M_META_SIZE] == MODULE_META_SIZE)
									printf("%d: %d\n", q, module_arr[q]);
								else printf("%d: %d (Bad Size! Should be %d)\n", q, module_arr[q], MODULE_META_SIZE);
								break;
							
							case M_TYPE:
								char32 buf[64];
								get_module_name(buf, module_arr[M_TYPE]);
								printf("%d: %d (%s)\n", q, module_arr[q], buf);
								break;
								
							default:
								printf("%d: %d\n", q, module_arr[q]);
						}
					}
					printf("/Debug Printout (%d)\n", mod_indx);
				} //end
				DEFINE BUTTON_WIDTH = GEN_BUTTON_WIDTH, BUTTON_HEIGHT = GEN_BUTTON_HEIGHT;
				DEFINE ABOVE_BOTTOM_Y = HEIGHT-(MARGIN_WIDTH+2)-BUTTON_HEIGHT-4;
				//start For all objects
				if(PROC_CONFIRM==button(bit, FRAME_X+BUTTON_WIDTH+3, HEIGHT-(MARGIN_WIDTH+2)-BUTTON_HEIGHT, BUTTON_WIDTH, BUTTON_HEIGHT, "Cancel", data, proc_data, 2))
				{
					running = false;
				}
				if(PROC_CONFIRM==button(bit, FRAME_X, HEIGHT-(MARGIN_WIDTH+2)-BUTTON_HEIGHT, BUTTON_WIDTH, BUTTON_HEIGHT, "Confirm", data, proc_data, 3, FLAG_DEFAULT))
				{
					running = false;
					do_save_changes = true;
				}
				if(PROC_CONFIRM==button(bit, FRAME_X+(2*(BUTTON_WIDTH+3)), HEIGHT-(MARGIN_WIDTH+2)-BUTTON_HEIGHT, BUTTON_WIDTH, BUTTON_HEIGHT, "%%77%%Del%ete", data, proc_data, 4, module_arr[M_TYPE]==MODULE_TYPE_BGCOLOR?FLAG_DISABLE:0))
				{
					if(delwarn())
					{
						running = false;
						SubEditorData[SED_QUEUED_DELETION] = active ? mod_indx : -mod_indx;
						SubEditorData[SED_HIGHLIGHTED] = 0; //This had to be highlighted to open this menu!
						bit->Free();
						gen_final();
						return;
					}
				}
				
				DEFINE TXTBX_LEFTMARG = 3, TXTBOX_SPACING = 4;
				int tfx = FRAME_X + TXTBX_LEFTMARG + Text->StringWidth("X:",DIA_FONT);
				DEFINE XYBOX_WID = 20;
				switch(module_arr[M_TYPE])
				{
					case MODULE_TYPE_PASSIVESUBSCREEN:
					case MODULE_TYPE_BGCOLOR:
						titled_text_field(bit, tfx, FRAME_Y, XYBOX_WID, buf_x, 3, TypeAString::TMODE_NUMERIC_POSITIVE, data, 1, FLAG_DISABLE, "X:");
						break;
					default:
						titled_text_field(bit, tfx, FRAME_Y, XYBOX_WID, buf_x, 3, TypeAString::TMODE_NUMERIC_POSITIVE, data, 1, 0, "X:");
				}
				tfx += XYBOX_WID+TXTBOX_SPACING+Text->StringWidth("Y:",DIA_FONT);
				switch(module_arr[M_TYPE])
				{
					case MODULE_TYPE_BGCOLOR:
						titled_text_field(bit, tfx, FRAME_Y, XYBOX_WID, buf_y, 3, TypeAString::TMODE_NUMERIC_POSITIVE, data, 2, FLAG_DISABLE, "Y:");
						break;
					default:
						titled_text_field(bit, tfx, FRAME_Y, XYBOX_WID, buf_y, 3, TypeAString::TMODE_NUMERIC_POSITIVE, data, 2, 0, "Y:");
				}
				tfx += XYBOX_WID+TXTBOX_SPACING+Text->StringWidth("Layer:",DIA_FONT);
				DEFINE LAYERBOX_WID = 24;
				switch(module_arr[M_TYPE])
				{
					case MODULE_TYPE_BGCOLOR:
						titled_inc_text_field(bit, tfx, FRAME_Y, LAYERBOX_WID, buf_lyr, 1, false, data, 3, FLAG_DISABLE, 0, 7, "Layer:");
						break;
					default:
						titled_inc_text_field(bit, tfx, FRAME_Y, LAYERBOX_WID, buf_lyr, 1, false, data, 3, 0, 0, 7, "Layer:");
				}
				tfx += LAYERBOX_WID+TXTBOX_SPACING+Text->StringWidth("Pos:",DIA_FONT);
				DEFINE POSBOX_WID = 24;
				switch(module_arr[M_TYPE])
				{
					case MODULE_TYPE_BGCOLOR:
						titled_inc_text_field(bit, tfx, FRAME_Y, POSBOX_WID, buf_pos, 2, false, data, 4, FLAG_DISABLE, 2, active?g_arr[NUM_ACTIVE_MODULES]-1:g_arr[NUM_PASSIVE_MODULES]-1, "Pos:");
						break;
					default:
						titled_inc_text_field(bit, tfx, FRAME_Y, POSBOX_WID, buf_pos, 2, false, data, 4, 0, 2, active?g_arr[NUM_ACTIVE_MODULES]-1:g_arr[NUM_PASSIVE_MODULES]-1, "Pos:");
				}
				//end
				switch(module_arr[M_TYPE]) //start
				{
					case MODULE_TYPE_BGCOLOR: //start
					{
						char32 buf[] = "Color:";
						text(bit, FRAME_X, FRAME_Y+12+5, TF_NORMAL, buf, PAL[COL_TEXT_MAIN]);
						module_arr[P1] = pal_swatch(bit, FRAME_X+Text->StringWidth(buf, DIA_FONT), FRAME_Y+12, 16, 16, module_arr[P1], data);
						break;
					} //end
					
					case MODULE_TYPE_SELECTABLE_ITEM_ID:
					case MODULE_TYPE_SELECTABLE_ITEM_CLASS: //start
					{
						bool class = module_arr[M_TYPE] == MODULE_TYPE_SELECTABLE_ITEM_CLASS;
						char32 buf[16];
						strcpy(buf, class ? "Class:" : "Item:");
						DEFINE FIELD_WID = 28, FIELD_X = WIDTH - MARGIN_WIDTH - 2 - FIELD_WID;
						titled_inc_text_field(bit, FRAME_X + Text->StringWidth(buf, DIA_FONT)+2, FRAME_Y+12+(10*1), FIELD_WID, argbuf1, 3, false, data, 5, 0, MIN_ITEMDATA, MAX_ITEMDATA, buf);
						DEFINE ITMX = (FRAME_X + Text->StringWidth(buf, DIA_FONT) + FIELD_WID + 4 +1), ITMY = FRAME_Y+18;
						frame_rect(bit, ITMX-1, ITMY-1, ITMX+16, ITMY+16, 1);
						int itmid = (class?(get_item_of_class(atoi(argbuf1))):(atoi(argbuf1)));
						if(itmid < 0) itmid = class ? get_item_of_class(atoi(argbuf1), true) : 0;
						if(itmid < 0) itmid = 0;
						itm(bit, ITMX, ITMY, itmid);
						titled_inc_text_field(bit, FIELD_X-(FIELD_WID*1), FRAME_Y+12+(10*0), FIELD_WID, argbuf2, 3, true, data, 6, 0, -1, MAX_MODULES, "Pos:");
						inc_text_field(bit, FIELD_X-FIELD_WID, FRAME_Y+12+(10*1), FIELD_WID, argbuf3, 3, true, data, 7, 0, -1, MAX_MODULES);
						inc_text_field(bit, FIELD_X-FIELD_WID, FRAME_Y+12+(10*3), FIELD_WID, argbuf4, 3, true, data, 8, 0, -1, MAX_MODULES);
						titled_inc_text_field(bit, FIELD_X-(FIELD_WID*2), FRAME_Y+12+(10*2), FIELD_WID, argbuf5, 3, true, data, 9, 0, -1, MAX_MODULES, "Dirs:");
						inc_text_field(bit, FIELD_X, FRAME_Y+12+(10*2), FIELD_WID, argbuf6, 3, true, data, 10, 0, -1, MAX_MODULES);
						break;
					} //end
					
					case MODULE_TYPE_ABUTTONITEM:
					case MODULE_TYPE_BBUTTONITEM:
					case MODULE_TYPE_PASSIVESUBSCREEN:
					{
						break;
					}
					
					case MODULE_TYPE_MINIMAP: //start
					{
						DEFINE TEXT_OFFSET = WIDTH - FRAME_X - 20;
						text(bit, FRAME_X+TEXT_OFFSET, FRAME_Y+12+5 + (18*0), TF_RIGHT, "Current Color:", PAL[COL_TEXT_MAIN]);
						module_arr[P1] = pal_swatch(bit, FRAME_X+TEXT_OFFSET, FRAME_Y+12 + (18*0), 16, 16, module_arr[P1], data);
						text(bit, FRAME_X+TEXT_OFFSET, FRAME_Y+12+5 + (18*1), TF_RIGHT, "Explored Color:", PAL[COL_TEXT_MAIN]);
						module_arr[P2] = pal_swatch(bit, FRAME_X+TEXT_OFFSET, FRAME_Y+12 + (18*1), 16, 16, module_arr[P2], data);
						text(bit, FRAME_X+TEXT_OFFSET, FRAME_Y+12+5 + (18*2), TF_RIGHT, "Unexplored Color:", PAL[COL_TEXT_MAIN]);
						module_arr[P3] = pal_swatch(bit, FRAME_X+TEXT_OFFSET, FRAME_Y+12 + (18*2), 16, 16, module_arr[P3], data);
						text(bit, FRAME_X+TEXT_OFFSET, FRAME_Y+12+5 + (18*3), TF_RIGHT, "Compass Color:", PAL[COL_TEXT_MAIN]);
						module_arr[P4] = pal_swatch(bit, FRAME_X+TEXT_OFFSET, FRAME_Y+12 + (18*3), 16, 16, module_arr[P4], data);
						text(bit, FRAME_X+TEXT_OFFSET, FRAME_Y+12+5 + (18*4), TF_RIGHT, "Compass Dead Color:", PAL[COL_TEXT_MAIN]);
						module_arr[P5] = pal_swatch(bit, FRAME_X+TEXT_OFFSET, FRAME_Y+12 + (18*4), 16, 16, module_arr[P5], data);
						
						char32 buf1[] = "Comp. Blink Rate:";
						titled_inc_text_field(bit, FRAME_X+3+Text->StringWidth(buf1, DIA_FONT), FRAME_Y+12+3, 28, argbuf6, 2, false, data, 5, 0, 1, 9, buf1);
						module_arr[P6] = VBound(atoi(argbuf6), 9, 1);
						
						switch(desc_titled_checkbox(bit, FRAME_X, FRAME_Y + 25 + (10 * 0), 7, module_arr[M_FLAGS1]&FLAG_MMP_COMP_ON_BOSS, data, 0, "Compass Points to Boss", "The compass will end once the boss is dead, instead of when the triforce is collected."))
						{
							case PROC_UPDATED_FALSE:
								module_arr[M_FLAGS1]~=FLAG_MMP_COMP_ON_BOSS;
								break;
							case PROC_UPDATED_TRUE:
								module_arr[M_FLAGS1]|=FLAG_MMP_COMP_ON_BOSS;
								break;
						}
						switch(desc_titled_checkbox(bit, FRAME_X, FRAME_Y + 25 + (10 * 1), 7, module_arr[M_FLAGS1]&FLAG_MMP_SHOW_EXPLORED_ROOMS_OW, data, 0, "Show Explored - OW", "Shows explored rooms on overworld dmaps"))
						{
							case PROC_UPDATED_FALSE:
								module_arr[M_FLAGS1]~=FLAG_MMP_SHOW_EXPLORED_ROOMS_OW;
								break;
							case PROC_UPDATED_TRUE:
								module_arr[M_FLAGS1]|=FLAG_MMP_SHOW_EXPLORED_ROOMS_OW;
								break;
						}
						switch(desc_titled_checkbox(bit, FRAME_X, FRAME_Y + 25 + (10 * 2), 7, module_arr[M_FLAGS1]&FLAG_MMP_SHOW_EXPLORED_ROOMS_DUNGEON, data, 0, "Show Explored - DNG", "Shows explored rooms on dungeon dmaps"))
						{
							case PROC_UPDATED_FALSE:
								module_arr[M_FLAGS1]~=FLAG_MMP_SHOW_EXPLORED_ROOMS_DUNGEON;
								break;
							case PROC_UPDATED_TRUE:
								module_arr[M_FLAGS1]|=FLAG_MMP_SHOW_EXPLORED_ROOMS_DUNGEON;
								break;
						}
						switch(desc_titled_checkbox(bit, FRAME_X, FRAME_Y + 25 + (10 * 3), 7, module_arr[M_FLAGS1]&FLAG_MMP_SHOW_EXPLORED_ROOMS_INTERIOR, data, 0, "Show Explored - INT", "Shows explored rooms on interior dmaps"))
						{
							case PROC_UPDATED_FALSE:
								module_arr[M_FLAGS1]~=FLAG_MMP_SHOW_EXPLORED_ROOMS_INTERIOR;
								break;
							case PROC_UPDATED_TRUE:
								module_arr[M_FLAGS1]|=FLAG_MMP_SHOW_EXPLORED_ROOMS_INTERIOR;
								break;
						}
						switch(desc_titled_checkbox(bit, FRAME_X, FRAME_Y + 25 + (10 * 4), 7, module_arr[M_FLAGS1]&FLAG_MMP_COMPASS_BLINK_DOESNT_STOP, data, 0, "Blink Continues", "The compass will continue blinking even after it changes color"))
						{
							case PROC_UPDATED_FALSE:
								module_arr[M_FLAGS1]~=FLAG_MMP_COMPASS_BLINK_DOESNT_STOP;
								break;
							case PROC_UPDATED_TRUE:
								module_arr[M_FLAGS1]|=FLAG_MMP_COMPASS_BLINK_DOESNT_STOP;
								break;
						}
						switch(desc_titled_checkbox(bit, FRAME_X, FRAME_Y + 25 + (10 * 5), 7, module_arr[M_FLAGS1]&FLAG_MMP_IGNORE_DMAP_BGTILE, data, 0, "Ignore DMap-specfic BG", "The MiniMap BG tile set in the DMap editor will be ignored"))
						{
							case PROC_UPDATED_FALSE:
								module_arr[M_FLAGS1]~=FLAG_MMP_IGNORE_DMAP_BGTILE;
								break;
							case PROC_UPDATED_TRUE:
								module_arr[M_FLAGS1]|=FLAG_MMP_IGNORE_DMAP_BGTILE;
								break;
						}
						switch(desc_titled_checkbox(bit, FRAME_X, FRAME_Y + 25 + (10 * 6), 7, module_arr[M_FLAGS1]&FLAG_MMP_LARGE_PLAYER_COMPASS_MARKERS, data, 0, "Larger Markers", "On 8x8 dmaps, the player position and compass markers will take the full 7x3, instead of the center 3x3."))
						{
							case PROC_UPDATED_FALSE:
								module_arr[M_FLAGS1]~=FLAG_MMP_LARGE_PLAYER_COMPASS_MARKERS;
								break;
							case PROC_UPDATED_TRUE:
								module_arr[M_FLAGS1]|=FLAG_MMP_LARGE_PLAYER_COMPASS_MARKERS;
								break;
						}
						DEFINE MMY = ABOVE_BOTTOM_Y-48;
						DEFINE MMX = WIDTH - FRAME_X - 80 - 2;
						frame_rect(bit, MMX-1, MMY-1, MMX+81, MMY+49, 1);
						text(bit, MMX - 3, MMY, TF_RIGHT, "Preview:", PAL[COL_TEXT_MAIN]);
						char32 buf[] = "Defeated";
						switch(r_titled_checkbox(bit, MMX - 10 - Text->StringWidth(buf, DIA_FONT), MMY + 8, 7, prev&1b, data, 0, buf))
						{
							case PROC_UPDATED_FALSE:
								prev~=1b;
								break;
							case PROC_UPDATED_TRUE:
								prev|=1b;
								break;
						}
						char32 bufm16[] = "16x8 Tile";
						char32 bufm8[] = " 8x8 Tile";
						int tilearr[2] = {module_arr[P7], module_arr[P8]};
						text(bit, FRAME_X, FRAME_Y + 25 + (10 * 7) + 4, TF_NORMAL, bufm16, PAL[COL_TEXT_MAIN]);
						tile_swatch(bit, FRAME_X + Text->StringWidth(bufm16, DIA_FONT), FRAME_Y + 25 + (10 * 7), 18, 18, tilearr, data);
						module_arr[P7] = tilearr[0];
						module_arr[P8] = tilearr[1];
						tilearr[0] = module_arr[P9];
						tilearr[1] = module_arr[P10];
						text(bit, FRAME_X+ Text->StringWidth(bufm16, DIA_FONT), FRAME_Y + 25 + (10 * 7) + 20 + 4, TF_RIGHT, bufm8, PAL[COL_TEXT_MAIN]);
						tile_swatch(bit, FRAME_X + Text->StringWidth(bufm16, DIA_FONT), FRAME_Y + 25 + (10 * 7) + 20, 18, 18, tilearr, data);
						module_arr[P9] = tilearr[0];
						module_arr[P10] = tilearr[1];
						if(prev&1b)
							Game->LItems[Game->GetCurLevel()] |= LI_BOSS | LI_TRIFORCE;
						minimap(module_arr, bit, active, MMX, MMY);
						Game->LItems[Game->GetCurLevel()] ~= LI_BOSS | LI_TRIFORCE;
						break;
					} //end
					
					case MODULE_TYPE_TILEBLOCK: //start
					{
						char32 buftl[] = "Tile:";
						int tlarr[2] = {module_arr[P1], module_arr[P2]};
						text(bit, FRAME_X+3, FRAME_Y+23, TF_NORMAL, buftl, PAL[COL_TEXT_MAIN]);
						tile_swatch(bit, FRAME_X+3+Text->StringWidth(buftl, DIA_FONT), FRAME_Y+15, 18, 18, tlarr, data);
						module_arr[P1] = tlarr[0];
						module_arr[P2] = tlarr[1];
						
						char32 buf1[] = "Wid:";
						titled_inc_text_field(bit, FRAME_X+27+Text->StringWidth(buftl, DIA_FONT)+Text->StringWidth(buf1, DIA_FONT), FRAME_Y+19, 28, argbuf3, 2, false, data, 0, 0, 1, 16, buf1);
						module_arr[P3] = VBound(atoi(argbuf3), 16, 1);
						char32 buf2[] = "Hei:";
						titled_inc_text_field(bit, FRAME_X+59+Text->StringWidth(buftl, DIA_FONT)+Text->StringWidth(buf1, DIA_FONT)+Text->StringWidth(buf2, DIA_FONT), FRAME_Y+19, 28, argbuf4, 2, false, data, 1, 0, 1, 14, buf2);
						module_arr[P4] = VBound(atoi(argbuf4), 14, 1);
						
						DEFINE PREVWID = module_arr[P3] * 16;
						DEFINE PREVHEI = VBound(module_arr[P4] * 16, 16*9, 0);
						DEFINE PREVY = ABOVE_BOTTOM_Y-PREVHEI;
						frame_rect(bit, (WIDTH/2)-(PREVWID/2), PREVY-1, (WIDTH/2)+(PREVWID/2), PREVY+PREVHEI, 1);
						text(bit, WIDTH/2, PREVY-8, TF_CENTERED, "Preview (Shows max 16x9):", PAL[COL_TEXT_MAIN]);
						tilebl(bit, (WIDTH/2)-(PREVWID/2)+1, PREVY, module_arr[P1], module_arr[P2], PREVWID/16, PREVHEI/16);
						break;
					} //end
					
					case MODULE_TYPE_HEARTROW: //start
					{
						char32 buf1[] = "Heart Count:";
						titled_inc_text_field(bit, FRAME_X+3+Text->StringWidth(buf1, DIA_FONT), FRAME_Y+39, 28, argbuf4, 2, false, data, 6, 0, 0, MAX_INT, buf1);
						module_arr[P4] = VBound(atoi(argbuf4), 32, 1);
						char32 buf2[] = "Spacing:";
						titled_inc_text_field(bit, FRAME_X+35+Text->StringWidth(buf1, DIA_FONT)+Text->StringWidth(buf2, DIA_FONT), FRAME_Y+39, 28, argbuf5, 2, false, data, 7, 0, buf2);
						module_arr[P5] = atoi(argbuf5);
						
						switch(desc_titled_checkbox(bit, FRAME_X, FRAME_Y + 53, 7, module_arr[M_FLAGS1]&FLAG_HROW_RTOL, data, 0, "Right to Left", "This row of hearts fills from right to left, instead of left to right."))
						{
							case PROC_UPDATED_FALSE:
								module_arr[M_FLAGS1]~=FLAG_HROW_RTOL;
								break;
							case PROC_UPDATED_TRUE:
								module_arr[M_FLAGS1]|=FLAG_HROW_RTOL;
								break;
						}
					} //end
					//fallthrough
					case MODULE_TYPE_HEART: //start
					{
						char32 buftl[] = "Tile:";
						int tlarr[2] = {module_arr[P1], module_arr[P2]};
						text(bit, FRAME_X+3, FRAME_Y+23, TF_NORMAL, buftl, PAL[COL_TEXT_MAIN]);
						tile_swatch(bit, FRAME_X+3+Text->StringWidth(buftl, DIA_FONT), FRAME_Y+15, 18, 18, tlarr, data);
						module_arr[P1] = tlarr[0];
						module_arr[P2] = tlarr[1];
						
						char32 buf3[] = "Heart Num:";
						titled_inc_text_field(bit, FRAME_X+27+Text->StringWidth(buftl, DIA_FONT)+Text->StringWidth(buf3, DIA_FONT), FRAME_Y+19, 28, argbuf3, 2, false, data, 5, 0, 0, MAX_INT, buf3);
						module_arr[P3] = Max(atoi(argbuf3), 0);
						//start Preview
						DEFINE PREVIEW_WID = 17*8;
						DEFINE PREVIEW_X = (WIDTH/2) - (PREVIEW_WID/2) + 1;
						DEFINE PREVIEW_Y = ABOVE_BOTTOM_Y-8;
						frame_rect(bit, (WIDTH/2) - (PREVIEW_WID/2), PREVIEW_Y-1, (WIDTH/2) + (PREVIEW_WID/2), ABOVE_BOTTOM_Y, 1);
						for(int tl = 0; tl < 4; ++tl)
						{
							for(int crn = 0; crn < 4; ++crn)
							{
								minitile(bit, PREVIEW_X + ((crn+(tl*4))*8), PREVIEW_Y, module_arr[P1]+tl+1, module_arr[P2], crn);
							}
						}
						minitile(bit, PREVIEW_X + 16*8, PREVIEW_Y, module_arr[P1], module_arr[P2], 0);
						text(bit, WIDTH/2, PREVIEW_Y-8, TF_CENTERED, "Preview:", PAL[COL_TEXT_MAIN]);
						//end Preview
						break;
					} //end
					
					case MODULE_TYPE_COUNTER: //UNFINISHED
					{
						
						break;
					}
					default:
					{
						text(bit, WIDTH/2, ((HEIGHT-(Text->FontHeight(DIA_FONT)*((1*3)+(0.5*2))))/2), TF_CENTERED, "WIP UNDER CONSTRUCTION", PAL[COL_TEXT_MAIN], 1);
						break;
					}
				} //end
				
				//
				null_screen();
				draw_dlg(bit, data);
				KillButtons();
				subscr_Waitframe();
			}
			for(int q = 0; q < DIA_CLOSING_DELAY; ++q) //Delay on closing
			{
				null_screen();
				draw_dlg(bit, data);
				KillButtons();
				subscr_Waitframe();
			}
			Game->LItems[Game->GetCurLevel()] = LItem;
			if(do_save_changes)
			{
				bit->Write(0, "_DIALOGUE.png", true);
				module_arr[M_X] = VBound(atoi(buf_x), max_x(module_arr), min_x(module_arr));
				module_arr[M_Y] = VBound(atoi(buf_y), max_y(module_arr, active), min_y(module_arr));
				module_arr[M_LAYER] = VBound(atoi(buf_lyr), 7, 0);
				switch(module_arr[M_TYPE])
				{
					case MODULE_TYPE_SELECTABLE_ITEM_CLASS:
					case MODULE_TYPE_SELECTABLE_ITEM_ID:
					{
						module_arr[P1] = VBound(atoi(argbuf1), MAX_ITEMDATA, MIN_ITEMDATA);
						module_arr[P2] = VBound(atoi(argbuf2), MAX_MODULES, -1);
						module_arr[P3] = VBound(atoi(argbuf3), MAX_MODULES, -1);
						module_arr[P4] = VBound(atoi(argbuf4), MAX_MODULES, -1);
						module_arr[P5] = VBound(atoi(argbuf5), MAX_MODULES, -1);
						module_arr[P6] = VBound(atoi(argbuf6), MAX_MODULES, -1);
						break;
					}
				}
				if(active)
				{
					mod_indx = VBound(atoi(buf_pos), g_arr[NUM_ACTIVE_MODULES]-1, 1);
					remove_active_module(old_indx);
					add_active_module(module_arr, mod_indx);
				}
				else
				{
					mod_indx = VBound(atoi(buf_pos), g_arr[NUM_PASSIVE_MODULES]-1, 1);
					remove_passive_module(old_indx);
					add_passive_module(module_arr, mod_indx);
				}
				if(mod_indx!=old_indx) SubEditorData[SED_HIGHLIGHTED] = mod_indx;
			}
			
			bit->Free();
			gen_final();
		} //end editObj
		//start Main GUI
		enum GuiState
		{
			GUI_BOTTOM, GUI_TOP, GUI_HIDDEN,
			GUISTATE_MAX
		};
		DEFINE MAIN_GUI_WIDTH = 256;
		DEFINE MAIN_GUI_HEIGHT = 40;
		bool isHoveringGUI()
		{
			int yoffs = -56;
			switch(SubEditorData[SED_GUISTATE])
			{
				case GUI_HIDDEN:
					return false;
				case GUI_TOP:
					break;
				case GUI_BOTTOM:
					yoffs = 168-MAIN_GUI_HEIGHT;
					break;
			}
			
			untyped data[DLG_DATA_SZ];
			data[DLG_DATA_WID] = MAIN_GUI_WIDTH;
			data[DLG_DATA_HEI] = MAIN_GUI_HEIGHT;
			data[DLG_DATA_YOFFS] = yoffs;
			return isHovering(data);
		}
		enum
		{
			GUIRET_NULL,
			GUIRET_EXIT
		};
		int runGUI(bool active)
		{
			if(SubEditorData[SED_ACTIVE_PANE]) return GUIRET_NULL; //No main GUI during dialogs.
			if(Input->ReadKey[KEY_TAB])
			{
				SubEditorData[SED_GUISTATE] = ((SubEditorData[SED_GUISTATE]+1)%GUISTATE_MAX);
			}
			int yoffs = -56;
			switch(SubEditorData[SED_GUISTATE])
			{
				case GUI_HIDDEN:
					yoffs = MAX_INT;
					break;
				case GUI_TOP:
					break;
				case GUI_BOTTOM:
					yoffs = 168-MAIN_GUI_HEIGHT;
					break;
			}
			
			untyped data[DLG_DATA_SZ];
			data[DLG_DATA_WID] = MAIN_GUI_WIDTH;
			data[DLG_DATA_HEI] = MAIN_GUI_HEIGHT;
			data[DLG_DATA_YOFFS] = yoffs;
			int ret = GUIRET_NULL;
			bitmap bit = getGUIBitmap();
			{
				//Deco
				frame_rect(bit, 0, 0, MAIN_GUI_WIDTH-1, MAIN_GUI_HEIGHT-1, 1);
				//Text
				text(bit, 2, 2, TF_NORMAL, "MENU: Move with 'TAB'", PAL[COL_TEXT_MAIN]);
				//Func
				//start BUTTONS
				DEFINE FIRSTROW_HEIGHT = Text->FontHeight(DIA_FONT)+3;
				DEFINE BUTTON_HEIGHT = Text->FontHeight(DIA_FONT)+8;
				DEFINE BUTTON_WIDTH = 62;//58;
				DEFINE BUTTON_HSPACE = 0;//5;
				DEFINE BUTTON_VSPACE = 0;
				DEFINE LEFT_MARGIN = 4;
				if(PROC_CONFIRM==button(bit, LEFT_MARGIN+((BUTTON_WIDTH+BUTTON_HSPACE)*0), FIRSTROW_HEIGHT + 0*(BUTTON_HEIGHT+BUTTON_VSPACE), BUTTON_WIDTH, BUTTON_HEIGHT, "%New Obj", data, main_proc_data, 0))
				{
					open_data_pane(DLG_NEWOBJ, PANE_T_SYSTEM);
				}
				if(PROC_CONFIRM==button(bit, LEFT_MARGIN+((BUTTON_WIDTH+BUTTON_HSPACE)*1), FIRSTROW_HEIGHT + 0*(BUTTON_HEIGHT+BUTTON_VSPACE), BUTTON_WIDTH, BUTTON_HEIGHT, "%Edit", data, main_proc_data, 1, SubEditorData[SED_HIGHLIGHTED] ? FLAG_DEFAULT : FLAG_DISABLE))
				{
					open_data_pane(SubEditorData[SED_HIGHLIGHTED], active);
				}
				if(PROC_CONFIRM==button(bit, LEFT_MARGIN+((BUTTON_WIDTH+BUTTON_HSPACE)*2), FIRSTROW_HEIGHT + 0*(BUTTON_HEIGHT+BUTTON_VSPACE), BUTTON_WIDTH, BUTTON_HEIGHT, "%Clone", data, main_proc_data, 2, SubEditorData[SED_HIGHLIGHTED] > 1 ? 0 : FLAG_DISABLE))
				{
					unless(SubEditorData[SED_JUST_CLONED]) //Don't clone every frame it's held, just the first frame pressed!
					{
						cloneModule(SubEditorData[SED_HIGHLIGHTED], active);
						SubEditorData[SED_HIGHLIGHTED] = active ? g_arr[NUM_ACTIVE_MODULES]-1 : g_arr[NUM_PASSIVE_MODULES]-1;
						SubEditorData[SED_JUST_CLONED] = true;
					}
				}
				else SubEditorData[SED_JUST_CLONED] = false;
				if(PROC_CONFIRM==button(bit, LEFT_MARGIN+((BUTTON_WIDTH+BUTTON_HSPACE)*3), FIRSTROW_HEIGHT + 0*(BUTTON_HEIGHT+BUTTON_VSPACE), BUTTON_WIDTH, BUTTON_HEIGHT, "%Options", data, main_proc_data, 3))
				{
					open_data_pane(DLG_OPTIONS, PANE_T_SYSTEM);
				}
				/*if(PROC_CONFIRM==button(bit, LEFT_MARGIN+((BUTTON_WIDTH+BUTTON_HSPACE)*0), FIRSTROW_HEIGHT + 1*(BUTTON_HEIGHT+BUTTON_VSPACE), BUTTON_WIDTH, BUTTON_HEIGHT, "%Save", data, main_proc_data, 4))
				{
					ret = GUIRET_SAVE;
					//open_data_pane(DLG_SAVEAS, PANE_T_SYSTEM);
				}*/
				/*if(PROC_CONFIRM==button(bit, LEFT_MARGIN+((BUTTON_WIDTH+BUTTON_HSPACE)*1), FIRSTROW_HEIGHT + 1*(BUTTON_HEIGHT+BUTTON_VSPACE), BUTTON_WIDTH, BUTTON_HEIGHT, "", data, main_proc_data, 5))
				{
					//open_data_pane(DLG_LOAD, PANE_T_SYSTEM);
				}*/
				if(PROC_CONFIRM==button(bit, LEFT_MARGIN+((BUTTON_WIDTH+BUTTON_HSPACE)*2), FIRSTROW_HEIGHT + 1*(BUTTON_HEIGHT+BUTTON_VSPACE), BUTTON_WIDTH, BUTTON_HEIGHT, "S%ystem", data, main_proc_data, 6))
				{
					open_data_pane(DLG_SYSTEM, PANE_T_SYSTEM);
				}
				if(PROC_CONFIRM==button(bit, LEFT_MARGIN+((BUTTON_WIDTH+BUTTON_HSPACE)*1), FIRSTROW_HEIGHT + 1*(BUTTON_HEIGHT+BUTTON_VSPACE), BUTTON_WIDTH, BUTTON_HEIGHT, "%Themes", data, main_proc_data, 7))
				{
					open_data_pane(DLG_THEMES, PANE_T_SYSTEM);
				}
				if(PROC_CONFIRM==button(bit, LEFT_MARGIN+((BUTTON_WIDTH+BUTTON_HSPACE)*3), FIRSTROW_HEIGHT + 1*(BUTTON_HEIGHT+BUTTON_VSPACE), BUTTON_WIDTH, BUTTON_HEIGHT, "Exit", data, main_proc_data, 8))
				{
					ret = GUIRET_EXIT;
				}
				//end BUTTONS
			}
			draw_dlg(bit, data);
			if(isHovering(data)) clearPreparedSelector();
			return ret;
		} //end main GUI
		//start Themes
		void editThemes()
		{
			gen_startup();
			//start setup
			DEFINE WIDTH = 256
			     , HEIGHT = 224
				 , BAR_HEIGHT = 11
				 , MARGIN_WIDTH = 1
				 , FRAME_X = MARGIN_WIDTH+2
				 , FRAME_Y = MARGIN_WIDTH+BAR_HEIGHT+2
				 ;
			bitmap bit = create(WIDTH, HEIGHT);
			bit->ClearToColor(0, PAL[COL_NULL]);
			
			char32 title[128] = "Theme Editor";
			Color NEWPAL[PAL_SIZE];
			Color BCKUPPAL[PAL_SIZE];
			memcpy(NEWPAL, PAL, PAL_SIZE);
			memcpy(BCKUPPAL, PAL, PAL_SIZE);
			untyped data[DLG_DATA_SZ];
			data[DLG_DATA_WID] = WIDTH;
			data[DLG_DATA_HEI] = HEIGHT;
			//
			null_screen();
			draw_dlg(bit, data);
			KillButtons();
			Waitframe();
			//
			center_dlg(bit, data);
			
			bool running = true;
			bool do_save_changes = false;
			//end
			int preview = 0;
			untyped proc_data[6];
			while(running)
			{
				bit->ClearToColor(0, PAL[COL_NULL]);
				//Deco
				frame_rect(bit, 0, 0, WIDTH-1, HEIGHT-1, MARGIN_WIDTH);
				//Func
				if(title_bar(bit, MARGIN_WIDTH, BAR_HEIGHT, title, data, "The Theme Editor allows you to customize the colors used by the editor windows. Use the presets to the left, or modify the color swatches individually to the right.")==PROC_CANCEL || CancelButtonP())
					running = false;
				
				switch(desc_titled_checkbox(bit, FRAME_X, FRAME_Y, 7, preview&1b, data, 0, "Preview", "If enabled, the palette will be live-updated. Else, changes will not take effect until you click 'Accept'."))
				{
					case PROC_UPDATED_FALSE:
						preview=10b;
						break;
					case PROC_UPDATED_TRUE:
						preview=11b;
						break;
				}
				//Palette Editing
				{
					DEFINE NUM_ROWS = 8, NUM_COLUMNS = Ceiling(COL_MAX/NUM_ROWS),
						   WID_COL = 64, HEI_ROW = 26;
					
					DEFINE START_Y = FRAME_Y+5, START_X = WIDTH-32-MARGIN_WIDTH-(WID_COL*(NUM_COLUMNS-1));
					int pal_node_x = START_X;
					for(int col = 0; col < NUM_COLUMNS; ++col)
					{
						int pal_node_y=START_Y;
						for(int row = 0; row < NUM_ROWS; ++row)
						{
							DEFINE COL_INDX = ((col*NUM_ROWS)+row);
							if(COL_INDX >= COL_MAX) break;
							char32 palbuf[32];
							if(getPalName(palbuf, COL_INDX))
							{
								NEWPAL[COL_INDX] = pal_swatch(bit, pal_node_x, pal_node_y, 16, 16, NEWPAL[COL_INDX], data);
							}
							else
							{
								frame_rect(bit, pal_node_x, pal_node_y, pal_node_x+15, pal_node_y+15, 1);
							}
							text(bit, pal_node_x-1, pal_node_y+5, TF_RIGHT, palbuf, PAL[COL_TEXT_MAIN]);
							pal_node_y+=HEI_ROW;
						}
						pal_node_x += WID_COL;
					}
				}
				
				//Buttons
				{
					DEFINE BUTTON_WIDTH = GEN_BUTTON_WIDTH, BUTTON_HEIGHT = GEN_BUTTON_HEIGHT;
					//Themes
					{
						DEFINE BUTTON_SPACING = 6, BUTTON_START_Y = 12, LABEL_HEIGHT = Text->FontHeight(DIA_FONT)+2;
						DEFINE NUM_PRESET_THEMES = 4;
						DEFINE BOXOFFSET = MARGIN_WIDTH+2;
						int bx = FRAME_X+BOXOFFSET, by = FRAME_Y+BUTTON_START_Y;
						frame_rect(bit, bx-BOXOFFSET, by-BOXOFFSET, bx+BUTTON_WIDTH+BOXOFFSET-1, by-BOXOFFSET + ((BUTTON_HEIGHT+BOXOFFSET+BOXOFFSET	)*NUM_PRESET_THEMES) + LABEL_HEIGHT, 1);
						i_proc(bit, bx, by, "Activating a theme will copy it's colors over the current theme.\n\n\"Basic\" themes use ZC System Colors, so they should work in any tileset.\n\n\"Classic\" themes are designed for Classic, and might not work elsewhere.", data);
						text(bit, bx+(BUTTON_WIDTH/2), by, TF_CENTERED, "Themes:", PAL[COL_TEXT_MAIN]);
						by += LABEL_HEIGHT;
						if(PROC_CONFIRM==button(bit, bx, by, BUTTON_WIDTH, BUTTON_HEIGHT, "Basic", data, proc_data, 0))
						{
							loadBasicPal(NEWPAL);
						}
						by += BUTTON_HEIGHT+BUTTON_SPACING;
						if(PROC_CONFIRM==button(bit, bx, by, BUTTON_WIDTH, BUTTON_HEIGHT, "B. Dark", data, proc_data, 1))
						{
							loadBasicDarkPal(NEWPAL);
						}
						by += BUTTON_HEIGHT+BUTTON_SPACING;
						if(PROC_CONFIRM==button(bit, bx, by, BUTTON_WIDTH, BUTTON_HEIGHT, "Classic", data, proc_data, 2))
						{
							loadClassicPal(NEWPAL);
						}
						by += BUTTON_HEIGHT+BUTTON_SPACING;
						if(PROC_CONFIRM==button(bit, bx, by, BUTTON_WIDTH, BUTTON_HEIGHT, "C. Dark", data, proc_data, 3))
						{
							loadClassicDarkPal(NEWPAL);
						}
						//by += BUTTON_HEIGHT+BUTTON_SPACING;
					}
					
					//Confirm / Reset
					{
						if(PROC_CONFIRM==button(bit, FRAME_X+BUTTON_WIDTH+3, HEIGHT-MARGIN_WIDTH-2-BUTTON_HEIGHT, BUTTON_WIDTH, BUTTON_HEIGHT, "Reset", data, proc_data, 4))
						{
							memcpy(NEWPAL, BCKUPPAL, PAL_SIZE);
						}
						if(PROC_CONFIRM==button(bit, FRAME_X, HEIGHT-MARGIN_WIDTH-2-BUTTON_HEIGHT, BUTTON_WIDTH, BUTTON_HEIGHT, "Accept", data, proc_data, 5, FLAG_DEFAULT))
						{
							running = false;
							do_save_changes = true;
						}
					}
				}
				
				//
				null_screen();
				draw_dlg(bit, data);
				KillButtons();
				subscr_Waitframe();
				if(preview&1b)
				{
					memcpy(PAL, NEWPAL, PAL_SIZE);
				}
				else if(preview==10b)
				{
					memcpy(PAL, BCKUPPAL, PAL_SIZE);
					preview=0;
				}
			}
			for(int q = 0; q < DIA_CLOSING_DELAY; ++q) //Delay on closing
			{
				null_screen();
				draw_dlg(bit, data);
				KillButtons();
				subscr_Waitframe();
			}
			
			if(do_save_changes)
			{
				bit->Write(0, "_DIALOGUE.png", true);
				memcpy(PAL, NEWPAL, PAL_SIZE);
			}
			else
			{
				memcpy(PAL, BCKUPPAL, PAL_SIZE);
			}
			
			bit->Free();
			gen_final();
		}
		//end
		//start System
		void sys_dlg()
		{
			gen_startup();
			//start setup
			DEFINE WIDTH = 256
			     , HEIGHT = 224
				 , BAR_HEIGHT = 11
				 , MARGIN_WIDTH = 1
				 , FRAME_X = MARGIN_WIDTH+2
				 , FRAME_Y = MARGIN_WIDTH+BAR_HEIGHT+2
				 ;
			bitmap bit = create(WIDTH, HEIGHT);
			bit->ClearToColor(0, PAL[COL_NULL]);
			
			char32 title[128] = "System Settings";
			untyped data[DLG_DATA_SZ];
			data[DLG_DATA_WID] = WIDTH;
			data[DLG_DATA_HEI] = HEIGHT;
			//
			null_screen();
			draw_dlg(bit, data);
			KillButtons();
			Waitframe();
			//
			center_dlg(bit, data);
			
			bool running = true;
			bool do_save_changes = false;
			untyped old_sys_settings[SSET_MAX];
			memcpy(old_sys_settings, sys_settings, SSET_MAX);
			//end
			untyped proc_data[6];
			while(running)
			{
				bit->ClearToColor(0, PAL[COL_NULL]);
				//Deco
				frame_rect(bit, 0, 0, WIDTH-1, HEIGHT-1, MARGIN_WIDTH);
				//Func
				if(title_bar(bit, MARGIN_WIDTH, BAR_HEIGHT, title, data)==PROC_CANCEL || CancelButtonP())
					running = false;
				
				switch(desc_titled_checkbox(bit, FRAME_X, FRAME_Y, 7, sys_settings[SSET_DELWARN], data, 0, "Recieve Deletion Warnings", "If checked, a confirmation prompt will appear when attempting to delete objects."))
				{
					case PROC_UPDATED_FALSE:
						sys_settings[SSET_DELWARN]=false;
						break;
					case PROC_UPDATED_TRUE:
						sys_settings[SSET_DELWARN]=true;
						break;
				}
				//Buttons
				{
					DEFINE BUTTON_WIDTH = GEN_BUTTON_WIDTH, BUTTON_HEIGHT = GEN_BUTTON_HEIGHT;
					//Confirm / Reset
					{
						if(PROC_CONFIRM==button(bit, FRAME_X+BUTTON_WIDTH+3, HEIGHT-MARGIN_WIDTH-2-BUTTON_HEIGHT, BUTTON_WIDTH, BUTTON_HEIGHT, "Cancel", data, proc_data, 4))
						{
							running = false;
						}
						if(PROC_CONFIRM==button(bit, FRAME_X, HEIGHT-MARGIN_WIDTH-2-BUTTON_HEIGHT, BUTTON_WIDTH, BUTTON_HEIGHT, "Accept", data, proc_data, 5, FLAG_DEFAULT))
						{
							running = false;
							do_save_changes = true;
						}
					}
				}
				
				//
				null_screen();
				draw_dlg(bit, data);
				KillButtons();
				subscr_Waitframe();
			}
			for(int q = 0; q < DIA_CLOSING_DELAY; ++q) //Delay on closing
			{
				null_screen();
				draw_dlg(bit, data);
				KillButtons();
				subscr_Waitframe();
			}
			
			unless(do_save_changes)
			{
				memcpy(sys_settings, old_sys_settings, SSET_MAX);
			}
			
			bit->Free();
			gen_final();
		}
		//end
		//start Options
		void opt_dlg(bool active)
		{
			gen_startup();
			//start setup
			DEFINE WIDTH = 256
			     , HEIGHT = 224
				 , BAR_HEIGHT = 11
				 , MARGIN_WIDTH = 1
				 , FRAME_X = MARGIN_WIDTH+2
				 , FRAME_Y = MARGIN_WIDTH+BAR_HEIGHT+2
				 ;
			bitmap bit = create(WIDTH, HEIGHT);
			bit->ClearToColor(0, PAL[COL_NULL]);
			//
			untyped settings_arr[NUM_SETTINGS + MODULE_META_SIZE];
			saveModule(settings_arr, 0, active);
			//
			char32 title[128];
			strcpy(title, active ? "Active Subscreen Settings" : "Passive Subscreen Settings");
			char32 desc_str[128];
			strcpy(desc_str, active ? "" : "");
			untyped data[DLG_DATA_SZ];
			data[DLG_DATA_WID] = WIDTH;
			data[DLG_DATA_HEI] = HEIGHT;
			//
			DEFINE MISCFIELD_WID = 28;
			DEFINE MISCFIELD_NUMCHARS = 5;
			DEFINE MISCFIELD_SPACE = 2;
			char32 b1[MISCFIELD_NUMCHARS+1];
			char32 b2[MISCFIELD_NUMCHARS+1];
			char32 b3[MISCFIELD_NUMCHARS+1];
			char32 b4[MISCFIELD_NUMCHARS+1];
			char32 b5[MISCFIELD_NUMCHARS+1];
			char32 b6[MISCFIELD_NUMCHARS+1];
			char32 b7[MISCFIELD_NUMCHARS+1];
			char32 b8[MISCFIELD_NUMCHARS+1];
			char32 b9[MISCFIELD_NUMCHARS+1];
			char32 b10[MISCFIELD_NUMCHARS+1];
			//
			if(active)
			{
				itoa(b1, settings_arr[A_STTNG_FRAME_HOLD_DELAY]);
			}
			else
			{
			
			}
			//
			null_screen();
			draw_dlg(bit, data);
			KillButtons();
			Waitframe();
			//
			center_dlg(bit, data);
			
			bool running = true;
			bool do_save_changes = false;
			//end
			untyped proc_data[6];
			while(running)
			{
				bit->ClearToColor(0, PAL[COL_NULL]);
				//Deco
				frame_rect(bit, 0, 0, WIDTH-1, HEIGHT-1, MARGIN_WIDTH);
				//Func
				if(title_bar(bit, MARGIN_WIDTH, BAR_HEIGHT, title, data, desc_str)==PROC_CANCEL || CancelButtonP())
					running = false;
				
				int flags_x = FRAME_X, flags_y = FRAME_Y;
				bool a_active[SUBSCR_BITS_INT] = {true}, p_active[SUBSCR_BITS_INT] = {false};
				DEFINE FLAGS_HEIGHT = 7;
				for(int q = 0; q < SUBSCR_BITS_INT; ++q)
				{
					char32 titlebuf[128], descbuf[256];
					get_flag_name(titlebuf, active, 1b<<q);
					get_flag_desc(descbuf, active, 1b<<q);
					switch(desc_titled_checkbox(bit, flags_x, flags_y, FLAGS_HEIGHT, settings_arr[STTNG_FLAGS1] & (1b<<q), data, active?(a_active[q]?0:FLAG_DISABLE):(p_active[q]?0:FLAG_DISABLE), titlebuf, descbuf))
					{
						case PROC_UPDATED_FALSE:
							settings_arr[STTNG_FLAGS1] &= ~(1b<<q);
							break;
						case PROC_UPDATED_TRUE:
							settings_arr[STTNG_FLAGS1] |= (1b<<q);
							break;
					}
					flags_y += (FLAGS_HEIGHT+2);
				}
				
				//Buttons
				{
					DEFINE BUTTON_WIDTH = GEN_BUTTON_WIDTH, BUTTON_HEIGHT = GEN_BUTTON_HEIGHT;
					//Confirm / Reset
					{
						if(PROC_CONFIRM==button(bit, FRAME_X+BUTTON_WIDTH+3, HEIGHT-MARGIN_WIDTH-2-BUTTON_HEIGHT, BUTTON_WIDTH, BUTTON_HEIGHT, "Cancel", data, proc_data, 1))
						{
							running = false;
						}
						if(PROC_CONFIRM==button(bit, FRAME_X, HEIGHT-MARGIN_WIDTH-2-BUTTON_HEIGHT, BUTTON_WIDTH, BUTTON_HEIGHT, "Accept", data, proc_data, 2, FLAG_DEFAULT))
						{
							running = false;
							do_save_changes = true;
						}
					}
				}
				
				int tfx = WIDTH-FRAME_X-MISCFIELD_WID, tfy = FRAME_Y;
				if(active)
				{
					titled_text_field(bit, tfx, tfy, MISCFIELD_WID, b1, MISCFIELD_NUMCHARS, TypeAString::TMODE_NUMERIC_POSITIVE, data, 1, 0, "Input Repeat Rate:");
					tfy+=Text->FontHeight(DIA_FONT)+2+2+MISCFIELD_SPACE;
					titled_text_field(bit, tfx, tfy, MISCFIELD_WID, b2, MISCFIELD_NUMCHARS, TypeAString::TMODE_NUMERIC_POSITIVE, data, 2, FLAG_DISABLE, "--");
					tfy+=Text->FontHeight(DIA_FONT)+2+2+MISCFIELD_SPACE;
					titled_text_field(bit, tfx, tfy, MISCFIELD_WID, b3, MISCFIELD_NUMCHARS, TypeAString::TMODE_NUMERIC_POSITIVE, data, 3, FLAG_DISABLE, "--");
					tfy+=Text->FontHeight(DIA_FONT)+2+2+MISCFIELD_SPACE;
					titled_text_field(bit, tfx, tfy, MISCFIELD_WID, b4, MISCFIELD_NUMCHARS, TypeAString::TMODE_NUMERIC_POSITIVE, data, 4, FLAG_DISABLE, "--");
					tfy+=Text->FontHeight(DIA_FONT)+2+2+MISCFIELD_SPACE;
					titled_text_field(bit, tfx, tfy, MISCFIELD_WID, b5, MISCFIELD_NUMCHARS, TypeAString::TMODE_NUMERIC_POSITIVE, data, 5, FLAG_DISABLE, "--");
					tfy+=Text->FontHeight(DIA_FONT)+2+2+MISCFIELD_SPACE;
					titled_text_field(bit, tfx, tfy, MISCFIELD_WID, b6, MISCFIELD_NUMCHARS, TypeAString::TMODE_NUMERIC_POSITIVE, data, 6, FLAG_DISABLE, "--");
					tfy+=Text->FontHeight(DIA_FONT)+2+2+MISCFIELD_SPACE;
					titled_text_field(bit, tfx, tfy, MISCFIELD_WID, b7, MISCFIELD_NUMCHARS, TypeAString::TMODE_NUMERIC_POSITIVE, data, 7, FLAG_DISABLE, "--");
					tfy+=Text->FontHeight(DIA_FONT)+2+2+MISCFIELD_SPACE;
					titled_text_field(bit, tfx, tfy, MISCFIELD_WID, b8, MISCFIELD_NUMCHARS, TypeAString::TMODE_NUMERIC_POSITIVE, data, 8, FLAG_DISABLE, "--");
					tfy+=Text->FontHeight(DIA_FONT)+2+2+MISCFIELD_SPACE;
					titled_text_field(bit, tfx, tfy, MISCFIELD_WID, b9, MISCFIELD_NUMCHARS, TypeAString::TMODE_NUMERIC_POSITIVE, data, 9, FLAG_DISABLE, "--");
					tfy+=Text->FontHeight(DIA_FONT)+2+2+MISCFIELD_SPACE;
					titled_text_field(bit, tfx, tfy, MISCFIELD_WID, b10, MISCFIELD_NUMCHARS, TypeAString::TMODE_NUMERIC_POSITIVE, data, 10, FLAG_DISABLE, "--");
				}
				else
				{
					titled_text_field(bit, tfx, tfy, MISCFIELD_WID, b1, MISCFIELD_NUMCHARS, TypeAString::TMODE_NUMERIC_POSITIVE, data, 1, FLAG_DISABLE, "--");
					tfy+=Text->FontHeight(DIA_FONT)+2+2+MISCFIELD_SPACE;
					titled_text_field(bit, tfx, tfy, MISCFIELD_WID, b2, MISCFIELD_NUMCHARS, TypeAString::TMODE_NUMERIC_POSITIVE, data, 2, FLAG_DISABLE, "--");
					tfy+=Text->FontHeight(DIA_FONT)+2+2+MISCFIELD_SPACE;
					titled_text_field(bit, tfx, tfy, MISCFIELD_WID, b3, MISCFIELD_NUMCHARS, TypeAString::TMODE_NUMERIC_POSITIVE, data, 3, FLAG_DISABLE, "--");
					tfy+=Text->FontHeight(DIA_FONT)+2+2+MISCFIELD_SPACE;
					titled_text_field(bit, tfx, tfy, MISCFIELD_WID, b4, MISCFIELD_NUMCHARS, TypeAString::TMODE_NUMERIC_POSITIVE, data, 4, FLAG_DISABLE, "--");
					tfy+=Text->FontHeight(DIA_FONT)+2+2+MISCFIELD_SPACE;
					titled_text_field(bit, tfx, tfy, MISCFIELD_WID, b5, MISCFIELD_NUMCHARS, TypeAString::TMODE_NUMERIC_POSITIVE, data, 5, FLAG_DISABLE, "--");
					tfy+=Text->FontHeight(DIA_FONT)+2+2+MISCFIELD_SPACE;
					titled_text_field(bit, tfx, tfy, MISCFIELD_WID, b6, MISCFIELD_NUMCHARS, TypeAString::TMODE_NUMERIC_POSITIVE, data, 6, FLAG_DISABLE, "--");
					tfy+=Text->FontHeight(DIA_FONT)+2+2+MISCFIELD_SPACE;
					titled_text_field(bit, tfx, tfy, MISCFIELD_WID, b7, MISCFIELD_NUMCHARS, TypeAString::TMODE_NUMERIC_POSITIVE, data, 7, FLAG_DISABLE, "--");
					tfy+=Text->FontHeight(DIA_FONT)+2+2+MISCFIELD_SPACE;
					titled_text_field(bit, tfx, tfy, MISCFIELD_WID, b8, MISCFIELD_NUMCHARS, TypeAString::TMODE_NUMERIC_POSITIVE, data, 8, FLAG_DISABLE, "--");
					tfy+=Text->FontHeight(DIA_FONT)+2+2+MISCFIELD_SPACE;
					titled_text_field(bit, tfx, tfy, MISCFIELD_WID, b9, MISCFIELD_NUMCHARS, TypeAString::TMODE_NUMERIC_POSITIVE, data, 9, FLAG_DISABLE, "--");
					tfy+=Text->FontHeight(DIA_FONT)+2+2+MISCFIELD_SPACE;
					titled_text_field(bit, tfx, tfy, MISCFIELD_WID, b10, MISCFIELD_NUMCHARS, TypeAString::TMODE_NUMERIC_POSITIVE, data, 10, FLAG_DISABLE, "--");
				}
				
				//
				null_screen();
				draw_dlg(bit, data);
				KillButtons();
				subscr_Waitframe();
			}
			for(int q = 0; q < DIA_CLOSING_DELAY; ++q) //Delay on closing
			{
				null_screen();
				draw_dlg(bit, data);
				KillButtons();
				subscr_Waitframe();
			}
			
			if(do_save_changes)
			{
				bit->Write(0, "_DIALOGUE.png", true);
				if(active)
				{
					settings_arr[A_STTNG_FRAME_HOLD_DELAY] = VBound(atoi(b1), MAX_INT, 0);
					load_active_settings(settings_arr);
				}
				else
				{
					load_passive_settings(settings_arr);
				}
			}
			else
			{
			}
			
			bit->Free();
			gen_final();
		}
		//end
		//start New Object
		void new_obj(bool active)
		{
			gen_startup();
			
			//start setup
			DEFINE MARGIN_WIDTH = 1
			     , WIDTH = 162
				 , TXTWID = WIDTH - ((MARGIN_WIDTH+1)*2)
				 , BAR_HEIGHT = 11
			     , HEIGHT = BAR_HEIGHT+4+(Text->FontHeight(DIA_FONT)*2) + 14
				 , FRAME_X = MARGIN_WIDTH+2
				 , FRAME_Y = MARGIN_WIDTH+BAR_HEIGHT+(Text->FontHeight(DIA_FONT)/2)
				 ;
			bitmap bit = create(WIDTH, HEIGHT);
			bit->ClearToColor(0, PAL[COL_NULL]);
			bitmap lastframe = create(WIDTH, HEIGHT);
			lastframe->ClearToColor(0, PAL[COL_NULL]);
			
			untyped data[DLG_DATA_SZ];
			data[DLG_DATA_WID] = WIDTH;
			data[DLG_DATA_HEI] = HEIGHT;
			//
			null_screen();
			draw_dlg(bit, data);
			KillButtons();
			Waitframe();
			//
			center_dlg(bit, data);
			
			bool running = true;
			//end
			untyped proc_data[1];
			int indx;
			int aval[] = {2,3,4,5,6,7,8,9,10,11};
			int pval[] = {4,5,7,8,9,10,11};
			int val = active ? aval : pval;
			while(running)
			{
				lastframe->Clear(0);
				fullblit(0, lastframe, bit);
				bit->ClearToColor(0, PAL[COL_NULL]);
				//Deco
				frame_rect(bit, 0, 0, WIDTH-1, HEIGHT-1, MARGIN_WIDTH);
				//Func
				if(title_bar(bit, MARGIN_WIDTH, BAR_HEIGHT, "Create Object", data, "Create a new object of a given type, at it's default settings.\nAfter creating the object, it's editing window will open.")==PROC_CANCEL || CancelButtonP())
					running = false;
				
				indx = dropdown_proc(bit, FRAME_X, FRAME_Y, WIDTH - (FRAME_X*2), indx, data,
				                     active
				                     ? {"Selectable Item (ID)", "Selectable Item (Type)", "A Item", "B Item", "Passive Subscreen", "MiniMap", "Tile Block", "Heart", "Heart Row", "Counter"}
				                     : {"A Item", "B Item", "MiniMap", "Tile Block", "Heart", "Heart Row", "Counter"}
				                     , -1/*Auto*/, 10, lastframe, 0);
				
				DEFINE BUTTON_WIDTH = 32, BUTTON_HEIGHT = 10;
				if(PROC_CONFIRM==button(bit, (WIDTH/2)-(BUTTON_WIDTH/2), HEIGHT-BUTTON_HEIGHT-3, BUTTON_WIDTH, BUTTON_HEIGHT, "Create", data, proc_data, 0, FLAG_DEFAULT))
				{
					untyped module_arr[MODULE_BUF_SIZE];
					switch(val[indx])
					{
						case MODULE_TYPE_SELECTABLE_ITEM_ID:
						{
							MakeSelectableItemID(module_arr); break;
						}
						case MODULE_TYPE_SELECTABLE_ITEM_CLASS:
						{
							MakeSelectableItemClass(module_arr); break;
						}
						case MODULE_TYPE_ABUTTONITEM:
						{
							MakeAButtonItem(module_arr); break;
						}
						case MODULE_TYPE_BBUTTONITEM:
						{
							MakeBButtonItem(module_arr); break;
						}
						case MODULE_TYPE_MINIMAP:
						{
							MakeMinimap(module_arr); break;
						}
						case MODULE_TYPE_TILEBLOCK:
						{
							MakeTileBlock(module_arr); break;
						}
						case MODULE_TYPE_HEART:
						{
							MakeHeart(module_arr); break;
						}
						case MODULE_TYPE_HEARTROW:
						{
							MakeHeartRow(module_arr); break;
						}
						case MODULE_TYPE_COUNTER:
						{
							MakeCounter(module_arr); break;
						}
						default:
						case MODULE_TYPE_PASSIVESUBSCREEN:
						{
							MakePassiveSubscreen(module_arr); break;
						}
					}
					if(active) add_active_module(module_arr);
					else add_passive_module(module_arr);
					int indx = (active ? g_arr[NUM_ACTIVE_MODULES] : g_arr[NUM_PASSIVE_MODULES])-1;
					open_data_pane(indx, active); //Go directly into the editObj dialogue from here!
					SubEditorData[SED_HIGHLIGHTED] = indx; //And highlight it, too!
					running = false;
				}
				//
				null_screen();
				draw_dlg(bit, data);
				KillButtons();
				subscr_Waitframe();
			}
			for(int q = 0; q < DIA_CLOSING_DELAY; ++q) //Delay on closing
			{
				null_screen();
				draw_dlg(bit, data);
				KillButtons();
				subscr_Waitframe();
			}
			
			bit->Write(0, "_DIALOGUE.png", true);
			
			bit->Free();
			lastframe->Free();
			gen_final();	
		}
		//end
		//start Main Menu
		void MainMenu() //start
		{
			/*
			//start OLD MENU CODE
			int editing = 1;
			Input->DisableKey[KEY_ESC] = editing!=0;
			while(true)
			{
				switch(editing)
				{
					case 0:
						if(Input->Press[CB_START])
						{
							runActiveSubscreen();
						}
						runPassiveSubscreen();
						break;
					case 1:
						runFauxActiveSubscreen();
						if(SubEditorData[SED_QUEUED_DELETION])
						{
							if(SubEditorData[SED_QUEUED_DELETION]<0) //passive
							{
								remove_passive_module(-SubEditorData[SED_QUEUED_DELETION]);
							}
							else //active
							{
								remove_active_module(SubEditorData[SED_QUEUED_DELETION]);
							}
							SubEditorData[SED_QUEUED_DELETION]=0;
						}
						KillButtons();
						break;
					case 2:
						runFauxPassiveSubscreen(true);
						runPreparedSelector(false);
						ColorScreen(7, PAL[COL_NULL], true);
						getSubscreenBitmap(false)->Blit(7, RT_SCREEN, 0, 0, 256, 56, 0, PASSIVE_EDITOR_TOP, 256, 56, 0, 0, 0, 0, 0, true);
						clearPassive1frame();
						KillButtons();
						break;
				}
				if(handle_data_pane(editing==1)) continue;
				if(editing) DIALOG::runGUI(editing==1);
				if(Input->ReadKey[KEY_P])
				{
					++editing;
					editing %= 3;
					Input->DisableKey[KEY_ESC] = editing!=0;
				}
				subscr_Waitframe();
			}
			//end OLD MENU CODE
			*/
			gen_startup();
			//start setup
			DEFINE WIDTH = 256
			     , HEIGHT = 224
				 , BAR_HEIGHT = 11
				 , MARGIN_WIDTH = 1
				 , FRAME_X = MARGIN_WIDTH+2
				 , FRAME_Y = MARGIN_WIDTH+BAR_HEIGHT+2
				 , ACOL_X = FRAME_X
				 , PCOL_X = FRAME_X + (WIDTH/2 - (FRAME_X*2)) + 4
				 , COL_WID = (WIDTH/2 - (FRAME_X*2))
				 ;
			bitmap bit = create(WIDTH, HEIGHT);
			bit->ClearToColor(0, PAL[COL_NULL]);
			bitmap lastframe = create(WIDTH, HEIGHT);
			lastframe->ClearToColor(0, PAL[COL_NULL]);
			
			char32 title[128] = "Main Menu";
			untyped data[DLG_DATA_SZ];
			data[DLG_DATA_WID] = WIDTH;
			data[DLG_DATA_HEI] = HEIGHT;
			//
			null_screen();
			draw_dlg(bit, data);
			KillButtons();
			Waitframe();
			//
			center_dlg(bit, data);
			//end
			untyped proc_data[100];
			int active_indx, passive_indx;
			int num_active_sub = count_subs(false), num_passive_sub = count_subs(true);
			printf("Counts: %03d,%03d\n",num_active_sub,num_passive_sub);
			unless(num_active_sub)
			{
				resetActive();
				save_active_file(1);
				++num_active_sub;
			}
			unless(num_passive_sub)
			{
				resetPassive();
				save_passive_file(1);
				++num_passive_sub;
			}
			Input->DisableKey[KEY_ESC] = true;
			disableKeys(true);
			while(true)
			{
				lastframe->Clear(0);
				fullblit(0, lastframe, bit);
				bit->ClearToColor(0, PAL[COL_NULL]);
				
				handle_data_pane(true);
				
				//Deco
				frame_rect(bit, 0, 0, WIDTH-1, HEIGHT-1, MARGIN_WIDTH);
				//Func
				title_bar(bit, MARGIN_WIDTH, BAR_HEIGHT, title, data, "", false);
				
				//Text
				{
					text(bit, ACOL_X + COL_WID/2, FRAME_Y, TF_CENTERED, "Active Subscreen", PAL[COL_TEXT_MAIN]);
					text(bit, PCOL_X + COL_WID/2, FRAME_Y, TF_CENTERED, "Passive Subscreen", PAL[COL_TEXT_MAIN]);
				}
				//Dropdowns
				{
					active_indx = dropdown_proc(bit, ACOL_X, FRAME_Y+8, COL_WID, active_indx, data, NULL, num_active_sub, 10, lastframe, 0);
					passive_indx = dropdown_proc(bit, PCOL_X, FRAME_Y+8, COL_WID, passive_indx, data, NULL, num_passive_sub, 10, lastframe, 0);
				}
				//Buttons
				{
					DEFINE BUTTON_WIDTH = GEN_BUTTON_WIDTH, BUTTON_HEIGHT = GEN_BUTTON_HEIGHT;
					DEFINE BUTTON_XOFF = (COL_WID/2) - (BUTTON_WIDTH/2);
					DEFINE BUTTON_SPACING = 4;
					//SaveLoad
					{
						//UNFINISHED Save (open save dlg; same as MainGUI save)
						//UNFINISHED Load (open load dlg; same as MainGUI load)
					}
					//Choose Buttons
					{
						if(PROC_CONFIRM==button(bit, ACOL_X+BUTTON_XOFF, FRAME_Y + 8 + ((BUTTON_HEIGHT + BUTTON_SPACING) * 1), BUTTON_WIDTH, BUTTON_HEIGHT, "New", data, proc_data, 2)) //start
						{
							resetActive();
							active_indx = num_active_sub;
							save_active_file(++num_active_sub);
						} //end
						if(PROC_CONFIRM==button(bit, PCOL_X+BUTTON_XOFF, FRAME_Y + 8 + ((BUTTON_HEIGHT + BUTTON_SPACING) * 1), BUTTON_WIDTH, BUTTON_HEIGHT, "New", data, proc_data, 3)) //start
						{
							resetPassive();
							passive_indx = num_passive_sub;
							save_passive_file(++num_passive_sub);
						} //end
						if(PROC_CONFIRM==button(bit, ACOL_X+BUTTON_XOFF, FRAME_Y + 8 + ((BUTTON_HEIGHT + BUTTON_SPACING) * 2), BUTTON_WIDTH, BUTTON_HEIGHT, "Dupe", data, proc_data, 4)) //start
						{
							load_active_file(active_indx+1);
							active_indx = num_active_sub;
							save_active_file(++num_active_sub);
						} //end
						if(PROC_CONFIRM==button(bit, PCOL_X+BUTTON_XOFF, FRAME_Y + 8 + ((BUTTON_HEIGHT + BUTTON_SPACING) * 2), BUTTON_WIDTH, BUTTON_HEIGHT, "Dupe", data, proc_data, 5)) //start
						{
							load_passive_file(passive_indx+1);
							passive_indx = num_passive_sub;
							save_passive_file(++num_passive_sub);
						} //end
						if(PROC_CONFIRM==button(bit, ACOL_X+BUTTON_XOFF, FRAME_Y + 8 + ((BUTTON_HEIGHT + BUTTON_SPACING) * 3), BUTTON_WIDTH, BUTTON_HEIGHT, "Delete", data, proc_data, 6)) //start
						{
							if(delwarn())
							{
								if(delete_active_file(active_indx+1))
								{
									char32 buf[] = "Active Subscreen #%i deleted successfully";
									sprintf(buf, buf, active_indx+1);
									active_indx = 0;
									unless(--num_active_sub)
									{
										resetActive();
										save_active_file(1);
										++num_active_sub;
									}
									else load_active_file(1);
									msg_dlg("Alert", buf);
								}
								else
								{
									char32 buf[] = "Active Subscreen #%i could not be deleted\nMenu data will be refreshed";
									sprintf(buf, buf, active_indx+1);
									err_dlg(buf);
									return; //Reset menu
								}
							}
						} //end
						if(PROC_CONFIRM==button(bit, PCOL_X+BUTTON_XOFF, FRAME_Y + 8 + ((BUTTON_HEIGHT + BUTTON_SPACING) * 3), BUTTON_WIDTH, BUTTON_HEIGHT, "Delete", data, proc_data, 7)) //start
						{
							if(delwarn())
							{
								if(delete_passive_file(passive_indx+1))
								{
									char32 buf[] = "Passive Subscreen #%i deleted successfully";
									sprintf(buf, buf, passive_indx+1);
									passive_indx = 0;
									unless(--num_passive_sub)
									{
										resetPassive();
										save_passive_file(1);
										++num_passive_sub;
									}
									else load_passive_file(1);
									msg_dlg("Alert", buf);
								}
								else
								{
									char32 buf[] = "Passive Subscreen #%i could not be deleted\nMenu data will be refreshed";
									sprintf(buf, buf, passive_indx+1);
									err_dlg(buf);
									return; //Reset menu
								}
							}
						} //end
						if(PROC_CONFIRM==button(bit, ACOL_X+BUTTON_XOFF, FRAME_Y + 8 + ((BUTTON_HEIGHT + BUTTON_SPACING) * 4), BUTTON_WIDTH, BUTTON_HEIGHT, "Edit", data, proc_data, 8)) //start
						{
							load_active_file(active_indx+1);
							if(runEditor(1))
								save_active_file(active_indx+1);
							else load_active_file(active_indx+1);
						} //end
						if(PROC_CONFIRM==button(bit, PCOL_X+BUTTON_XOFF, FRAME_Y + 8 + ((BUTTON_HEIGHT + BUTTON_SPACING) * 4), BUTTON_WIDTH, BUTTON_HEIGHT, "Edit", data, proc_data, 9)) //start
						{
							load_passive_file(passive_indx+1);
							if(runEditor(2))
								save_passive_file(passive_indx+1);
							else load_passive_file(passive_indx+1);
						} //end
					}
					//Mode Buttons
					{
						if(PROC_CONFIRM==button(bit, FRAME_X + MARGIN_WIDTH + (BUTTON_WIDTH + 5)*0, HEIGHT-(MARGIN_WIDTH+2)-BUTTON_HEIGHT, BUTTON_WIDTH, BUTTON_HEIGHT, "S%ystem", data, proc_data, 10))
						{
							open_data_pane(DLG_SYSTEM, PANE_T_SYSTEM);
						}
						if(PROC_CONFIRM==button(bit, FRAME_X + MARGIN_WIDTH + (BUTTON_WIDTH + 5)*1, HEIGHT-(MARGIN_WIDTH+2)-BUTTON_HEIGHT, BUTTON_WIDTH, BUTTON_HEIGHT, "%Themes", data, proc_data, 11))
						{
							open_data_pane(DLG_THEMES, PANE_T_SYSTEM);
						}
						if(PROC_CONFIRM==button(bit, FRAME_X + MARGIN_WIDTH + (BUTTON_WIDTH + 5)*2, HEIGHT-(MARGIN_WIDTH+2)-BUTTON_HEIGHT, BUTTON_WIDTH, BUTTON_HEIGHT, "T%est", data, proc_data, 12))
						{
							load_active_file(active_indx+1);
							load_passive_file(passive_indx+1);
							runEditor(0);
						}
						//UNFINISHED TEXT- explain how to get back to this menu from another mode
					}
				}
				
				//
				null_screen();
				draw_dlg(bit, data);
				KillButtons();
				subscr_Waitframe();
			}
			/* Unreachable
			for(int q = 0; q < DIA_CLOSING_DELAY; ++q) //Delay on closing
			{
				null_screen();
				draw_dlg(bit, data);
				KillButtons();
				subscr_Waitframe();
			}
			
			bit->Free();
			gen_final();
			*/
		} //end
		bool runEditor(int mode) //start
		{
			unless(mode)
				disableKeys(false);
			while(true)
			{
				switch(mode)
				{
					case 0:
						if(Input->Press[CB_START])
						{
							runActiveSubscreen();
						}
						runPassiveSubscreen();
						break;
					case 1:
						runFauxActiveSubscreen();
						KillButtons();
						break;
					case 2:
						runFauxPassiveSubscreen(true);
						runPreparedSelector(false);
						ColorScreen(7, PAL[COL_NULL], true);
						getSubscreenBitmap(false)->Blit(7, RT_SCREEN, 0, 0, 256, 56, 0, PASSIVE_EDITOR_TOP, 256, 56, 0, 0, 0, 0, 0, true);
						clearPassive1frame();
						KillButtons();
						break;
				}
				if(SubEditorData[SED_QUEUED_DELETION])
				{
					if(SubEditorData[SED_QUEUED_DELETION]<0) //passive
					{
						remove_passive_module(-SubEditorData[SED_QUEUED_DELETION]);
					}
					else //active
					{
						remove_active_module(SubEditorData[SED_QUEUED_DELETION]);
					}
					SubEditorData[SED_QUEUED_DELETION]=0;
				}
				if(handle_data_pane(mode==1)) continue;
				int gret = GUIRET_NULL;
				if(mode) gret = DIALOG::runGUI(mode==1);
				if(Input->ReadKey[KEY_ESC] || gret == GUIRET_EXIT)
				{
					if(mode)
					{
						ProcRet r = yesno_dlg("Exiting Edit Mode", "Would you like to save your changes?" ,"Save", "Revert");
						if(r == PROC_CONFIRM) return true;
						if(r == PROC_DENY) return false;
					}
					else
					{
						disableKeys(true);
						return true;
					}
				}
				if(mode) subscr_Waitframe();
				else Waitframe();
			}
		} //end
		void disableKeys(bool dis)
		{
			Input->DisableKey[KEY_ESC] = true;
			Input->DisableKey[KEY_F1] = dis;
			Game->ClickToFreezeEnabled = !dis;
		}
		//end Main Menu
		//start SaveLoad
		void save()
		{
			msg_dlg("WIP", "This feature is still under construction. Please wait for an update.");
			return;
		}
		void load()
		{
			msg_dlg("WIP", "This feature is still under construction. Please wait for an update.");
		}
		//end SaveLoad
		//Misc Mini-DLGs
		//start Select Color
		Color pick_color(Color default_color)
		{
			gen_startup();
			//start setup0
			DEFINE WIDTH = 128
				 , BAR_HEIGHT = 11
			     , HEIGHT = 128+BAR_HEIGHT
				 , MARGIN_WIDTH = 1
				 , FRAME_X = MARGIN_WIDTH+2
				 , FRAME_Y = MARGIN_WIDTH+BAR_HEIGHT+2
				 ;
			bitmap bit = create(WIDTH, HEIGHT);
			bit->ClearToColor(0, PAL[COL_NULL]);
			
			char32 title[128] = "Color Picker";
			untyped data[DLG_DATA_SZ];
			data[DLG_DATA_WID] = WIDTH;
			data[DLG_DATA_HEI] = HEIGHT;
			Color active_swatch = default_color;
			//
			null_screen();
			draw_dlg(bit, data);
			KillButtons();
			Waitframe();
			//
			center_dlg(bit, data);
			
			bool running = true;
			bool do_save_changes = false;
			//end
			untyped proc_data[2] = {true, 0}; //Default TRUE for "is selected" on colorgrid.
			while(running)
			{
				bit->ClearToColor(0, PAL[COL_NULL]);
				//Deco
				frame_rect(bit, 0, 0, WIDTH-1, HEIGHT-1, MARGIN_WIDTH);
				//Func
				if(title_bar(bit, MARGIN_WIDTH, BAR_HEIGHT, title, data, "Choose a color from the palette selector.")==PROC_CANCEL || CancelButtonP())
					running = false;
				
				active_swatch = colorgrid(bit, 32, 32, active_swatch, 4, data, proc_data, 0);
				
				DEFINE BUTTON_WIDTH = 32, BUTTON_HEIGHT = 16;
				if(PROC_CONFIRM==button(bit, 64-(BUTTON_WIDTH/2), 32+(0xE*4)+16, BUTTON_WIDTH, BUTTON_HEIGHT, "Select", data, proc_data, 1, FLAG_DEFAULT))
				{
					running = false;
					do_save_changes = true;
				}
				
				//
				null_screen();
				draw_dlg(bit, data);
				KillButtons();
				subscr_Waitframe();
			}
			for(int q = 0; q < DIA_CLOSING_DELAY; ++q) //Delay on closing
			{
				null_screen();
				draw_dlg(bit, data);
				KillButtons();
				subscr_Waitframe();
			}
			
			bit->Free();
			gen_final();
			if(do_save_changes)
			{
				return active_swatch;
			}
			else
			{
				return default_color;
			}
		}
		//end
		//start Select Tile
		DEFINE TL_PER_ROW = 16;
		DEFINE TL_PER_COL = 13;
		DEFINE TL_PER_PAGE = TL_PER_ROW * TL_PER_COL;
		DEFINE E_TILE_PER_ROW = 20;
		DEFINE E_TILE_PER_COL = 13;
		DEFINE E_TILE_PER_PAGE = E_TILE_PER_ROW * E_TILE_PER_COL;
		void pick_tile(int arr) //start
		{
			gen_startup();
			//start Setup
			DEFINE WIDTH = 256, HEIGHT = 224;
			bitmap bit = create(WIDTH, HEIGHT);
			bit->ClearToColor(0, PAL[COL_NULL]);
			char32 titlefmt[] = "Tile Picker - Page %d (Engine Page %d) - Tile %d, CS %d";
			int tl = arr[0];
			int cs = arr[1];
			untyped data[DLG_DATA_SZ];
			data[DLG_DATA_WID] = WIDTH;
			data[DLG_DATA_HEI] = HEIGHT;
			//
			null_screen();
			draw_dlg(bit, data);
			KillButtons();
			Waitframe();
			//
			center_dlg(bit, data);
			
			bool running = true;
			//end Setup
			
			int clk, iclk;
			int mz = Input->Mouse[MOUSE_Z];
			bool controls = true;
			bitmap blnk = create(256, 208);
			blnk->ClearToColor(0, COL_NULL);
			blnk->Rectangle(0, 1, 1, 14, 14, PAL[COL_CURSOR], 1, 0, 0, 0, false, OP_OPAQUE);
			blnk->Line(0, 1, 1, 14, 14, PAL[COL_CURSOR], 1, 0, 0, 0, OP_OPAQUE);
			blnk->Line(0, 1, 14, 14, 1, PAL[COL_CURSOR], 1, 0, 0, 0, OP_OPAQUE);
			for(int tx = 1; tx < 16; ++tx)
			{
				blnk->Blit(0, blnk, 0, 0, 16, 16, tx*16, 0, 16, 16, 0, 0, 0, BITDX_NORMAL, 0, false);
			}
			for(int ty = 1; ty < 13; ++ty)
			{
				blnk->Blit(0, blnk, 0, 0, 256, 16, 0, ty*16, 256, 16, 0, 0, 0, BITDX_NORMAL, 0, false);
			}
			
			while(running)
			{
				if(keyprocp(KEY_TAB)) controls = !controls;
				clk = (clk+1) % 3600;
				iclk = (iclk+1) % 3600;
				bit->ClearToColor(0, PAL[COL_NULL]);
				//
				if(keyprocp(KEY_EQUALS) || keyprocp(KEY_PLUS_PAD))
				{
					cs = (cs+1) % 12;
				}
				else if(keyprocp(KEY_MINUS) || keyprocp(KEY_MINUS_PAD))
				{
					if(--cs < 0) cs = 11;
				}
				bool ki = !(iclk%60);
				
				if(SubEditorData[SED_LCLICKING])
				{
					int mx = DLGMouseX(data), my = DLGMouseY(data);
					tl = (tl - (tl % TL_PER_PAGE)) + Div(mx,16) + Div(my-8,16) * TL_PER_ROW;
				}
				if(Input->Press[CB_DOWN] || (ki && Input->Button[CB_DOWN]))
					tl += TL_PER_ROW;
				else if(Input->Press[CB_UP] || (ki && Input->Button[CB_UP]))
					tl -= TL_PER_ROW;
				else if(Input->Press[CB_RIGHT] || (ki && Input->Button[CB_RIGHT]))
					++tl;
				else if(Input->Press[CB_LEFT] || (ki && Input->Button[CB_LEFT]))
					--tl;
				else if(keyprocp(KEY_PGDN) || Input->Mouse[MOUSE_Z] < mz)
					tl += TL_PER_PAGE;
				else if(keyprocp(KEY_PGUP) || Input->Mouse[MOUSE_Z] > mz)
					tl -= TL_PER_PAGE;
				else if(keyprocp(KEY_P))
				{
					tl = jumpPage(tl);
				}
				mz = Input->Mouse[MOUSE_Z];
				if(Input->Press[CB_UP] || Input->Press[CB_DOWN] || Input->Press[CB_RIGHT] || Input->Press[CB_LEFT])
					iclk = 0;
				if(tl < 0) tl += NUM_TILES;
				else tl %= NUM_TILES;
				
				if(DefaultButtonP())
				{
					arr[0] = tl;
					arr[1] = cs;
					running = false;
				}
				//
				int pg = Div(tl, TL_PER_PAGE);
				int pgtl = pg*TL_PER_PAGE;
				//
				char32 title[128];
				sprintf(title, titlefmt, pg, Div(tl, E_TILE_PER_PAGE), tl, cs);
				if(title_bar(bit, 0, 8, title, data, "", false)==PROC_CANCEL || CancelButtonP())
				{
					running = false;
				}
				//
				blnk->Blit(0, bit, 0, 0, 256, 208, 0, 8, 256, 208, 0, 0, 0, BITDX_NORMAL, 0, false);
				for(int q = 0; q < TL_PER_PAGE && q+pgtl < MAX_TILE; ++q)
				{
					unless(Graphics->IsBlankTile[q+pgtl])
						bit->DrawTile(0, (q % TL_PER_ROW) * 16, 8 + Div(q, TL_PER_ROW) * 16, pgtl+q, 1, 1, cs, -1, -1, 0, 0, 0, 0, false, OP_OPAQUE);
				}
				/*unless(pgtl + TL_PER_PAGE > MAX_TILE)
					bit->DrawTile(7, 0, 8, pgtl, TL_PER_ROW, TL_PER_COL, cs, -1, -1, 0, 0, 0, 0, false, OP_OPAQUE);
				else //Last page can't fit all the tiles
				{
					bit->Rectangle(7, 0, 8, 255, 224, PAL[COL_HIGHLIGHT], 1, 0, 0, 0, true, OP_OPAQUE);
					bit->DrawTile(7, 0, 8, pgtl, TL_PER_ROW, 3, cs, -1, -1, 0, 0, 0, 0, false, OP_OPAQUE);
					bit->DrawTile(7, 0, 8 + (3*16), pgtl + (3*TL_PER_ROW), 4, 1, cs, -1, -1, 0, 0, 0, 0, false, OP_OPAQUE);
				}*/
				//
				if(clk & 1100000b)
				{
					int pos = tl % TL_PER_PAGE;
					int x1 = (pos % TL_PER_ROW) * 16, y1 = 8 + Div(pos,TL_PER_ROW) * 16;
					bit->Rectangle(0, x1, y1, x1+15, y1+15, PAL[COL_CURSOR], 1, 0, 0, 0, false, OP_OPAQUE);
				}
				if(controls)
				{
					frame_rect(bit, 0, HEIGHT-49, WIDTH-1, HEIGHT-1, 1);
					text(bit, WIDTH/2, HEIGHT-46, TF_CENTERED,
					     "Controls:\nTab: Toggle Controls | P: Jump to Page\n"
					     "PGUP / PGDN and Mousewheel: Change Page\n"
					     "Dirs: Move Cursor | Click: Move Cursor\n"
					     "+/-: Change CSet | Enter: Confirm | ESC: Cancel"
					     , PAL[COL_TEXT_MAIN], 200);
				}
				//
				null_screen();
				draw_dlg(bit, data);
				KillButtons();
				subscr_Waitframe();
			}
			for(int q = 0; q < DIA_CLOSING_DELAY; ++q) //Delay on closing
			{
				null_screen();
				draw_dlg(bit, data);
				KillButtons();
				subscr_Waitframe();
			}
			
			bit->Free();
			gen_final();
		} //end
		
		int jumpPage(int cur_tl) //start
		{
			gen_startup();
			//start setup
			DEFINE MARGIN_WIDTH = 1
			     , WIDTH = 162
				 , TXTWID = WIDTH - ((MARGIN_WIDTH+1)*2)
				 , BAR_HEIGHT = 11
			     , HEIGHT = BAR_HEIGHT+47
				 , FRAME_X = MARGIN_WIDTH+2
				 , FRAME_Y = MARGIN_WIDTH+BAR_HEIGHT+2
				 ;
			DEFINE BUTTON_WIDTH = GEN_BUTTON_WIDTH, BUTTON_HEIGHT = GEN_BUTTON_HEIGHT;
			bitmap bit = create(WIDTH, HEIGHT);
			bit->ClearToColor(0, PAL[COL_NULL]);
			
			untyped data[DLG_DATA_SZ];
			data[DLG_DATA_WID] = WIDTH;
			data[DLG_DATA_HEI] = HEIGHT;
			//
			null_screen();
			draw_dlg(bit, data);
			KillButtons();
			Waitframe();
			//
			center_dlg(bit, data);
			
			bool running = true;
			//end
			untyped proc_data[2];
			bool engine_page = false;
			char32 pgbuf[16] = "0";
			DEFINE MAX_PAGE = Div(MAX_TILE, TL_PER_PAGE);
			DEFINE MAX_E_PAGE = Div(MAX_TILE, E_TILE_PER_PAGE);
			while(running)
			{
				bit->ClearToColor(0, PAL[COL_NULL]);
				//Deco
				frame_rect(bit, 0, 0, WIDTH-1, HEIGHT-1, MARGIN_WIDTH);
				//Func
				if(title_bar(bit, 0, BAR_HEIGHT, "Jump to Page", data, "")==PROC_CANCEL || CancelButtonP())
				{
					running = false;
				}
				//
				char32 buf[] = "Engine Page Number";
				switch(titled_checkbox(bit, FRAME_X, FRAME_Y, 7, engine_page, data, 0, buf))
				{
					case PROC_UPDATED_FALSE:
						engine_page = false;
						break;
					case PROC_UPDATED_TRUE:
						engine_page = true;
						break;
				}
				//
				char32 buf1[] = "Page:";
				titled_inc_text_field(bit, FRAME_X+3+Text->StringWidth(buf1, DIA_FONT), FRAME_Y+12, 28, pgbuf, 3, false, data, 0, 0, 0, engine_page ? MAX_E_PAGE : MAX_PAGE, buf1);
				//
				if(PROC_CONFIRM==button(bit, FRAME_X+BUTTON_WIDTH+3, HEIGHT-(MARGIN_WIDTH+2)-BUTTON_HEIGHT, BUTTON_WIDTH, BUTTON_HEIGHT, "Cancel", data, proc_data, 0))
				{
					running = false;
				}
				if(PROC_CONFIRM==button(bit, FRAME_X, HEIGHT-(MARGIN_WIDTH+2)-BUTTON_HEIGHT, BUTTON_WIDTH, BUTTON_HEIGHT, "Confirm", data, proc_data, 1, FLAG_DEFAULT))
				{
					running = false;
					int pg = atoi(pgbuf);
					if(engine_page)
					{
						int etl = pg*E_TILE_PER_PAGE;
						cur_tl = (cur_tl % TL_PER_PAGE) + (etl - (etl % TL_PER_PAGE));
					}
					else
					{
						cur_tl = (cur_tl % TL_PER_PAGE) + (pg*TL_PER_PAGE);
					}
					if(cur_tl > MAX_TILE)
						cur_tl = MAX_TILE;
				}
				
				
				//
				null_screen();
				draw_dlg(bit, data);
				KillButtons();
				subscr_Waitframe();
			}
			for(int q = 0; q < DIA_CLOSING_DELAY; ++q) //Delay on closing
			{
				null_screen();
				draw_dlg(bit, data);
				KillButtons();
				subscr_Waitframe();
			}
			
			bit->Free();
			gen_final();
			return cur_tl;
		} //end
		//end Select Tile
		//start YesNo
		ProcRet yesno_dlg(char32 msg)
		{
			return yesno_dlg("", msg, "%Yes", "%No");
		}
		ProcRet yesno_dlg(char32 title, char32 msg)
		{
			return yesno_dlg(title, msg, "", "%Yes", "%No");
		}
		ProcRet yesno_dlg(char32 title, char32 msg, char32 descstr)
		{
			return yesno_dlg(title, msg, descstr, "%Yes", "%No");
		}
		ProcRet yesno_dlg(char32 title, char32 msg, char32 yestxt, char32 notxt)
		{
			return yesno_dlg(title, msg, "", yestxt, notxt);
		}
		ProcRet yesno_dlg(char32 title, char32 msg, char32 descstr, char32 yestxt, char32 notxt)
		{
			gen_startup();
			//start setup
			DEFINE MARGIN_WIDTH = 1
			     , WIDTH = 162
				 , TXTWID = WIDTH - ((MARGIN_WIDTH+1)*2)
				 , NUM_ROWS_TEXT = DrawStringsCount(DIA_FONT, msg, TXTWID)
				 , BAR_HEIGHT = 11
			     , HEIGHT = BAR_HEIGHT+10+(Text->FontHeight(DIA_FONT)*1.5*NUM_ROWS_TEXT)+5+3+2
				 , FRAME_X = MARGIN_WIDTH+2
				 , FRAME_Y = MARGIN_WIDTH+BAR_HEIGHT+2
				 ;
			bitmap bit = create(WIDTH, HEIGHT);
			bit->ClearToColor(0, PAL[COL_NULL]);
			
			untyped data[DLG_DATA_SZ];
			data[DLG_DATA_WID] = WIDTH;
			data[DLG_DATA_HEI] = HEIGHT;
			//
			null_screen();
			draw_dlg(bit, data);
			KillButtons();
			Waitframe();
			//
			center_dlg(bit, data);
			
			ProcRet ret = PROC_NULL;
			//end
			untyped proc_data[2];
			until(ret)
			{
				bit->ClearToColor(0, PAL[COL_NULL]);
				//Deco
				frame_rect(bit, 0, 0, WIDTH-1, HEIGHT-1, MARGIN_WIDTH);
				//Func
				if(title_bar(bit, MARGIN_WIDTH, BAR_HEIGHT, title, data, descstr)==PROC_CANCEL || CancelButtonP())
				{
					ret = PROC_CANCEL;
				}
				
				text(bit, WIDTH/2, BAR_HEIGHT + 5, TF_CENTERED, msg, PAL[COL_TEXT_MAIN], TXTWID);
				
				DEFINE BUTTON_WIDTH = GEN_BUTTON_WIDTH, BUTTON_HEIGHT = GEN_BUTTON_HEIGHT;
				if(PROC_CONFIRM==button(bit, (WIDTH/2)-6-BUTTON_WIDTH, HEIGHT-BUTTON_HEIGHT-3, BUTTON_WIDTH, BUTTON_HEIGHT, yestxt, data, proc_data, 0, FLAG_DEFAULT))
				{
					ret = PROC_CONFIRM;
				}
				if(PROC_CONFIRM==button(bit, (WIDTH/2)+6, HEIGHT-BUTTON_HEIGHT-3, BUTTON_WIDTH, BUTTON_HEIGHT, notxt, data, proc_data, 1))
				{
					ret = PROC_DENY;
				}
				
				//
				null_screen();
				draw_dlg(bit, data);
				KillButtons();
				subscr_Waitframe();
			}
			for(int q = 0; q < DIA_CLOSING_DELAY; ++q) //Delay on closing
			{
				null_screen();
				draw_dlg(bit, data);
				KillButtons();
				subscr_Waitframe();
			}
			
			bit->Free();
			gen_final();
			return ret;
		}
		//end 
		//start msg_dlg
		void msg_dlg(char32 msg)
		{
			msg_dlg("", msg, "", "O%k");
		}
		void msg_dlg(char32 title, char32 msg)
		{
			msg_dlg(title, msg, "", "O%k");
		}
		void msg_dlg(char32 title, char32 msg, char32 descstr)
		{
			msg_dlg(title, msg, descstr, "O%k");
		}
		void msg_dlg(char32 title, char32 msg, char32 descstr, char32 oktxt) //start
		{
			gen_startup();
			
			//start setup
			DEFINE MARGIN_WIDTH = 1
			     , WIDTH = 162
				 , TXTWID = WIDTH - ((MARGIN_WIDTH+1)*2)
				 , NUM_ROWS_TEXT = DrawStringsCount(DIA_FONT, msg, TXTWID)
				 , BAR_HEIGHT = 11
			     , HEIGHT = BAR_HEIGHT+10+(Text->FontHeight(DIA_FONT)*1.5*NUM_ROWS_TEXT)+5+3+2
				 , FRAME_X = MARGIN_WIDTH+2
				 , FRAME_Y = MARGIN_WIDTH+BAR_HEIGHT+2
				 ;
			bitmap bit = create(WIDTH, HEIGHT);
			bit->ClearToColor(0, PAL[COL_NULL]);
			
			untyped data[DLG_DATA_SZ];
			data[DLG_DATA_WID] = WIDTH;
			data[DLG_DATA_HEI] = HEIGHT;
			//
			null_screen();
			draw_dlg(bit, data);
			KillButtons();
			Waitframe();
			//
			center_dlg(bit, data);
			
			bool running = true;
			//end
			untyped proc_data[1];
			while(running)
			{
				bit->ClearToColor(0, PAL[COL_NULL]);
				//Deco
				frame_rect(bit, 0, 0, WIDTH-1, HEIGHT-1, MARGIN_WIDTH);
				//Func
				if(title_bar(bit, MARGIN_WIDTH, BAR_HEIGHT, title, data, descstr)==PROC_CANCEL || CancelButtonP())
					running = false;
				
				text(bit, WIDTH/2, BAR_HEIGHT + 5, TF_CENTERED, msg, PAL[COL_TEXT_MAIN], TXTWID);
				
				DEFINE BUTTON_WIDTH = GEN_BUTTON_WIDTH, BUTTON_HEIGHT = GEN_BUTTON_HEIGHT;
				if(PROC_CONFIRM==button(bit, (WIDTH/2)-(BUTTON_WIDTH/2), HEIGHT-BUTTON_HEIGHT-3, BUTTON_WIDTH, BUTTON_HEIGHT, oktxt, data, proc_data, 0, FLAG_DEFAULT))
				{
					running = false;
				}
				
				//
				null_screen();
				draw_dlg(bit, data);
				KillButtons();
				subscr_Waitframe();
			}
			for(int q = 0; q < DIA_CLOSING_DELAY; ++q) //Delay on closing
			{
				null_screen();
				draw_dlg(bit, data);
				KillButtons();
				subscr_Waitframe();
			}
			
			bit->Write(0, "_DIALOGUE.png", true);
			
			bit->Free();
			gen_final();
		} //end
		void err_dlg(char32 msg)
		{
			msg_dlg("Error", msg, "Something went wrong; maybe a file wasn't found, or an internal error occurred.");
		}
		//end
		//start Dropdown
		int dropdown_open(bitmap parentBit, const int x, int y, const int WIDTH, int selIndx, untyped parentDLGData, char32 strings, int NUM_OPTS, int NUM_VIS_OPTS)
		{
			DEFINE BKUP_INDX = selIndx;
			/* Notes:
			parentBit is not actually `bit`, but needs to be a new sub-bitmap (same size as `bit`). 
			`fullblit(0, sub, bit)` should be called before `ClearToColor`, so the sub stores the last frame's draw. (in the dlg that calls this)
			Also, a proc needs to call this. The proc handles the part that's always visible, this func only handles the list itself after opening.
			/
			strings is char32[][]; an array of char32[] pointers. Each index is a full string!
			/
			Make a subbitmap for the procs to draw to. Blit a portion of that (based on scroll) to the main bitmap of the dlg.
			Scroll: No bar, just buttons; a button for up/down, and top/bottom. Buttons should take the entire bar space.
			*/
			//start setup
			gen_startup();
			DEFINE MARGIN_WIDTH = 0;
			DEFINE TXT_VSPACE = 2;
			DEFINE UNIT_HEIGHT = TXT_VSPACE + Text->FontHeight(DIA_FONT);
			DEFINE NUM_OPTS_FLIP = 8;
			if(NUM_VIS_OPTS < 0) //Fit-to-screen
			{
				NUM_VIS_OPTS = Min(Div(224 - (2*MARGIN_WIDTH) - y, UNIT_HEIGHT), NUM_OPTS);
				if(NUM_VIS_OPTS < NUM_OPTS_FLIP && NUM_VIS_OPTS < NUM_OPTS)
				{
					y -= UNIT_HEIGHT*(NUM_OPTS_FLIP+1)+1;
					NUM_VIS_OPTS = NUM_OPTS_FLIP;
				}
			}
			else if(y+(UNIT_HEIGHT * Min(NUM_VIS_OPTS, NUM_OPTS_FLIP))>224)
			{
				NUM_VIS_OPTS = Min(Div(224 - (2*MARGIN_WIDTH) - y, UNIT_HEIGHT), NUM_OPTS);
				if(NUM_VIS_OPTS < NUM_OPTS_FLIP && NUM_VIS_OPTS < NUM_OPTS)
				{
					NUM_VIS_OPTS = Min(NUM_OPTS_FLIP, NUM_OPTS);
					y -= UNIT_HEIGHT*(NUM_VIS_OPTS+1)+1;
				}
			}
			NUM_VIS_OPTS = Min(NUM_VIS_OPTS, NUM_OPTS);
			const bool DO_BUTTONS = NUM_VIS_OPTS < NUM_OPTS;
			DEFINE MAX_SCROLL_INDX = NUM_OPTS-NUM_VIS_OPTS;
			DEFINE TXT_X = MARGIN_WIDTH+2;
			DEFINE BTN_WIDTH = DO_BUTTONS ? 10 : 0;
			DEFINE BMP_WIDTH = WIDTH - BTN_WIDTH;
			DEFINE BTN_X = BMP_WIDTH;
			DEFINE HEIGHT = Max((MARGIN_WIDTH * 2) + (UNIT_HEIGHT*NUM_VIS_OPTS)-1, DO_BUTTONS ? BTN_WIDTH*4 : 0);
			DEFINE BMP_HEIGHT = (MARGIN_WIDTH * 2) + (UNIT_HEIGHT*NUM_OPTS);
			DEFINE BTN_HEIGHT = HEIGHT/4;
			int scrollIndx = Min(selIndx, MAX_SCROLL_INDX);
			bitmap bit = create(WIDTH, HEIGHT),
			       listbit = create(BMP_WIDTH, BMP_HEIGHT);
			bit->ClearToColor(0, PAL[COL_NULL]);
			listbit->ClearToColor(0, PAL[COL_NULL]);
			
			untyped data[DLG_DATA_SZ];
			data[DLG_DATA_WID] = WIDTH;
			data[DLG_DATA_HEI] = HEIGHT;
			data[DLG_DATA_XOFFS] = x + parentDLGData[DLG_DATA_XOFFS];
			data[DLG_DATA_YOFFS] = y + parentDLGData[DLG_DATA_YOFFS];
			untyped ldata[DLG_DATA_SZ];
			ldata[DLG_DATA_WID] = BMP_WIDTH;
			ldata[DLG_DATA_HEI] = BMP_HEIGHT;
			ldata[DLG_DATA_XOFFS] = data[DLG_DATA_XOFFS];
			ldata[DLG_DATA_YOFFS] = data[DLG_DATA_YOFFS] - (scrollIndx*UNIT_HEIGHT);
			//
			null_screen();
			draw_dlg(parentBit, parentDLGData);
			KillButtons();
			Waitframe(); //NOT subscr_Waitframe.
			//
			bool running = true;
			//end
			untyped proc_data[4];
			bool was_clicking;
			while(running)
			{
				bit->Clear(0);
				listbit->Clear(0);
				ldata[DLG_DATA_YOFFS] = data[DLG_DATA_YOFFS] - (scrollIndx*UNIT_HEIGHT); //update to current scroll
				frame_rect(bit, 0, 0, WIDTH-1, HEIGHT-1, 1, PAL[COL_FIELD_BG]);
				//h_rect(bit, 0, 0, WIDTH-1, HEIGHT-1, PAL[COL_BODY_MAIN_DARK]);
				bool isHoveringList = DLGCursorBox(0, 0, BMP_WIDTH-1, HEIGHT-1, data);
				int cy = DLGMouseY(ldata);
				//List options
				{
					int ty = MARGIN_WIDTH + 2;
					for(int q = 0; q < NUM_OPTS; ++q)
					{
						int num_buf[12];
						itoa(num_buf, q+1);
						if(q==selIndx) rect(listbit, 0, ty-2, 0+BMP_WIDTH-1, ty+UNIT_HEIGHT-2, PAL[COL_HIGHLIGHT]);
						text(listbit, TXT_X, ty, TF_NORMAL, strings ? strings[q] : num_buf, PAL[COL_TEXT_FIELD]);
						ty += Text->FontHeight(DIA_FONT) + TXT_VSPACE;
					}
				}
				//Directionals
				{
					if(keyprocp(KEY_UP))
					{
						selIndx = Max(selIndx-1, 0);
						scrollIndx = VBound(scrollIndx, Min(MAX_SCROLL_INDX, selIndx), Max(0, selIndx-NUM_VIS_OPTS+1));
					}	
					else if(keyprocp(KEY_DOWN))
					{
						selIndx = Min(selIndx+1, NUM_OPTS-1);
						scrollIndx = VBound(scrollIndx, Min(MAX_SCROLL_INDX, selIndx), Max(0, selIndx-NUM_VIS_OPTS+1));
					}
				}
				//Buttons
				if(DO_BUTTONS)
				{
					int by = 0;
					if(PROC_CONFIRM==button(bit, BTN_X, by, BTN_WIDTH, BTN_HEIGHT, "", data, proc_data, 0, (scrollIndx <= 0) ? FLAG_DISABLE : 0))
					{
						scrollIndx = 0;
					}
					line(bit, BTN_X + 2, by + (BTN_HEIGHT/2)-1, (BTN_X + BTN_WIDTH/2)-1, by+2, (scrollIndx <=0) ? PAL[COL_DISABLED] : PAL[COL_TEXT_MAIN]);
					line(bit, BTN_X + BTN_WIDTH - 2 - 1, by + (BTN_HEIGHT/2)-1, (BTN_X + BTN_WIDTH/2), by+2, (scrollIndx <=0) ? PAL[COL_DISABLED] : PAL[COL_TEXT_MAIN]);
					line(bit, BTN_X + 2, by + BTN_HEIGHT - 2 - 1, (BTN_X + BTN_WIDTH/2)-1, by + (BTN_HEIGHT/2), (scrollIndx <=0) ? PAL[COL_DISABLED] : PAL[COL_TEXT_MAIN]);
					line(bit, BTN_X + BTN_WIDTH - 2 - 1, by + BTN_HEIGHT - 2 - 1, (BTN_X + BTN_WIDTH/2), by + (BTN_HEIGHT/2), (scrollIndx <=0) ? PAL[COL_DISABLED] : PAL[COL_TEXT_MAIN]);
					by += BTN_HEIGHT;
					if(PROC_CONFIRM==button(bit, BTN_X, by, BTN_WIDTH, BTN_HEIGHT, "", data, proc_data, 1, (scrollIndx <= 0) ? FLAG_DISABLE : 0))
					{
						scrollIndx = Max(scrollIndx-1, 0);
					}
					line(bit, BTN_X + 2, by + (BTN_HEIGHT/2)-1, (BTN_X + BTN_WIDTH/2)-1, by+2, (scrollIndx <=0) ? PAL[COL_DISABLED] : PAL[COL_TEXT_MAIN]);
					line(bit, BTN_X + BTN_WIDTH - 2 - 1, by + (BTN_HEIGHT/2)-1, (BTN_X + BTN_WIDTH/2), by+2, (scrollIndx <=0) ? PAL[COL_DISABLED] : PAL[COL_TEXT_MAIN]);
					by += BTN_HEIGHT;
					if(PROC_CONFIRM==button(bit, BTN_X, by, BTN_WIDTH, BTN_HEIGHT, "", data, proc_data, 2, (scrollIndx >= MAX_SCROLL_INDX) ? FLAG_DISABLE : 0))
					{
						scrollIndx = Min(scrollIndx+1, MAX_SCROLL_INDX);
					}
					line(bit, BTN_X + 2, by + 5, (BTN_X + BTN_WIDTH/2)-1, by+(BTN_HEIGHT/2)+2, (scrollIndx >= MAX_SCROLL_INDX) ? PAL[COL_DISABLED] : PAL[COL_TEXT_MAIN]);
					line(bit, BTN_X + BTN_WIDTH - 2 - 1, by + 5, (BTN_X + BTN_WIDTH/2), by+(BTN_HEIGHT/2)+2, (scrollIndx >= MAX_SCROLL_INDX) ? PAL[COL_DISABLED] : PAL[COL_TEXT_MAIN]);
					by += BTN_HEIGHT;
					if(PROC_CONFIRM==button(bit, BTN_X, by, BTN_WIDTH, BTN_HEIGHT, "", data, proc_data, 3, (scrollIndx >= MAX_SCROLL_INDX) ? FLAG_DISABLE : 0))
					{
						scrollIndx = MAX_SCROLL_INDX;
					}
					line(bit, BTN_X + 2, by + 2, (BTN_X + BTN_WIDTH/2)-1, by+(BTN_HEIGHT/2)-1, (scrollIndx >= MAX_SCROLL_INDX) ? PAL[COL_DISABLED] : PAL[COL_TEXT_MAIN]);
					line(bit, BTN_X + BTN_WIDTH - 2 - 1, by + 2, (BTN_X + BTN_WIDTH/2), by+(BTN_HEIGHT/2)-1, (scrollIndx >= MAX_SCROLL_INDX) ? PAL[COL_DISABLED] : PAL[COL_TEXT_MAIN]);
					line(bit, BTN_X + 2, by + (BTN_HEIGHT/2), (BTN_X + BTN_WIDTH/2)-1, by + BTN_HEIGHT - 2 - 1, (scrollIndx >= MAX_SCROLL_INDX) ? PAL[COL_DISABLED] : PAL[COL_TEXT_MAIN]);
					line(bit, BTN_X + BTN_WIDTH - 2 - 1, by + (BTN_HEIGHT/2), (BTN_X + BTN_WIDTH/2), by + BTN_HEIGHT - 2 - 1, (scrollIndx >= MAX_SCROLL_INDX) ? PAL[COL_DISABLED] : PAL[COL_TEXT_MAIN]);
				}
				
				if(isHoveringList)
				{
					if(SubEditorData[SED_LCLICKING])
					{
						was_clicking = true;
						selIndx = VBound(Div(cy-MARGIN_WIDTH, UNIT_HEIGHT), NUM_OPTS, 0); //Select clicked option
					}
					else if(was_clicking)
					{
						running = false;
					}
				}
				else
				{
					was_clicking = false;
					if(SubEditorData[SED_LCLICKED] && !DLGCursorBox(0, 0, WIDTH-1, HEIGHT-1, data))
					{
						selIndx = BKUP_INDX;
						running = false;
					}
				}
				if(DefaultButtonP())
				{
					running = false;
				}
				if(CancelButtonP())
				{
					selIndx = BKUP_INDX;
					running = false;
				}
				
				listbit->Blit(7, bit, 0, MARGIN_WIDTH+(scrollIndx*UNIT_HEIGHT)+1, BMP_WIDTH, HEIGHT-(MARGIN_WIDTH*2), 0, MARGIN_WIDTH, BMP_WIDTH, HEIGHT-(MARGIN_WIDTH*2), 0, 0, 0, 0, 0, true);
				null_screen();
				draw_dlg(parentBit, parentDLGData);
				draw_dlg(bit, data);
				if(keyprocp(KEY_R))
				{
					bitmap out = create(parentDLGData[DLG_DATA_WID], parentDLGData[DLG_DATA_HEI]);
					out->ClearToColor(0, PAL[COL_NULL]);
					moveblit(7, out, parentBit, parentDLGData[DLG_DATA_WID], parentDLGData[DLG_DATA_HEI]);
					bit->Blit(7, out, 0, 0, WIDTH-1, HEIGHT-1, data[DLG_DATA_XOFFS] - parentDLGData[DLG_DATA_XOFFS], data[DLG_DATA_YOFFS] - parentDLGData[DLG_DATA_YOFFS], WIDTH-1, HEIGHT-1, 0, 0, 0, 0, 0, true);
					out->Free();
				}
				KillButtons();
				subscr_Waitframe();
			}
			
			listbit->Free();
			bit->Free();
			
			gen_final();
			return selIndx;
		} //end
		//Other
		//start Spacing
		DEFINE CENTER_VIS_X = 256/2;
		DEFINE CENTER_VIS_Y = (224/2)-56;
		void center_dlg(bitmap bit, untyped dlgdata)
		{
			dlgdata[DLG_DATA_XOFFS] = CENTER_VIS_X - (dlgdata[DLG_DATA_WID]/2);
			dlgdata[DLG_DATA_YOFFS] = CENTER_VIS_Y - (dlgdata[DLG_DATA_HEI]/2);
			/*Trace(dlgdata[DLG_DATA_XOFFS]);
			Trace(dlgdata[DLG_DATA_YOFFS]);*/
		}
		//end
		//start Drawing
		void null_screen()
		{
			Screen->Rectangle(7, 0, -56, 256, 176, PAL[COL_NULL], 1, 0, 0, 0, true, OP_OPAQUE); //Blank the screen
		}
		
		void draw_dlg(bitmap bit, untyped dlgdata)
		{
			bit->Blit(7, RT_SCREEN, 0, 0, dlgdata[DLG_DATA_WID], dlgdata[DLG_DATA_HEI], dlgdata[DLG_DATA_XOFFS], dlgdata[DLG_DATA_YOFFS]
			        , dlgdata[DLG_DATA_WID], dlgdata[DLG_DATA_HEI], 0, 0, 0, 0, 0, true);
		}
		//end
		//start Misc
		enum ProcRet
		{
			PROC_NULL,
			PROC_CANCEL,
			PROC_CONFIRM,
			PROC_DENY,
			PROC_UPDATED_TRUE,
			PROC_UPDATED_FALSE
		};
		
		void get_module_name(char32 buf, int moduleType) //start
		{
			switch(moduleType)
			{
				case MODULE_TYPE_SETTINGS:
				{
					strcat(buf, "Settings"); break;
				}
				case MODULE_TYPE_BGCOLOR:
				{
					strcat(buf, "Background Color"); break;
				}
				case MODULE_TYPE_SELECTABLE_ITEM_ID:
				{
					strcat(buf, "Selectable Item (ID)"); break;
				}
				case MODULE_TYPE_SELECTABLE_ITEM_CLASS:
				{
					strcat(buf, "Selectable Item (Type)"); break;
				}
				case MODULE_TYPE_ABUTTONITEM:
				{
					strcat(buf, "A Item"); break;
				}
				case MODULE_TYPE_BBUTTONITEM:
				{
					strcat(buf, "B Item"); break;
				}
				case MODULE_TYPE_PASSIVESUBSCREEN:
				{
					strcat(buf, "Passive Subscreen"); break;
				}
				case MODULE_TYPE_MINIMAP:
				{
					strcat(buf, "Minimap"); break;
				}
				case MODULE_TYPE_TILEBLOCK:
				{
					strcat(buf, "Tile Block"); break;
				}
				case MODULE_TYPE_HEART:
				{
					strcat(buf, "Heart"); break;
				}
				case MODULE_TYPE_HEARTROW:
				{
					strcat(buf, "Heart Row"); break;
				}
				case MODULE_TYPE_HEARTROW:
				{
					strcat(buf, "Counter"); break;
				}
			}
		} //end
		
		void get_module_desc(char32 buf, int moduleType) //start
		{
			switch(moduleType)
			{
				case MODULE_TYPE_SETTINGS:
				{
					strcat(buf, ""); break;
				}
				case MODULE_TYPE_BGCOLOR:
				{
					strcat(buf, "The background color of the subscreeen."); break;
				}
				case MODULE_TYPE_SELECTABLE_ITEM_ID:
				{
					strcat(buf, "A selectable object representing a specific item ID.\n\nSelectable objects have an 'Index' value. They also have 4 'Direction' values. Setting these direction values to the 'Index' of another selectable indicates where to select when a direction is pressed."); break;
				}
				case MODULE_TYPE_SELECTABLE_ITEM_CLASS:
				{
					strcat(buf, "A selectable object representing the highest item in the inventory of a specific item class.\n\nSelectable objects have an 'Index' value. They also have 4 'Direction' values. Setting these direction values to the 'Index' of another selectable indicates where to select when a direction is pressed."); break;
				}
				case MODULE_TYPE_ABUTTONITEM:
				{
					strcat(buf, "Displays the currently equipped A-Button item."); break;
				}
				case MODULE_TYPE_BBUTTONITEM:
				{
					strcat(buf, "Displays the currently equipped B-Button item."); break;
				}
				case MODULE_TYPE_PASSIVESUBSCREEN:
				{
					strcat(buf, "This module will draw the current scripted passive subscreen to the active subscreen.\n\nNote that this does NOT include the engine subscreen graphics."); break;
				}
				case MODULE_TYPE_MINIMAP:
				{
					strcat(buf, "Displays the minimap of the current DMap, with various settings."); break;
				}
				case MODULE_TYPE_TILEBLOCK:
				{
					strcat(buf, "Draws a block of tiles to the screen."); break;
				}
				case MODULE_TYPE_HEART:
				{
					strcat(buf, "A single heart container."); break;
				}
				case MODULE_TYPE_HEARTROW:
				{
					strcat(buf, "A row of heart containers."); break;
				}
			
				case MODULE_TYPE_COUNTER:
				{
					strcat(buf, "Displays the value of a counter."); break;
				}
			}
		} //end
		
		void get_flag_name(char32 buf, bool active, int flag) //start
		{
			if(active)
			{
				switch(flag)
				{
					case FLAG_ASTTNG_ITEMS_USE_HITBOX_FOR_SELECTOR:
					{
						strcat(buf, "Items Use Hitbox Size"); break;
					}
					default: strcat(buf, "--"); break;
				}
			}
			else
			{
				switch(flag)
				{
					default: strcat(buf, "--"); break;
				}
			}
		} //end
		
		void get_flag_desc(char32 buf, bool active, int flag) //start
		{
			if(active)
			{
				switch(flag)
				{
					case FLAG_ASTTNG_ITEMS_USE_HITBOX_FOR_SELECTOR:
					{
						strcat(buf, "The highlight around items, both in the editor and when selecting them in-game, are based on 'Hit' size if this is on, or 'Draw' size otherwise."); break;
					}
					default: break;
				}
			}
			else
			{
				switch(flag)
				{
					default: break;
				}
			}
		} //end
		
		bool DLGCursorBox(int x, int y, int x2, int y2, untyped dlgdata) //Automatically handle dlg offsets when reading the cursor's position
		{
			return CursorBox(x, y, x2, y2, -dlgdata[DLG_DATA_XOFFS], -dlgdata[DLG_DATA_YOFFS]);
		}
		
		int DLGMouseX(untyped dlgdata)
		{
			return Input->Mouse[MOUSE_X] - dlgdata[DLG_DATA_XOFFS];
		}
		
		int DLGMouseY(untyped dlgdata)
		{
			return Input->Mouse[MOUSE_Y] - dlgdata[DLG_DATA_YOFFS];
		}
		
		bool isHovering(untyped dlgdata)
		{
			return DLGCursorBox(0, 0, dlgdata[DLG_DATA_WID]-1, dlgdata[DLG_DATA_HEI]-1, dlgdata);
		}

		void grabType(char32 buf, int maxchar, TypeAString::TMode tm)
		{
			using namespace TypeAString;
			startTypingMode(maxchar, tm);
			addStr(buf);
			remchr(buf, 0);
			handleTyping();
			getType(buf);
			endTypingMode();
		}
		
		int _strchr(char32 str, int pos, char32 chr)
		{	//Find the first NON-ESCAPED instance of a character
			int ret = strchr(str, pos, chr);
			until(ret<0 || (ret==0 || str[ret-1]!='\\'))
				ret = strchr(str, ret+1, chr);
			return ret;
		} //end 
	}
}
