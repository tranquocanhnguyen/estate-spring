package com.tranquocanh.util;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.tranquocanh.dto.AuthToken;
import com.tranquocanh.dto.UserDTO;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import org.springframework.stereotype.Component;

@Component
public class GetTokenUtils {
    ObjectMapper objectMapper = new ObjectMapper();
    public String getToken(String userName, String password) {
        DefaultHttpClient httpClient = new DefaultHttpClient();
        try {
            HttpPost httpPost = new HttpPost("http://localhost:8081/authentication");
            httpPost.setHeader("Content-Type", "application/json");
            UserDTO userDTO = new UserDTO();
            userDTO.setUserName(userName);
            userDTO.setPassword(password);
            StringEntity stringEntity = new StringEntity(objectMapper.writeValueAsString(userDTO));
            httpPost.setEntity(stringEntity);
            HttpResponse response = httpClient.execute(httpPost);
            int statusCode = response.getStatusLine().getStatusCode();
            if (statusCode >= 200 && statusCode < 300) {
                HttpEntity httpEntity = response.getEntity();
                String apiOutput = EntityUtils.toString(httpEntity);
                return objectMapper.readValue(apiOutput, AuthToken.class).getToken();
            }
        } catch (Exception e) {
            return null;
        }
        return null;
    }
}
