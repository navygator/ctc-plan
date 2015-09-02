# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
  $('#achievement_achievement_type_id').change (e)->
    $.ajax {
      method: 'get',
      url: $(@).closest('.form-group').data('url') + "/#{e.val}", 
      dataType: 'json'
      success: (data, status, xhr) ->
        $('.variable').hide()
        $.each((data.visible_params || '').split(','), (idx, val)->
          if val != ''
            $('.' + val).removeClass('hidden').show()
        )
        
    }
    
    $.ajax {
      method: 'get',
      url: '/grades/search.json?achievement_type_id=' + e.val
      dataType: 'json'
      success: (data, status, xhr) ->
        $('select#achievement_grade_id').html('<option value=""></option>' + $.map(data, (v) ->
          "<option value=#{v.id}>#{v.text}</option>"
          ).join(''))
        $('select#achievement_grade_id').select2('destroy')
        $('select#achievement_grade_id').select2(allowClear: true);
    }
    

$(document).ready(ready)
$(document).on('page:load', ready)