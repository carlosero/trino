$ ->
  $("input.datetime_picker").each (i) ->
    $(this).datetimepicker
      altField: $(this).next()
      format: "dd-mm-yyyy HH:ii p"
      language: 'es'
      autoclose: 1
      todayHighlight: 1
      todayBtn:  1
      showMeridian: 1
      startDate: "01-01-2013 12:00 am"
