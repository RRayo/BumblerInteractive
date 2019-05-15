if (bTackle)
{
	if (!other.bDestroy)
	{
		other.bDestroy = true;
	}
} 
else if (!other.bDestroy)
{
	game_restart();
}