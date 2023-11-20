PImage img1, img2, img3, img4, img5, img6, img7, img8,
        img9, img10, img11, img12, img13, img14, img15, img16, img17;


/*****************************************************************
 時間がなかったため、１階から4階までのエリアの移動手段は全て追加しまし
 たが、５階エリアへの移動手段を追加できませんでした。
 また、一部オブジェクトの当たり判定を追加できませんでした。
*****************************************************************/


public void setup()
{
  size(700, 700);
  img3 = loadImage("floor3.1.jpg");//3階中央エリア
  img4 = loadImage("floor3.2.jpg");//3階中央エリア
  img5 = loadImage("floor3.3.jpg");//3階中央エリア
  img6 = loadImage("floor3.4.jpg");//3階中央エリア
  img7 = loadImage("floor3.5.jpg");//3階中央エリア
  img8 = loadImage("floor3.6.jpg");//3階中央エリア
  img9 = loadImage("3階左.png");
  img10 = loadImage("4階右.png");
  img11 = loadImage("４階中央.png");
  img12 = loadImage("１階左.png");
  img13 = loadImage("２階左.png");
  img14 = loadImage("５階中央.png");
  img15 = loadImage("５階右.png");
  img16 = loadImage("５階左.png");
  img17 = loadImage("４階左.png");

  //ライブラリ
  float ss = 80;
  joystick = new GStick(this, width-ss, height-ss, ss, ss);
  // Change from the default X4 mode (4 position) to the
  // 8 position mode.
  joystick.setMode(G4P.X8);
  strokeWeight(1.5f);
  px = width/2;//プレイヤーの位置
  py = height;//プレイヤーの位置
}

public void draw()
{
  
  //１階左エリアに入ったら
  if(areaNum == 11)
  {
      background(200, 200, 200);
      //マップ画像の表示
      image(img12, dx, (dy - 3758) + height);

      floor1L_kcl();//当たり判定
  }
  
  //２階左エリアに入ったら
  if(areaNum == 21)
  {
      background(200, 200, 200);
      //マップ画像の表示
      image(img13, dx, (dy - 3758) + height);

      floor2L_kcl();//当たり判定
  }

  //3階中央エリアに入ったら
  if(areaNum == 32)
  {
      //マップ画像の表示
      image(img3, dx, (dy - 4469) + height);
      image(img4, dx, (dy - 3769) + height);
      image(img5, dx, (dy - 3069) + height);
      image(img6, dx, (dy - 2369) + height);
      image(img7, dx, (dy - 1669) + height);
      image(img8, dx, (dy - 969) + height);

      floor3M_kcl();//当たり判定
  }

  //3階左エリアに入ったら
  if(areaNum == 31)
  {
      background(200, 200, 200);
      //マップ画像の表示
      image(img9, dx, (dy - 3758) + height);

      floor3L_kcl();//当たり判定
  }

  //4階右エリアに入ったら
  if(areaNum == 43)
  {
      background(200, 200, 200);
      //マップ画像の表示
      image(img10, dx, (dy - 2658) + height);

      floor4R_kcl();//当たり判定
  }

  //4階中央エリアに入ったら
  if(areaNum == 42)
  {
      background(200, 200, 200);
      //マップ画像の表示
      image(img11, dx, (dy - 4469) + height);

      floor4M_kcl();//当たり判定
  }

  //4階左エリアに入ったら
  if(areaNum == 41)
  {
      background(200, 200, 200);
      //マップ画像の表示
      image(img17, dx, (dy - 3644) + height);

      floor4L_kcl();//当たり判定
  }

  //5階右エリアに入ったら
  if(areaNum == 53)
  {
      background(200, 200, 200);
      //マップ画像の表示
      image(img15, dx, (dy - 2658) + height);

      floor5R_kcl();//当たり判定
  }

  //5階中央エリアに入ったら
  if(areaNum == 52)
  {
      background(200, 200, 200);
      //マップ画像の表示
      image(img14, dx, (dy - 4469) + height);

      floor5M_kcl();//当たり判定
  }

  //5階左エリアに入ったら
  if(areaNum == 51)
  {
      background(200, 200, 200);
      //マップ画像の表示
      image(img16, dx, (dy - 3644) + height);

      floor5L_kcl();//当たり判定
  }

  playerMake();//プレイヤーの表示

  sceneCtl();//シーン移動制御
}

