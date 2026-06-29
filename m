Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A346D2DAFBB
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 05:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782710598; cv=none; b=fovfDcvK3e+gqVTaaaauthIM4wsVPMUdG7kzs4I7WNqzSjEEPsr7htuYwtdhFvSqJsFRwUkXGm5l8DcA3wo9Pi2gTvnjLIGq8PojBoLFzmFDfBcXUhWKD8y1onOdo3jPBqKwnotuU9ZPoEl0pZ/8JZH8rdT9uHsCngFpEIjio/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782710598; c=relaxed/simple;
	bh=ZxqfMVDg3FWeOpe+56ZRiDWXBu8hxTAQ+YpZ4xQsA5o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n5mR4PGAD4O9IHxuYLvQ3wRDKLDYkx553o+Y0IfiHySEgCcVDV8F8GUXCi67eS867vHOCiUXmwlcoYBYyRjfpGD47n/fBkXM4JJxcrQ07ZjEmfrJIPDwyr/siBEFN8f6e+xXisaRs7FHR4Ea+nTV4jOiNhed13aIR1GObh07LNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nKv15rIA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kQrGs6we; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nKv15rIA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kQrGs6we"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NOLq1766937
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 05:23:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cu36DmfqEkFszFBjI/w/JiRPAOrfBwPdCWBBCaxyZ1A=; b=nKv15rIAd8eiPma+
	Z2C/yaUcZrVUsUBqftISqyK2WzWM/2uOaBt+BwSqrcbnfKik5mu19W3hOg5FG0bP
	WqVhG6pW1gGYsTDGz0FRm7K+hbiI5DF8Y2LoZpEtm5dDFjcKg7wGJJH46BHsDtjT
	wm7ihNakcGvFD2KqzDIj4sgl/iwWEyU8U8nuNmpnwTswGPBLcnexub+YeijjhtyB
	JGC3DTDVHu/Yi3LOYycYmwl7TD2WAvletgksW/qZRgz+0AllpoUDog8pgQ1OHcDK
	tWNDEwOItWXh5iBZ1Fne2QSBKxWKY7pdl+MlmrDkBCyy2VKPz77ghguGVkYd4kgB
	rZiebw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f270a4n8q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 05:23:14 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c9e994869aso4399725ad.0
        for <linux-sound@vger.kernel.org>; Sun, 28 Jun 2026 22:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782710594; x=1783315394; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cu36DmfqEkFszFBjI/w/JiRPAOrfBwPdCWBBCaxyZ1A=;
        b=kQrGs6webdMBF/KX34hKylACdYKeXtDl3kw6MnsWWe0JhBa2vqDO09IR57KeIzhoRA
         cyd9qjy76WSGW2ZZ/cR+zW8qHHtOUuoGo1/FHHJQNK/xcqFlegyVf/ghPnxEx3hBWr3u
         emneoohXGf/eq1nkQ4bNQPUQT4xJc+V2aPuaSnXdd06vqsTpPmdLLqVt+G3vRxNzQN6j
         pNESRDTcWKO+b6bkT6oW092kE0nN19EW6NSGl4Pe7u2NLDfA+/OQF4eUYcnGcdtMZQfx
         +k4mjSiZl32zftgXIvNcX2aF4sN6QmeSm99QEfEu6ikegrnnmjf9q/9FaMzPngqtPK6c
         SA7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782710594; x=1783315394;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cu36DmfqEkFszFBjI/w/JiRPAOrfBwPdCWBBCaxyZ1A=;
        b=gXoybz6f5rcyuOqbJ1Ls3VHxrx6CJ+600YaJN6sabDred27hCwLLAVbvA020nSBwTK
         ZfKzxa70CvkYKQn84mWKwL2D1GSDdtxrJnxHMVNN6d9j9IXsIBsZXcl4x26LPIpOya2B
         O4/vTmai8xhp5dl9xQ15brF5AhRtGGhqKn2UAcTzSCc/JKmCGCU6Y0MKPak6GmiZ6V1y
         iVfo8mzAVcrojzv3eQEOID4TDWk7WFZe270ccb1X0+2CbYbIgWVci5WMzgHkLIWnPjxA
         eTsqIJ5RLFlIb1YCk5Z/9ZsqK+0woEVm/14jJmeRRZrMQTVLUok1r3ASbYBRe1w1TQXm
         Jsiw==
X-Gm-Message-State: AOJu0YwAm8P7xCPJOcwnzpKfOWct4o+mNC0MvUA9nr6KEi1tQYz+RyPX
	rIXzzLSaIug75PA/b/vlOL0jwrdRnlOt8w6eQ7vvCS4JZD0IKzP9KFmQWzODZOkO8Xl5OEPkrl2
	xqkGumQlLxQBYvjHjjJp43ICliqz8MDUYqf2i5vfNr6JGvF02Fr668FGI5mO85Op9Ig==
X-Gm-Gg: AfdE7cngrSi+0p+1E5keqH7PQuZPDEY9aehmFw6fBcJdQDCEYIQc2VwfrhsYVqL5jg3
	5VFvu/tkZH2rF086ZFRhvNGV6GgSqhMNICi516xpDIR4RauVwnVzEX7CWoUo3rSDh2TsW22bxKj
	7wNeHIJ3aD1Nz4hfwmOOvhG8Iyyr0x8J8W4m50/4FXJ7PCgH6beAxGKzLwnDNYRlpC4mHiOqCrB
	U8rkY7J3AW6xAOLqNO6SitLh01jj/GUj/DN0145jbLNcnmUzrAusvqdoXGJUJva3QA41FgIn54q
	whpdPqHI2AUuQSwu//iqPUm/tv8Bjjvm3Cd3Njo7nlI1g2+x9Z5xmh/wBKVo+/qbOHwzpsbzrCh
	dJoIht/hG+eDWTl30OmWiOFZ/7vNh1XpvnTjVkqaZyJOtKqbm+A==
X-Received: by 2002:a17:903:4b03:b0:2c9:deec:f564 with SMTP id d9443c01a7336-2c9deed0010mr38516565ad.13.1782710594237;
        Sun, 28 Jun 2026 22:23:14 -0700 (PDT)
X-Received: by 2002:a17:903:4b03:b0:2c9:deec:f564 with SMTP id d9443c01a7336-2c9deed0010mr38516445ad.13.1782710593804;
        Sun, 28 Jun 2026 22:23:13 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c9cd6916e3sm29479155ad.40.2026.06.28.22.23.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 22:23:13 -0700 (PDT)
Message-ID: <1aa30528-6cec-41cd-9289-a3979c989740@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:53:08 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/8] arm64: dts: qcom: shikra: Add gpr node
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pratyush Meduri <mpratyus@qti.qualcomm.com>
References: <20260616201315.2565115-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260616201315.2565115-4-mohammad.rafi.shaik@oss.qualcomm.com>
 <7ce8356f-ec09-41e2-a57d-60d20a08e850@kernel.org>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <7ce8356f-ec09-41e2-a57d-60d20a08e850@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA0NCBTYWx0ZWRfX9OG/vBJThi5j
 3QpSXi86bIM068dGpJ+XkBa0eO7PZBG7SEAGD2GLrXDsefK97cW7X1Dnfj1vFNRVNcPnq3wj1of
 pTgnamFU1oYUAJBDVVjFVhmQ2XIEW2vsjJJu+ZOHa+n5ScwsldVNwe65JUpKk5xW+80oDXvBV2s
 NnCZj+PAc7uvCEzfFCKvTbBcvEDtoyhxEgqO+37Os2FOtVU8+w/4sJRb2DvwU60Ev9IVjXn+pww
 YnjUnnCKTGhZtPQGm0Gc6ht0/QNxQBdn6OUrtxFY1XxiEJOBP9I/oWpaGEdnPphf4HYh43Y+4jP
 DisShCspI4lc1be4WLjnGZpvrHNyUfym4LGWigBJBcNgo4cf4kv+eygbMQcOgj93A5nR26rsFrS
 wpsggL//N8SPSXW6WlbpmJCWUWS3QbH/RofwiUI7IpykeX49cjUNm1dI6BQKBVIYNzWJlC+59XM
 DzWLH4rHSVaJnBK0gwQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA0NCBTYWx0ZWRfX+yzbgK+TUkPr
 8Qc8x8nyfYbp3MGgHwmtGjKWP7q8B0uYBM9dfRaBcsNugekdAQMuj5SGpOXXWfz8uydgZSOw4mX
 KR7MHlSfGLldT5CxYofjZ5BUIwa6IOs=
X-Proofpoint-GUID: Kq2xuahANJs3ChphGGic9iMvG4wl9WYl
X-Proofpoint-ORIG-GUID: Kq2xuahANJs3ChphGGic9iMvG4wl9WYl
X-Authority-Analysis: v=2.4 cv=Fe4HAp+6 c=1 sm=1 tr=0 ts=6a420142 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=P-IC7800AAAA:8 a=KLxTuU9TmGYBU-aeN2AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290044



On 6/22/2026 7:14 PM, Krzysztof Kozlowski wrote:
> On 16/06/2026 22:13, Mohammad Rafi Shaik wrote:
>> Add GPR(Generic Pack router) node along with
> 
> Missing spaces before (.
> 
>> APM(Audio Process Manager) and PRM(Proxy resource
>> Manager) audio services.
> 
> 
> Please wrap commit message according to Linux coding style / submission
> process (neither too early nor over the limit):
> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597
> 

Thanks, I’ll fix the spacing and update the commit message to follow 
Linux coding style and wrapping guidelines.

> 
>> @@ -1851,6 +1854,42 @@ glink-edge {
>>   				mboxes = <&apcs_glb 12>;
>>   				qcom,remote-pid = <1>;
>>   				label = "mpss";
>> +
>> +				gpr: gpr {
>> +					compatible = "qcom,gpr";
>> +					qcom,glink-channels = "modem_apps";
>> +					qcom,domain = <GPR_DOMAIN_ID_MODEM>;
>> +					qcom,intents = <200 20>;
>> +					#address-cells = <1>;
>> +					#size-cells = <0>;
>> +
>> +					q6apm: service@1 {
>> +						compatible = "qcom,q6apm";
>> +						reg = <GPR_APM_MODULE_IID>;
>> +						#sound-dai-cells = <0>;
>> +
>> +						q6apmbedai: bedais {
>> +							compatible = "qcom,q6apm-lpass-dais";
>> +							#sound-dai-cells = <1>;
>> +						};
>> +
>> +						q6apmdai: dais {
>> +							compatible = "qcom,q6apm-dais";
>> +							qcom,vmid = <QCOM_SCM_VMID_LPASS
>> +								     QCOM_SCM_VMID_MSS_MSA>;
> 
> I don't understand what is happening here.
> 

Apologies for the confusion. I will update the commit description in the 
next revision to clearly explain the use of vmid,

> Other patch made a change like:
> 
> -qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
> 
> But even here you do not have it.
> 
> I don't understand what is happening here, but for now it looks that
> this patchset is incorrect and incomplete.
> 

I will also incorporate that change directly into this patchset to avoid 
confusion caused by multiple parallel threads, and ensure everything is 
consistent and complete here.

Thanks & Regards,
Rafi.

>> +						};
>> +					};
>> +
> 
> 
> Best regards,
> Krzysztof

