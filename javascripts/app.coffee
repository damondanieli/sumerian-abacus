moveBead = (e) ->
  $('.bead').unbind 'click', moveBead
  col = $(this).data('col')
  parent = $(this).parents('div.divide')

  parent.find(".bead:not(.inactive)[data-col=#{col}]").addClass('active')
  $(this).removeClass('active')
  $('.bead.active').bind 'click', moveBead

  total = 0
  col = 0

  while col <= $('.row .bead').length
    $(".earth .bead[data-col=#{col}]").each ->
      if $(this).hasClass('active')
        if col == 0
          total+= 1
        else if col == 1
          total+= 1 * 10
        else if col == 2
          total+= 1 * 10 * 6
        else if col == 3
          total+= 1 * 10 * 6 * 10
        else if col == 4
          total+= 1 * 10 * 6 * 10 * 6
        else if col == 5
          total+= 1 * 10 * 6 * 10 * 6 * 10
      else return false
    $($(".heaven .bead[data-col=#{col}]").get().reverse()).each ->
      if $(this).hasClass('active')
        if col == 0
          total+= 10 / 2
        else if col == 1
          total+= (10 * 6) / 2
        else if col == 2
          total+= (10 * 6 * 10) / 2
        else if col == 3
          total+= (10 * 6 * 10 * 6) / 2
        else if col == 4
          total+= (10 * 6 * 10 * 6 * 10) / 2
        else if col == 5
          total+= (10 * 6 * 10 * 6 * 10 * 6) / 2
      else return false
    col++

  $('.total').text String(total).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")

jQuery ->

  $('.heaven .row:not(:last) .bead, .earth .row:not(:first) .bead').addClass('active')
  # $('.earth .row:first:even .bead').removeClass('active')
  $('.earth > div:nth-child(4) > div:nth-child(1)').removeClass('active').addClass('inactive')
  $('.earth > div:nth-child(5) > div:nth-child(1)').removeClass('active').addClass('inactive')
  $('.earth > div:nth-child(4) > div:nth-child(3)').removeClass('active').addClass('inactive')
  $('.earth > div:nth-child(5) > div:nth-child(3)').removeClass('active').addClass('inactive')
  $('.earth > div:nth-child(4) > div:nth-child(5)').removeClass('active').addClass('inactive')
  $('.earth > div:nth-child(5) > div:nth-child(5)').removeClass('active').addClass('inactive')

  $('.total').text(0)

  $(".bead").bind 'click', moveBead
