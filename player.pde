import g4p_controls.*;

GStick joystick;
int facing = 6;
int dirX, dirY;
float px, py;
float dx=0;
float dy=0;
float speed;

//縦のマップ画像の移動範囲の上限を設定する関数
void displayLimY(int limY)
{
      //プレイやーの位置を計算する
      px = (px + dirX * speed);

      //マップの位置範囲制限
      if(dy <= 0)
      {
        dy = 0;
        //プレイやーを移動可能に
        py = (py + dirY * speed);
      }
      if((py <= height/2 && dy < limY - height) || (py > height/2 && dy > 0))
      {
        py = height/2;
        //マップを移動可能に
        dy = (dy - dirY * speed);
      }
      if(dy >= limY - height)
      {
        dy = limY - height;
        //プレイやーを移動可能に
        py = (py + dirY * speed);
      }

      //プレイヤーの移動範囲制限
      if(py >= height)
      {
        py = height;
      }
      if(py <= 0)
      {
        py = 0;
      }
}

//横のマップ画像の移動範囲の上限を設定する関数
void displayLimX(int limX)
{
      //マップの位置範囲制限
      if(dx >= 0)
      {
        dx = 0;
        //プレイやーを移動可能に
        px = (px + dirX * speed);
      }
      if((px >= width/2 && dx > -(limX - width)) || (px < width/2 && dx < 0))
      {
        px = width/2;
        //マップを移動可能に
        dx = (dx - dirX * speed);
      }
      if(dx <= -(limX - width))
      {
        dx = -(limX - width);
        //プレイやーを移動可能に
        px = (px + dirX * speed);
      }
}

/*オブジェクトの当たり判定を定める関数
  px:enable, py:unable, dy:enable, dx:unable*/
void obj_kcl(float left, float right, float sita, float ue)
{
  if(px >= left && px <= right && dy > sita && dy < ue)
  {

    //下面の当たり判定
    if((px >= left && px <= right && dy > sita))
    {
        if((dy - 3) <= sita + 1)
        {
            dy = dy - 3;
        }
    }

    //上面の当たり判定
    if((px >= left && px <= right && dy < ue))
    {
        if((dy + 3) >= ue - 1)
        {
            dy = dy + 3;
        }
    }

    //右面の当たり判定
    if(px + 3 > right)
    {
      px = px + 5;
    }

    //左面の当たり判定
    if(px - 3 < left)
    {
      px = px - 5;
    }
  }
}

/*オブジェクトの当たり判定を定める関数
  px:enable, py:enable, dy:enable, dx:unable*/
void pyobj_kcl(float left, float right, float sita, float ue)
{
  if(px >= left && px <= right && dy >= 0 && dy < ue && py <= sita)
  {
    px = px - dirX * speed;
    py = py - dirY * speed;

    //下面の当たり判定
    if((px >= left && px <= right && py < sita))
    {
        if((py + 3) >= sita - 1)
        {
            py = py + 3;
        }
    }

    //上面の当たり判定
    if((px >= left && px <= right && dy < ue))
    {
        if((dy + 3) >= ue - 1)
        {
            dy = dy + 3;
        }
    }

    //右面の当たり判定
    if(px + 3 > right)
    {
      px = px + 5;
    }

    //左面の当たり判定
    if(px - 3 < left)
    {
      px = px - 5;
    }
  }
}

/*オブジェクトの当たり判定を定める関数
  px:enable, py:enable, dy:enable, dx:unable*/
void pydobj_kcl(float left, float right, float sita, float ue)
{
  if(px >= left && px <= right && py > ue && dy >= sita)
  {
    px = px - dirX * speed;
    py = py - dirY * speed;
    dy = dy + dirY * speed;

    //下面の当たり判定
    if((px >= left && px <= right && dy > sita))
    {
        if((dy + 3) <= sita - 1)
        {
            dy = py - 3;
        }
    }

    //上面の当たり判定
    if((px >= left && px <= right && py > ue))
    {
        if((py + 3) <= ue - 1)
        {
            py = py - 3;
        }
    }

    //右面の当たり判定
    if(px + 3 > right)
    {
      px = px + 5;
    }

    //左面の当たり判定
    if(px - 3 < left)
    {
      px = px - 5;
    }
  }
}

/*オブジェクトの当たり判定を定める関数
  px:enable, py:enable, dy:unable, dx:unable*/
void pxpxobj_kcl(float left, float right, float sita, float ue)
{
  if(px >= left && px <= right && dy >= 0 && py > ue && py <= sita)
  {

    //下面の当たり判定
    if((px >= left && px <= right && py < sita))
    {
        if((py + 3) >= sita - 1)
        {
            py = py + 3;
        }
    }

    //上面の当たり判定
    if((px >= left && px <= right && py > ue))
    {
        if((py + 3) >= ue - 1)
        {
            py = py - 3;
        }
    }

    //右面の当たり判定
    if(px - 3 > right)
    {
      px = px + 5;
    }

    //左面の当たり判定
    if(px + 3 < left)
    {
      px = px - 5;
    }
  }
}

/*オブジェクトの当たり判定を定める関数
  px:enable, py:enable, dy:unable, dx:enable*/
void pypyobj_kcl(float left, float right, float sita, float ue)
{
  if(dx <= left && px <= right && dy >= 0 && py > ue && py <= sita)
  {

    //下面の当たり判定
    if((dx <= left && px < right && py < sita))
    {
        if((py + 3) <= sita - 1)
        {
            px = px - dirX * speed;
            py = py - dirY * speed;
        }
    }

    //上面の当たり判定
    if((dx <= left && px < right && py > ue))
    {
        if((py + 3) <= ue - 1)
        {
            px = px - dirX * speed;
            py = py - dirY * speed;
        }
    }

    //右面の当たり判定
    if(px > right - 3 && px < right + 3)
    {
      px = px + 5;
    }

    //左面の当たり判定
    if(dx + 5 > left)
    {
      dx = dx + 5;
    }
  }
}

/*オブジェクトの当たり判定を定める関数
  px:enable, py:unable, dy:enable, dx:enable*/
void dydyobj_kcl(float left, float right, float sita, float ue)
{
  if(dx <= left && px <= right && dy >= 0 && dy < ue && dy >= sita)
  {

    //下面の当たり判定
    if((px >= left && px <= right && dy > sita))
    {
        if((dy - 3) <= sita + 1)
        {
            dy = dy - 3;
        }
    }

    //上面の当たり判定
    if((px >= left && px <= right && dy < ue))
    {
        if((dy + 3) >= ue - 1)
        {
            dy = dy + 3;
        }
    }

    //右面の当たり判定
    if(px + 3 > right)
    {
      px = px + 5;
    }

    //左面の当たり判定
    if(dx + 3 > left)
    {
      dx = dx + 5;
    }
  }
}

/*オブジェクトの当たり判定を定める関数
  px:unable, py:unable, dy:enable, dx:enable*/
void dxdxobj_kcl(float left, float right, float sita, float ue)
{
  if(dx <= left && dx >= right && dy >= 0 && dy < ue && dy >= sita)
  {

    //下面の当たり判定
    if((dx <= left && dx >= right && dy > sita))
    {
        if((dy - 3) <= sita + 1)
        {
            dy = dy - 3;
        }
    }

    //上面の当たり判定
    if((dx <= left && dx >= right && dy < ue))
    {
        if((dy + 3) >= ue - 1)
        {
            dy = dy + 3;
        }
    }

    //右面の当たり判定
    if(dx - 3 < right)
    {
      dx = dx - 5;
    }

    //左面の当たり判定
    if(dx + 3 > left)
    {
      dx = dx + 5;
    }
  }
}

/*オブジェクトの当たり判定を定める関数
  px:左enable, py:下enable, dy:上enable, dx:右enable*/
void dxpxobj_kcl(float left, float right, float sita, float ue)
{
  if(px >= left && dx >= right && dy >= 0 && dy < ue && py <= sita)
  {

    //下面の当たり判定
    if((px >= left && dx > right && py < sita))
    {
        if((py + 3) <= sita - 1)
        {
            px = px - dirX * speed;
            py = py - dirY * speed;
        }
    }

    //上面の当たり判定
    if((px >= left && dx >= right && dy < ue))
    {
        if((dy + 3) >= ue - 1)
        {
            dy = dy + 3;
        }
    }

    //右面の当たり判定
    if(dx - 3 < right)
    {
      dx = dx - 5;
    }

    //左面の当たり判定
    if(px + 3 < left)
    {
      px = px - 5;
    }
  }
}

/*オブジェクトの当たり判定を定める関数
  px:左enable, py:上enable, dy:下enable, dx:右enable*/
void dxpxdobj_kcl(float left, float right, float sita, float ue)
{
  if(px >= left && dx >= right && dy >= 0 && py > ue && dy >= sita)
  {

    //下面の当たり判定
    if((px >= left && dx > right && dy > sita))
    {
        if((dy - 3) <= sita + 1)
        {
            dy = dy - 3;
        }
    }

    //上面の当たり判定
    if((px >= left && dx >= right && py > ue))
    {
        if((py + 3) <= ue - 1)
        {
            px = px - dirX * speed;
            py = py - dirY * speed;
        }
    }

    //右面の当たり判定
    if(dx - 3 < right)
    {
      dx = dx - 5;
    }

    //左面の当たり判定
    if(px + 3 < left)
    {
      px = px - 5;
    }
  }
}

/*オブジェクトの当たり判定を定める関数
  px:右enable, py:上enable, dy:下enable, dx:左enable*/
void pydxxobj_kcl(float left, float right, float sita, float ue)
{
  if(dx <= left && px <= right && dy >= 0 && py > ue && dy >= sita)
  {

    //下面の当たり判定
    if((px >= left && dx > right && dy > sita))
    {
        if((dy - 3) <= sita + 1)
        {
            dy = dy - 3;
        }
    }

    //上面の当たり判定
    if((px >= left && dx >= right && py > ue))
    {
        if((py + 3) <= ue - 1)
        {
            px = px - dirX * speed;
            py = py - dirY * speed;
        }
    }

    //右面の当たり判定
    if(px + 3 > right)
    {
      px = px + 5;
    }

    //左面の当たり判定
    if(dx + 3 > left)
    {
      dx = dx + 5;
    }
  }
}

/*オブジェクトの当たり判定を定める関数
  px:右enable, py:下enable, dy:上enable, dx:左enable*/
void pydxobj_kcl(float left, float right, float sita, float ue)
{
  if(dx <= left && px <= right && dy >= 0 && dy < ue && py <= sita)
  {

    //下面の当たり判定
    if((dx <= left && px < right && py < sita))
    {
        if((py + 3) >= sita - 1)
        {
            py = py + 3;
        }
    }

    //上面の当たり判定
    if((px >= left && px <= right && dy < ue))
    {
        if((dy + 3) >= ue - 1)
        {
            dy = dy + 3;
        }
    }

    //右面の当たり判定
    if(px + 3 > right)
    {
      px = px + 5;
    }

    //左面の当たり判定
    if(dx + 3 > left)
    {
      dx = dx + 5;
    }
  }
}

void playerMake()
{
    // Draw arrow in current position and rotation
    pushMatrix();
    strokeWeight(1);
    translate(px, py);
    rotate(facing * PI/4);
    fill(255, 200, 200);
    stroke(160, 32, 32);
    beginShape();
    vertex(-20, -10);
    vertex(-20, 10);
    vertex(30, 0);
    endShape(CLOSE);
    fill(160, 32, 32);
    noStroke();
    ellipse(-6, 0, 10, 10);
    popMatrix();
}

public void handleStickEvents(GStick stick, GEvent event) 
{ 
  if (joystick == stick) 
  {
    int pos = stick.getPosition();
    if (pos < 0) // Stick is in rest position?
      speed = 0;
    else 
    { // The stick is not at rest 
      facing = pos;
      dirX = stick.getStickX();
      dirY = stick.getStickY();
      if(keyPressed)
      {
        if(key == 'a')
        {
          speed = 2.5;
        }
        if(key == 'z')
        {
          speed = 3.0;
        }
        if(key == 's')
        {
          speed = 4.0;
        }
        if(key == 'd')
        {
          speed = 5.0;
        }
      }
      else
      {
        speed = 1.5;
      }
    }
  }
}