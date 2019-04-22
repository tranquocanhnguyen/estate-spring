package com.tranquocanh.service.impl;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.tranquocanh.dto.BuildingDTO;
import com.tranquocanh.dto.MyUserDetail;
import com.tranquocanh.service.IBuildingService;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.EntityUtils;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Service
public class BuildingService implements IBuildingService {

    ObjectMapper objectMapper = new ObjectMapper();

 //   private MyUserDetail myUserDetail;
//    String my = myUserDetail.getToken();
    @Override
    public List<BuildingDTO> findAll(BuildingDTO buildingDTO) {
        DefaultHttpClient httpClient = new DefaultHttpClient();
        try {
            HttpPost httpPost = new HttpPost("http://localhost:8081/api/building");
            httpPost.setHeader("Content-Type", "application/json ");
            StringEntity stringEntity = new StringEntity(objectMapper.writeValueAsString(buildingDTO));
            httpPost.setEntity(stringEntity);
            HttpResponse response = httpClient.execute(httpPost);
            int statusCode = response.getStatusLine().getStatusCode();
            if (statusCode >= 200 && statusCode < 300) {
                HttpEntity httpEntity = response.getEntity();
                String apiOutput = EntityUtils.toString(httpEntity);
                List<BuildingDTO> buildingDTOS = Arrays.asList(objectMapper.readValue(apiOutput, BuildingDTO[].class));
                return buildingDTOS;
            }
        } catch (Exception e) {
            return null;
        }
        return null;
    }
}
