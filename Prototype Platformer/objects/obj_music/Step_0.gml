
if !audio_is_playing(msc_main){
	music_playing_id=audio_play_sound(msc_main,0,true)
}





audio_sound_gain(music_playing_id, global.master_volume*global.music_volume, 0)
