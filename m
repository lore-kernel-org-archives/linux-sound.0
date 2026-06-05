Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE6D3F8EA2
	for <linux-sound@vger.kernel.org>; Fri,  5 Jun 2026 11:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780659776; cv=none; b=utG2hnNn+dZqPKz96J6k7PD/Bs9KH43oDwDKDh50nvGjYCZCkYUT047+ne0z7cF9ATENtXO1l1Sw2J1sDtHfHTfEzBa9lfDElmIQd983ndc8LzpBfbiSh3UC88RwGkMFhWd66eiJIvtG902SWy7GmgRYbjyMlEfLgLGtUsyPgeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780659776; c=relaxed/simple;
	bh=ZOxNwcAxgJuwesTTu4Buf77BKR829ICvZ5T7AoOiC/4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Qf3tZS/Njlqy8K2xkV8azlCdFdU4ndTJOoMyMsFvbwYlLMwP0VkMsLdAhwFKffPXXkDfOsKTkF8TtaqVNdy19CQ2GkUzYzlmD5FbkQbMTc12BEpsn/wtDDCcgTrjxzW8S40HR4TRweayPCxxk1V16vYrdKGVRjBJWgU0Ar0mezU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fLRWRQnb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eU5ymAlK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fLRWRQnb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eU5ymAlK"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65575mFP1502474
	for <linux-sound@vger.kernel.org>; Fri, 5 Jun 2026 11:42:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uPBjwVOd2SfO6t7DyDLUX6jVgyApWKoQB7ymLnNgC9g=; b=fLRWRQnb9uIqRpAG
	ukdjTNqg1UK7czTwaZSftrfDWsVB4gOyOdssKev1BBTfCexObDS8sotAf8pye4ux
	osNO1Mqnkuf6NsdLDpMiVdcxm4iXidfVr5H5gWaAYgqZdGpPnyA6FP0XhTeNiXm1
	7HO9UCVVKSkhxD2dhg2CIv3v81wcftZqrU3SwYf2cScfUdBQ4qyw71ambXkltgtB
	EygTpxaq343wGgFyAR4V/fHPgacc4AMsbfFQ0d/M68T83X1PzC1+N/WZqNlQs2x7
	lidThsVtAjAPTGU48miKRyrI/tyksrVkbSQRPcrC1i757E960PJv6At4Uqh0ItDF
	Fyzfxg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eksrws1c6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 05 Jun 2026 11:42:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5174a23afcbso22412841cf.3
        for <linux-sound@vger.kernel.org>; Fri, 05 Jun 2026 04:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780659773; x=1781264573; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uPBjwVOd2SfO6t7DyDLUX6jVgyApWKoQB7ymLnNgC9g=;
        b=eU5ymAlKQQZnsFZi5MxwOnslMd79bhBIE7fWpSD0emoNO16BewOg6h1fczzzxp8D+p
         5f5kEn4X9D6xuyUqu06iTiQeOjGLoO4/Ym00b0Ypqb+mOMiN2b83wLpczXClOFrhIfe5
         w1XiX9kA92wDpWB0nBqkf2VBVcbhVPMM926qnmruxxtrgjvYwL8nIT5aNH7EQT/gME2x
         ALHx8vH1egl8r0P9WN/g/efjVMRP7uZc56JNehnqyaDC4dxFCrRamXCWqqkrNiatDl1f
         EkD28ZCTCbT0NRZc/G0k0MP009Mn48Amw/u0EtGq7ym3IUbaU0uZUYOsrGyRaQtdGX4i
         0OQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780659773; x=1781264573;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uPBjwVOd2SfO6t7DyDLUX6jVgyApWKoQB7ymLnNgC9g=;
        b=K+kxuA7RW/BCwR+bYw4xMCDisc4PIAi9AN2tR7KvO1pXi/8/xNxg8L/xFjk+iYiL+2
         yNqsUM80wKMIFqBlkVLOEH+3ec1BG2cil12Yt5GRyttgc9o87Iirx50REaWduwgmisLE
         3dFnTADfmJoDpd35L190QmLld5TAxxT1MigyP7W0Yaq8zmnaG+ll2jffCwjPMOuH5Ika
         eD4YOBa4xPsY5p/K+/652t8gkcltBV1cz2As8kK4j6iGnCgKcQfVDBGd11czGY2slr2c
         33t8olUss0zogYszt12q6HKpSP+tbZAh3SzGv7wkwHmKzgZBu6vJ07K2a0DOhIEIKOF4
         NKDg==
X-Forwarded-Encrypted: i=1; AFNElJ8iOI/p4ZbK5yVtBsrnobKp0laEPwu5WhTdJ7rsPurKlawETpXrHx7UbXGxHTf5KOC9604Apwptb/L6bQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy74qloqwgS3WqEKURNWQqA8DrS7PuCfy1utIoMzSUbBJW+RWAm
	SRLdh976bQFoQCN9Lb29PdQgQtO/QtKbKm+NOX+XCyCrhpV8uqF0FhMhzJ+Ac8VTbhc951Te38V
	4R2sHGsci297IAGE3ca4rurnGc8YsLPthL1BiEluvNpSqoApMyTp2rJ4H/xcd7QH38w==
X-Gm-Gg: Acq92OGpIC56KdFaIFrVP5XIdyodxG1WWNxFulTK2bwJSrmRKiJgyTtAihaE+6GJWXU
	kaDv8lLiox1YuZnsbfDSWBVtUsdZrq4y0m/eu+nLqgrbN4wApvS5IyZmAux+wES4nsPl5xf6ih8
	2y9xOM48buP2u5vfKqTPowkvGN9JPAlKHytHFkPOmiDa6MXBe0bUmIXSG/7AB76c6csdtWQ9Jb/
	9jFBv9MvcwAtb9Pj/2iUCAII/BjJwLRduqwg36Cn05XlA2wKbRjAUYhYuRtywWc7eJ0hvNC8pMy
	2ch5Ficb+ta08lxy+ADUT6EZrMOQIrhYCb9L1dMgK2BnpZCOIyc2LrwrNYvKNitisN9//duYeMn
	WXSaR83w8nk/ge+0qwgT4FUtz+bcEDjurvRDddRu7a3QomPGbf8d+xZuMdiM=
X-Received: by 2002:a05:622a:155:b0:516:cee1:4727 with SMTP id d75a77b69052e-51795aeb96bmr46253101cf.14.1780659773108;
        Fri, 05 Jun 2026 04:42:53 -0700 (PDT)
X-Received: by 2002:a05:622a:155:b0:516:cee1:4727 with SMTP id d75a77b69052e-51795aeb96bmr46252631cf.14.1780659772606;
        Fri, 05 Jun 2026 04:42:52 -0700 (PDT)
Received: from [192.168.68.125] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4601f351ac0sm41760570f8f.27.2026.06.05.04.42.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 04:42:51 -0700 (PDT)
Message-ID: <dda555ad-71e1-4420-beee-eaf6a1ce2c8a@oss.qualcomm.com>
Date: Fri, 5 Jun 2026 12:42:50 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH v2 00/10] Expand SoundWire enumeration helper coverage
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org,
        vkoul@kernel.org, lee@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        srini@kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20260605084810.1575539-1-ckeepax@opensource.cirrus.com>
Content-Language: en-US
In-Reply-To: <20260605084810.1575539-1-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=L5ktheT8 c=1 sm=1 tr=0 ts=6a22b63e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=w1d2syhTAAAA:8 a=EUspDBNiAAAA:8 a=EjvMs8CsDyu3LpJ9lXEA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDExMiBTYWx0ZWRfX9oXSAQ3U5UJS
 TBMkENooSdyP0ru4vxSkGzdNIIlpFJuJnZGk7uWC2L5KEvbnLWx3YFNZZn0gkIiLdRK8lwFA333
 c8+uM/ZQs38/3fwVvC2Tfac71biDVIkRNVOyhXHY9PbtXUgidGG8JKQrknXBuklvsy7mzhuMsQR
 97paQh4XaiSvZhcq8/3DjjmO4XEMyLDKuMZAj4I830TcyXrNofntxXpuKmMOlBvHO2bHf/jmvCs
 pcZhjqGS+vHEOIqFvnZKAiuMmWn/BFds9pTETdv6JJxfdmK5GwHiit/KDFpZTO8el6NixPFgiki
 rt6f1SBlUFNWu1oOkkrmJL9zcUdx1ChkyG+QqxysiIFo3OvHb0HO//QOed8MykzU43jiUBxi6/E
 zg+I3ANza0v7C66/pktK1n1VMl+R353PrpH6p3RFeI4Kut2m4frdzyAmIrteuncTy0dJxy27LWI
 DyfEFMeTcIdS5xud48w==
X-Proofpoint-ORIG-GUID: FbPNTV8ST_mLTPgQuVvAI1RuhHuNj6mG
X-Proofpoint-GUID: FbPNTV8ST_mLTPgQuVvAI1RuhHuNj6mG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050112



On 6/5/26 9:48 AM, Charles Keepax wrote:
> The patch series in [1] added a new helper to remove common boiler plate
> waiting for a device to enumerate on SoundWire, however, many devices
> also wait for enumeration during probe. This series updates things to be
> suitable such that we can call the same helper at probe time when the
> unattach_request is not valid.
> 
> There is one final step outstanding which is to add a core helper
> that waits for a device to drop off the bus. This is not include
> in this series and should be the last step of this process.
> 
> Thanks,
> Charles
> 
> [1] https://lore.kernel.org/linux-sound/20260512103022.1154645-1-ckeepax@opensource.cirrus.com/
> 
> Changes since v1:
>  - Completely remove the attached flag from cs42l43
> 
> Charles Keepax (10):
>   soundwire: Always wait for initialisation of unattached devices
>   ASoC: wsa881x: Use new SoundWire enumeration helper
>   mfd: cs42l43: Use new SoundWire enumeration helper
>   ASoC: rt5682: Use new SoundWire enumeration helper
>   ASoC: pm4125: Use new SoundWire enumeration helper
>   ASoC: wcd937x: Use new SoundWire enumeration helper
>   ASoC: wcd938x: Use new SoundWire enumeration helper
>   ASoC: wcd939x: Use new SoundWire enumeration helper
>   ASoC: SDCA: Use new SoundWire enumeration helper
>   ASoC: cs35l56: Remove unnecessary conditionals waiting for enumeration
> 
>  drivers/mfd/cs42l43-i2c.c      |  2 --
>  drivers/mfd/cs42l43-sdw.c      |  7 -----
>  drivers/mfd/cs42l43.c          | 15 ++++------
>  drivers/soundwire/bus.c        |  3 --
>  include/linux/mfd/cs42l43.h    |  2 --
>  sound/soc/codecs/cs35l56-sdw.c | 47 +++++++-----------------------
>  sound/soc/codecs/cs35l56.h     |  1 -

Thanks for the cleanup,

For all below Qualcomm codecs:
tested on Lenovo T14s.

>  sound/soc/codecs/pm4125.c      | 11 ++-----
>  sound/soc/codecs/wcd937x.c     | 11 ++-----
>  sound/soc/codecs/wcd938x.c     | 11 ++-----
>  sound/soc/codecs/wcd939x.c     | 11 ++-----
>  sound/soc/codecs/wsa881x.c     | 10 +++----

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Tested-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>


--srini

>  sound/soc/sdca/sdca_class.c    | 53 ++++------------------------------
>  sound/soc/sdca/sdca_class.h    |  3 --
>  15 files changed, 41 insertions(+), 160 deletions(-)
> 

