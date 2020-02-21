import osdialog

proc main() =
  # Open directory with default arguments
  when true:
    echo "file open dir"

    var filename = fileDialog(fdOpenDir)
    if filename != "":
      echo "\t", filename
    else:
      echo "\tCanceled"

  # Open file with default arguments
  when true:
    echo "file open"

    filename = fileDialog(fdOpenFile)
    if filename != "":
      echo "\t", filename
    else:
      echo "\tCanceled"

  # Save file with default arguments
  when true:
    echo "file save"

    filename = fileDialog(fdSaveFile)
    if filename != "":
      echo "\t", filename
    else:
      echo "\tCanceled"

  # Open directory with custom arguments
  when true:
    echo "file open dir in cwd"

    filename = fileDialog(fdOpenDir, path=".", filename="こんにちは")
    if filename != "":
      echo "\t", filename
    else:
      echo "\tCanceled"

  # Open file with custom arguments
  when true:
    echo "file open dir in cwd"

    filename = fileDialog(fdOpenFile, path=".", filename="こんにちは",
                          filters="Source:c,cpp,mHeader:h,hpp")
    if filename != "":
      echo "\t", filename
    else:
      echo "\tCanceled"

  # Save file with custom arguments
  when true:
    echo "file save in cwd"

    filename = fileDialog(fdSaveFile, path=".", filename="こんにちは",
                          filters="Source:c,cpp,mHeader:h,hpp")
    if filename != "":
      echo "\t", filename
    else:
      echo "\tCanceled"

main()

