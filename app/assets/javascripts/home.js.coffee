ready = ->
  $('.select2').select2()

  $('.date-field').each ->
    $(@).datepicker('setDate',  $(@).data('value'))


$(document).ready(ready)
$(document).on('page:load', ready)