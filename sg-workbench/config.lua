Config = {}

Config.Prop = 'prop_tool_box_04' -- The prop that will used for when the work bench is on ground and in hand
Config.Item = 'toolbox' -- Name of the item used for suit cases
Config.OpenBTN = 'Open Tool Box' -- The open label shown when targeting the prop
Config.PickupBTN = 'Pick Up Tool Box' -- The Pick up label shown when targeting the prop
Config.WorkbenchBTN = 'Workbench' -- The name that shows up when the work bench is open

Config.Workbench = {
    items = {
        {type = 'item', name = 'beer', count = 6, time = 10, ingredients = {
            {name = 'sixpack', count = 1}		
        }},	  
        {type = 'item', name = '12gauge', count = 12, time = 5, ingredients = {
            {name = 'box_of_12gauge', count = 1}
        }}, 
        {type = 'item', name = '9mm', count = 50, time = 7, ingredients = {
            {name = 'box_of_9mm', count = 1}		
        }}, 
        {type = 'item', name = '5ammo', count = 20, time = 5, ingredients = {
            {name = 'box_of_556', count = 1}
        }}, 
        {type = 'item', name = '762mm', count = 20, time = 5, ingredients = {
            {name = 'box_of_762', count = 1}
        }}
    }    
} 	