//2階左エリアの当たり判定
void floor2L_kcl()
{
    float wid = 1755 - width;
    float hei = 3758 - height/2;

    displayLimX(1755);
    displayLimY(3758);

    //右端の壁の当たり判定
    pyobj_kcl(610, 700, height - (3758 - 3630), 1880);

    //奥の方の右端の壁の当たり判定
    pydobj_kcl(610, 700, 1880, 0);

    //階段の当たり判定
    //pypyobj_kcl(-700, width - (1755 - 1540), height, 580);

    //円卓の当たり判定
    pydxobj_kcl(-895, width - (1755 - 1540), height - (3758 - 3590), hei - 3340);

    //情報ライブラリーの当たり判定
    pxpxobj_kcl(width - (1755 - 1540), width - (1755 - 1755), height - (3758 - 3758), height - (3758 - 3710));

    //透明な薄いの当たり判定
    dydyobj_kcl(-750, width - (1755 - 1575), hei - 3250, hei - 3235);

    //下の研究室の当たり判定
    dydyobj_kcl(-700 - (1340 - 1055), width - (1755 - 1520), hei - 3151, hei - 1542);
    
    //円卓の当たり判定
    dydyobj_kcl(-700 - (1250 - 1055), width - (1755 - 1540), hei - 1360, hei - 1110);

    //薄い壁の当たり判定
    dydyobj_kcl(-700 - (1055 - 1055), width - (1755 - 1521), hei - 1035, hei - 940);

    //上の横階段の当たり判定
    //dydyobj_kcl(-700 - (1055 - 1055), 368, hei - 1542, hei - 1406);

    //上の研究室の当たり判定
    pydxxobj_kcl(-700 - (1055 - 1055), width - (1755 - 1520), hei - 940, 0);

    //机１の当たり判定
    dxdxobj_kcl(-750, -850, hei - 3120, hei - 3015);

    //机２の当たり判定
    dxdxobj_kcl(-750, -850, hei - 2960, hei - 2850);

    //机3の当たり判定
    dxdxobj_kcl(-750, -850, hei - 2790, hei - 2680);

    //机4の当たり判定
    dxdxobj_kcl(-750, -850, hei - 2560, hei - 2450);

    //机5の当たり判定
    dxdxobj_kcl(-750, -850, hei - 2390, hei - 2270);

    //机6の当たり判定
    dxdxobj_kcl(-750, -850, hei - 2245, hei - 2175);

    //机7の当たり判定
    dxdxobj_kcl(-750, -850, hei - 2080, hei - 1960);

    //机8の当たり判定
    dxdxobj_kcl(-750, -850, hei - 1910, hei - 1800);

    //左下壁の当たり判定
    dxpxobj_kcl(0, -700, 570, 92);

    //左上壁の当たり判定
    dxpxdobj_kcl(0, -700, 160, 0);

    //上記二つの壁の間の当たり判定
    dxpxdobj_kcl(0, -230, 160, 92);

}