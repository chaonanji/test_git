FUNCTION extract_hdr_path, image_loc, fname_org

  ; Schneidet den Pfad von file-namen ab
  len_image_loc = strlen(image_loc)         ; number of characters of the file-path
  len_fname_org = strlen(fname_org)

  ; Filename + File-type-extension zB. Dresden_sub.bsq
  file_name = strmid(fname_org, len_image_loc+1)
    ;print, "Selected file: ", file_name

  ; Suche nach Startposition für file-type extension angabe (.)
  point_pos = strpos(file_name, '.')      ; position (index) von .-Character
    ;print, point_pos                   ; Index-position des .-Characters


  ; Überprüfung Filenamen, ob mehr als ein Punkt-Character (.) vorhanden ist --> wenn ja (zB. Dresden.subset.bsq): Abbruch des Programms/ Errormessage!
  point = strsplit(file_name, '.', count=point_count)       ; counts the points (.) in the file-name
  number_of_points = point_count-1                          ; Anzahl von vorhandenen Punkt-Characters in File-name
    ;print, number_of_points

  ; count the number of characters of the filename + filetype-extension
  fname_length=strlen(file_name)  ; länge des strings (index)
    ;print, "number of characters of the file name + file-type-extension", file_name_length

  ; extracts the file-type extension (with point) eg. .bsq
  fextension= strmid(file_name, point_pos, fname_length)
    ;print, "file extension/type: ", fextension

  len_fextension=strlen(fextension)                   ; counts the character of the file-type-extension zB. 4 --> .bsq
  char_fname = fname_length - strlen(fextension)      ; subtraction the . and file-type extension from file-name and gives the number of characters (eg. for Dresden_sub --> 11)
    ;print, "number of characters of the file-name", char_fname
  name_of_file = strmid(file_name, 0, char_fname)     ; cuts the . and file-extension from the filename and outputs the name only 

  ; Filename of hdr-file eg. Dresden_sub.hdr
  fname_hdr = name_of_file + '.hdr'
    ;print, 'Filename of appropriate hdr-file: ', fname_hdr

  ; Extracts the filepath of the hdr-file eg. D:\Dresden\Dresden_sub.hdr
  fpath_hdr = filepath(fname_hdr, ROOT_DIR=image_loc)

return, fpath_hdr

END