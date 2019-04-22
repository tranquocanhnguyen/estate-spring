package com.tranquocanh.service;

import com.tranquocanh.dto.BuildingDTO;

import java.util.List;

public interface IBuildingService {
    List<BuildingDTO> findAll(BuildingDTO buildingDTO) ;
}
