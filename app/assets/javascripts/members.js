$(function(){
  $("#member-table").DataTable();

  $('#member-select').selectize({
    sortField: 'text',
    create: true,
  });

  $('#package-select').selectize({
    sortField: 'text',
    create: true,
  });

});