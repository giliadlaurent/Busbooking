<script>
	$j(function(){
		var tn = 'availability';

		/* data for selected record, or defaults if none is selected */
		var data = {
			bus: <?php echo json_encode(array('id' => $rdata['bus'], 'value' => $rdata['bus'], 'text' => $jdata['bus'])); ?>,
			route: <?php echo json_encode(array('id' => $rdata['route'], 'value' => $rdata['route'], 'text' => $jdata['route'])); ?>,
			amount: <?php echo json_encode($jdata['amount']); ?>
		};

		/* initialize or continue using AppGini.cache for the current table */
		AppGini.cache = AppGini.cache || {};
		AppGini.cache[tn] = AppGini.cache[tn] || AppGini.ajaxCache();
		var cache = AppGini.cache[tn];

		/* saved value for bus */
		cache.addCheck(function(u, d){
			if(u != 'ajax_combo.php') return false;
			if(d.t == tn && d.f == 'bus' && d.id == data.bus.id)
				return { results: [ data.bus ], more: false, elapsed: 0.01 };
			return false;
		});

		/* saved value for route */
		cache.addCheck(function(u, d){
			if(u != 'ajax_combo.php') return false;
			if(d.t == tn && d.f == 'route' && d.id == data.route.id)
				return { results: [ data.route ], more: false, elapsed: 0.01 };
			return false;
		});

		/* saved value for route autofills */
		cache.addCheck(function(u, d){
			if(u != tn + '_autofill.php') return false;

			for(var rnd in d) if(rnd.match(/^rnd/)) break;

			if(d.mfk == 'route' && d.id == data.route.id){
				$j('#amount' + d[rnd]).html(data.amount);
				return true;
			}

			return false;
		});

		cache.start();
	});
</script>

