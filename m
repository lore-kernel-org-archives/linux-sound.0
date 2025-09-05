Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DBA35CEDA
	for <linux-sound@vger.kernel.org>; Fri,  5 Sep 2025 14:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757080801; cv=none; b=l/QM4xvavGh7CsTELiCzFTwkjD5Z7AINaCNtcF77JYH/z8wpPxdPNR60EtLlx4Oq6gxVWms2OTXwurq4BdBepWcf6edJKrcuBnT2A7aqOqELfYumW8XbDm5DH+m5WweG40qTaqn3tihCh7VvkoOsdysLDRLCPfWR1No3EC+jVi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757080801; c=relaxed/simple;
	bh=Nxs4jNv/0ib3sf+j4qyuTZlmnL6qwSijbxCkWrKUZ3I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lz5lISe+sFkw1HupI+nr10DKO3f7MBw7vTONK5ZLi4Lr99KvklS52jTmq7hXJo9G46MlF9pkGBR0hRGWhdPom/qaoWcYBQlYxYyDt/9J8jp3n5zYFO7Z8tEalV9eMfH/C72Qjy1d5gbmQLsbaw1XbTRS3ceEGdbxymn6KJNI9Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gp3Jo45O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gp3Jo45O"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5856vijJ002373
	for <linux-sound@vger.kernel.org>; Fri, 5 Sep 2025 13:59:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ea05wx5yo8UuvtRp2vDxehHvL08xPw5lw2wd8l1MqSI=; b=Gp3Jo45Og9cQPZc8
	mNUvOZ8QlKcHamZT/P6ndQ1Aivt4WQ0l1FPQHQr0sZtMJW8VTlzpJ8gQEAcU6Qse
	DfZbI9wtsVB5MGbe9OA2xA5EMp2raLJlOdmQU/6qxwuhIPJJkebzR2SP4NOy89Gb
	fP28CDKE/197QdBmHbgNHUXju95thY3rbrwZZtJfQt01y2xkx8QfKHHdhToviT7p
	54GrW9k+1UCtuj9cLuDN5JsOtHxwmbudokWo+RKgI5P27hVDmeCv2zM1aebZjPkJ
	3Ss9jbW0bIeit2QZ4OHKO37tiTXKrGF1ABmDuhoe5CQbskfEHnF9Bwr0hkU1UV4q
	kTNnTw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ush3b73d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 13:59:59 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-7296c012ec9so19777486d6.2
        for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 06:59:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757080798; x=1757685598;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ea05wx5yo8UuvtRp2vDxehHvL08xPw5lw2wd8l1MqSI=;
        b=V9paI5jHz6nP6luptdJgFx0zzFwzGrnLRg46umNBy98B8Ne0oBnEtjnLzAwwMonZbs
         Eu1rrvWEiRuTf7JjIZMoI1kABgRFMucise6eHH02yJis6n41NyCHiTDt9gyY09zIC16y
         SEABTcyqTfUgPEzrVeXUBtiHgd5H+MGvtzSkqJBt1RdIcGnqXExMgvk5+INWVEXWNG/W
         MHNzzHSUV4nFE2NIjEUtg3AT7RBiyuEgJ8KP0wF2gWZPt1fzqQ+uyHLZSSpqR07M74HC
         4bGDG9k63fORDaLEk32BSfhIx/hlZZxEL3H0dU9nz64YKC2dVgo9lwgwF3pURfrkrfU1
         L79w==
X-Forwarded-Encrypted: i=1; AJvYcCXtU8BT4KMqa5CxjI69rBHYLelh8Vv/P6SuzRut8M+fXyKTu8LE9Cvr/5DxrZYaU9zlGwPIvArao3pb/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhVkQzkHAnN6bULGuN3FARPpB9fxjT34c0UhdHjKDeifh5b/iY
	F+948hW6nwsEn5BT+19hodBIzti9zZU+62a5W440xeWtxnU6DWyny+o7GRT7nqOlGosceMJn5RR
	jWk4m+G1uV0PSDjJ/J8eLXqxu+sDiJRhFHZy3PWnjAiO7eNebZIeiWWMxYSTwmVjJCQ==
X-Gm-Gg: ASbGncsqBC9QjZEv8VH7PIG0kDwL8C3eSnY5ZgWCre7gRACDYOyX83S6/OWXpjPqoCZ
	nzn6rdwGybFDj3mli+2MH9toyAuOXSiAdyi+eM7x/f/6bC5RFXe7P61VIjjjzKBy5mgsLyyx1pb
	yi6uuZlCQzg1s8KT8dXr7G0Jc9LXOrbOv/BffFgjhBEpyhJ89ahpGD3t7qrmIgwgqjeLC9mBhAM
	hXp+tSxheXV9cW541aMdfAN2S1bnA3siD8kl9qyJrcuIE4stGW3vWOskmFJlEZALAic5cM9mVQ+
	/nLAy8gkOoHZJnFleMZKFE66E8uUDWpZga8tZUa5pRaMVJVjGXzwhSL2QH8ca2+Wqg8=
X-Received: by 2002:a05:6214:769:b0:72c:cc04:c3b3 with SMTP id 6a1803df08f44-72ccc04c482mr24151146d6.0.1757080797896;
        Fri, 05 Sep 2025 06:59:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHccFczVmu2K/MQDGzAtfbcJwtC1knDM1QHNcoZ7QIDaLyWrv6egTKR2btgO1NsqyhBqXTIQg==
X-Received: by 2002:a05:6214:769:b0:72c:cc04:c3b3 with SMTP id 6a1803df08f44-72ccc04c482mr24150546d6.0.1757080797193;
        Fri, 05 Sep 2025 06:59:57 -0700 (PDT)
Received: from [192.168.68.119] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3cf276d5e5fsm31898228f8f.27.2025.09.05.06.59.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 06:59:56 -0700 (PDT)
Message-ID: <a3785cf4-750d-44ef-afaa-7d398e00652f@oss.qualcomm.com>
Date: Fri, 5 Sep 2025 14:59:55 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] ASoC: codecs: wcd: add common helper for wcd
 codecs
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: broonie@kernel.org, perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        krzysztof.kozlowski@linaro.org, neil.armstrong@linaro.org
References: <20250822104927.2621866-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250822104927.2621866-3-srinivas.kandagatla@oss.qualcomm.com>
 <kmm4e5bg7uehmlsgrfhzo4agr6ga6d5gxtpxq5sg4t3wql5p6m@llwyz4kzsj7y>
 <f6a631bb-d17d-4eba-adfc-4db08540f5a0@oss.qualcomm.com>
 <6igcrtfra6h75v5g3wucokxw3ncj3k66ui3jnhfpdf2lmxc3tm@3hzihrpgjaz3>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <6igcrtfra6h75v5g3wucokxw3ncj3k66ui3jnhfpdf2lmxc3tm@3hzihrpgjaz3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMiBTYWx0ZWRfX9gdukDhIXuoN
 4m8aIpJS1x41YIWnOEItxDMrNw6T4TNDvfZKDmYKuFxUOIVIQL060CV0qzVVi/FYv1nQFzwBszY
 aCTgSQXVIt1DRwBcHY6zPEzXNxJh2+AB6aFst8dGZLwv8RlLgzjKweEjOWB+TOMehYj31RvjkXT
 IZyOBm6WJAUYprLgDfRHnIxuA2qZncUem8g5TINmveD4+xW7YvEbGKw78/l4ZmUahmZs/WghV6Z
 XaEy8XrYTRQvj+44jhEByg/4bboomN1OXPqTtlE97QQAUuCXRIJSLgBxBdyRwVzci/jYPiJUFvA
 6VIKAzgKA71T2ezNINBS7jGlr6NXm7U6YzWevuyqphxVmeC1hNgq4YABFK8SwboDobwJvuF/uVI
 i3I/sF3w
X-Proofpoint-ORIG-GUID: mc0SG3NIKVKCpjq9MiFEXnYSFlft3rv6
X-Proofpoint-GUID: mc0SG3NIKVKCpjq9MiFEXnYSFlft3rv6
X-Authority-Analysis: v=2.4 cv=M9NNKzws c=1 sm=1 tr=0 ts=68baecdf cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=9GHC5Obp58ijhVwBxQMA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300032

On 9/5/25 2:50 PM, Dmitry Baryshkov wrote:
> On Fri, Sep 05, 2025 at 08:03:49AM +0100, Srinivas Kandagatla wrote:
>> Sorry for some reason I did not notice this email!.
>>
>> On 8/22/25 12:18 PM, Dmitry Baryshkov wrote:
>>>> + */
>>>> +
>>>> +#ifndef __WCD_COMMON_H__
>>>> +#define __WCD_COMMON_H___
>>>> +
>>>> +#define WCD_MIN_MICBIAS_MV	1000
>>>> +#define WCD_DEF_MICBIAS_MV	1800
>>>> +#define WCD_MAX_MICBIAS_MV	2850
>>> These do not belong to a public header.
>>
>>
>> All the wcd codecs have same MICBIAS circuitry, this is the internal
>> micbias circuit we are talking about here.
>>
>> Actual micbias value comes from device tree, but these are min/max
>> ranges that are supported by all WCD codecs.
>>
>> Why do you think it should not be part of common header?
> 
> Because they are not used by any of the users of the header.
> 
Got it, if the ask it to move it to c file.. that is fine with me.

--srini
>>
>> --srini
>>>
>>>> +#define WCD_MAX_MICBIAS		4
>>>> +
>>>> +struct wcd_common {
>>>> +	struct device *dev;
>>>> +	int max_bias;
>>>> +	u32 micb_mv[WCD_MAX_MICBIAS];
>>>> +	u32 micb_vout[WCD_MAX_MICBIAS];
>>>> +};
>>>> +
>>>> +int wcd_get_micb_vout_ctl_val(struct device *dev, u32 micb_mv);
>>>> +int wcd_dt_parse_micbias_info(struct wcd_common *common);
>>>> +
>>>> +#endif /* __WCD_COMMON_H___  */
>>
> 

