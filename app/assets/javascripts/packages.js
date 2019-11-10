$(function(){
  $("#package-table").DataTable();

  $('select#package-select').selectize({
    sortField: 'text',
    create: true,
  });
  
});