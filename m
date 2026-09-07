Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602842D0C63
	for <linux-sound@vger.kernel.org>; Mon,  7 Sep 2026 13:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788788012; cv=none; b=atWtIm68k4UKKx1Ltv5tXFprBSQsbnzhMm+z1EpshdoF+vrwevPT2/xGvfYYBT+OEF0f6wx0K1IG+lHHnmmnCbQlZz2rGU5XowkLISX05Q3Ab8+jTeQfRvnQlzb3HjdA4vBmHuUjZjkhJBCdUJj2zifYCHK+tHTMj33PEvTBTrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788788012; c=relaxed/simple;
	bh=UGpEwHE73K8JUHx8prAb89bZKHDFXF0E6NVwybBROg0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M/dLizsrSOqktt9SS4dtmKBlEbAmRi42/N4DFvLTBzLkAB0NTwUn3yAQluy5IbSeb0hUGI5lozIh44ZWsxZpWGcaFqxG2k2y1+Mw3DTaqYuw7bhIds5lMYEx6sfvMehhd4HcdaRMBcB88cdbwdLI28+wxteggGOaTXGebssw6wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F0YZN3w/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IUWmt/oO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F0YZN3w/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IUWmt/oO"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AmwfM810024
	for <linux-sound@vger.kernel.org>; Mon, 7 Sep 2026 13:33:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WU8hu9+Mpo6BhUGuNxrAU/OvDkc6gH+9dBYerOzVkXc=; b=F0YZN3w/fjWzYsm6
	3R/9wc8HSEX9puNtQm9Jlz523qRpJW917883JGtIVWjiswIWAsU4y9ByaXBdOL/K
	J3c0G3Pw602FFesdPLSQbC8y6AGV90jcEfPCQNC04xO5ZW3ctKG8HqDuBLsVee4q
	/Clpxdtn9Rv1ToEbE41U7tPvF73xWsj6GO9hnQLdA4m333SMGn7njkhIPxeWlQeA
	1fWeQggmM9ufAtVTNwv4MsEXXaCrogb4ySaads174FYv40XnO7x4e4DfbtfMbrst
	P8r2aJe+oIqSPDN+FpFDnOGcajCGohVxSPeOg7+o5EpigcoLPr/DOWk0RqkjfYx6
	45TIBg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghrua9kmv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 07 Sep 2026 13:33:30 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7475c666b20so3469148137.3
        for <linux-sound@vger.kernel.org>; Mon, 07 Sep 2026 06:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788788010; x=1789392810; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WU8hu9+Mpo6BhUGuNxrAU/OvDkc6gH+9dBYerOzVkXc=;
        b=IUWmt/oOZDlG85JTstSuCm/j8R4aXhdo42JP+ROJoTzm28UewC5IxIpvMY+9fedZSW
         veXkk/WhhUM7vzHEotR7xkwm3P5cKcA7QOM5cAVq69JFxGAjwuh1Bl+9WqGgu/18t9Bx
         1TGrfS4EaTkFRPUFoxBLliM5VHN7gkxcKO96AZNk+kRwViwKQj0c0/1t5a3M6xzhMKWv
         8ZaEs4Guf5CoeVqeYbRA5itfUEmRLQAtXXd34/WKdDhGsjtiRW917krTWh732y1cUDcZ
         Ixp7BU8ewX65tBAKbfDlf7LOkXT23KHCYapiaCCp88R3Mgei4FBz4Fl6R79ZKVNuLCfm
         Ep5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788788010; x=1789392810;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WU8hu9+Mpo6BhUGuNxrAU/OvDkc6gH+9dBYerOzVkXc=;
        b=QC0iGovCtDple5Kgj0AFw3wIzGw/6gIYH0TXVbrGa1/tdnM7LzdtSlSqZElZEqCnVd
         ZTt68RSObC4fbpzRXfqoTNATpRBk8+pXeuVV3ftrB9GdgvIMIL1F/xVPFkPD0nlzYfZE
         GRnqeLMHOI/6XKqNvVVlunOoMCCsL3KmNim8+oyfMYgdGrXZeXggv6BRzlvifOEQY7ef
         74OB4J3cGJHe2rkWN1v5A/yfVuH1tmkU6A8adqnqJp3pEX4RkQTLJNMt+NgvYjNR9gCA
         x6zZuJO6MaMFBZPBiUM7j+Svz8Lcktn/VYUEPtreZTafSoWIUuU4/WdoRpxEW5CiI2Bn
         m/0Q==
X-Forwarded-Encrypted: i=1; AKwUvBzokVvwjNsP8BIvidK+j/AhplfI2xs0XKBiAowYtmGp7rVDnxEuqhEojq4EZ9WrGH+VZT/7XY36K0COuQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nm8xGVA5iTvEPoWc+MVCA+0UFEw7rCZ9T8LUWpBPUAR7ycb341
	2Pte1DvZPOV5qKFXz4fIZ0ZfwJu6Rycj5Ur6BuPTWhcTmf4+nXyyOmI1wi6EMyK5GkiFrylySJ1
	PxeNib3ZrYnIx5nyCq/ypd4zDdpSKAoUtQJ1e8CpKtRjghnmzEllEGezeR4mAzhSTrA==
X-Gm-Gg: AYBFou25a7PK7hgW3dX9//bgZWdUde9qnITnBJRkjxN56XT3Dw6GxlraudBrcypAoD+
	QFCUsW2jTqe/ZZ4VAf1Qs7ePlDpq+7tbcKdF/Om4X9AQ15IoY2lx0HXtHeuyxLqRw/NNZTb2u/x
	vI/xtq3jmpX512GYpAbN7TyRQDxjArKTrY8qL3ewJFPQW/WGJKOHByAP0WdCHkE5GNfsP5B9Zv7
	fI9/iTx2fmq66BKJ0psShVGWkZM5PZyFFBSsR4z4BHXjqvIcyFpTViv/Fp9GS1Q0r/FrF1duf3a
	3tPNy61oHg1re9bwF75NB/OSm0k26O0g9/6J7REYLZe/WXLIsXZI5BB0i/u9XrU9vVjo82lwgLe
	muMTBv0HIZ8uNoEXJsrvNtvvIc6g=
X-Received: by 2002:a05:6102:578e:b0:778:4fe0:8297 with SMTP id ada2fe7eead31-78a4aa70e09mr10723872137.11.1788788009698;
        Mon, 07 Sep 2026 06:33:29 -0700 (PDT)
X-Received: by 2002:a05:6102:578e:b0:778:4fe0:8297 with SMTP id ada2fe7eead31-78a4aa70e09mr10723851137.11.1788788009192;
        Mon, 07 Sep 2026 06:33:29 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49cfd3f815bsm222288685e9.4.2026.09.07.06.33.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 06:33:28 -0700 (PDT)
Message-ID: <8c5ac974-f004-42cd-90fe-3611fd8daef0@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 14:33:27 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/11] ASoC: SDCA: add hw_ops with hw_init hook
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela
 <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Takashi Iwai <tiwai@suse.com>,
        Faiz Nabi Kuchay <fkuchay@oss.qualcomm.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260907083727.733705-5-srinivas.kandagatla@oss.qualcomm.com>
 <603a67c1-dcc6-469f-9420-5ffbf55000bf@linux.dev>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <603a67c1-dcc6-469f-9420-5ffbf55000bf@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _Q0NUwonJecbsnKhA0Yam2B4BBdgaHdx
X-Authority-Analysis: v=2.4 cv=U+aiy+ru c=1 sm=1 tr=0 ts=6a9ebd2a cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=wW6vim8a_ILquhf3CB0A:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: _Q0NUwonJecbsnKhA0Yam2B4BBdgaHdx
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE1MCBTYWx0ZWRfX3AbPcTT2tBwM
 3tpWHzQXeMVUS54+4Q4VAVRmBXSacFwL1c7q5vMWoodLQf0hkydErkR180yCoHm/vOlkGFrpxC9
 uATMUJJs/n2VPKKKxGFdrdLmM0XdT7g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE1MCBTYWx0ZWRfXzByHsfhxDIe1
 FeghKzq7nx1NO1+iooG7agHIT+4YRO3E5FbOnSLyOJ+ePdmAl25yo2CFlc1AVatCquAeoy12V3B
 jp84sJafoEHWIQz07NtEL00wLgwLM6MVUb4LKnt8LasNq9eCHqsEt5jRUW68Zp5q5AsejsyJx8Q
 Ldn9/acerNRdBJSNjQaPxIcA2pF4jyVd/X4zqN+MTGxiBfcVbIyhg7GPmJJdMIXVkTGJUH0rvWS
 AtjpfWNP7CPp2cxJyK/fNHSNt4BPOx+zH+FJtR2zym21lVr8jo2a72zSHFBf7uK933vKhO9LwCu
 u46ASJfSGPaOMXmMoBYuQkU1O5hRXTm0+pXnOW8UAcXF1NcdlYxqW++azYXmCI3D336cXiiwfIg
 0UsuYIPWQr7MQTFoE2hW5lziamHGErXqPXkpkrDqxDhgb66AjZV/6JMd1YeTm35bVrIIH+idnpG
 NwWkmKfpTGswQRB6H7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070150

On 9/7/26 12:29 PM, Pierre-Louis Bossart wrote:
> On 9/7/26 10:37, Srinivas Kandagatla wrote:
>> Add struct sdca_class_hw_ops with a hw_init callback that runs from
>> sdca_class_probe() before the class regmap is created.  Codec drivers
>> use it to enable supplies, toggle reset GPIOs and program initial
>> vendor register state.
> 
> It'd be good to clarify when this hw_init() is supposed to run. Probe
> and hardware being available are usually two different things. I think
> this relies on a behavior at the device level where the function
> subdevices are only created after SoundWire device enumeration.

This callback is now removed in v3 and using probe to do most of it.

--srini
> 
> Also the 'hw_init' naming could be confusing, this is used in many codec
> drivers to track if the hardware has previously been initialized.
> 
>> sdca_class_probe() gains an optional const struct sdca_class_hw_ops *
>> argument (NULL for pure-generic SDCA parts) and stashes it on
>> sdca_class_drv for later use.
>>
>> No functional change for the built-in class_sdw_driver, which passes
>> NULL.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  include/sound/sdca_class.h  | 17 ++++++++++++++++-
>>  sound/soc/sdca/sdca_class.c | 15 +++++++++++++--
>>  2 files changed, 29 insertions(+), 3 deletions(-)
>>
>> diff --git a/include/sound/sdca_class.h b/include/sound/sdca_class.h
>> index c6063f22be7a..3342937d09fd 100644
>> --- a/include/sound/sdca_class.h
>> +++ b/include/sound/sdca_class.h
>> @@ -20,6 +20,17 @@ struct regmap;
>>  struct sdw_slave;
>>  struct sdca_function_data;
>>  
>> +/**
>> + * struct sdca_class_hw_ops - optional codec hardware callbacks
>> + * @hw_init: enable supplies, toggle reset, etc.  Runs from sdca_class_probe()
>> + *           before the class regmap is created and before the slave is
>> + *           ATTACHED; callers needing bus I/O must sdw_slave_wait_for_init()
>> + *           first.
>> + */
>> +struct sdca_class_hw_ops {
>> +	int (*hw_init)(struct sdw_slave *slave);
>> +};
>> +
>>  struct sdca_class_drv {
>>  	struct device *dev;
>>  	struct regmap *dev_regmap;
>> @@ -27,6 +38,8 @@ struct sdca_class_drv {
>>  
>>  	struct sdca_interrupt_info *irq_info;
>>  
>> +	const struct sdca_class_hw_ops *hw_ops;
>> +
>>  	struct mutex regmap_lock;
>>  	/* Serialise function initialisations */
>>  	struct mutex init_lock;
>> @@ -35,7 +48,9 @@ struct sdca_class_drv {
>>  
>>  /* Library helpers used by codec-specific SDCA SoundWire drivers. */
>>  int sdca_class_read_prop(struct sdw_slave *sdw);
>> -int sdca_class_probe(struct sdw_slave *sdw, struct sdca_class_drv *drv);
>> +int sdca_class_probe(struct sdw_slave *sdw,
>> +		     struct sdca_class_drv *drv,
>> +		     const struct sdca_class_hw_ops *hw_ops);
>>  void sdca_class_remove(struct sdca_class_drv *drv);
>>  
>>  /*
>> diff --git a/sound/soc/sdca/sdca_class.c b/sound/soc/sdca/sdca_class.c
>> index b952fa6eb802..374de7d9e0b5 100644
>> --- a/sound/soc/sdca/sdca_class.c
>> +++ b/sound/soc/sdca/sdca_class.c
>> @@ -153,6 +153,8 @@ static void class_boot_work(struct work_struct *work)
>>   *       allocation and sets its own dev_set_drvdata() -- the framework
>>   *       does not touch drvdata.  Typically embedded in the codec's own
>>   *       priv struct so codec drivers can keep per-slave state.
>> + * @hw_ops: optional device-specific hw_ops (may be NULL for pure-generic
>> + *          SDCA parts that need no quirks)
>>   *
>>   * Codec-specific SoundWire drivers call this from their .probe after
>>   * allocating a struct sdca_class_drv (usually embedded in their own
>> @@ -160,7 +162,9 @@ static void class_boot_work(struct work_struct *work)
>>   * sdca_class_drv fields, sets up the class regmap, and queues the
>>   * deferred boot work.
>>   */
>> -int sdca_class_probe(struct sdw_slave *sdw, struct sdca_class_drv *drv)
>> +int sdca_class_probe(struct sdw_slave *sdw,
>> +		     struct sdca_class_drv *drv,
>> +		     const struct sdca_class_hw_ops *hw_ops)
>>  {
>>  	struct device *dev = &sdw->dev;
>>  	struct regmap_config *dev_config;
>> @@ -178,9 +182,16 @@ int sdca_class_probe(struct sdw_slave *sdw, struct sdca_class_drv *drv)
>>  
>>  	drv->dev = dev;
>>  	drv->sdw = sdw;
>> +	drv->hw_ops = hw_ops;
>>  	mutex_init(&drv->regmap_lock);
>>  	mutex_init(&drv->init_lock);
>>  
>> +	if (hw_ops && hw_ops->hw_init) {
>> +		ret = hw_ops->hw_init(sdw);
>> +		if (ret)
>> +			return dev_err_probe(dev, ret, "hw_init failed\n");
>> +	}
>> +
> 
> nit-pick: should the INIT_WORK be moved higher before this hw_init()? It
> has nothing to do with regmap and we'd lose the requirement that
> hw_init() be run before regmap inits.
> 
>>  	INIT_WORK(&drv->boot_work, class_boot_work);
>>  
>>  	dev_config->lock_arg = &drv->regmap_lock;
>> @@ -222,7 +233,7 @@ static int class_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *id
>>  
>>  	dev_set_drvdata(&sdw->dev, drv);
>>  
>> -	return sdca_class_probe(sdw, drv);
>> +	return sdca_class_probe(sdw, drv, NULL);
>>  }
>>  
>>  /**
> 

