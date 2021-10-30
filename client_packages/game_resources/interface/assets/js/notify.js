function notify(type, layout, message, time) {
    var types = ['alert', 'error', 'success', 'information', 'warning'];
    var layouts = ['top', 'topLeft', 'topCenter', 'topRight', 'center', 'centerLeft', 'centerRight', 'bottom', 'bottomLeft', 'bottomCenter', 'bottomRight'];
    var images = ['<i class=""><div class="border"></div>' + '' +
        '<img src="package://game_resources/interface/assets/images/notify/error.png" width="25px">Ошибка! </i></i>',
        '<i class=""><div class="border"></div><img src="package://game_resources/interface/assets/images/notify/error.png" width="25px">Ошибка! </i>',
        '<i class=""><div class="border"></div><img src="package://game_resources/interface/assets/images/notify/success.png" width="25px">Успешно! </i></i>',
        '<i class=""><div class="border"></div><img src="package://game_resources/interface/assets/images/notify/info.png" width="25px">Информация! </i>',
        '<i class=""><div class="border"></div><img src="package://game_resources/interface/assets/images/notify/warning.png" width="25px" >Предупреждение! </i>']
    message = '<div class="text">'+images[type]+message+'</div>';
    new Noty({type: types[type], layout: layouts[layout], theme: 'fivestar', text: message, timeout: time, progressBar: true, animation: {open: 'noty_effects_open', close: 'noty_effects_close'}}).show();
}

