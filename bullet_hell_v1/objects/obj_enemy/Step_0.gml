if (bDestroy)
{
	if (bStartDestroy)
	{
		bStartDestroy = false;
		score += 5;
		audio_play_sound(snd_enemy, 1, 0);
	}
	bScaleDown = true;
}

if (bScaleDown)
{
	image_xscale *= 0.8;
	image_yscale = image_xscale;
	
	if (image_xscale <= 0.1)
	{
		bScaleDown = false;
		bScaleUp = true;
	}
}

if (bScaleUp)
{
	image_xscale *= 1.8;
	image_yscale = image_xscale;
}

if (image_xscale >= 1.5)
{
	image_alpha *= 0.5;
}

if (image_alpha <= 0)
{
	instance_destroy();
}