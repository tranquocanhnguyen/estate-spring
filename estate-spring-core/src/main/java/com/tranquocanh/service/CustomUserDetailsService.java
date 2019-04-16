package com.tranquocanh.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.tranquocanh.dto.AuthToken;
import com.tranquocanh.dto.MyUserDetail;
import com.tranquocanh.dto.RoleDTO;
import com.tranquocanh.dto.UserDTO;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private HttpServletRequest request;

    ObjectMapper objectMapper = new ObjectMapper();

    @Override
    public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
        String password = request.getParameter("j_password");
        String token = getToken(userName, password);
        UserDTO userDTO = findByUserName(token, userName);
        if (userDTO == null) {
            throw new UsernameNotFoundException("User not found");
        }
        List<GrantedAuthority> authorities = new ArrayList<>();
        for (RoleDTO item : userDTO.getRoles()) {
            authorities.add(new SimpleGrantedAuthority(item.getCode()));
        }
        MyUserDetail myUserDetail = new MyUserDetail(userDTO.getUserName(), userDTO.getPassword(), authorities);
        myUserDetail.setToken(token);
        BeanUtils.copyProperties(userDTO, myUserDetail);
        return myUserDetail;
    }

    private UserDTO findByUserName(String token, String userName) {
        if (token != null) {
            try {
                DefaultHttpClient httpClient = new DefaultHttpClient();

                HttpGet httpGet = new HttpGet("http://localhost:8081/api/user?username=" + userName);
                httpGet.addHeader("Authorization", "Bearer "+token+"");

                HttpResponse response = httpClient.execute(httpGet);

                int statusCode = response.getStatusLine().getStatusCode();
                if (statusCode >= 200 && statusCode < 300) {
                    HttpEntity httpEntity = response.getEntity();
                    String apiOutput = EntityUtils.toString(httpEntity);
                    return objectMapper.readValue(apiOutput, UserDTO.class);
                }
            } catch (Exception e) {
                return null;
            }
        }
        return null;
    }

    private String getToken(String userName, String password) {
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
