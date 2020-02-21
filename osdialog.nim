import osdialog/wrapper

export wrapper.FileDialog


proc c_free(p: pointer) {. importc: "free", header: "<stdlib.h>".}

proc fileDialog*(dialog: FileDialog, path: string = "", filename: string = "",
                 filters: string = ""): string =

  var parsedFilters = if filters != "": osdialog_filters_parse(filters)
                      else: nil

  var cPath: cstring
  if path != "": cPath = path

  var cFilename: cstring
  if filename != "": cFilename = filename

  var res = osdialog_file(dialog, path, filename, parsedFilters)
  result = $res
  c_free(res)

  osdialog_filters_free(parsedFilters)

