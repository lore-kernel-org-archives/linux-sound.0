Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E882D46B4
	for <linux-sound@vger.kernel.org>; Fri,  5 Sep 2025 07:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757055835; cv=none; b=W3oOYvoWwFC7mJ6xwOzr7bZuMDXhYGqL7QkRz/jDnqd4NJ26TWIdH93KjrJufRlQd6xfaTHHGFCgfu13orJ9zBdGWJ28UqAnqtUl/iFE365YJRrKStL3a62VW7+s362xOJ0GrJjhSnZthecNT6OB2EAzS07j7oiqg0rWGkzLVvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757055835; c=relaxed/simple;
	bh=VM0nKVBbJC3EXcL+2r1nh5KaJBUzAyVK/5lsmjwQ2TI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZyO7h8HLDUG4uWwylP2/KFz9DrCKOqoLyAb8lBObgmjwIuaFmO8SpKl0sr3qX7umTl+qw5FDbbMSKSKC434/wntPwsvzqC5k6qzyARxiAfKSPSLVJg3r+BJajkESBZglLfIBMTpw6TFocJfyXKpi4l0luJmmwTtxZHCPkMJuNmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O1UCHN8W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O1UCHN8W"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584INSIr007609
	for <linux-sound@vger.kernel.org>; Fri, 5 Sep 2025 07:03:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uh0zHPqensMvXDsKJ/9Mhe+pmsC/EijM0tWsWvi8kEQ=; b=O1UCHN8WC97vjYZZ
	HQDZWIFmZIQ4qKqGMXT5X6HeLjpiPQPpx5JctW96J4S4dEenQjD/UXfLN6gaBOAO
	8gkxhFeptvAr0AWXVActyILCKrNApNne09l4WZWh7n1hbWoHLRuSfaV54jvmHNjS
	nrp7MeNseUepje+n/GuywGdDlYSahWdn4CC8EAkFdBtJIBMHe98Po9JPS2NdQjLY
	9oxW+WGXgIJNOAPelHTFWUWxUoNNANnMmYxvyH+oJHGzvjE5O4JD+dx7/YNxtXIS
	cFCWyGEKilV4X3TAArof6gNI5lhNzYgVlPkuXXMkJmqJrTKVeflcSkaj/b87+fX2
	Hvkk8Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura9237q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 07:03:52 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b31bea5896so21386001cf.2
        for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 00:03:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757055832; x=1757660632;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Uh0zHPqensMvXDsKJ/9Mhe+pmsC/EijM0tWsWvi8kEQ=;
        b=P11DnTaqpGl3/WQ1xdnc5Ca9sfivcLt+9GYAjAKSGZprBnDN7HpidoVuLsEwTHYWNX
         PSwha1GSZsde3cQahu0yG1cWCBVRi8OaRY5PG8WzIFlm+uBd4A7+EFMahLZ2kgri3F5v
         y1taNAeAZubT3OSPiyGWoDSjTnk4lmU72PQw/ZzcAqiqm6k8IXtIjF1zviUsfI1n3i4M
         5pGJ/HlcLR1qutw56HqB+pBKp9SR2Bw0c5txZ0cnqWeP/Mla94rlWAlW5f0aADxg2JDc
         BWEXKYLNmtuipHTe5BMKjesqgf0Ez4VdSw4w0ofVEA2tvgW471v6k5WC9dALIAr69NSi
         1dTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCIgKlW309gN7kOB8Lr1MAZSEtt6WsPFlCrOdXg5Wjr8b+3oA6Aq75Ga/ibM1L4M4ndbbTGQHQcvjK/g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3lE2R+8ZnTZL2pZPUN0KUMurSr+rinjE6YMwT/biZB6AnBB1u
	ETeRQJimiI6gWiEr/ZA6eFACAhRKsOo0K70Pmx/K/MuKHVU03z1O7K7pFR3yIstdKW13XSS0UH5
	KXxGJQ8f/5CgdUqI84rz+4AWcXIzhv6fFKbGGmjX6L3e+rJncF634CGEDGiLaCvzOoQ==
X-Gm-Gg: ASbGncvXvKuKdemYqZycpeblx9FALAF7hp9kxU+UPtGve9h/9yeglzisC4SSg009pGs
	EyODNDB5zPYP/gLOMRF5bP8zM5yFfDwOkp4IMGD32XnaWshZFA4simQ4am1Kxq48OSMbHHi+y+d
	YQG+iIUDI36njMGPxME3iST+HOJddItBRh4B8EcBumnTpvBjmGkvwmu6UkSy4OchxojlKE1JmtM
	DZrvOR5wEt0pzmsZLmro1sLDkHDBd1sOQ7hxrx6a34S+2zugJhpxocYh35/C76QTwBjzQBmHF3v
	f1TlV9lTf6UXqTaVk9zUpTTyUKp16WHpkWoMFcx3VhFPvwLaXkJe94aMT4Gkg9Evho8=
X-Received: by 2002:a05:622a:8ca:b0:4b3:4fdb:f2a4 with SMTP id d75a77b69052e-4b34feb3e21mr151706391cf.73.1757055831871;
        Fri, 05 Sep 2025 00:03:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHG2WGOBevUmbvF6L6SlA1g/1cS0fHSL6yPVxAnOVTWc4dOXAnkfXOBDdkJYebg/JKqxCflAg==
X-Received: by 2002:a05:622a:8ca:b0:4b3:4fdb:f2a4 with SMTP id d75a77b69052e-4b34feb3e21mr151706061cf.73.1757055831200;
        Fri, 05 Sep 2025 00:03:51 -0700 (PDT)
Received: from [192.168.68.119] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45b8f2d3c88sm183965295e9.19.2025.09.05.00.03.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 00:03:50 -0700 (PDT)
Message-ID: <f6a631bb-d17d-4eba-adfc-4db08540f5a0@oss.qualcomm.com>
Date: Fri, 5 Sep 2025 08:03:49 +0100
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
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <kmm4e5bg7uehmlsgrfhzo4agr6ga6d5gxtpxq5sg4t3wql5p6m@llwyz4kzsj7y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: VCtdHm6dq9feaH76gdEHZEw37L9s2lZQ
X-Proofpoint-GUID: VCtdHm6dq9feaH76gdEHZEw37L9s2lZQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfX0AdnnypXt7oS
 E3lpl380Y/y83qO6wpOnngAiFmKkkrnb+SVCzLWI+i32lnFHLi5MRlJhGKk8a1kY7nszlGBKm78
 81jI4EPqE38ZHQrA8h0B4IZ0GC6Me39Qr/PohrcIeGRCWjzK91UC9SDTObG0pwpyX36o9oYUfM5
 Nf11kWE208OOnD5tVDSFr2YPnQvM6j7erE33GWw62frKdArw9rfHnZwMFsxP5YGu6hraoJvRF88
 BMDXO65GTJzUyQmKdzsE6BkfSDpTauHnxAK7uEO85ujbGenzMv/ex8pZcAt5+lfmKP6X86eTGs9
 tMxQyPzmAhgZo2ewqwvsubjHOpvRwHpJQBMlC6ErOEzTP/q2VtO0LkDbB5JHk0JsFYEfmKAETYN
 9iMx/26K
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68ba8b58 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=Jf94gfbLdGj3VxC-8ggA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_02,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020

Sorry for some reason I did not notice this email!.

On 8/22/25 12:18 PM, Dmitry Baryshkov wrote:
>> + */
>> +
>> +#ifndef __WCD_COMMON_H__
>> +#define __WCD_COMMON_H___
>> +
>> +#define WCD_MIN_MICBIAS_MV	1000
>> +#define WCD_DEF_MICBIAS_MV	1800
>> +#define WCD_MAX_MICBIAS_MV	2850
> These do not belong to a public header.


All the wcd codecs have same MICBIAS circuitry, this is the internal
micbias circuit we are talking about here.

Actual micbias value comes from device tree, but these are min/max
ranges that are supported by all WCD codecs.

Why do you think it should not be part of common header?

--srini
> 
>> +#define WCD_MAX_MICBIAS		4
>> +
>> +struct wcd_common {
>> +	struct device *dev;
>> +	int max_bias;
>> +	u32 micb_mv[WCD_MAX_MICBIAS];
>> +	u32 micb_vout[WCD_MAX_MICBIAS];
>> +};
>> +
>> +int wcd_get_micb_vout_ctl_val(struct device *dev, u32 micb_mv);
>> +int wcd_dt_parse_micbias_info(struct wcd_common *common);
>> +
>> +#endif /* __WCD_COMMON_H___  */

