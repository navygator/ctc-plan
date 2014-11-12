$ ->
  $('.show-search').click ->
    $('.search-form').fadeIn(300)
    $('.search-form input').focus()

  $('.search-form input').blur ->
    $('.search-form').fadeOut(300)
