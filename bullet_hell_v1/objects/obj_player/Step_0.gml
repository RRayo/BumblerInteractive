// Movement
if (!bTackle)
{
	var HSpeedSign = sign(hspeed);
	hspeed -= HSpeedSign * HorizontalFriction;
	if (sign(hspeed) != HSpeedSign)
	{
		hspeed = 0;
	}

	if (keyboard_check(ord("A")) && !keyboard_check(ord("D")))
	{
		hspeed = -MaxHSpeed;
	}

	if (keyboard_check(ord("D")) && !keyboard_check(ord("A")))
	{
		hspeed = MaxHSpeed;
	}
	
	if (keyboard_check(ord("W")) && !keyboard_check(ord("S")))
	{
		vspeed = -MaxUpSpeed;
	}

	if (keyboard_check(ord("S")) && !keyboard_check(ord("W")))
	{
		vspeed = MaxUpSpeed;
	}
	
	if (keyboard_check_pressed(vk_escape))
	{
		game_restart();
	}


	var InstTileBottom = instance_place(x, y - sprite_height / 2 + 1, obj_tile);

	if (InstTileBottom != noone) && vspeed < 0
	{
		vspeed = min(MaxFallSpeed, InstTileBottom.bbox_top - y + sprite_height / 2);
		//y = InstTileBottom.bbox_top - sprite_height + sprite_yoffset;
	
	}
	
	var InstTileUp = instance_place(x, y + sprite_height / 2 + 1, obj_tile);

	if ((InstTileUp != noone) && vspeed > 0)
	{
		vspeed = min(MaxFallSpeed, InstTileBottom.bbox_top - y - sprite_height / 2);
		//y = InstTileBottom.bbox_top - sprite_height + sprite_yoffset;
	
	}


	var InstTileLeft = instance_place(x - sprite_width / 2 - 1, y, obj_tile);

	if (InstTileLeft != noone && hspeed < 0)
	{
		hspeed = max(-MaxHSpeed, InstTileLeft.bbox_right - x  + sprite_width / 2);
	}

	var InstTileRight = instance_place(x + sprite_width / 2 + 1, y, obj_tile);

	if (InstTileRight != noone && hspeed > 0)
	{
		hspeed = min(MaxHSpeed, InstTileRight.bbox_left - x - sprite_width / 2);
	}


	//vspeed =  min(vspeed, MaxFallSpeed);
	

	// Bullet

	image_angle = point_direction(x, y, mouse_x, mouse_y);

	if (mouse_check_button_pressed(mb_left) && bBullet)
	{
		bBullet = false;
		InstBullet = instance_create_layer(x, y, "Instances", obj_bullet);
		InstBullet.direction = image_angle;
		alarm[0] = BulletCooldown;
		
		audio_play_sound(snd_bullet, 1, 0);
	}

	// Tackle

	if (mouse_check_button_pressed(mb_right))
	{
		if (!bTackle)
		{
			bTackle = true;
			timeline_index = tl_tackle;
			timeline_position = 0;
			timeline_running = true;
			timeline_loop = false;
			
			audio_play_sound(snd_tackle, 1, 0);
		}
	}
}
if (bTackle)
{
	speed -= TackleFriction;
	if (speed <= 0)
	{
		speed = 0;
	}
}