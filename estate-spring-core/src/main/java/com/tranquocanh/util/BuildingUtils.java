package com.tranquocanh.util;

import com.tranquocanh.enums.BuildingType;

import java.util.HashMap;
import java.util.Map;
import java.util.stream.Stream;

public class BuildingUtils {

    public static Map<String, String> getBuildingTypes() {
        Map<String, String> results = new HashMap<>();
        Stream.of(BuildingType.values()).forEach(type -> {
            results.put(type.name(), type.getValue());
        });
        return results;
    }
}
