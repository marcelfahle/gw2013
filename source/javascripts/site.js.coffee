jQuery ->
  $('.fancybox-media').fancybox(
    helpers:
      media: {}
  )

  sliders = []
  $('.feature-slider').krautSlider
    nextBtn: $('.slider-nav .slide-next')
    prevBtn: $('.slider-nav .slide-prev')
    navIndex: $('.slider-nav .slide-indexes')

  $('.mobile-nav-trigger').on 'click', (e) ->
    e.preventDefault()
    $('.mobile-nav').slideToggle 'slow'

  
