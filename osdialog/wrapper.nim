const CFLAGS = "-g -Wall -Wextra -std=c99 -pedantic "

when defined(windows):
  {.passL: "-mwindows", compile: "src/osdialog_win.c".}

elif defined(macosx):
  {.passC: CFLAGS & "-mmacosx-version-min=10.7", passL: "-framework AppKit",
    compile: "src/osdialog_mac.m".}

elif defined(linux):
  when defined(osdialogGtk2):
    {.passC: CFLAGS & staticExec("pkg-config --cflags gtk+-2.0"),
      passL: staticExec("pkg-config --libs gtk+-2.0"),
      compile: "src/osdialog_gtk2.c".}

  elif defined(osdialogGtk3):
    {.passC: CFLAGS & staticExec("pkg-config --cflags gtk+-3.0"),
      passL: staticExec("pkg-config --libs gtk+-3.0"),
      compile: "src/osdialog_gtk3.c".}

  elif defined(osdialogZenity):
    {.passC: CFLAGS, compile: "src/osdialog_zenity.c".}

  else:
    {.error: "define osdialogGtk2, osdialogGtk3 or osdialogZenity " &
             "(pass -d:... to compile)".}

{.passC: CFLAGS, compile: "src/osdialog.c".}

type
  MessageBoxLevel* = enum
    mblInfo, mblWarning, mblError

  MessageBoxButtons* = enum
    mbbOk, mkbOkCancel, mbbYesNo

proc osdialog_message*(level: MessageBoxLevel, buttons: MessageBoxButtons,
                       message: cstring): cint {.cdecl, importc.}

#[
proc osdialog_prompt*(level: MessageBoxLevel, message: cstring,
                   text: cstring): cstring {.cdecl, importc.}
]#

type
  FileDialog* = enum
    fdOpenFile, fdOpenDir, fdSaveFile

  FilterPatternsObj {.bycopy.} = object
    pattern*: cstring
    next*: FilterPatterns

  FilterPatterns* = ptr FilterPatternsObj

  FiltersObj {.bycopy.} = object
    name*: cstring
    patterns*: FilterPatterns
    next*: Filters

  Filters* = ptr FiltersObj


proc osdialog_file*(action: FileDialog; path: cstring; filename: cstring;
                    filters: Filters): cstring {.cdecl, importc.}

proc osdialog_filters_parse*(str: cstring): Filters {.cdecl, importc.}

proc osdialog_filters_free*(filters: Filters) {.cdecl, importc.}

#[
type
  ColorObj {.bycopy.} = object
    r*: byte
    g*: byte
    b*: byte
    a*: byte

  Color* = ptr ColorObj

proc osdialog_color_picker*(color: Color, opacity: cint): cint
    {.cdecl, importc.}
]#
