$(function(){
  $('[data-toggle="tooltip"]').tooltip();

  $(document).on('change','.box', function(){
    color = $(this).val();
    id = $(this).attr('id')
    $.ajax({
      type: 'GET',
      url: '/update_squares',
      data: { color: color, id: id },

      success: function(data){
        $('#update-squares').html(data);
        $('[data-toggle="tooltip"]').tooltip();
      },error: function(data){
        return false}
    });
  });
})