#-- Start Code --#
require "sketchup.rb"


module Input_Line_by_XYZ
    def self.doit
        aents = Sketchup.active_model.active_entities
        px=0
        py=0
        pz=0
        loop do 
            pt1 = inputbox(['X', 'Y', 'Z'], [px,py,pz], "Starting Point Coordinates")
            return if not pt1
            pt2 = inputbox(['X', 'Y', 'Z'], [pt1[0],pt1[1],pt1[2]], "Ending Point Coordinates")
            return if not pt2
            ents = Sketchup.active_model.entities 
            ents.add_edges( pt1,pt2 )
            px=pt2[0]
            py=pt2[1]
            pz=pt2[2]
        end
    end
end


filename=File.basename(__FILE__)
if not file_loaded?(filename)
    UI.menu('Plugins').add_item('Input_Line_by_XYZ') {Input_Line_by_XYZ.doit}
    file_loaded(filename)
end
#-- End Code --#