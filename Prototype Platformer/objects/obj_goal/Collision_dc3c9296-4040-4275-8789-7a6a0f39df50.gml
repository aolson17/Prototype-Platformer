/// @description Advance To Next Room


var sound = audio_play_sound(snd_win,0,0)
audio_sound_gain(sound,global.master_volume*global.sound_volume,0)

room_goto_next()