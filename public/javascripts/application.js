// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

var attachmentCount = 0

function AddAttachment(){
  attachmentCount++;
	document.getElementById('upload').style.display = '';
  var attachments = document.getElementById('attachments');
  attachments.style.display = '';

  var panel = document.createElement('div');
	Element.extend(panel);	
	panel.addClassName('attachmentPanel')

  var newAttachment = document.createElement('input');
  newAttachment.type = 'file'
  newAttachment.name = 'attachment[]'
  newAttachment.id = 'attachment' + attachmentCount; // para implementar link delete
  panel.appendChild(newAttachment);
  attachments.appendChild(panel);
}

