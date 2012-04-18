// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function(){
		$("#question_type_normal").click(function(){
			$("#questions").show();
			$(".clonedInput").hide();
			$("#hidebtnm").hide();
		}); //normal text box show 
		
		$("#question_type_Measurement").click(function(){
			$("#questions").hide();
			$("#hidebtnm").show();
			$(".clonedInput").show();
			$("#txtbtnkcinput1").show();
			$("#hidebtnm").show();
		});//quesiton_type_Measurement
		
		$("#question_sequence_rbbkt").click(function(){
			$("#textkc").show();
			$("#btntextkcadd").show();
			$("#btntextkcdel").show();
						
			$("#input1").show();
			$("#textbinsize1").hide();
			$("#hidebs").hide();
			$("#hidekc").show();
		});//quesiton_sequence_Measurement
		
		$("#question_sequence_rbdtree").click(function(){
			$("#textbinsize1").show();
			$("#btntextaddbinsize").show();
			$("#btntextdelbinsize").show();
			$("#input1").hide();
			$("#hidekc").hide();
			$("#hidebs").show();

		});//quesiton_sequence_
		$("#btnadd").click(function(){
			$("#txtbtnkcinput1").show();
			
		}); //
		
		$("#question_sequence_random").click(function(){
			$("#textkc").hide();
			$("#btntextkcadd").hide();
			$("#btntextkcdel").hide();
			$("#btntextaddbinsize").hide();
			$("#btntextdelbinsize").hide();
		    $("#textbinsize").hide();
		    
		});
		$("#question_sequence_random_once").click(function(){
			$("#textkc").hide();
			$("#btntextkcadd").hide();
			$("#btntextkcdel").hide();
			$("#btntextaddbinsize").hide();
			$("#btntextdelbinsize").hide();
		    $("#textbinsize").hide();
		});
		$("#question_sequence_as_in_instruction_set").click(function(){
			$("#textkc").hide();
			$("#btntextkcadd").hide();
			$("#btntextkcdel").hide();
			$("#btntextaddbinsize").hide();
			$("#btntextdelbinsize").hide();
		    $("#textbinsize").hide();
		});
		
		$('#btntextkcadd').click(function() {
            var num     = $('.tobeclonedtextkc').length; // how many "duplicatable" input fields we currently have
            var newNum  = new Number(num + 1);      // the numeric ID of the new input field being added

            // create the new element via clone(), and manipulate it's ID using newNum value
            var newElem = $('#input' + num).clone().attr('id', 'input' + newNum);

            // manipulate the name/id values of the input inside the new element
            newElem.children(':first').attr('id', 'name' + newNum).attr('name', 'name' + newNum);

            // insert the new element after the last "duplicatable" input field
            $('#input' + num).after(newElem);

            // enable the "remove" button
            $('#btntextkcdel').attr('disabled','');

            // business rule: you can only add 5 names
            //if (newNum == 5)
              //  $('#btntextkcadd').attr('disabled','disabled');
        });
		$('#btntextkcdel').click(function() {
		        var num = $('.tobeclonedtextkc').length; // how many "duplicatable" input fields we currently have
		        $('#input' + num).remove();     // remove the last element

		                // enable the "add" button
				$('#btntextkcadd').attr('disabled','');

		                // if only one element remains, disable the "remove" button
		         if (num-1 == 1)
		           $('#btntextkcdel').attr('disabled','disabled');
		});  //delete button code deleted
		
		$('#btnadd').click(function() {
            var num     = $('.clonedInput').length; // how many "duplicatable" input fields we currently have
            var newNum  = new Number(num + 1);      // the numeric ID of the new input field being added
            var newElem = $('#txtbtnkcinput' + num).clone().attr('id', 'txtbtnkcinput' + newNum);
            newElem.children(':first').attr('id', 'name' + newNum).attr('name', 'name' + newNum);
            $('#txtbtnkcinput' + num).after(newElem);
            $('#btnDel').attr('disabled','');
            //if (newNum == 5)
              //  $('#btnadd').attr('disabled','disabled');
        });
		$('#btnDel').click(function() {
			    var num = $('.clonedInput').length; // how many "duplicatable" input fields we currently have
			      $('#txtbtnkcinput' + num).remove();     // remove the last element
			                // enable the "add" button
					$('#btnadd').attr('disabled','');
			       if (num-1 == 1)
			         $('#btnDel').attr('disabled','disabled');
		});  //delete button code deleted
		
		$('#btntextaddbinsize').click(function() {
            var num     = $('.tobeclonedtextbinsize').length; // how many "duplicatable" input fields we currently have
            var newNum  = new Number(num + 1);      // the numeric ID of the new input field being added
            var newElem = $('#textbinsize' + num).clone().attr('id', 'textbinsize' + newNum);
            newElem.children(':first').attr('id', 'name' + newNum).attr('name', 'name' + newNum);
            $('#textbinsize' + num).after(newElem);
            $('#btnDel').attr('disabled','');
            //if (newNum == 5)
              //  $('#btntextaddbinsize').attr('disabled','disabled');
        });
		$('#btntextdelbinsize').click(function() {
			    var num = $('.tobeclonedtextbinsize').length; // how many "duplicatable" input fields we currently have
			      $('#textbinsize' + num).remove();     // remove the last element
			                // enable the "add" button
					$('#btntextaddbinsize').attr('disabled','');
			       if (num-1 == 1)
			         $('#btntextdelbinsize').attr('disabled','disabled');
		});  //delete button code deleted

});