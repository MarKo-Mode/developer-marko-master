setInterval(function () {
    var name = (localplayer.getVariable('REMOTE_ID') == undefined) ? `Не авторизован` : `Игрок №${localplayer.getVariable("REMOTE_ID")}`;
	mp.discord.update('ReplayRP-1.1 RolePlay', name);
}, 10000);