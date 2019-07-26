/// @description Restart Room

var sound = audio_play_sound(snd_reset,0,0)
audio_sound_gain(sound,global.master_volume*global.sound_volume,0)
room_restart()