# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load', ->
  $('.new_member input').keypress (e) ->
    if e.which == 13 && valid_email($( ".new_member #member_email" ).val()) && $( ".new_member #member_name" ).val() != ""
      $('.new_member').submit()

  $('.new_member input').bind 'blur', ->
    if valid_email($( ".new_member #member_email" ).val()) && $( ".new_member #member_name" ).val() != ""
      $('.new_member').submit()

  $('body').on 'click', 'a.remove_member', (e) ->
    $.ajax '/members/'+ e.currentTarget.id,
        type: 'DELETE'
        dataType: 'json',
        data: {}
        success: (data, text, jqXHR) ->
          Materialize.toast('Membro removido', 4000, 'green')
          $('#member_' + e.currentTarget.id).remove()
        error: (jqXHR, textStatus, errorThrown) ->
          Materialize.toast('Problema na remoção de membro', 4000, 'red')
    return false

  $('.new_member').on 'submit', (e) ->
    $.ajax e.target.action,
        type: 'POST'
        dataType: 'json',
        data: $(".new_member").serialize()
        success: (data, text, jqXHR) ->
          insert_member(data['id'], data['name'],  data['email'])
          $('.new_member #member_name, .new_member #member_email').val("")
          $('.new_member #member_name').focus()
          Materialize.toast('Membro adicionado', 4000, 'green')
        error: (jqXHR, textStatus, errorThrown) ->
          Materialize.toast('Problema na hora de incluir membro', 4000, 'red')
    return false

  $(document).on 'blur', '.member_update', (e) ->
    email = $(this).closest("#member_email")
    name =  $(this).closest("#member_name")
    if valid_email(email.val()) && name.val() != ""
      $(this).closest('form').submit()

  $('.update_member').on 'submit', (e) ->
    $.ajax e.target.action,
      type: 'PUT'
      dataType: 'json',
      data: $(this).serialize()
      success: (data, text, jqXHR) ->
        Materialize.toast('Membro atualizado', 4000, 'green')
      error: (jqXHR, textStatus, errorThrown) ->
        Materialize.toast('Problema na atualização do Membro', 4000, 'red')
    return false


valid_email = (email) ->
  /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/.test(email)

insert_member = (id, name, email) ->
   $.ajax '/campaigns/member/' + id,
        type: 'GET'
        data: {}
        success: (data, text, jqXHR) ->
          $('.member_list').append(data)
        error: (jqXHR, textStatus, errorThrown) ->
          Materialize.toast('Problema na remoção de membro', 4000, 'red')