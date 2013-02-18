var Slider = function() { this.initialize.apply(this, arguments) }
Slider.prototype = {

  initialize: function(slider) {
    this.ul = slider.children[0]
    this.li = this.ul.children

    // make <ul> as large as all <li>’s
    //this.ul.style.width = (2560 * this.li.length) + 'px'
    this.ul.style.width = (this.li[0].clientWidth * this.li.length) + 'px'

    this.currentIndex = 0
  },

  goTo: function(index) {
    // filter invalid indices
    if (index < 0 || index > this.li.length - 1)
      return

    // move <ul> left
    console.log(this.ul.offsetLeft); 
    this.ul.style.left =  (-(2560 * index)) + 'px';

    this.currentIndex = index
  },

  goToPrev: function() {
    this.goTo(this.currentIndex - 1)
  },

  goToNext: function() {
    this.goTo(this.currentIndex + 1)
  },

  getCurrentWidth: function() {
     var x = 0;
     if (self.innerHeight)
     {
       x = self.innerWidth;
     }
     else if (document.documentElement && document.documentElement.clientHeight)
     {
       x = document.documentElement.clientWidth;
     }
     else if (document.body)
     {
       x = document.body.clientWidth;
     }
     return x;
  }
}
