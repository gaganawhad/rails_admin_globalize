jQuery ->
  $locale_already_select = $("#target_locale_already_select")

  $locale_already_select.on 'change', (e) ->
    url = $locale_already_select.data("target-url")
    location.replace updateQueryStringParameter(url, "target_locale", $locale_already_select.val())

  $locale_not_yet_select = $("#target_locale_not_yet_select")

  $locale_not_yet_select.on 'change', (e) ->
    url = $locale_not_yet_select.data("target-url")
    location.replace updateQueryStringParameter(url, "target_locale", $locale_not_yet_select.val())

  updateQueryStringParameter = (uri, key, value) ->
    separator = if (uri.indexOf('?') != -1) then "&" else "?"
    reg_exp = new RegExp("([?|&])#{key}=.*?(&|$)", "i")
    if (uri.match(reg_exp))
      return uri.replace(reg_exp, "$1#{key}=#{value}$2")
    else
      return "#{uri}#{separator}#{key}=#{value}"
