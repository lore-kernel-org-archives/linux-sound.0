Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7286F33ADB1
	for <linux-sound@vger.kernel.org>; Fri, 19 Dec 2025 14:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766155676; cv=none; b=PfZwkC08bwAa/Se+C1pgWPS2xw4q4EOkSQkyEju8y0ECI9d70ehzPcxq6GTfs3R28qHnW+XMxCNqNA74bCMPmB0RgCx8yBTzAy4pp75NDPtXpGh6R8luItiYRkdPNgLUNcUapPhxsEDxs+knvLAr+iZjnn4d+97h/VIFhwN5Qkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766155676; c=relaxed/simple;
	bh=w78XjIOWanqGmSehKOKKJzkJvwlZgqHon/FpET6GQEs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MJD+fX5aPpO/EXeokSO+iyeOzMRcx+OKZX8Ej70pf38klZNgewsgoAwq6IwRcg68MvRXgpBi1QXaG6+kRKfm4AGbZ78K/FL1kgbckuHHlH8luG4w7GLpk03KPgPk8roD7io0TZlmpJ9mh0AG1GwqL4VB+yl84FTZlkFDvfLbut4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HQV4bJAt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JjqJV9LZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HQV4bJAt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JjqJV9LZ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJC90pk3319217
	for <linux-sound@vger.kernel.org>; Fri, 19 Dec 2025 14:47:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F1iTSmIRUH3Wpm9nn7q/H7t7C7jp0Ciq3kOx6kXEZNY=; b=HQV4bJAtKM3mre3Y
	vaUtTH1JmSB3U5q7xeYIYfk0Ekx3gh2G2HZnZtfmOLrtKSdjM4t7aEhuDAytiKL9
	Fb+qqQacnCA+ngUVjr0jnxkHGJUD0IWtTN4DKhok0Pn70OZ9wM5RN7lV4/vE5lmK
	JcJA39p5v6tAPH84tQ53UW5yv02JGt5WciDffPtM6pOX5y+TwWD8jn2OAl211jnG
	Yr97OHsAtFIw6XweCw6eAAEpaM4k68e/ORMaM2TqEn7O9bY9G93Rz4V9CYKWixrJ
	PlTiZtrddYXKh5n5Narh0ZwzmVGQ7+us4WI7u8txWFNNEMgYAdONHPc8whKoZHOD
	M8a+tA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2etxk9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 19 Dec 2025 14:47:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f1aba09639so4307961cf.0
        for <linux-sound@vger.kernel.org>; Fri, 19 Dec 2025 06:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766155673; x=1766760473; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F1iTSmIRUH3Wpm9nn7q/H7t7C7jp0Ciq3kOx6kXEZNY=;
        b=JjqJV9LZ1rJR8Bdv82bRq5cHXCupNdkrARexkxwCl+FgQ3n2fWY4zl05tH3B9QiUNy
         kuCo/ZzFj1C7wwglr9TnVhi9Jd/Mx8FBYfe1os3uJoDLdaTBjVBStTlxAP4jvYasypWr
         XHz+tIpAUJsvVp5cTZPcvwobWZas/m6dm4olGqhV3NA+ulHbfoDPTp1PMjtUjk3Zhyi5
         /SrqF/aVMET1zl9HcqJAHLVV2HsjdYqa8Ve9DQlV4edHZOlw6MYaKwHCwFhhqFSZvH6b
         aF0l5HO6GgAjKyR+HOkFMHRbw0YQ9DUuhAtfePxJ5c0wK8NGVbzfEiN3+UbRi22u70YU
         T8vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766155673; x=1766760473;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F1iTSmIRUH3Wpm9nn7q/H7t7C7jp0Ciq3kOx6kXEZNY=;
        b=dy9n915mhT5j5N9ho4rkWqFd8zXbSr6XD4bnde82/WlGpL+p0ATfs6QmKQHeV96jOh
         JmA/Fd0GKJ8l8ieo+ItIhw1IvC6l9qVqpRvZDeYgJcnNVVQpQd2iEQq8YtLffu7KMSgS
         ZNBrNwxyEtCegoC1dHT8nsEJLyKF54mKeya4LSGT84RPNOiIE6ZG/oqp0HtPle3gK3vS
         2pHSSqZIYFxDOi301+pBLMWbCFKA64IxFxWIM97aoGTlVEoUBrUM8w6WULY1FhlQPOL2
         ivXVfKZS0U2XlVQZ6QaKYKr2kqjc0Iy8q12dX5dCaQ4m5W03ledjt98PBVYTdXhnrLnk
         cmog==
X-Forwarded-Encrypted: i=1; AJvYcCUYwV1GooYUnntbRCAFXW1zop6LysfuMWN7hDVZ1TASdCxyUmXRC2Rm82tlKKLdQ2U9ZVl4CDSR9PkvRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVh6EKIFyMwa5+/n8kSkdG9+Mwqc4i2OpBUI1dekMbsy9Bbx5l
	h+4Z/6dgy+AhFebEJkRtAW1TF5lTSsUvXpQgQWXSmUSV/Np0uRQtHKmnxHeZC5YqTMCctoH28gq
	/lBsKhZ59TE8/qIE9w+7GRHWdHrL2ZPt1x2FbZkWqyicZVvwNuzF0/mtMyhAPt0QqDVjnp8WvWA
	==
X-Gm-Gg: AY/fxX47MbbsBZAX6kUvb4ZPWgVtv0Tyf5alUO8gzMPedGtcGoFF11U8Yd5SrTI3ZER
	k5hZcm6CAhPdzBVyx9aXQMHrnyyV7vPVjW94clsyX1rifkmwQxva3BBYOPgShH9o6aE0yBzQuQf
	gT99U3w9/Rv4O4dH+iaggbbEwyLo3z1Pr2vcqnRq/8ERl51q8/kyGqGEAG1pMahEqpasOyppuzV
	fPh6oHWt7ppxyWu0wdDdIrJB0mKg5dXcKQBgyvRvUYo44dmtvwQ5ALln21Due/UsX9IbiKb5ntm
	IxoXrbh7wAwM0r49CSu/j+2xBOn9V8Z7wMvMcEy0d/rgi4eJBzlOkpSnwns6Sz9srRjC4y4tE6z
	JbRTCjAV4hvBhLd6IzUDe+qgV3QURzQdWYlc1n0j2rOCQbcpLtkgK0lAWtpH0YEfJFQ==
X-Received: by 2002:a05:622a:1920:b0:4ee:2580:9bc5 with SMTP id d75a77b69052e-4f4abce1e37mr30790531cf.2.1766155673370;
        Fri, 19 Dec 2025 06:47:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+xhK8ObNrJ48ftnc1jHWypPh2iebhfDTfbsi/MJV3ojoClN4uhpF4J2LSkP8s4i90fDCiTw==
X-Received: by 2002:a05:622a:1920:b0:4ee:2580:9bc5 with SMTP id d75a77b69052e-4f4abce1e37mr30790151cf.2.1766155672881;
        Fri, 19 Dec 2025 06:47:52 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f51144sm247227066b.69.2025.12.19.06.47.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 06:47:52 -0800 (PST)
Message-ID: <9d6ba420-3d86-4f28-9e51-a239ade7b67f@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 15:47:50 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] ASoC: soc_sdw_utils: drop bogus container_of() error
 handling
To: Johan Hovold <johan@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
        Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bard Liao <yung-chuan.liao@linux.intel.com>
References: <20251219142715.19254-1-johan@kernel.org>
 <20251219142715.19254-4-johan@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251219142715.19254-4-johan@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3Qt1mZLwI90AqvOgNlYWovJsrKNmGI1_
X-Proofpoint-ORIG-GUID: 3Qt1mZLwI90AqvOgNlYWovJsrKNmGI1_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEyNCBTYWx0ZWRfXxnejlEeHQaxI
 dE+Q+qvvnvYJajY+aq2bY6LD5qOMikEbYDQUA7TmPl0Rl9A+25jT/AdYfeNMYWosbiLHLKHgLsN
 GiFmwSsdJCG1k7kR52QygyUOgbSCwA97MNIfWkYV9C/1pzGoyqiav4jAEgFTINuWpI6h9ZU2M1l
 QS+AzX0VpRSXKDqI+J/3RTh9jHic7hwmratbRjNqqjjGND4Fkyw3MFLw4q1F3Qxw0zI3fyXpWmv
 fS6l4Svts/42q9YKYSgxxCqI07yPfb1JLxCKpNa99NNsR8Ob3Y9L+goyebcdYQIb07N0BK9ECyO
 2tyJvwerhE4TuYv0wZNJCEIh1MkbSi0oSnaBQwEeK8eL1aLvHBhfxHLNHCLWLHNkRphdSVKAgvB
 q7dfdhomeCg62GhdVYhQxEWvlkaphMYpsMNahk2O//j0I4K49v0qBvU5m2NZJdrHRmPN/SeLcu3
 XO8oTSbw1nXgXhbcKcw==
X-Authority-Analysis: v=2.4 cv=Tp7rRTXh c=1 sm=1 tr=0 ts=6945659a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=9cGGZZSxXyOUeeFP3NgA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_05,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190124

On 12/19/25 3:27 PM, Johan Hovold wrote:
> The dev_to_sdw_dev() helper uses container_of() to return the containing
> soundwire device structure of its pointer argument and will never return
> NULL.
> 
> Fixes: 4f8ef33dd44a ("ASoC: soc_sdw_utils: skip the endpoint that doesn't present")
> Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
