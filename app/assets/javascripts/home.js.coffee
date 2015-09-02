ready = ->
  $('.select2').select2(allowClear: true)

  $('.date-field').each ->
    $(@).datepicker('setDate',  $(@).data('value'))


$(document).ready(ready)
$(document).on('page:load', ready)