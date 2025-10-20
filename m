Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A460262FEB
	for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 15:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760973566; cv=none; b=I48J3rozvxBySdGR/+YLQV0DKx8Rw1PXWLAm8nfCXh2VCO8EPMlYaZaWvnzvhxq2Z7Fmd8wVPP/hTJhVWK8GoNYsqPNWI1IGBmv7LhNqunZa2Ljl2mOv6eP6wEOYlEc3GKIaqwVSu5I9UF1L/NqaKvIWE7jrXm2NwqiNyvG9RSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760973566; c=relaxed/simple;
	bh=txIz2mOWj+d71E+Te7JQa6TGasPd3qP3hYYTto4gqzs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uya5H8+6VqsX1KifFeZ/HWNfmUBvcL3X0xGJqdudTX2wMrl7foHgDVoYZxGQFF/J5oVy3PgEJXGgDyFkESWCtIq5Wt2PXh8Pm5ozPPNR3u4e/ohrDiips90SoAnPLBKrgDRk9iTINyq/lnTcA53l1tf1LdSX4jnFCSLak0KOI6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L5639v1w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L5639v1w"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KBlo8c009293
	for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 15:19:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I+yIVlYM5/2IuWRwZgg83a0i74gXu/4A3ovbjVxqAvo=; b=L5639v1wdsU88KTZ
	aP31YCPaZZA17fAr371LPz20Mbe9pPB7jmcP/Y8iw0T8UvihA7TV4RPBzBAVRWSo
	qeOH0FXFykqJ6BytYCI2boZwYh4q/Mec+JwiaByylksSYZZ3kFU7OJD2YSv8b9/w
	H+FjqRpgvHKOVTKlyjcAIJPP6oxu0n8WnWP5zit66fkzf4Ynh0TMoRh0hREVhTgF
	n5bdgtu0sxfq6dPzXCXY8E/fl1VmiPWADwT4AEEjBXr8TXqiKm3vFbn/MsnJia5t
	2opTO9GPTBU7I+MlXaSnqesfc/GDdglQ9AiOMmIJrwFehUH1diFuZLXpoqyacvPO
	pp11KQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v0kfded9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 15:19:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-891215d399dso973703785a.1
        for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 08:19:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760973563; x=1761578363;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I+yIVlYM5/2IuWRwZgg83a0i74gXu/4A3ovbjVxqAvo=;
        b=DT2x5C7zxzjBbXYTPWaJEggj8dyidR4t/CV+0nJqH6fNHK8WrOepKnrxzjDJsFbo9y
         9fTsBGXo/DzxpiEhyrZxr7yMqnVxkaRr+RG4lvy3DpR90PY6Jj5DigqvLzw3EfWr4+cu
         s4cIAUmkYHgiVlTAKT3cG4tfmp6aeILRkAfKaYndn1ClHfH/d+NVrm2v2IzA4MIpgi5p
         dAg3yaV+bomXfC2N9uJLi/Wsj8JGnEOC+OKl0lKHLsmHNEYcmknbcpYtCLqn9yKd0jW+
         bdT3pRq7rPWfdkvN7UmpK0exyztMoURPNksBfmRDFBH8xTjgcxAik9V52iQRwXWkPjw0
         BRpg==
X-Forwarded-Encrypted: i=1; AJvYcCVMNEF9O122fz+lCfeFKqoInzX5DeQgFhPNwlYuigtqEsNrAmcq7+hVtvQTG57chR6khDUFQ4OzSnVM4g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+koUV3TboOk8SRMDtwjLpYdu3gXw8jGMT8402r6PoX9rY7og/
	giQCAQzjxJ06VSKUIIQ6MobfQdn5RIEyidJTG1c//0uwSeg76UfV70Y8xb3Mo8DXfxEikS7Ph8g
	omwaEdW6BxXbBQ1RsStxLc4Pcvntz1p7sC/+4MnA9URYk7eynyo/yg6ISPr5/BwoX+A==
X-Gm-Gg: ASbGncuFZMz9h1QoQ8SLFjG/MR7xdPZxAkKwvvMjoeZiukcq+g+tbS2ikiqi8Mp6tP0
	ZwgTE72vL0jvIn0WlIdN9fF/9f1D8O3ybtnHvDMrqbaJ/bOOPxhyAQlRohDnWDx6WV8gMcOJ2wu
	Fd0b5ojqPPFiQ42UReZcjvqsdmlDMHZzjs+kjx5bdFrC8vfUHIaQGzj2MyO4iQYT+L+IUl/M4R8
	MZranpDK+vfyi24yLlRD3Nx1CVEGWB9vxuiqq32RCACYxTdVcln05Xw2SjAyRDNbwbt83BBz/4L
	b1LDTQDDX4UpiR3rAzWLTDmotxv117qij/VtYZV0QA2l0GukcYGxS3F8QrVi8HiD85lQ2aQ5skZ
	VU7RNlSVTtJ5gL5ny55edOYUz8g==
X-Received: by 2002:a05:622a:1a18:b0:4e8:b940:eba6 with SMTP id d75a77b69052e-4e8b940ee60mr75346841cf.54.1760973562662;
        Mon, 20 Oct 2025 08:19:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEH7CJ1xZAKYdlNReNmCh8bS2iyCK1x9Vecn8/NOzPyBPl+tYWrz9fVLu/gfRksjbH30i8Ykw==
X-Received: by 2002:a05:622a:1a18:b0:4e8:b940:eba6 with SMTP id d75a77b69052e-4e8b940ee60mr75346481cf.54.1760973562191;
        Mon, 20 Oct 2025 08:19:22 -0700 (PDT)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4715520d753sm150398215e9.13.2025.10.20.08.19.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 08:19:21 -0700 (PDT)
Message-ID: <56328447-4cab-4446-b8be-63fad2a6217f@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 16:19:19 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] regmap: slimbus: fix bus_context pointer in
 __devm_regmap_init_slimbus
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Alexey Klimov <alexey.klimov@linaro.org>
Cc: broonie@kernel.org, gregkh@linuxfoundation.org, srini@kernel.org,
        rafael@kernel.org, dakr@kernel.org, make24@iscas.ac.cn, steev@kali.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, stable@vger.kernel.org
References: <20251020015557.1127542-1-alexey.klimov@linaro.org>
 <asrczgrmisaqzhin37jzgylm6ez2mlxtsbe6qp5mqgfecprup4@yb32qzna367s>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <asrczgrmisaqzhin37jzgylm6ez2mlxtsbe6qp5mqgfecprup4@yb32qzna367s>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=E6LAZKdl c=1 sm=1 tr=0 ts=68f652fb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FQcGyLhEAAAA:8 a=KKAkSRfTAAAA:8
 a=ZVbmtxpYz0up1Ekx5joA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=09nrmc514_O-33C_6P4G:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: yZ-cOHElaWgw30mPOb_d7WkamwkM-vs1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAwMiBTYWx0ZWRfX4gzqAwlGpTTH
 XzaqcMVEaTkSTodmC+F6sDXkhFkcoSBR515pVhToEoO2ayGqwzJ4q97xwUs3rLnVzcI/ywOANCz
 +9oSsYwu/VHeTGrxu1Qk1JAmAmNVPfFKs8ax2FwhkYAZG3qrVzf+HAYUc02nDcEMUibMZXlRDz2
 Hq51XqhCABfqUmLku3jxJM8ggc2wDJcWBlGTs3HIrbqLt2hZatEqTIEpW6q/xmnmfE+6tyLF6H5
 3lLzy3X6n7RoggNl2JeNice+cxmW/K9aJ8fStOqeaekwhp0wZdf0WkuUvstBjNyTD90zWJGPYxB
 1aJ14wF8mdx2q1Or5WzVi2bICRZe9HEupK1TSHSdnCT6JprdXZ7p+HwLaSPEW82MQ39Fx1isP1h
 41gZRbka+dNYRaFq2ugWE1K1w6N5Tg==
X-Proofpoint-GUID: yZ-cOHElaWgw30mPOb_d7WkamwkM-vs1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 phishscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180002



On 10/20/25 12:15 PM, Dmitry Baryshkov wrote:
> On Mon, Oct 20, 2025 at 02:55:57AM +0100, Alexey Klimov wrote:
>> Commit 4e65bda8273c ("ASoC: wcd934x: fix error handling in
>> wcd934x_codec_parse_data()") revealed the problem in slimbus regmap.
>> That commit breaks audio playback, for instance, on sdm845 Thundercomm
>> Dragonboard 845c board:
>>
>>
>> The __devm_regmap_init_slimbus() started to be used instead of
>> __regmap_init_slimbus() after the commit mentioned above and turns out
>> the incorrect bus_context pointer (3rd argument) was used in
>> __devm_regmap_init_slimbus(). It should be &slimbus->dev. Correct it.
>> The wcd934x codec seems to be the only (or the first) user of
>> devm_regmap_init_slimbus() but we should fix till the point where
>> __devm_regmap_init_slimbus() was introduced therefore two "Fixes" tags.
>>
>> Fixes: 4e65bda8273c ("ASoC: wcd934x: fix error handling in wcd934x_codec_parse_data()")
>> Fixes: 7d6f7fb053ad ("regmap: add SLIMbus support")
>> Cc: stable@vger.kernel.org
>> Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Cc: Ma Ke <make24@iscas.ac.cn>
>> Cc: Steev Klimaszewski <steev@kali.org>
>> Cc: Srinivas Kandagatla <srini@kernel.org>
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>
>> The patch/fix is for the current 6.18 development cycle
>> since it is fixes the regression introduced in 6.18.0-rc1.
>>
>>  drivers/base/regmap/regmap-slimbus.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/base/regmap/regmap-slimbus.c b/drivers/base/regmap/regmap-slimbus.c
>> index 54eb7d227cf4..edfee18fbea1 100644
>> --- a/drivers/base/regmap/regmap-slimbus.c
>> +++ b/drivers/base/regmap/regmap-slimbus.c
>> @@ -63,7 +63,7 @@ struct regmap *__devm_regmap_init_slimbus(struct slim_device *slimbus,
>>  	if (IS_ERR(bus))
>>  		return ERR_CAST(bus);
>>  
>> -	return __devm_regmap_init(&slimbus->dev, bus, &slimbus, config,
>> +	return __devm_regmap_init(&slimbus->dev, bus, &slimbus->dev, config,
> 
> Looking at regmap_slimbus_write(), the correct bus context should be
> just 'slimbus' (which is equal to '&slimbus->dev', because dev is the
> first field in struct slimbus_device. So, while the patch is correct,
> I'd suggest just passing slimbus (and fixing __regmap_init_slimbus()
> too).
+1
I agree, it adds more clarity to just pass slimbus instead of dev.

--srini> >>  				  lock_key, lock_name);
>>  }
>>  EXPORT_SYMBOL_GPL(__devm_regmap_init_slimbus);
>> -- 
>> 2.47.3
>>
> 

