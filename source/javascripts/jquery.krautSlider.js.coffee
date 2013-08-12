$ = jQuery
$.fn.extend
  krautSlider: (options) ->
    self = $.fn.krautSlider
    opts = $.extend {}, self.default_options, options
    $(this).each (i, el) ->
      self.init el, opts

$.extend $.fn.krautSlider,
  default_options:
    log: true

  init: (el, opts) ->
    @ul = $($(el).find('.slides'))
    @li = $(@ul.children())
    @ul.css 'width', "#{@li.first().width() * @li.length}px"
    @currentIndex = 0

    @nextBtn = $(opts.nextBtn) if opts.nextBtn
    @prevBtn = $(opts.prevBtn) if opts.prevBtn
    @navIndex = $(opts.navIndex) if opts.navIndex

    $(window).resize =>
      @adjustPositions()
    
    @setupControls()
    
    @showDescription()


  setupControls: ->
    me = @
    @nextBtn.on 'click', (e)=>
      e.preventDefault()
      @goToNext()
    @prevBtn.on 'click', (e)=>
      e.preventDefault()
      @goToPrev()
    @navIndex.children().each ->
      $(@).on 'click', (e) ->
        e.preventDefault()
        goto = $(@).find('a').data('goto')
        me.goTo (goto)

  setIndexTo: (to) ->
    @navIndex.children().each ->
      $(@).find('a').removeClass()
    $(@navIndex.children()[to]).find('a').addClass 'active'


  adjustPositions: ->
    #@ul.addClass 'nomove'


    if (!('balancer' in @) )
      @balancer = setTimeout ( =>
        percentage = 2560 / $('body').width() * 100
        @ul.css 'left', "#{-(percentage * @currentIndex)+50}%"
        delete @balancer
      ), 0
    

  goTo: (index) ->
    if (index < 0)
      index = @li.size()-1
      #return
    if (index > @li.size()-1)
      index = 0

    @hideDescription()
    @setIndexTo index

    percentage = 2560 / $('body').width() * 100
    @ul.css 'left', "#{-(percentage * index)+50}%"

    @currentIndex = index

    @showDescription()


  goToPrev: ->
    @goTo @currentIndex - 1

  goToNext: ->
    @goTo @currentIndex + 1

  hideDescription: ->
    $(@ul.children()[@currentIndex]).find('.project-description').animate
      opacity: 0


  showDescription: ->
    $(@ul.children()[@currentIndex]).find('.project-description').css 'left', '49%'

    setTimeout ( =>
      $(@ul.children()[@currentIndex]).find('.project-description').animate(
        opacity: 1
        left: "50%"
      )

        
    ), 400
  


  log: (msg) ->
    console.log msg
