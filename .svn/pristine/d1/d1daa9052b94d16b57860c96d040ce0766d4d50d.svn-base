package com.atyou.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsRequest;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.http.MethodType;
import com.aliyuncs.profile.DefaultProfile;
import com.aliyuncs.profile.IClientProfile;
import com.atyou.dao.UserInfoMapper;
import com.atyou.dao.UserMapper;
import com.atyou.pojo.User;
import com.atyou.pojo.UserInfo;
import com.atyou.pojo.UserInfoExample;
import com.atyou.pojo.UserInfoExample.Criteria;
import com.atyou.service.UserService;
import com.atyou.util.DateUtil;
import com.atyou.util.UserContext;
import com.atyou.vo.VerifyCodeVO;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	UserMapper userMapper;

	@Autowired
	UserInfoMapper userInfoMapper;
	
	public User selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return userMapper.selectByPrimaryKey(id);
	}

	public List<UserInfo> get(String phone) {
		UserInfoExample example = new UserInfoExample();
		Criteria criteria = example.createCriteria();
		criteria.andPhoneEqualTo(phone);
		return this.userInfoMapper.selectByExample(example);
	}

	//用户注册
	@Override
	public Map<String, String> register(String phone, String identifyCode, String password) {
		/*VerifyCodeVO vc = new VerifyCodeVO();
		System.out.println(vc.getPhone()+"---"+vc.getVerifyCode());
		System.out.println("*************************************");
		System.out.println(phone+"---"+identifyCode+"---"+password);*/
		//检验手机号是都已经注册
		Map<String, String> modeMap = new HashMap<>();
		List<UserInfo> list = this.get(UserContext.getCurrentVerifyCode().getPhone());
		if (list != null && list.size() > 0) {
			modeMap.put("success", "0");
			modeMap.put("msg", "用户已经被注册！");
			return modeMap;
			//System.out.println("用户已经被注册！");
		}else {
			String verifyCode = UserContext.getCurrentVerifyCode().getVerifyCode();
			if (verifyCode.equals(identifyCode)) {
				UserInfo userInfo = new UserInfo();
				userInfo.setCreateTime(new Date());
				userInfo.setStatus("1");
				userInfo.setRole("1");
				userInfo.setPhone(phone);
				userInfo.setPassword(password);
				//System.out.println(phone+"***"+password);
				userInfoMapper.insert(userInfo);
				modeMap.put("success", "1");
				return modeMap;
			}else {
				//System.out.println("验证码不正确！");
				modeMap.put("success", "0");
				modeMap.put("msg", "验证码不正确！");
				return modeMap;
			}
			//System.out.println("可以注册！");
		}
	}


	//验证码业务
	@Override
	public void sendVerifyCode(String phone) {
		//System.out.println("是否执行！");
		//判断当前是否能够发送短信
		//从session中获取最后一次发送短信的时间
		VerifyCodeVO vc = UserContext.getCurrentVerifyCode();
		if(vc==null 
				|| DateUtil.secondsBetween(new Date(), vc.getLastSendTime()) > 60) {
			//正常发送验证码短信
			//1.生成一个验证码
			String verifyCode = UUID.randomUUID().toString().substring(0, 4);
			//2.发送短信
			try {
				//设置超时时间-可自行调整
			    System.setProperty("sun.net.client.defaultConnectTimeout", "10000");
			    System.setProperty("sun.net.client.defaultReadTimeout", "10000");
			    //初始化ascClient需要的几个参数
			    final String product = "Dysmsapi";//短信API产品名称（短信产品名固定，无需修改）
			    final String domain = "dysmsapi.aliyuncs.com";//短信API产品域名（接口地址固定，无需修改）
			    //替换成你的AK
			    final String accessKeyId = "LTAIy9ztz2C7XKkW";//你的accessKeyId,参考本文档步骤2
			    final String accessKeySecret = "eC9OukZsM8uSprC3Cj5eFFT3bKYiTM";//你的accessKeySecret，参考本文档步骤2
			    //初始化ascClient,暂时不支持多region（请勿修改）
			    IClientProfile profile = DefaultProfile.getProfile("cn-hangzhou", accessKeyId,
			    accessKeySecret);
			    DefaultProfile.addEndpoint("cn-hangzhou", "cn-hangzhou", product, domain);
			    IAcsClient acsClient = new DefaultAcsClient(profile);
				// 组装请求对象
				SendSmsRequest request = new SendSmsRequest();
				// 使用post提交
				request.setMethod(MethodType.POST);
				// 必填:待发送手机号。支持以逗号分隔的形式进行批量调用，批量上限为1000个手机号码,批量调用相对于单条调用及时性稍有延迟,验证码类型的短信推荐使用单条调用的方式
				request.setPhoneNumbers(phone);
				// 必填:短信签名-可在短信控制台中找到
				request.setSignName("News新闻");
				// 必填:短信模板-可在短信控制台中找到
				request.setTemplateCode("SMS_133045193");
				// 可选:模板中的变量替换JSON串,如模板内容为"亲爱的${name},您的验证码为${code}"时,此处的值为
				// 友情提示:如果JSON中需要带换行符,请参照标准的JSON协议对换行符的要求,比如短信内容中包含\r\n的情况在JSON中需要表示成\\r\\n,否则会导致JSON在服务端解析失败
				request.setTemplateParam("{\"name\":\"Tom\", \"code\":\""+verifyCode+"\"}");
				//可选-上行短信扩展码(扩展码字段控制在7位或以下，无特殊需求用户请忽略此字段)
			     //request.setSmsUpExtendCode("90997");
			     //可选:outId为提供给业务方扩展字段,最终在短信回执消息中将此值带回给调用者
			     request.setOutId("yourOutId");
			    //请求失败这里会抛ClientException异常
			    SendSmsResponse sendSmsResponse = acsClient.getAcsResponse(request);
			    if(sendSmsResponse.getCode() != null && sendSmsResponse.getCode().equals("OK")) {
			    //请求成功
			    }
				// 3.把手机号，验证码，发送时间装配到vo并保存到session
				vc = new VerifyCodeVO();
				vc.setLastSendTime(new Date());
				vc.setPhone(phone);
				vc.setVerifyCode(verifyCode);
				UserContext.putVerifyCode(vc);
				// System.out.println("测试！");
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("短信发送失败！");
			}
		}else {
			//System.out.println("发送过于频繁！");
			throw new RuntimeException("发送过于频繁!");
		}	
	}
	

}
