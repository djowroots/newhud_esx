$(function() {

	window.onload = function(e){
		// NUI Callback
		window.addEventListener('message', function(event){
			let item = event.data;

			if(item.setDisplay == true){
				$(".divHud").css('opacity', item.display)
				$("#horario").css('opacity', item.display)
				
				if(item.display == 0.0) $('#imgHud').css({'visibility' : 'hidden'});
				else $('#imgHud').css({'visibility' : 'visible'});
			}
		})
	}

	// Configura o Timezone do Moment.js
	moment.locale('pt-BR');
	// Inicia o tick de horário
	function iniciarHorario() {
		document.getElementById('horario').innerHTML = "<p>" + moment().format(`HH:mm:ss`);
		t = setTimeout(function() {
			iniciarHorario()
		}, 500);
	}
	iniciarHorario();
});
  