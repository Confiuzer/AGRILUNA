# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


ready = ->
	#alert 'hello'
	domid = ''
	div_id = ''

	# Hide discounts and bonuses form from the start
	$("div.discount_update_form").hide();
	$("div.bonus_update_form").hide();

	# Show discounts form on click
	$('div.pay_roll_item_discount_update').click ->
		domid = $(this).attr('id')
		div_id = domid.replace(/[^0-9]/g, '')
		#alert(domid);
		#alert(div_id);
		$('#' + domid).hide()
		$("div#discount_update_form_" + div_id).show();
	

	# When updating the updates...
	# Get ID of the pay_roll_item
	$('.discount_update_form_button').click (event) ->
		event.preventDefault()
		#alert('Inside prevent default')
		domid = $(this).attr('id')
		pay_roll_item_id = domid.replace(/[^0-9]/g, '')
		
		# Send de ajax request and handle the success or error
		#alert('Inside send ajax')
		#url = $(this).attr('action')
		url = '/pay_roll_items/' + pay_roll_item_id + '/update_discount'
		update_discount = $('div#discount_update_form_' + pay_roll_item_id + ' #pay_roll_item_discounts').val()
		# The id pay_roll_item_discounts is auto generated by rails in the input of the form
		#alert(update_discount)

		$.ajax
			type: 'put'
			url: url
			data: { pay_roll_item: { discounts: update_discount }, id: pay_roll_item_id }
			dataType: 'json'
			success: (json) ->
				$('div#discount_update_form_' + pay_roll_item_id).fadeOut()
				$('#pay_roll_item_discounts_' + pay_roll_item_id).fadeOut()
				$('#pay_roll_item_discounts_' + pay_roll_item_id).text(json.pay_roll_item.discounts.toFixed(2)).slideDown().effect("highlight", {color: '#00DCB7'}, 2000)
				$('#pay_roll_item_total_' + pay_roll_item_id).fadeOut()
				$('#pay_roll_item_total_' + pay_roll_item_id).text(json.pay_roll_item.total.toFixed(2)).slideDown().effect("highlight", {color: '#00DCB7'}, 2000)
				$('#pay_roll_subtotal').fadeOut()
				$('#pay_roll_subtotal').text(json.pay_roll.subtotal.toFixed(2)).slideDown().effect("highlight", {color: '#00DCB7'}, 2000)
				$('#pay_roll_discount').fadeOut()
				$('#pay_roll_discount').text(json.pay_roll.discount.toFixed(2)).slideDown().effect("highlight", {color: '#00DCB7'}, 2000)
				$('#pay_roll_bonus').fadeOut()
				$('#pay_roll_bonus').text(json.pay_roll.bonus.toFixed(2)).slideDown().effect("highlight", {color: '#00DCB7'}, 2000)
				$('#pay_roll_total').fadeOut()
				$('#pay_roll_total').text(json.pay_roll.total.toFixed(2)).slideDown().effect("highlight", {color: '#00DCB7'}, 2000)
				
			error: (json) ->
               	if(json.status==400)
                   	alert(json.responseText)
               	else
                   	#alert("Something went wrong")
               		alert(json.responseText)
               	$('#pay_roll_item_discounts_' + pay_roll_item_id).text(json.pay_roll_item.discounts).slideDown()
				$('div#discount_update_form_' + pay_roll_item_id).fadeOut()




	# Show bonuses form on click
	$('div.pay_roll_item_bonus_update').click ->
		domid = $(this).attr('id')
		div_id = domid.replace(/[^0-9]/g, '')
		#alert('domid='+domid);
		#alert('div_id='+div_id);
		$('#' + domid).hide()
		$("div#bonus_update_form_" + div_id).show();


	# When updating the bonuses...
	# Get ID of the pay_roll_item
	$('.bonus_update_form_button').click (event) ->
		event.preventDefault()
		#alert('Inside prevent default')
		domid = $(this).attr('id')
		pay_roll_item_id = domid.replace(/[^0-9]/g, '')
		
		# Send de ajax request and handle the success or error
		#alert('Inside send ajax')
		#url = $(this).attr('action')
		url = '/pay_roll_items/' + pay_roll_item_id + '/update_bonus'
		update_bonus = $('div#bonus_update_form_' + pay_roll_item_id + ' #pay_roll_item_bonuses').val()
		# The id pay_roll_item_discounts is auto generated by rails in the input of the form
		#alert('update_bonus='+update_bonus)

		$.ajax
			type: 'put'
			url: url
			data: { pay_roll_item: { bonuses: update_bonus }, id: pay_roll_item_id }
			dataType: 'json'
			success: (json) ->
				$('div#bonus_update_form_' + pay_roll_item_id).fadeOut()
				$('#pay_roll_item_bonuses_' + pay_roll_item_id).fadeOut()
				$('#pay_roll_item_bonuses_' + pay_roll_item_id).text(json.pay_roll_item.bonuses.toFixed(2)).slideDown().effect("highlight", {color: '#00DCB7'}, 2000)
				$('#pay_roll_item_total_' + pay_roll_item_id).fadeOut()
				$('#pay_roll_item_total_' + pay_roll_item_id).text(json.pay_roll_item.total.toFixed(2)).slideDown().effect("highlight", {color: '#00DCB7'}, 2000)
				$('#pay_roll_subtotal').fadeOut()
				$('#pay_roll_subtotal').text(json.pay_roll.subtotal.toFixed(2)).slideDown().effect("highlight", {color: '#00DCB7'}, 2000)
				$('#pay_roll_discount').fadeOut()
				$('#pay_roll_discount').text(json.pay_roll.discount.toFixed(2)).slideDown().effect("highlight", {color: '#00DCB7'}, 2000)
				$('#pay_roll_bonus').fadeOut()
				$('#pay_roll_bonus').text(json.pay_roll.bonus.toFixed(2)).slideDown().effect("highlight", {color: '#00DCB7'}, 2000)
				$('#pay_roll_total').fadeOut()
				$('#pay_roll_total').text(json.pay_roll.total.toFixed(2)).slideDown().effect("highlight", {color: '#00DCB7'}, 2000)
				
			error: (json) ->
               	if(json.status==400)
                   	alert(json.responseText)
               	else
                   	#alert("Something went wrong")
               		alert(json.responseText)
               	$('#pay_roll_item_bonuses_' + pay_roll_item_id).text(json.pay_roll_item.bonuses).slideDown()
				$('div#bonus_update_form_' + pay_roll_item_id).fadeOut()

				



$(document).ready(ready)
$(document).on('page:load', ready)