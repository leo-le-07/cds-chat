jQuery(document).on 'turbolinks:load', ->
  if $('.infinite-new-friends').size() > 0
    $(window).on 'scroll', ->
      more_posts_url = $('.pagination a').attr('href')
      if more_posts_url && $(window).scrollTop() > $(document).height() - $(window).height() - 60
        $('.pagination').html('<img src="/assets/ajax-loader.gif" alt="Loading..." title="Loading..." />')
        $.getScript more_posts_url
      return
    return
