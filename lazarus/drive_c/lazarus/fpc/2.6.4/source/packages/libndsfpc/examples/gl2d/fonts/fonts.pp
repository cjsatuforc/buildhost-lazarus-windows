(*
  Easy GL2D
  Relminator 2011 
  Richard Eric M. Lope BSN RN
  Http://Rel.Phatcode.Net
  A very small, simple, yet very fast DS 2D rendering lib using the DS' 3D core.
  --
  Translated in Object Pascal by Francesco Lombardi - 2012
  http://itaprogaming.free.fr
*)
program fonts;

{$L build/font_si.o}
{$L build/font_16x16.o}

{$mode objfpc}
{$H+}

uses
  ctypes, nds9, gl2d, uvcoord_font_si, uvcoord_font_16x16;

const
  font_16x16BitmapLen = 32768;
  font_siBitmapLen = 8192;
  font_siPalLen = 512;

var 
  font_siBitmap: array [0..0] of cuint; cvar; external;
  font_16x16Bitmap: array [0..0] of cuint; cvar; external;
  font_siPal: array [0..0] of cushort; cvar; external;


type
  // Our font class
  Tglfont = class 
  private
    font_sprite: pglimage;
    str: array [1..256] of cchar;
    str2: array [1..256] of cchar;
  public
    function Load(_font_sprite: pglImage; const numframes: cuint; texcoords: pcuint;
                  _type: GL_TEXTURE_TYPE_ENUM; sizeX, sizeY, param, pallette_width: cint;
                  const palette: pcuint16; const texture: pcuint8): cint;
    procedure Print(x, y: integer; const text: pchar); overload;
    procedure Print(x, y: integer; value: cint); overload;
    procedure PrintCentered(x, y: integer; const text: pchar); overload;
    procedure PrintCentered(x, y: integer; value: cint); overload;
  end;


function TglFont.Load(_font_sprite: pglImage; const numframes: cuint; texcoords: pcuint;
                  _type: GL_TEXTURE_TYPE_ENUM; sizeX, sizeY, param, pallette_width: cint;
                  const palette: pcuint16; const texture: pcuint8): cint;
var
  textureID: cint;
begin
  font_sprite := _font_sprite;
  textureID := glLoadSpriteSet(font_sprite,
                                numframes, 
                                texcoords,
                                _type,
                                sizeX,
                                sizeY,
                                param,
                                pallette_width,
                                palette,
                                texture );
  result := textureID;
end;

procedure TglFont.Print(x, y: integer; const text: pchar);
var
  font_char: cuchar;
  i: integer;
begin
  for i := 0 to length(Text) do
  begin
    font_char := Ord(text[i]) - 32;
    glSprite( x, y, GL_FLIP_NONE, @font_sprite[font_char] );
    x := x + font_sprite[font_char].width; 
  end;
end;

procedure TglFont.Print(x, y: integer; value: cint);
begin
  sprintf(@str, '%i', value);
  Print(x, y, @str);
end;

procedure TglFont.PrintCentered(x, y: integer; const text: pchar); 
var
  font_char: cuchar;
  total_width: integer;
  o_text: pchar;
  i: integer;
begin
  total_width := 0;
  o_text := text;
  
  for i := 0 to length(Text) do
  begin
    font_char := Ord(text[i]) - 32;
    total_width := total_width + font_sprite[font_char].width; 
  end;
  
  x := (SCREEN_WIDTH - total_width) div 2; 
  
//  text := o_text;
  for i := 0 to length(o_Text) do
  begin
    font_char := Ord(o_text[i]) - 32;
    glSprite( x, y, GL_FLIP_NONE, @font_sprite[font_char] );
    x := x + font_sprite[font_char].width; 
  end;
  
end;

procedure TglFont.PrintCentered(x, y: integer; value: cint);
begin
  sprintf(@str, '%i', value);
  PrintCentered(x, y, @str);
end;

var
  // This imageset would use our texture packer generated coords so it's kinda
  // safe and easy to use 
  // FONT_SI_NUM_IMAGES is a value #defined from "uvcoord_font_si.h"
  FontImages: array [1..FONT_SI_NUM_IMAGES] of glImage;
  FontBigImages: array [1..FONT_16X16_NUM_IMAGES] of glimage;

  // Our fonts
  Font, FontBig: Tglfont;
  textureSize: cint;
  frame: integer;
  x: integer;
  opacity: integer;
  
  
begin
  defaultExceptionHandler();
  
  Font := TglFont.Create;
  FontBig := TglFont.Create;
  
  videoSetMode(MODE_5_3D);
  consoleDemoInit();
  // Initialize GL in 3d mode
  glScreen2D();
  
  // Set  Bank A to texture (128 kb)
  vramSetBankA( VRAM_A_TEXTURE );
  vramSetBankE(VRAM_E_TEX_PALETTE);  // Allocate VRAM bank for all the palettes
  
  // Load our font texture
  // We used glLoadSpriteSet since the texture was made
  // with my texture packer.
  // no need to save the return value since
  // we don't need  it at all
  Font.Load(@FontImages,        // pointer to glImage array
         FONT_SI_NUM_IMAGES,    // Texture packer auto-generated #define
         @font_si_texcoords,    // Texture packer auto-generated array
         GL_RGB256,       // texture type for glTexImage2D() in videoGL.h 
         TEXTURE_SIZE_64,     // sizeX for glTexImage2D() in videoGL.h
         TEXTURE_SIZE_128,    // sizeY for glTexImage2D() in videoGL.h
         GL_TEXTURE_WRAP_S or GL_TEXTURE_WRAP_T or TEXGEN_OFF or GL_TEXTURE_COLOR0_TRANSPARENT, // param for glTexImage2D() in videoGL.h
         256,           // Length of the palette (256 colors)
         @font_siPal,   // Palette Data
         @font_siBitmap   // image data generated by GRIT 
       );

  // Do the same with our bigger texture
  FontBig.Load(@FontBigImages,
         FONT_16X16_NUM_IMAGES, 
         @font_16x16_texcoords,
         GL_RGB256,
         TEXTURE_SIZE_64,
         TEXTURE_SIZE_512,
         GL_TEXTURE_WRAP_S or GL_TEXTURE_WRAP_T or TEXGEN_OFF or GL_TEXTURE_COLOR0_TRANSPARENT,
         256,
         @font_siPal,
         @font_16x16Bitmap   
       );


  
  
  iprintf(#$1b'[1;1HEasy GL2D Font Example');
  iprintf(#$1b'[3;1HFonts by Adigun A. Polack');
  
  iprintf(#$1b'[6;1HRelminator');
  iprintf(#$1b'[7;1HHttp://Rel.Phatcode.Net');
  
  // calculate the amount of 
  // memory uploaded to VRAM in KB
  TextureSize := font_siBitmapLen + font_16x16BitmapLen;
            
            
  iprintf(#$1b'[10;1HTotal Texture size= %i kb', TextureSize div 1024);
  
  // our ever present frame counter 
  frame := 0;
  
  
  while true do
  begin
    // increment frame counter and rotation offsets
  
    inc(frame);
  
    // set up GL2D for 2d mode
    glBegin2D();
      
      // fill the whole screen with a gradient box
      glBoxFilledGradient( 0, 0, 255, 191,
                 RGB15( 31,  0,  0 ),
                 RGB15(  0, 31,  0 ),
                 RGB15( 31,  0, 31 ),
                 RGB15(  0, 31, 31 )
                               );
      
      // Center print the title
      glColor( RGB15(0,0,0) );
      FontBig.PrintCentered( 0, 0, 'EASY GL2D' );
      glColor( RGB15((frame*6) and 31,(-frame*4) and 31, (frame*2) and 31) );
      FontBig.PrintCentered( 0, 20,  'FONT EXAMPLE');

      // Fixed-point sinusoidal movement
      x := ( sinLerp( frame * 400 ) * 30 ) shr 12;
     
      // Make the fonts sway left and right
      // Also change coloring of fonts
      glColor( RGB15(31,0,0) );
      FontBig.Print( 25 + x, 50, 'hfDEVKITPROfh' );
      glColor( RGB15(31,0,31) );
      glColor( RGB15(x, 31 - x, x * 2) );
      FontBig.Print( 50 - x, 70, 'dcLIBNDScd' );
      
      
      
      // change fontsets and  print some spam
      glColor( RGB15(0,31,31) );
      Font.PrintCentered( 0, 100, 'FONTS BY ADIGUN A. POLACK' );
      Font.PrintCentered( 0, 120, 'CODE BY RELMINATOR' );
      
      
      // Restore normal coloring
      glColor( RGB15(31,31,31) );
      
      // Change opacity relative to frame
      opacity := abs( sinLerp( frame * 245 ) * 30 ) shr 12;
      
      // translucent mode 
      // Add 1 to opacity since at 0 we will get into wireframe mode
      glPolyFmt(POLY_ALPHA(1 + opacity) or POLY_CULL_NONE or POLY_ID(1));
      FontBig.Print( 35 + x, 140, 'ANYA THERESE' );
      
      
      
      glPolyFmt(POLY_ALPHA(31) or POLY_CULL_NONE or POLY_ID(2));
      
      // Print the number of frames
      Font.Print( 10, 170, 'FRAMES = ');
      Font.Print( 10 + 72, 170, frame );
            
    glEnd2D();
    
    glFlush(0);

    swiWaitForVBlank();
    
  
  end;
  Font.free;
  FontBig.free;

end.

