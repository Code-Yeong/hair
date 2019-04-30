package cn.wd.hair;

import android.content.Context;
import android.util.Log;
import android.view.View;
import android.widget.TextView;

import com.amap.api.maps.AMap;
import com.amap.api.maps.MapView;

import io.flutter.plugin.common.MessageCodec;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;

public class BMapViewFactory extends PlatformViewFactory {

    private MapView mapView;
//    BMapViewFactory
    public BMapViewFactory(MessageCodec<Object> createArgsCodec, MapView mapView) {
        super(createArgsCodec);
        this.mapView = mapView;
    }

    @Override
    public PlatformView create(final Context context, int i, Object o) {
        Log.e("status","yes");
        TextView textView = new TextView(context);
        textView.setText("hello world");
        return new PlatformView() {
            @Override
            public View getView() {

                AMap aMap = mapView.getMap();
                Log.e("mapView",aMap.getMyLocation()+"");
                aMap.setMapType(AMap.MAP_TYPE_NORMAL);

                return mapView;
//                return textView;
            }

            @Override
            public void dispose() {
                Log.e("mapView","MapView disposed!");
            }
        };
    }
}