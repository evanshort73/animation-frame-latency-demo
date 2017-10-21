var _evanshort73$animation_frame_latency_demo$Native_AnimationFrame = function()
{

function create()
{
	return _elm_lang$core$Native_Scheduler.nativeBinding(function(callback)
	{
		var id = requestAnimationFrame(function() {
      let now = Date.now();
			callback(_elm_lang$core$Native_Scheduler.succeed(now));
      let el = document.getElementById("directly");
      let myParity = Math.floor(now * 0.001) % 2 != 0
      let yourParity = el.style.background.startsWith("rgb(255, 0, 0)")
      if (yourParity != myParity) {
        el.style.background = myParity ? "#ff0000" : "#ffff00";
      }
		});

		return function() {
			cancelAnimationFrame(id);
		};
	});
}

return {
	create: create
};

}();
