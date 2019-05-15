var CameraX = camera_get_view_x(view_camera[0]);
var CameraY = camera_get_view_y(view_camera[0]);

draw_text(CameraX + 16, CameraY + 8, "Score: " + string(score));