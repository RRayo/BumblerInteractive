image_angle = direction;

if (bDestroy)
{
	image_alpha *= 0.8;
	vspeed *= 0.8;
	hspeed *= 0.8;
}

if (image_alpha <= 0)
{
	instance_destroy();
}