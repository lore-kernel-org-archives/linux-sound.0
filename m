Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C15722A4FC
	for <linux-sound@vger.kernel.org>; Wed, 16 Jul 2025 15:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752680296; cv=none; b=GBdvwvJKS9oWINOrBe0HcGsUPfLK9cJhA1eXsGGEfO4/fxtqzrV2/BDiMM7U/UXKs0SPtkEC94xBVQ/CMDahH5FOb6arSpL6hBt/QNIIIT/cDpfoF6orCJKwqo7NdekXEkdVf+GFpxCXktEczB4D/AYre3BLH3UteD+un2xD4Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752680296; c=relaxed/simple;
	bh=l5P1z4ovdvHY0CSXjSyliAiwgCOTQV3QfxvxZAlEmC4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=feUjOHcse9gKRhiqeGZAhXEO8rk0QZVeiFiA7FlN1WoGS8gc5oxBgWg1W44uOuznIamdixr8Js7MxJ8of5lRLWnkpKMg/uYl2MFvulIb4lbcqWguxENDapkUzsSID4zriQG32blYUCahbOj0znZMvKB47MVegCN2zwVQU6mriqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JYEObN5A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JYEObN5A"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GCsM5C007235
	for <linux-sound@vger.kernel.org>; Wed, 16 Jul 2025 15:38:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UkYAxaVWsTIpveHNj6bY5KPJ5ksQrOMHQ1BxM11VR2k=; b=JYEObN5AbIOLZ1g6
	BdmXvAIsMiPZR6Nxjin0dy8wyZcmVK3SJ7cBJsiw1cd/auknAA22hSrVSfVSKLIn
	xnoscOSbwdjmC2/+I4ZsFiSwEaALpobnv6DS67WXt0ab2RNv+4zuhKTohohv1UYC
	PoXA6tlCfiY1q12wo2JMh3yuwBtbaqsqOE21l67fh5fTJ36He/kSN0Q6siV5VkcX
	tNcBfzNSe+uQIWnt2n025vgsfmAKVVeLhmasVBF6UTwfetgCb0IaEd48/4POYKXB
	FRD4t0YCRJ/iFFCJXNigsp1uSEQzY7DaS1kmQE1PH0HsJn5i+v8FQt6MdScwS8aw
	vTbCAg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wnh5vr5f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 16 Jul 2025 15:38:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c955be751aso1065400485a.2
        for <linux-sound@vger.kernel.org>; Wed, 16 Jul 2025 08:38:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752680291; x=1753285091;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UkYAxaVWsTIpveHNj6bY5KPJ5ksQrOMHQ1BxM11VR2k=;
        b=j8dRMWqmkMQC9/PUHmUAGF8IBC+pyAiTPuvG7DjUiTmUIVKKNM+LVifCqBr3JKtfBL
         KeLw2lRou5ToDVa0bx0PXomOqRkbmSVY0lFYj9yJOUR60CShq/HjYuWz4qXDXWBKuzy5
         NQ5u4DJLDwlE/vIol9m0ivJOGWtcwPF26fTp9axJZNhy+Z5okuNqNj7yjwBJSFAbacSC
         o3MZNzRRKcgqYEQ6NBVWuBNyuG4By9pmlUhAApCv3ILgmaeosoFv4B/Z3yx8RL5vQwL0
         ZN+elCbkmwV3KXlpb2HoKSaKFIv8q803ogcuEJdFc8zxLnOgZYJzzc9GVuPZQRb4coow
         S47A==
X-Forwarded-Encrypted: i=1; AJvYcCUkPLRUShEaoLw7v9S6syXHGBl8lxjXu6VRck286gYYMZJD/22HrOXrqZHSR1dZ0O3PtsS1B9ZX7nwfgg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8hXbeX7Hy/8CxVCNv7Ew3GvAg2vy1OS7WHhaDAqPTRb07C/3O
	8gJgJDVPaATH0l2jK5E3ZhLXK7+zHIwm1O/Mi7LRi/9TPVSBnb0rhf5wMvdqYgeuXkGbA8BGa/l
	1TDhdhXxM5el3K6YY9U+bx3TD1qxlBvZFlDu28+3WM+tMcTJlQth6m1fr5iUB7QZpcd1sShH4Ew
	==
X-Gm-Gg: ASbGncvSDftdI6Y/HCG2TY2XaA1MqkOq1yxIkqJPZnwsBwiS0M0hDrrx3wErIRFCGSG
	hh0BvBYWWSPE2QALEYF1ajuB+nBCd7uzGYXYQhXno6fNB/MThYT+fuOVgdP5QWBGdcT5rRqfHvF
	AF5AW3D3KNOqH99ldlwq21pOJUuafGGU10HYr96viO9yEBmK/u+i23X8EHyPvmhITUI+gC0nLh8
	vTqRdqXeW0c5NUXFb7/vwI9QQ5ljjEYJ7FyLHpSfe2d+OoG5+5FLupRxhrMXvM9c1V/ximffy7z
	Kp03D1Ad5XMTIXfonKKIEmbMP+yTzBPUiPOipKbw9pwf1ZyCKRDOUJitDIOG0A94YQY=
X-Received: by 2002:a05:620a:2845:b0:7e0:bd35:fd21 with SMTP id af79cd13be357-7e342ab1fbbmr515910885a.19.1752680290586;
        Wed, 16 Jul 2025 08:38:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOu3vav4ASfeHUT5qSQ3WEE71kptmN+XUWMWPqA/D78xEVSW3WpYohE6TsP7cV4WPYeMEFrw==
X-Received: by 2002:a05:620a:2845:b0:7e0:bd35:fd21 with SMTP id af79cd13be357-7e342ab1fbbmr515905185a.19.1752680290024;
        Wed, 16 Jul 2025 08:38:10 -0700 (PDT)
Received: from [192.168.68.118] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b5e8e0d867sm18422684f8f.61.2025.07.16.08.38.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 08:38:09 -0700 (PDT)
Message-ID: <d25ace2a-4744-4c92-9c56-e630bab306d8@oss.qualcomm.com>
Date: Wed, 16 Jul 2025 16:38:08 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] ASoC: codecs: wcd939x: move to using dev_get_regmap
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, neil.armstrong@linaro.org,
        krzysztof.kozlowski@linaro.org
References: <20250716123323.5831-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250716123323.5831-5-srinivas.kandagatla@oss.qualcomm.com>
 <9f4c750a-9e23-45a0-a761-4c3fc2c7d8c9@sirena.org.uk>
 <6de11c01-5b59-4222-9f4a-c951c74f0128@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <6de11c01-5b59-4222-9f4a-c951c74f0128@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dKimmPZb c=1 sm=1 tr=0 ts=6877c764 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=_B8sJ2igTC3d7dtnB-UA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: qO-ys61OsN6inR9OSWJhIVcQqBBtXU9W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDE0MCBTYWx0ZWRfX9Juo+ADAQygU
 f/Na10qnqQyHCIlEDoL2X2FdCMpgq4Z6HzdAXWVXFMM/lGZ7gjtCh+s7slqqgZm9yEO28FDh4nZ
 un3axrXQ+e1P6p7lTXY1XTpQRGKcsYUYMxyTMyjEVB2zvBFNgdoBQxUjgPjzgXw1UbUwFhPTq8V
 BGcrqdOY/nm7uFVK5WTrHRXDwa+uop8rncVFG6mXcb59CTScTkIIyhcwQl3Ew4Ixkje7pcKpATz
 COIODdqYTyFJEOKIvFStDDjEiSVBIrNbnTq4CSw+jZHVLaC/+zMQzImIDJEyWYe3VWH//yV7j/n
 Az121E5D3jb+fF5q8UGfk57PLlyilnI8/CE46FEPLSmYA+A5EwSNYosTQS6NKEUj1kU6WsrbChn
 RKXbuAnphUV3qgITkKL6h6DvruhpbPNgjgBKXKlzEnbzFQT4ekxF9zMD3+MfSyC/vRml9IbM
X-Proofpoint-ORIG-GUID: qO-ys61OsN6inR9OSWJhIVcQqBBtXU9W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_02,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 mlxlogscore=717 mlxscore=0 spamscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507160140

On 7/16/25 3:36 PM, Srinivas Kandagatla wrote:
> On 7/16/25 3:31 PM, Mark Brown wrote:
>> On Wed, Jul 16, 2025 at 01:33:22PM +0100, srinivas.kandagatla@oss.qualcomm.com wrote:
>>
>>> Ffor some reason we ended up with a boiler plate for dev_get_regmap in
>>> wcd939x codec and started exporting a symbol for this. Remove this
>>> redundant wrapper and direclty use dev_get_regmap from device pointer..
>>
>>> -struct regmap *wcd939x_swr_get_regmap(struct wcd939x_sdw_priv *wcd)
>>> -{
>>> -	if (wcd->regmap)
>>> -		return wcd->regmap;
>>> -
>>> -	return ERR_PTR(-EINVAL);
>>> -}
>>> -EXPORT_SYMBOL_GPL(wcd939x_swr_get_regmap);
>>
>>
>>>  	/* Get regmap from TX SoundWire device */
>>> -	wcd939x->regmap = wcd939x_swr_get_regmap(wcd939x->sdw_priv[AIF1_CAP]);
>>> -	if (IS_ERR(wcd939x->regmap)) {
>>> +	wcd939x->regmap = dev_get_regmap(wcd939x->txdev, NULL);
>>> +	if (!wcd939x->regmap) {
Infact this turned out to me much simpler and not even use
dev_get_regmap() by just doing a deref of sdw_priv

wcd939x->regmap = wcd939x->sdw_priv[AIF1_CAP]->regmap;

Will fix such instances in next spin.

--srini
>>
>> The existing code should be more efficient than dev_get_regmap(), the
>> latter does a devres_find() to look up the regmap while the above is
>> just a pointer dereference.  It's probably a marginal difference in the
>> context of probe() but there is a reason to do something more direct if
>> you can, dev_get_regmap() is mainly intended for generic APIs that get
> Thanks Mark, I did not realize that dev_get_regmap was devres search at
> the end, Will drop this patch and make something similar changes to
> other codecs too.
> 
> --srini
>> passed a struct device.
> 

