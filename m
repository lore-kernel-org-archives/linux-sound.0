Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000142DE70A
	for <linux-sound@vger.kernel.org>; Tue,  2 Sep 2025 13:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756818837; cv=none; b=izbXRv3aYwg+iT4Map1Ij81yav5ng4if9JMXXy0zwWomNpH1xEDWx6Yl5UQI2PspezVbrWycLyCHmS8YjynYlPpSMCdtNK7iIOlhNAWbrGehtG83WOIH6eQRw3BMvJRWAHna5h9kPFxEopKvU3rjauyrE8a7ZYF3D1VZHDtF9sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756818837; c=relaxed/simple;
	bh=NEqt1IGUvbJ/KdkgQh5Nd50b7JMGbhzzzDTUt+XhdZs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ULDQde9im5OxbBko+L1uU9y1UHW9EG46dmy67ve3zbCxqW5U+DJHcKLgG09fk1U1lTAbT2XEevd+7NOlr+p8ITkoBbNjv31Q1qkO3N/wnjFVneP0SxhaoPwrCd1TJHgexEHiPdd/L8h8O6wJi7SBImTbWq564Y7uuWh5L3fLVGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kqAiSJDw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kqAiSJDw"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582BGuMj029653
	for <linux-sound@vger.kernel.org>; Tue, 2 Sep 2025 13:13:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jpFrherE2XmJVprlyXeBMsk55/r6EzRcDfzRbz2ysrI=; b=kqAiSJDwvp/y6hbO
	gnWehDFQie2NW4ILklkB500ZvrfwIGFUtJ3Xtxns7TloSYnT2xYYcfLlUqUoXvLb
	5ZLo9whsvBpg2a9Ic0b8krcGEtDAw+Oa/McCJVE5CSTlDr3qzQBiq0suR7yfuPHD
	o/bPxzYa/tBhoc78DRlcA/GKWFQCYmVL52tpi2JBSze2gB+X/G5/xVSqnAVj3eJg
	t9zNXqVO6QYwFibx54f9spb2oPaiF/FGsht9xwVbq1V5CKo3uBzzrwgOj4bnEl7B
	ccNI9JAZstC8xZ4hwu4SUALoRZq3nmCYKgxPRBzD9h12ydgHPy97QGxOENl5qrpY
	LqrvjQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ush2yrtk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 02 Sep 2025 13:13:55 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-544953b4aaeso4079660e0c.2
        for <linux-sound@vger.kernel.org>; Tue, 02 Sep 2025 06:13:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756818833; x=1757423633;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jpFrherE2XmJVprlyXeBMsk55/r6EzRcDfzRbz2ysrI=;
        b=YigvCZacEUw6mad/iGofF3leZVt2X1MVVKIZkvW3z8S4+pPqff5IqQrVNCEPaEmzeY
         z+2vZXwV3+62TQZu7gfVyir4WLCShKUHjWMjhm/xLcRdRcvb4Gxj8wIq2DKKreIyzdOf
         laVfur+2kTDAE8Wvrm/fORvkScYG322dZBt8Hq87dZXnZUxY0k3zrRi8QNuY1Yh6Zg+I
         XoyE3hP9XpFG3QiVAtqe+lptj/DlLb0zw62WP820H4yEwrna9v+w+9J96cMCXBvNpn2j
         /M1/mFWphg59DzR9hFKXGgPYsAnQP9KdijKFzcvaQtmWntf5qGNHqB1rsUr65Xt0wcfQ
         i1lw==
X-Forwarded-Encrypted: i=1; AJvYcCV7gUXDvsGLiBhx9JV/k94SSzmSpFGvVMCatCoMhG9Qf1VZQ4rEaTLW89MjneGOqkv7Ze6oupCFEdceLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKEXm5v2c47ox2/tkLvrbqwne4rhyF1reOsutRe1rLGVkwCCH5
	V2/2cQrR/Gu8WDvDoSySuStBidgc5wWTCdOqSrpZ2P8Y9nuodsOvXh8TeMOEMn8l9SK+67sH8hp
	YXQG0qqe/USpRoCF5gR7udPVIyfU9pL08Vp7q2kashwe8VB795ur38Ea/ijy2Bv66rzyN1DDeKg
	==
X-Gm-Gg: ASbGncsGzF0tczwXo8KxMOqMk9G7AUDc46vBL1nM5ZjKJeWFxDj5dPcOeZk1D4yAHLr
	bj6CyFgHl8PmzYtZtc4pafC8Eouxk51TktdRH2SmSYA86htpUVbXIQZizRyIUwc4GerO1uZ7pUT
	ZKumHiAYUoC6185DkqA5cIp00NoKRXz0Nh8Ml+QD+sNmG4wWXufPrX7j6sgkHPrdp5BY00S2CSX
	8qQ4kWmRNMGfo4wU2yP7ItVwDmq7UmBTH+jjpmM6srEIam+s51y5UfOsxvFUtsWuAcPBV9ZP2u1
	ZbpdhCRiIZfPQKlEj2BmlhZXSkULRH+7+/YKPuEHfniQkWiz1A6qYUZxcWLGvnVL+Bg=
X-Received: by 2002:a05:6122:ca0:b0:542:9c0b:c5be with SMTP id 71dfb90a1353d-544a0196adamr3255257e0c.7.1756818833449;
        Tue, 02 Sep 2025 06:13:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESujcJ1JHETmQv6wfVpXW7wRsuOg0a2I6B4VmJrIPDtHrdqiMJA95vllCOMRuuCKPS/ZBorA==
X-Received: by 2002:a05:6122:ca0:b0:542:9c0b:c5be with SMTP id 71dfb90a1353d-544a0196adamr3255230e0c.7.1756818832930;
        Tue, 02 Sep 2025 06:13:52 -0700 (PDT)
Received: from [192.168.68.118] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3d701622b92sm8368449f8f.58.2025.09.02.06.13.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 06:13:51 -0700 (PDT)
Message-ID: <3c41bc8e-796b-4efe-97cd-03b737f09689@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 14:13:50 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] soundwire: qcom: deprecate qcom,din/out-ports
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, vkoul@kernel.org, conor+dt@kernel.org,
        srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org
References: <20250901195037.47156-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250901195037.47156-5-srinivas.kandagatla@oss.qualcomm.com>
 <20250902-light-vegan-snake-efe03c@kuoka>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250902-light-vegan-snake-efe03c@kuoka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMiBTYWx0ZWRfX1ulo7DnUr0tE
 2aJju2Pk/LKqLlyuyl80IDB5qyMF/LKeuiAmQ9rUcpxdM2m6B4Sdk+lL1CQhrwOKd/iHiuot+5H
 gdG5HXbyiTWA+pcPj0UdL3LngveUQYDah712CDTxamLPkou6bB3D6vJF8ErBGnyaX5viaNVQfjQ
 6pR1ZQpdoLFvufpLh6bc2ILBGOxb2mozNA/NJB8rj5pIWPMwXSwybAjUTbe8yv2/R3/GDNh+wQg
 vrW7Rshkvb2MLoKtjY0/UpWKh6AoKIOvsEEi0yGFOOt2gZVjro3FHwahSS4AzLEdjkAkMWX0AKU
 jkaPlUqCmG+tm10I89jVi6zXzn8SaJN+Z/YgFWXvHzoO0X696FiqFLuV+QYMayhC+bcwpaP0v4Y
 rmGPHaP5
X-Proofpoint-ORIG-GUID: xYaKrqEBL8SOMf_s3RDneFztH_wUxfsN
X-Proofpoint-GUID: xYaKrqEBL8SOMf_s3RDneFztH_wUxfsN
X-Authority-Analysis: v=2.4 cv=M9NNKzws c=1 sm=1 tr=0 ts=68b6ed93 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=SiZq7lb_pfuETCquD7sA:9
 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300032

On 9/2/25 9:38 AM, Krzysztof Kozlowski wrote:
> On Mon, Sep 01, 2025 at 08:50:34PM +0100, Srinivas Kandagatla wrote:
>> Number of input and output ports can be dynamically read from the
>> controller registers, getting this value from Device Tree is redundant
>> and potentially lead to bugs.
>>
>> Remove the code parsing this property along with marking this as
>> deprecated in device tree bindings.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  drivers/soundwire/qcom.c | 134 ++++++++++++++-------------------------
>>  1 file changed, 49 insertions(+), 85 deletions(-)
>>
>> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
>> index 7f19ebba6137..4fa3e1c080ef 100644
>> --- a/drivers/soundwire/qcom.c
>> +++ b/drivers/soundwire/qcom.c
>> @@ -128,7 +128,6 @@
>>  #define MAX_FREQ_NUM						1
>>  #define TIMEOUT_MS						100
>>  #define QCOM_SWRM_MAX_RD_LEN					0x1
>> -#define QCOM_SDW_MAX_PORTS					14
>>  #define DEFAULT_CLK_FREQ					9600000
>>  #define SWRM_MAX_DAIS						0xF
>>  #define SWR_INVALID_PARAM					0xFF
>> @@ -195,6 +194,7 @@ struct qcom_swrm_ctrl {
>>  	int wake_irq;
>>  	int num_din_ports;
>>  	int num_dout_ports;
>> +	int nports;
>>  	int cols_index;
>>  	int rows_index;
>>  	unsigned long port_mask;
>> @@ -202,7 +202,7 @@ struct qcom_swrm_ctrl {
>>  	u8 rcmd_id;
>>  	u8 wcmd_id;
>>  	/* Port numbers are 1 - 14 */
>> -	struct qcom_swrm_port_config pconfig[QCOM_SDW_MAX_PORTS + 1];
>> +	struct qcom_swrm_port_config *pconfig;
>>  	struct sdw_stream_runtime *sruntime[SWRM_MAX_DAIS];
>>  	enum sdw_slave_status status[SDW_MAX_DEVICES + 1];
>>  	int (*reg_read)(struct qcom_swrm_ctrl *ctrl, int reg, u32 *val);
>> @@ -1157,7 +1157,7 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
>>  				       struct snd_pcm_hw_params *params,
>>  				       int direction)
>>  {
>> -	struct sdw_port_config pconfig[QCOM_SDW_MAX_PORTS];
>> +	struct sdw_port_config *pconfig __free(kfree) = NULL;
> 
> That's incorrect usage of __free(), missing constructor.
> 
>>  	struct sdw_stream_config sconfig;
>>  	struct sdw_master_runtime *m_rt;
>>  	struct sdw_slave_runtime *s_rt;
>> @@ -1167,6 +1167,10 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
>>  	int maxport, pn, nports = 0, ret = 0;
>>  	unsigned int m_port;
>>  
>> +	pconfig = kcalloc(ctrl->nports, sizeof(*pconfig), GFP_KERNEL);
> 
> This almost always goes to definition and I do not see anything
> preventing it.
Yes, It can go to the definition.

But does this matter for a single instance of __free? I thought this was
an issue if we have multiple __free() or guard() and __free() the order
of definitions matter.

Will follow the recommendation in v2.

thanks,
--srini
> 
>> +	if (!pconfig)
>> +		return -ENOMEM;
> 
> Best regards,
> Krzysztof
> 

