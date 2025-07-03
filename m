Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D733233127
	for <linux-sound@vger.kernel.org>; Thu,  3 Jul 2025 12:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751547013; cv=none; b=MoK6WcSa7Gfws9Few+hc7t/aza94/H3BqIQP22gORTcuwYZRnj+cvGpW2c54SU3aqvL/uyQDnLC1GxqBkdppjx1Vjd2g30WFD2NJi/4t6/MBkiS9PQ1nvtX4LPv8NBxCXaQQRvsyO1LVIpvb85F3G7B0T50iUcioBYDClTCv1sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751547013; c=relaxed/simple;
	bh=Qqgc1GnsOOAq4v1APP985iIN3JGVd/bERoSbPbqKFAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZFUWLogxdcQSP5az4aswAfC/B6nMzBhjSekLGMzixLGCaJwyCHu6OcAmrqDcqbE9hncddgV7hvDo84B9vBekeNTj3uIrb1vD67lJbpkpnBdSF/djobBT1PItNmmiKMU5AtnyTo4B02srcirLIYKfg/BtO4v5VOWGmaQ8aJ74Lt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ceIyflyr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ceIyflyr"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563APsYJ000324
	for <linux-sound@vger.kernel.org>; Thu, 3 Jul 2025 12:50:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uj1sS16Dw8PguzC7LFhxazWH4isKpN88omJ0VRX+99Y=; b=ceIyflyrPBy0NZjV
	JjVKQl9IXmvqESL+iKNOQ89Ru+xutmghTyTYK5EGp42+lVDIR2p8WQpK/pfEBOuh
	Cut0L5fIVUaYkSPZef+Be8Wc8zGbE55uixKvrwSfPV29jE4xyTk53tGYU2l38gxF
	/r00NMy7mQeCibDWjRGgyG6PIBzhY6IHAu9LNfxu52o+9O3DjB8JfW1LkEhYZMHr
	d403Hv+GCrQcnPprsD98e5eYyY5mJCmdXFHgUHUFUbvtnuHcEgrAg4sT7mKy0WeZ
	ik+kmm0rcoQfNI0GeNxE2YpdUO4c107araPDhvKtCvrmcSJyGXqY8icv375VLe1a
	+D3mEQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qmgcee-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 03 Jul 2025 12:50:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d446ce0548so298636285a.3
        for <linux-sound@vger.kernel.org>; Thu, 03 Jul 2025 05:50:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751547010; x=1752151810;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uj1sS16Dw8PguzC7LFhxazWH4isKpN88omJ0VRX+99Y=;
        b=G+Cyg+Ck9T6pVY7q59Td2z5RQb6wf6rog6EzjeP0eydkpVlAugiEqsXY/2WxrHvemG
         8csfusU2woH8DZd074n+RyxNrWnVh6n+tWzXsKEtM6aDgGyOmgvGisFBBWXTzo+AIXk4
         i8U4/YkF9xSCyVrVCPkh3jdd1klNmY/ZmVYfPFDCbuOrCP8Ibdab6VCxtz6eOfEWohF6
         g4zTUZtyYs9o/CT227fYdYNoKCad5uwgYjzUrJEftRN+/qTl8Ih8BhM6a3CU9JEof2AY
         gMNsdYeMWbEZF8grddMiJBQwVl6F/aGg5erRvZJ9HYcn4AZXwPe9eumSSGoBefWd6pYi
         Htng==
X-Forwarded-Encrypted: i=1; AJvYcCWSCwZYEyuRCDqHIonaB3OHbxpGDTcFjBKKerAJNnsrkBlNFbMeHTTCFwFfB94+7KX26xYeiSJJGUHhoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwG62pAl1KJxDYLDaEMvyxmdOENVBQSZ2xUBhN1qgrXj04DrdDx
	siQlp1TaTqLvASxdDe0hsNxWrqUhUdOU7HmHj9514K4g5DIHV25TUIUs5r8NYWMKGMFMtqSkdeo
	OtQ4DDlcm13XDA3ZSv6n/XKAhWl1jTGsRsoJ7ARJVdL7JmAs46wHnhT1NSmGyQAfT2w==
X-Gm-Gg: ASbGncu7KYET534BZFGvK4TNXko4Txhd0i2rORjGEtgW58evN8M2e+zsaEgGi6lq4sJ
	Hz6G6oXjS+cOFyqS4xx8Op+cNeAMEKqAnq3nab0AMykNIh4HiiXZQnZpIiheECFPk4/pAMu/YIv
	hvKfZh5mk/aoyTA+Qadzj5R9pOgUAuIurzht4bLQK9W32J2n19HW+TDq3Fjrv3f08zrkV4gl+yz
	tSbH85s/f8Eutf4G2krVWnH9CGsYzLOsWZ4W6P7I4+yDyAS3kGAtlRkHXZoLgOFOf0wMuDgEWLX
	mBXLgLJKOxW2wFjcQfQKjSfbR+YDQFFDVdQlFvwg4gZxNXd/
X-Received: by 2002:a05:620a:28cc:b0:7d4:536a:c0c5 with SMTP id af79cd13be357-7d5c4704096mr755996485a.2.1751547009978;
        Thu, 03 Jul 2025 05:50:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5zoCjhAwYQJaY5mtO22xdyqlDuhd9aBfqot1+DE6Zj4R49CJv87BJ4eKnl1sxbcb4/h4Iyg==
X-Received: by 2002:a05:620a:28cc:b0:7d4:536a:c0c5 with SMTP id af79cd13be357-7d5c4704096mr755991085a.2.1751547009398;
        Thu, 03 Jul 2025 05:50:09 -0700 (PDT)
Received: from [192.168.68.115] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a88c7ec6aesm18533845f8f.5.2025.07.03.05.50.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 05:50:08 -0700 (PDT)
Message-ID: <4f51fa0f-96ac-4b9a-8e8f-e9e3d9c1f512@oss.qualcomm.com>
Date: Thu, 3 Jul 2025 13:50:07 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] ASoC: codecs: add new pm4125 audio codec driver
To: Alexey Klimov <alexey.klimov@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250626-pm4125_audio_codec_v1-v1-0-e52933c429a0@linaro.org>
 <20250626-pm4125_audio_codec_v1-v1-3-e52933c429a0@linaro.org>
 <00b63483-8012-4a04-9486-536a7b236497@oss.qualcomm.com>
 <DB16S3FI8AXX.1LA99XCPAW1UF@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <DB16S3FI8AXX.1LA99XCPAW1UF@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=68667c83 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=Men2jHeljtYBJhSsfTwA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: eCbsP7bqmX9sQ2d50tDD3qREtgVw-d-g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDEwNyBTYWx0ZWRfX9fBNHBEJN9Vy
 CtN/7YmqWoLBWeL+Ztdu8TlOq2JK6x3n/5TEwZHM/Jv82Ky7AmQRLrBBgrHnkaBIppspBl+7FKG
 w5FGSKPNU/NLKrsnTc+uJE/GPyIH6VsA6m7OCnYefPDYNTPzcEANomTKPmY5Hja4/hWllA5VeyG
 uOli5c7/s6MVy5zbJNBS288HvDb3GqsO04TfMI/A9jVcqXjc4pkwFHllYG9AYBEvK7xHdIfeu7+
 ELO6YqYVRHLnW5NJYF7Egg/dshTpVRLcCwFS1mpireXVA5ATCQn5utt9/AhhihpPORhPVT6EIek
 oj5T+HddMm0ew9OCzYtCMmelPnYKBsAdWYd7Gt9+I1REkv7V0auyDDATCDuZj3ew3vKeV0ohd/O
 ss05LsCQG5wL1gyMXD9RXfBc5TiGy4xrlp6pByPeZ4vlLNggpcLcymsXQ5OfB2VhrjXn419L
X-Proofpoint-GUID: eCbsP7bqmX9sQ2d50tDD3qREtgVw-d-g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=588
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030107

On 7/2/25 2:43 AM, Alexey Klimov wrote:
>>> +static int pm4125_handle_post_irq(void *data)
>>> +{
>>> +	struct pm4125_priv *pm4125;
>>> +
>>> +	if (data)
>>> +		pm4125 = (struct pm4125_priv *)data;
>>> +	else
>>> +		return IRQ_HANDLED;
>> This will result in interrupt storm, as you are not clearning the source.
>>
>>> +
>>> +	regmap_write(pm4125->regmap, PM4125_DIG_SWR_INTR_CLEAR_0, 0);
>>> +	regmap_write(pm4125->regmap, PM4125_DIG_SWR_INTR_CLEAR_1, 0);
>>> +	regmap_write(pm4125->regmap, PM4125_DIG_SWR_INTR_CLEAR_2, 0);
>>> +
>>> +	return IRQ_HANDLED;
>>> +}
> Do you mean that it should be:
> 
> static int pm4125_handle_post_irq(void *data)
> {
> 	struct pm4125_priv *pm4125 = (struct pm4125_priv *)data;
> 
> 	regmap_write(pm4125->regmap, PM4125_DIG_SWR_INTR_CLEAR_0, 0);
> 	regmap_write(pm4125->regmap, PM4125_DIG_SWR_INTR_CLEAR_1, 0);
> 	regmap_write(pm4125->regmap, PM4125_DIG_SWR_INTR_CLEAR_2, 0);
> 
> 	return IRQ_HANDLED;
> }  

yes. We can not return IRQ_HANDLED without clearing the pending
interrupt source.

--srini
> 
> I need to fix irq_drv_data = NULL in pm4125_regmap_irq_chip then.
> IIRC it is always NULL.
