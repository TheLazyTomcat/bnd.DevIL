unit DevILU;

{$INCLUDE '.\DevIL_defs.inc'}

interface

uses
  DevIL;

const
  ILU_UNICODE = {$IFDEF DevIL_Unicode}True{$ELSE}False{$ENDIF};

{===============================================================================
    Constants
===============================================================================}
const
  ILU_VERSION = 180;


  ILU_FILTER         = $2600;
  ILU_NEAREST        = $2601;
  ILU_LINEAR         = $2602;
  ILU_BILINEAR       = $2603;
  ILU_SCALE_BOX      = $2604;
  ILU_SCALE_TRIANGLE = $2605;
  ILU_SCALE_BELL     = $2606;
  ILU_SCALE_BSPLINE  = $2607;
  ILU_SCALE_LANCZOS3 = $2608;
  ILU_SCALE_MITCHELL = $2609;


  // Error types
  ILU_INVALID_ENUM      = $0501;
  ILU_OUT_OF_MEMORY     = $0502;
  ILU_INTERNAL_ERROR    = $0504;
  ILU_INVALID_VALUE     = $0505;
  ILU_ILLEGAL_OPERATION = $0506;
  ILU_INVALID_PARAM     = $0509;


  // Values
  ILU_PLACEMENT          = $0700;
  ILU_LOWER_LEFT         = $0701;
  ILU_LOWER_RIGHT        = $0702;
  ILU_UPPER_LEFT         = $0703;
  ILU_UPPER_RIGHT        = $0704;
  ILU_CENTER             = $0705;
  ILU_CONVOLUTION_MATRIX = $0710;

  ILU_VERSION_NUM = IL_VERSION_NUM;
  ILU_VENDOR      = IL_VENDOR;


  // Languages
  ILU_ENGLISH            = $0800;
  ILU_ARABIC             = $0801;
  ILU_DUTCH              = $0802;
  ILU_JAPANESE           = $0803;
  ILU_SPANISH            = $0804;
  ILU_GERMAN             = $0805;
  ILU_FRENCH             = $0806;
  ILU_ITALIAN            = $0807;


{
  Following constants are commented-out in the original header file too. They
  seem to be not used anywhere (maybe a relic from earlier version?).
}
  // Filters
(*
  ILU_FILTER_BLUR         = $0803;
  ILU_FILTER_GAUSSIAN_3x3 = $0804;
  ILU_FILTER_GAUSSIAN_5X5 = $0805;
  ILU_FILTER_EMBOSS1      = $0807;
  ILU_FILTER_EMBOSS2      = $0808;
  ILU_FILTER_LAPLACIAN1   = $080A;
  ILU_FILTER_LAPLACIAN2   = $080B;
  ILU_FILTER_LAPLACIAN3   = $080C;
  ILU_FILTER_LAPLACIAN4   = $080D;
  ILU_FILTER_SHARPEN1     = $080E;
  ILU_FILTER_SHARPEN2     = $080F;
  ILU_FILTER_SHARPEN3     = $0810;
*)

{===============================================================================
    Types
===============================================================================}
type
  ILinfo = record
    Id:         ILuint;     // the image's id
    Data:       ILubyte_p;  // the image's data
    Width:      ILuint;     // the image's width
    Height:     ILuint;     // the image's height
    Depth:      ILuint;     // the image's depth
    Bpp:        ILubyte;    // bytes per pixel (not bits) of the image
    SizeOfData: ILuint;     // the total size of the data (in bytes)
    Format:     ILenum;     // image format (in IL enum style)
    aType:      ILenum;     // image type (in IL enum style)
    Origin:     ILenum;     // origin of the image
    Palette:    ILubyte_p;  // the image's palette
    PalType:    ILenum;     // palette type
    PalSize:    ILuint;     // palette size
    CubeFlags:  ILenum;     // flags for what cube map sides are present
    NumNext:    ILuint;     // number of images following
    NumMips:    ILuint;     // number of mipmaps
    NumLayers:  ILuint;     // number of layers
  end;
  ILinfo_p = ^ILinfo;

  ILpointf = record
    x:  ILfloat;
    y:  ILfloat;
  end;
  ILpointf_p = ^ILpointf;

  ILpointi = record
    x:  ILint;
    y:  ILint;
  end;
  ILpointi_p = ^ILpointi;

{===============================================================================
    API functions (as procedural variables)
===============================================================================}
var 
  iluAlienify:       Function: ILboolean; stdcall = nil;
  iluBlurAvg:        Function(Iter: ILuint): ILboolean; stdcall = nil;
  iluBlurGaussian:   Function(Iter: ILuint): ILboolean; stdcall = nil;
  iluBuildMipmaps:   Function: ILboolean; stdcall = nil;
  iluColoursUsed:    Function: ILuint; stdcall = nil;
  iluCompareImage:   Function(Comp: ILuint): ILboolean; stdcall = nil;
  iluContrast:       Function(Contrast: ILfloat): ILboolean; stdcall = nil;
  iluCrop:           Function(XOff,YOff,ZOff,Width,Height,Depth: ILuint): ILboolean; stdcall = nil;
  iluDeleteImage:    procedure(Id: ILuint); stdcall = nil;  // Deprecated
  iluEdgeDetectE:    Function: ILboolean; stdcall = nil;
  iluEdgeDetectP:    Function: ILboolean; stdcall = nil;
  iluEdgeDetectS:    Function: ILboolean; stdcall = nil;
  iluEmboss:         Function: ILboolean; stdcall = nil;
  iluEnlargeCanvas:  Function(Width,Height,Depth: ILuint): ILboolean; stdcall = nil;
  iluEnlargeImage:   Function(XDim,YDim,ZDim: ILfloat): ILboolean; stdcall = nil;
  iluEqualize:       Function: ILboolean; stdcall = nil;
  iluEqualize2:      Function: ILboolean; stdcall = nil;
  iluErrorString:    Function(Error: ILenum): ILconst_string; stdcall = nil;
  iluConvolution:    Function(matrix: ILint_p; scale,bias: ILint): ILboolean; stdcall = nil;
  iluFlipImage:      Function: ILboolean; stdcall = nil;
  iluGammaCorrect:   Function(Gamma: ILfloat): ILboolean; stdcall = nil;
  iluGenImage:       Function: ILuint; stdcall = nil; // Deprecated
  iluGetImageInfo:   procedure(Info: ILinfo_p); stdcall = nil;
  iluGetInteger:     Function(Mode: ILenum): ILuint; stdcall = nil;
  iluGetIntegerv:    procedure(Mode: ILenum; Param: ILint_p); stdcall = nil;
  iluGetString:      Function(StringName: ILenum): ILstring; stdcall = nil;
  iluImageParameter: procedure(PName,Param: ILenum); stdcall = nil;
  iluInit:           procedure; stdcall = nil;
  iluInvertAlpha:    Function: ILboolean; stdcall = nil;
  iluLoadImage:      Function(FileName: ILconst_string): ILuint; stdcall = nil;
  iluMirror:         Function: ILboolean; stdcall = nil;
  iluNegative:       Function: ILboolean; stdcall = nil;
  iluNoisify:        Function(Tolerance: ILclampf): ILboolean; stdcall = nil;
  iluPixelize:       Function(PixSize: ILuint): ILboolean; stdcall = nil;
  iluRegionfv:       procedure(Points: ILpointf_p; n: ILuint); stdcall = nil;
  iluRegioniv:       procedure(Points: ILpointi_p; n: ILuint); stdcall = nil;
  iluReplaceColour:  Function(Red,Green,Blue: ILubyte; Tolerance: ILfloat): ILboolean; stdcall = nil;
  iluRotate:         Function(Angle: ILfloat): ILboolean; stdcall = nil;
  iluRotate3D:       Function(x,y,z,Angle: ILfloat): ILboolean; stdcall = nil;
  iluSaturate1f:     Function(Saturation: ILfloat): ILboolean; stdcall = nil;
  iluSaturate4f:     Function(r,g,b,Saturation: ILfloat): ILboolean; stdcall = nil;
  iluScale:          Function(Width,Height,Depth: ILuint): ILboolean; stdcall = nil;
  iluScaleAlpha:     Function(scale: ILfloat): ILboolean; stdcall = nil;
  iluScaleColours:   Function(r,g,b: ILfloat): ILboolean; stdcall = nil;
  iluSepia:          Function: ILboolean; stdcall = nil;
  iluSetLanguage:    Function(Language: ILenum): ILboolean; stdcall = nil;
  iluSharpen:        Function(Factor: ILfloat; Iter: ILuint): ILboolean; stdcall = nil;
  iluSwapColours:    Function: ILboolean; stdcall = nil;
  iluWave:           Function(Angle: ILfloat): ILboolean; stdcall = nil;

  iluColorsUsed:     Function: ILuint; stdcall = nil;
  iluSwapColors:     Function: ILboolean; stdcall = nil;
  iluReplaceColor:   Function(Red,Green,Blue: ILubyte; Tolerance: ILfloat): ILboolean; stdcall = nil;
{
  Note that in the original header, the following function is declared as:

    #define iluScaleColor   iluScaleColour

  So as an alias for iluScaleColour, which afaik does not exist. I am assuming
  this is an error, and should look this way:

    #define iluScaleColors  iluScaleColours
}
  iluScaleColors:    Function(r,g,b: ILfloat): ILboolean; stdcall = nil;

{===============================================================================
    Library loading - declaration
===============================================================================}
const
  DevILU_LibFileName = 'ILU.dll';

Function DevILU_Initialized: Boolean;
Function DevILU_Initialize(const LibPath: String = DevIL_LibFileName; InitLib: Boolean = True): Boolean;
procedure DevILU_Finalize(FinalLib: Boolean = True);

implementation

end.
