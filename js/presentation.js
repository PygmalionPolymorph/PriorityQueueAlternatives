Reveal.initialize({
	width: "100%",
	height: "100%",
	center: false,
	keyboard: true,
	math: {
		mathjax: 'https://cdn.mathjax.org/mathjax/latest/MathJax.js',
		config: 'TeX-AMS_HTML-full'
	},
	dependencies: [
		{ src: 'lib/js/classList.js', condition: function() { return !document.body.classList; } },
		{ src: 'plugin/notes/notes.js', async: true },
		{ src: '/plugin/math/math.js', async: true }
	]
});

Reveal.addEventListener('fragmenthidden', function(ev) {
	var frag = $(ev.fragment);
	if (frag.hasClass('trigger')) {
		$(frag).parents('section').find('.state-' + frag.data('state')).addClass('invisible');
		$(frag).parents('section').find('.state-' + frag.data('state') + '-out').removeClass('invisible');
	}
});
Reveal.addEventListener('fragmentshown', function(ev) {
	var frag = $(ev.fragment);
	if (frag.hasClass('trigger')) {
		$(frag).parents('section').find('.state-' + frag.data('state')).removeClass('invisible');
		$(frag).parents('section').find('.state-' + frag.data('state') + '-out').addClass('invisible');
	}
});

function handleSmallSlides() {
	var $slides = $('.slides');
	$slides.each(function(i, elem) {
		console.log(elem);
		$elem = $(elem);
		if ($elem.width() < 1025 && $elem.width() >= 600) {
			$elem.removeClass('slides-smallest').addClass('slides-small');
		} else if ($elem.width() < 600) {
			$elem.removeClass('slides-small').addClass('slides-smallest');
		} else {
			$elem.removeClass('slides-small').removeClass('slides-smallest');
		}
	});
}

$(window).resize(function() {handleSmallSlides()});
$(document).ready(function() {handleSmallSlides()});
