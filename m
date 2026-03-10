Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5311D32ED39
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 15:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773155996; cv=none; b=eo1pTZK1CFLBynTb2v/PMA9N2sRU+yVg1p8f4xzHfSJVZCmVyLHLn2Orq9SxkOZQyvk1ES3UOl9/nTlEQgVzpYeMGPx3nxPTjkibLBuiwJljaPk8NfoGxCcnu66LYrfEO1jOqoN+3UTDv5L274B20E88wpi9A432k4mTcutaiEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773155996; c=relaxed/simple;
	bh=Y0Wdue9Hov/jeRThd+ve+ss/+RVIzkAy4V1Rl8ezbvk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YeguoZBjEGmcSyFg91OSxCv5DpPjG33rxpQ6lHwomOpktwu7vXYQ8w43npPc26q7x1oQTqj7new4aSCO+KQfhtt6+2DytqXJ/ibjD9Wkx1Ghd8ZBAdtr9OpXXCiI2IBR/WqorLbjtbthSFyZDlZ/pLDviKleaA0RzhvJpGNVWKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XZjavMOu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HowtOOZJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XZjavMOu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HowtOOZJ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACagdc024740
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 15:19:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wr3E3KZIgt2SmLWl7S/JE0LCYCkRItSsKqlqEkGNm9I=; b=XZjavMOu0f5qzxrD
	rsWdh7DQEHy+VXqOGyO/zY7uzEcmTphJp0ImC/5+zbeOl5SkoL/8EbkAx6RmLhQ8
	snayLccF3TUh301ZjzHD54VijsdfSDbIqdlUTWh/0jSWEvx3qtN26Mpfqq0cOdrB
	lUWAi8guEa03bX6CGmpbFlxvYUFEzJrUC37c1Ze0RtFHXG2N1gWrBV3kyT6t7wzJ
	sLuqWjvAytMKsae+bXZsPrXBPMXfAh/XdmTGmfpieBBnMdAZJqiJcF/ZUyEgz6j9
	CgmnaoJz7RGlg6ZeTJ2ukz0fd/9QQ8vTbK+pG4GHV3nkNxwII7K8xL6NhDm5SwzJ
	ngNC8A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctg5nhg4r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 15:19:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5033c483b76so884894991cf.1
        for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 08:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773155993; x=1773760793; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Wr3E3KZIgt2SmLWl7S/JE0LCYCkRItSsKqlqEkGNm9I=;
        b=HowtOOZJY0tS0v8waZ8UlejZ9AFZToVJMOqqYKHHZaWzjIYIUvqhEp9VKPr24Tmn2c
         tbtXvHic6hZoiEHoRiyA04ZhRlSHP/HAfxz1mz1oPD9KJXmMpWhEOECXI3K5edJBSeG+
         3VqqaZqmG7WYjMhQQjgU/dqQ5QMp3B+b+RGzBt03A54jJPA3XyNaf7PZdXimapr7OEuo
         wl+nR5AGiqipwAqVXJgEeUN5R1KL+IitIrNuaqgyQZE6MEHIminiX41zRxCvBdo0Sc/c
         yxXzg8VsZiipGpF5HKPCto2OxX1YrqrkFezqSHsyu/RgV9x72yRvCayReFHk5MCV/8YH
         Qkrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773155993; x=1773760793;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wr3E3KZIgt2SmLWl7S/JE0LCYCkRItSsKqlqEkGNm9I=;
        b=s+mPMP62jV48hT9WDKIHeCfoOBg1EDy7uwzJpN6uIjXASNeI3wVud6LknLaCTBakH+
         I8jRk30k+KxoSgHOjYjquv5p2KjWWTj00gYSEFn6pCNduKmFG2kz8WZ2rwxM9HPwR9d6
         1jexv4yUA6qMBTKdJIyilC51or2SXsLXnAWGTR7aYb9IPv+pNBZ7/ppDbU7o3Ogo43kR
         0QU/KG1mDaUadXTL5tjjSSmskXMhlGovsYWSaIUf/yii9qZGqUM/cSPKpMuySyVJfb1v
         hbjyoT0ZXPASo6gD0/vot8DeoVhPpZ+VzS5p2bKd2sM5kkLROI56tvaKvx+Maeb6wZI0
         lxlw==
X-Forwarded-Encrypted: i=1; AJvYcCUglbR13bnbh4/MTpbEYPXLpJBuxvg+Nn+MQxtMvBsDX8YbKkkc0mICLrPYtcCn4ZAczluJjGxYqMYVkw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqTubDE0lM2J1//fWQMdtp9Wj5rYSddvnhGG9Q3eFWIaY5KE+i
	1V7qI8Ilumj4tXQseKJnthgswcdTjJXJxlrhaNdR0wAJbGGedvQe0Weow6Vfpfkex3TEnhbxs4k
	Lpl9VFUbUOoADZGjYLFECKqb1IDVEMUgRj1zzu0bzCMtcf+HRpn8yt8XUzjnK7d3oVw==
X-Gm-Gg: ATEYQzybM8foLxc51TNyDrGgALGxXfcZBFsyP7ZPa5oBYZNuR+gVsEJwvqWN3wjAJ6w
	Ki66mMI1rkbZBv4AlxU/q2WUDeKnmOc/m1M45FrPY/itISkJAdwLI9DbDTPME+Cf47bD3PPYCOA
	FCPsvqiXfxfcYYvoix4SmfyADdRrPsPCrXQeKOzMcMLhse5TeeoEYyUkBKs5K+nI80Y0iZue4UL
	IfP7hMmA+U0vmCE+JlpbUCQHwNxJ2iCneu4R6FV/t91IJENY3flmBRAGB2y8wqPNmrKDSi6UwP4
	Djyc98L9w40bzl20MApGIxALnwzyHYJiZGW92viLjULB94AXOZui0/KHD5KgYan3//AHipeTEn1
	Oy1UeoYBYnXo7f1R0gYn+S362dwYD0UpiR2LPxcgr32vaOljT
X-Received: by 2002:a05:620a:4485:b0:8cd:94f9:1bd0 with SMTP id af79cd13be357-8cd94f93e31mr348408085a.48.1773155993642;
        Tue, 10 Mar 2026 08:19:53 -0700 (PDT)
X-Received: by 2002:a05:620a:4485:b0:8cd:94f9:1bd0 with SMTP id af79cd13be357-8cd94f93e31mr348403385a.48.1773155993066;
        Tue, 10 Mar 2026 08:19:53 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae3c80esm32983764f8f.29.2026.03.10.08.19.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 08:19:52 -0700 (PDT)
Message-ID: <11a0280c-052c-4cc2-9761-44acea55ac33@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 16:19:50 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] remoteproc: mtp_scp: Constify buffer passed to
 scp_send_ipi()
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-media@vger.kernel.org,
        Mathieu Poirier <mathieuu.poirier@linaro.org>
References: <20260310-rpmsg-send-const-v2-0-0e94c5db9bf4@oss.qualcomm.com>
 <20260310-rpmsg-send-const-v2-2-0e94c5db9bf4@oss.qualcomm.com>
 <8d965895-c77b-4d67-8365-3ea6a8ef5fca@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <8d965895-c77b-4d67-8365-3ea6a8ef5fca@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JsEJ_zF9kzT_V1SM5xXUGn5KPXrr6Zgi
X-Authority-Analysis: v=2.4 cv=ervSD4pX c=1 sm=1 tr=0 ts=69b0369a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=QX4gbG5DAAAA:8 a=y30i2QHNpJnWzB643pgA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: JsEJ_zF9kzT_V1SM5xXUGn5KPXrr6Zgi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEzMyBTYWx0ZWRfX+S/qk+6jTWcR
 K7G0Z7uBOt5st3Otqt3AvYxFZqNLGMDjiuGyCPwlulf+rfowgXfFxDIhX8RZXymfurheNy/4dfb
 nBLstlxKWd66HBGQeeKXCD+UUqQSJ8gPiQyWwAMJc+R/FJHuQJIVmVbV10kB9t9Vw4ZW4uG/xZD
 VHmmgyAwxSrv+h73MyNYOHMCnhkV3SCzPKFfo/B/ee5VVXmv1Jko6CfB5wIWcXkPySQUnL5b1AD
 CUEKryX9qIkWDnG65C4gkd0kDw2F+9vTyUdPvmKvTkQTFSdS/whMMDommK3LVqNW3FZYjHtJd70
 vwlVzy/ezeThSBcrfGyS0MCjZwzw+RJ0I+6Vjm8XcQFx/TA2NV1UX1EyI/S7rL2C2+kzdYldBj3
 41RM4cowjvjgp+hClkQEh7TmdSJXnIAuNPguCmDqeoAfyLsG/bD6L7hK6DBaDqjMkG2I6Nt1y5e
 iFn0kMUggT8NTjLHNoA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_03,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100133

On 10/03/2026 15:35, AngeloGioacchino Del Regno wrote:
> Il 10/03/26 12:22, Krzysztof Kozlowski ha scritto:
>> scp_send_ipi() should only send the passed buffer, without modifying its
>> contents, so mark pointer 'buf' as pointer to const.
>>
>> Acked-by: Mathieu Poirier <mathieuu.poirier@linaro.org>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> 
> 
> Please fix the commit title - that should be `remoteproc: mtk_scp: .....`

Ack, thanks!

> 
> After which:
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 


Best regards,
Krzysztof
