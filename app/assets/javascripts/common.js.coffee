@updateScheduler = (sender)->
  $form = $(sender).closest('form')
  $form.find('.fieldData').val(scheduler.toJSON())