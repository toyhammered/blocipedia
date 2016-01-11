$(document).on('page:change', function() {

  // Only run if this ID is on the page.
  if ( $('#body-edit-area').length) {
    updateFormView();

    $('#body-edit-area').keyup(function() {
      updateFormView();
    });
  }

  // Only run if this Class is on the page
  if ($('.markdown-area').length) {
    updateShowView();
  }

});

function updateFormView() {
  updatePreview();
  adjustEditAreaHeight();
  syncEditAndPreviewHeights();
}

function updatePreview() {
  var markdownText = $('#body-edit-area').val();

  $('#body-preview').html(
    markdown.toHTML(markdownText)
  );
}

function adjustEditAreaHeight() {
  var editAreaText = $('#body-edit-area').val();
  var noOfLines = editAreaText.split(/\r|\r\n|\n/).length;

  $('#body-edit-area').attr("rows", noOfLines + 2);
}

function syncEditAndPreviewHeights() {
  var editAreaHeight = $('#body-edit-area').height();
  var adjustedHeight = editAreaHeight - 10;

  $('#body-preview').height(adjustedHeight)
}

function updateShowView() {
  var markdownText = $('.markdown-area').text().trim();
  $('.markdown-area').html(markdown.toHTML(markdownText));
}
