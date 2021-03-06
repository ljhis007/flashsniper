Function CreatCursor
;  shiftArray = [ $
;  '       ##       ', $
;  '   ## #..###    ', $
;  '  #..##..#..#   ', $
;  '  #..##..#..# # ', $
;  '   #..#..#..##.#', $
;  '   #..#..#..#..#', $
;  ' ####.......#..#', $
;  '#..##..........#', $
;  '#...#.........# ', $
;  ' #............# ', $
;  '  #...........# ', $
;  '  #..........#  ', $
;  '   #.........#  ', $
;  '    #.......#   ', $
;  '     #......#   ', $
;  '                ' ]
  shiftArray = [ $ 
  '       .        ', $ 
  '      .#.       ', $ 
  '     .###.      ', $ 
  '    .#####.     ', $ 
  '   ....#....    ', $ 
  '  .#. .#. .#.   ', $ 
  ' .##...#...##.  ', $ 
  '.######$######. ', $ 
  ' .##...#...##.  ', $ 
  '  .#. .#. .#.   ', $ 
  '   ....#....    ', $ 
  '    .#####.     ', $ 
  '     .###.      ', $ 
  '      .#.       ', $ 
  '       .        ', $ 
  '                '] 
  
;  rotateArray = [ $
;  '                ', $
;  '       #        ', $
;  '      ##        ', $
;  '    .#####      ', $
;  '      ##  #     ', $
;  '       #   #    ', $
;  '            #   ', $
;  '            #   ', $
;  '  #         #   ', $
;  '  #         #   ', $
;  '  #         #   ', $
;  '   #       #    ', $
;  '    #     #     ', $
;  '     #####      ', $
;  '                ', $
;  '                ' ]
  rotateArray = [ $
  '                ', $
  '       .        ', $
  '      ..        ', $
  '    #.....      ', $
  '      ..  .     ', $
  '       .   .    ', $
  '            .   ', $
  '            .   ', $
  '  .         .   ', $
  '  .         .   ', $
  '  .         .   ', $
  '   .       .    ', $
  '    .     .     ', $
  '     .....      ', $
  '                ', $
  '                ' ]
;  scaleArray = [ $
;  '                ', $
;  '    ###         ', $
;  '  ##...##       ', $
;  '  #.....#       ', $
;  ' #.......#      ', $
;  ' #.......#      ', $
;  ' #.......#      ', $
;  '  #.....##      ', $
;  '  ##...###      ', $
;  '    #######     ', $
;  '         ###    ', $
;  '          ###   ', $
;  '           ###  ', $
;  '            #   ', $
;  '                ', $
;  '                ' ]
  scaleArray = [ $
  '                ', $
  '    ###         ', $
  '  ##...##       ', $
  '  #.....#       ', $
  ' #.......#      ', $
  ' #.......#      ', $
  ' #.......#      ', $
  '  #.....##      ', $
  '  ##...#.#      ', $
  '    #####.#     ', $
  '         #.#    ', $
  '          #.#   ', $
  '           #.#  ', $
  '            #   ', $
  '                ', $
  '                ' ]
  
  cursor = { $
    name: ['shift','rotate','scale'], $
    image : LonArr(3,16), $
    hotSpot : LonArr(3,2), $
    mask : LonArr(3,16) }
    
  strArray = [ ptr_new(shiftArray,/no_copy), $
    ptr_new(rotateArray,/no_copy), $
    ptr_new(scaleArray,/no_copy) ]
  for i=0,n_elements(strArray)-1 do begin
    image = Create_Cursor(*strArray[i], HotSpot=Hotspot, Mask=Mask)
    cursor.image[i,*] = image
    cursor.hotSpot[i,*] = Hotspot
    cursor.mask[i,*] = Mask
  endfor
  ptr_free, strArray
  return, ptr_new(cursor,/no_copy)
end