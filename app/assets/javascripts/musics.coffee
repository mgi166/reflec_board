$ ->
 $('tbody').on 'click', 'tr', ->
   if $(this).find('a').length
     $(this).off('click')
   else
     window.location.href = $(this).data('href')
