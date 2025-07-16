Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BE323815F
	for <linux-sound@vger.kernel.org>; Wed, 16 Jul 2025 14:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752676590; cv=none; b=f5IZm+/bcGaD2EXyN6MioUjQeSLeI3EGyzYoZ/HBc0e1oIrKd2vneuVx/0JSSNVdBtLGJ6HZ1qGL88PYfXF1ieKk4ohd7hFCyIOOV0c5FjBki21oroiJ4zhq6A/v4gKDtgTOwyuRdi1zRFoeLbM9Zie/1WwQmG5tJWWDQ6Skikg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752676590; c=relaxed/simple;
	bh=kWi9q2Y7BtCTuQpXIsV0qVlJCPRpa73NHUr4PkpWIKE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NxO+XEA0/+ZDYFJ4zHquUkqLwNLCCk8Qy9rU2yyE7m9eopGQ+NXaD4oJZPBN+Eg2cr9Bycj7AZY8EfZFz8sph1U/Khp88E1f4AqmGBKQVIqxfVyf/9crOdObe9S6Y6ne3iq/I5Gzfe3OYTBiSAQDRMh1vnXzMmkgQnId/1SyIos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H+SOQg/N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H+SOQg/N"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GCwegh025524
	for <linux-sound@vger.kernel.org>; Wed, 16 Jul 2025 14:36:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yA4UmYowfV6ZSvtoqDZ9mQILLwvVdlfWPK/+o9PtKoc=; b=H+SOQg/NHM9CFRFb
	Kn2gVgKcJwJLi5vLKyZZpivTylywC1NYYM0Es66fRRgrn21qPug79nha9ZwpgpiR
	dJiykYMXPG3dGzxnKuIgADcyOjVnMBOB35H7mZ9uT4Tcd5CuUVL/Oy1RyK7wRAs/
	EWDoj2iaQXjc1qNMUI4atZsQ/TeNvGb82UYD41ziAPTgkV3RLajqoxN/DGQIFc7u
	3tr7W5ki2OLIhtBehs9xkEXg9/qEUgN2zEnEpkPfOSckSlHKZcAQ4HMKkEEj8euT
	+oq5VRU/mzmz0fQOPSOYYTQ2xtYPkA95a4/jmu2uAg+J6AJB7gw3gorx8FyJXEgo
	F/zYgg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dpf7ad-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 16 Jul 2025 14:36:27 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ab401e333bso18369601cf.1
        for <linux-sound@vger.kernel.org>; Wed, 16 Jul 2025 07:36:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752676586; x=1753281386;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yA4UmYowfV6ZSvtoqDZ9mQILLwvVdlfWPK/+o9PtKoc=;
        b=PRmypngxdrwVgtxA3+m9H/KkuHD8Urqa99/AZYIJzd63JcRc8GtkGNJZmK8mE5jJbp
         X3nT68t/IkQ84D9phYaHmVv2Hky0j6nyS7fOWhJriBdw9sgdB16xjvvyFVP0dyw9jK++
         mu6l2k8zhcnws9J265AIXuukb8SddqW+56SpgBTrYLAcWEkbtJMXVWWw/gbQf9j56r3t
         XplZkKzuNiQ2cOolIUyUev6Qz4zXtrCvRq9AQiav5HH90vc3TOnrSj7b4a1rf5UlXoPd
         lZCZxmAVQ7RYxHnmEeqxFRQekxzu6O0scddm97GAobTZO7j+HxI+10PyRreCE7Q5jFQt
         07ww==
X-Forwarded-Encrypted: i=1; AJvYcCUAIKOz6cK0FDlKG+Ll6r0m5NYfkrysO+Qo8HZlxlrVCDg/ahLQMBl7t9jww8z00IAuB0FEN8HMYO+wdg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKIL5BEKcgF3urLxGd1V28BGYc/MvF+2jR3I1wlGqLxoU+lXBo
	7OXrEqvN5bIvg1UWpHZl/E0GmbtU30fXTw0suEaMTnLCzXvmjEUU6PiC+ooD6s9tuxq3vWms332
	MwYtS4lb/n3urCGjdEslgiQJpA/uzzd94y/bqmBM2qg2WYFhtwyfx6nG2k6nm9SFx6w==
X-Gm-Gg: ASbGnctweif+1JlOnfdBXQcxpSxCMnhZ6TotJMw2jkGPJB7KlTLkc/GxdUdawxrnwmm
	9p/eJELBc5bIF/SXek/3Odc4qLpQi/rSGzG2H/MfB1AaHczVRHr+KN0FSGxIgEaQzU3t7IxA0Wr
	vszcULxNan+ilffz2WMi0tg15NxywWShnUuRiwXekrll2Hhw9YBlKi3harNA8ujyjYKhC9VR9T5
	Cd7Xa2trkuLruearaFiVI4wUFGGGL97v6RW+GbGtFEcptoc0AVuzhHxcNCj1LQSG07cmWL9UpvT
	3gw1fGn3OaYTCZ4s0pZwGXf3cDeOSjhlv2kbM31c98XIWH7SgRBMivNvrgPjob86MOY=
X-Received: by 2002:a05:622a:4cc8:b0:4ab:5b15:fdb1 with SMTP id d75a77b69052e-4ab7f9511eemr119396481cf.15.1752676586210;
        Wed, 16 Jul 2025 07:36:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGi5okhmPc18F4MSl3Ewd57VpwWpM4vQ1vHWNcrZD3NgHSt79iUlTK7PnkvhFJVebZUhBEygw==
X-Received: by 2002:a05:622a:4cc8:b0:4ab:5b15:fdb1 with SMTP id d75a77b69052e-4ab7f9511eemr119395741cf.15.1752676585545;
        Wed, 16 Jul 2025 07:36:25 -0700 (PDT)
Received: from [192.168.68.118] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc2464sm18418111f8f.38.2025.07.16.07.36.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 07:36:25 -0700 (PDT)
Message-ID: <6de11c01-5b59-4222-9f4a-c951c74f0128@oss.qualcomm.com>
Date: Wed, 16 Jul 2025 15:36:24 +0100
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
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <9f4c750a-9e23-45a0-a761-4c3fc2c7d8c9@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDEzMiBTYWx0ZWRfX4YjkSdCqBmxm
 +o9wi1UPuVxOspJVBNGDQqhzK5laHLH7f6Uo40mO5rxs6ZeUQvLxKG95jgkgIPgh1nOSyvmL3el
 9DCwNYOFHNzQYTKb3TDEWumEYQsspkj1uzobRKvkk+AlSaa/9LF3bUJVky8yyR5NeD2h5ggZRJq
 7cbMRYKUp4yzoQN3Xeimchh2XDBK218OVcFyzFKBF6mDfZvWsk9QTvj5TvJQqinrh4KApZA+0Lk
 kc0rEZ9/tr9AhjLZIwvtX+g/HB//BSTr1nFdLtBRSmp53Zzit7cT8tVlHNzB5k3KrqE8UhL2i8m
 7PuFu/oK8sWHDGqEMfwCzmOhTrAiYMpcNTHVDt0aKYnBRhBjgFQUAIMVIhDNysOJRBeAWCAD1xd
 2QwcoUUonwDve+u8eBjCSqWQPWZ3Y13KyJ/FQ1SjePaNKmlDRIXplHx9bk/s8QtYrtDYhbaU
X-Proofpoint-GUID: RyrEFcvRVhW6s7c4gnA8SM1as0kCIj2N
X-Proofpoint-ORIG-GUID: RyrEFcvRVhW6s7c4gnA8SM1as0kCIj2N
X-Authority-Analysis: v=2.4 cv=Y+r4sgeN c=1 sm=1 tr=0 ts=6877b8eb cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=iuNjYCSt-HKeNY_OgDcA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_02,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=688 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507160132

On 7/16/25 3:31 PM, Mark Brown wrote:
> On Wed, Jul 16, 2025 at 01:33:22PM +0100, srinivas.kandagatla@oss.qualcomm.com wrote:
> 
>> Ffor some reason we ended up with a boiler plate for dev_get_regmap in
>> wcd939x codec and started exporting a symbol for this. Remove this
>> redundant wrapper and direclty use dev_get_regmap from device pointer..
> 
>> -struct regmap *wcd939x_swr_get_regmap(struct wcd939x_sdw_priv *wcd)
>> -{
>> -	if (wcd->regmap)
>> -		return wcd->regmap;
>> -
>> -	return ERR_PTR(-EINVAL);
>> -}
>> -EXPORT_SYMBOL_GPL(wcd939x_swr_get_regmap);
> 
> 
>>  	/* Get regmap from TX SoundWire device */
>> -	wcd939x->regmap = wcd939x_swr_get_regmap(wcd939x->sdw_priv[AIF1_CAP]);
>> -	if (IS_ERR(wcd939x->regmap)) {
>> +	wcd939x->regmap = dev_get_regmap(wcd939x->txdev, NULL);
>> +	if (!wcd939x->regmap) {
> 
> The existing code should be more efficient than dev_get_regmap(), the
> latter does a devres_find() to look up the regmap while the above is
> just a pointer dereference.  It's probably a marginal difference in the
> context of probe() but there is a reason to do something more direct if
> you can, dev_get_regmap() is mainly intended for generic APIs that get
Thanks Mark, I did not realize that dev_get_regmap was devres search at
the end, Will drop this patch and make something similar changes to
other codecs too.

--srini
> passed a struct device.

