package cn.wd.hair;

import com.amap.api.maps.MapView;

import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugin.common.StandardMessageCodec;

public final class ViewRegistrant {
    public static void registerWith(PluginRegistry registry, MapView mapView) {
        final String key = ViewRegistrant.class.getCanonicalName();

        if (registry.hasPlugin(key)) return;

        PluginRegistry.Registrar registrar = registry.registrarFor(key);
        registrar.platformViewRegistry().registerViewFactory("BMapView", new BMapViewFactory(new StandardMessageCodec(), mapView));
    }
}