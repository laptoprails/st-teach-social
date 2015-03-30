// Adding and removing fields in forms
function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".field").fadeOut();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).before(content.replace(regexp, new_id));
}

function retrieveSimilarObjectiveables(objectiveable_type, based_on){

	if (based_on == 'objectives') {
		// Based on common objectives
		var objective_inputs = $('.objectiveName');
		var objectives_array = [];
		for (i = 0; i < objective_inputs.length; i++){
			if (objective_inputs[i].value.trim().length > 0){
				objectives_array.push(objective_inputs[i].value.trim());
			}
		}
		
		if (objectives_array.length > 0){
			$.ajax({
		    type: "GET",
		    url: '/objectives/similar_objectiveables',
		    data: { objectives : JSON.stringify(objectives_array),
		    				type: objectiveable_type,
		    				based_on: 'objectives'
		    			},
		    dataType: 'json',
		    contentType: 'application/json',
		    success: displayObjectiveables
			});		
		}	
	} else if (based_on == 'name') {
		// Based on the objectivable name
		var name = $('.objectiveable-name')[0].value.trim();
		if (name.length > 0){
			$.ajax({
		    type: "GET",
		    url: '/objectives/similar_objectiveables',
		    data: { objectives : JSON.stringify([name]),
		    				type: objectiveable_type,
		    				based_on: 'name'
		    			},
		    dataType: 'json',
		    contentType: 'application/json',
		    success: displayObjectiveables
			});		
		}			
	}
}

function displayObjectiveables(result){
	// the html which would be displayed
	var objectiveables = result.objectiveables;
	var based_on = result.based_on;

	var result_html = '';
	if (objectiveables) {
		for (i = 0; i < objectiveables.length; i++){
			var objectiveable = objectiveables[i].objectiveable;
			// generate the link
			var link = '<a href="' + objectiveables[i].url + '">' + objectiveables[i].link_title + '</a><br />';
			result_html += link;
		}
	}
	// display the HTML

	if (based_on == "objectives"){
		$('#similarObjectiveables').html(result_html);	
	} else {
		$('#similarObjectiveablesTitle').html(result_html);	
	}

	
}


