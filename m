Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9B73BCD2A
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 12:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476933; cv=none; b=ihpc/bLsHP4lWTQ8XaO0xa9Mhtn6S/5JxaMgXvQocFJfKav8Ss7y6CJXhhZ/AhyWc09beSet5InWwCXoQ1cINV/t0Q4HERr4NgIdhGf10PiRBswMnqNj0pLQmR1KdKgunTaoHdMZ3n65r9ONNCdJqz4c/dfb8hJ2Gb46Lo6rP8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476933; c=relaxed/simple;
	bh=eBuqRI24vD9lYQdJzGI9yYYYHDAzmgfP+d2spgyUCE0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RcnayJMR5PfdrjJkxr6ZqVlpwKTi6sMuEidy5RG/S28zl7ntWEoSw62bnImUXvZk5Sdd3TpHYlC1I15Dnnsos5xIGwE16UMLvda/lyp6ArKu85oiqgNLfffs7QSI3aw6hGALXfr/dDJk3bet2/9bSCrI6uMu2rOCCrMn/jv0zH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PVO+5lEP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Js5V6Q+w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PVO+5lEP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Js5V6Q+w"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9hHSm2833328
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 12:55:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r4oI1G/Tvwo9Ye+D1/omQonq92SLREOl8PUl+SUaYyg=; b=PVO+5lEPcrUX73k3
	qJVcygFJF2n6LbU2fBb8YO5youBtQ8EgV4G5/PnY5VtJGH/5lG8u2NzcXdlnxWJk
	MZoeDcPqNNwygsna3I4NsAoxdmJYetCXTI/fXuGv4BTJmD3cWdkZGSaRPjpd/bSe
	HqKPZnq12RkGMQmS5PcOdaXkC5TDXyuueVy4h4oenZA+/wT4zdoe7RKAmei27KRw
	UACC8uhZrtq0dF9+HrKAotgmlcKWaMY1V6f/b054vIsEBuGO6FeCS7i/a9tO5DuD
	f0df5fL/iBsVcv0hu7PDWvZDbFgzcGafIPTaUumQQWBEEVcMjN1g6XEc9rTsavRX
	jfoQuw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpxyd9vu8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 12:55:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936aa34873bso787891985a.3
        for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 05:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789476930; x=1790081730; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r4oI1G/Tvwo9Ye+D1/omQonq92SLREOl8PUl+SUaYyg=;
        b=Js5V6Q+wvAsgRkrObYFDLE3QBOkVf/QScPSenBdIJhoehrpb2nDV3Py9vxriiRzCYS
         q2jfDhU9U9DOd3rSG2hIvYPz46vsfdsHeA0Kb//zHzUyFM4yP/nGciTi8guXNeJmkZC2
         LCMR8hS/iTzoyHmVqICq5hgp64TPQPX+oJ2apo3Eucf6QaYRgrLuBGNJwX2qnoHdd+xZ
         CLfjmqBiFY5agAwXl/euvWbJqXIMuP+icNW4YRU9MAWIGC0EER1vJuZlLirhDpzF3q24
         dkQrNbtabmtHLpwzEDmc1MIWCMErPkOz9NejrxCy2NeOfcrH5r/YMlazLNHnBfpdY5uk
         jW/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789476930; x=1790081730;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r4oI1G/Tvwo9Ye+D1/omQonq92SLREOl8PUl+SUaYyg=;
        b=TYUn37w1PVRum/GvKHlA9QbpFnhdgecO4o8nCI2xr12yVcWLLfPwdAYAUrHoOdgZ/R
         ITYXlSDph+YaALXlYOMcKHn/IviWLhYiNBjxtZkWbnklRQua/ZlKJ5I5yjvcL7boWA+r
         JnBjiUQgI10fcEH+JV34r3LgUdbuVsoB3xtrNNFYe6Plivf+MB8knkeSF/7lu30ApFly
         8Ixm3t3MGI6UHDvhptVgIga5cNJrtcPBMqtb06qSYsoWr8hKI524xXGCZCREv5J58WWS
         QRpt6Yj0DAjZgsnVYopxnrHC9k8hjU1aemRSuQ/8C+R0l/5vzj9kE0YsxX90kJBkUbO3
         4g6A==
X-Gm-Message-State: AFuF++lAaRvzsAgJrElPkJuq4jAGaR1WAKkDAyut+w0ZRvEmoij/PSn4
	X/9hKTAPLue25c6IijBOHhbcxtGwf/sZY7qYr/9bkkqzY6rb0qZZvXZiWh+nJ1M59jD4MtcoDSJ
	oyEUJ9udBmLD1FVxe328Xdj6eCkqjmh/ENJKsbay9api0GwCsvUdYEQfBtPz68eh0vA==
X-Gm-Gg: AYBFou3Pff38cmALQXYfBB1ABhFUKxR8YR22ha/Sahv+l06L+UC5ZiBb7TdhMWPDfDP
	kriNJeTdfWV5rjlww7TG1rFdNdX9hDZ+QY5X0D/JDidjQaVcjAM1tq70sf4bvC3lhRt48DrBpDj
	SltbJEaFV2zCBSGnzP0Jtu72VD+JRTxctMWhrdJqC7fFFQAhrwGpak7kOrkyOAGFaGGkPfs4KGE
	bRt0JFOHS32M/QitWXoe2fQmq6EmwcWYzmotWHwNTSz/yKo/6SOL7g7fe2SbwajKhhyXTPwLeka
	rUcXoaBe/pw/ZFO1oqO/J+7hQYTLUdyBkLTzu1b5Q24rGFf/O06UEncX6zuu3jLM3bvDcgx0PPY
	0KfC0c37ERmE6R0AezfZ2/70/
X-Received: by 2002:a05:620a:2556:b0:939:13a7:70f0 with SMTP id af79cd13be357-93a40765af3mr102081385a.5.1789476930109;
        Tue, 15 Sep 2026 05:55:30 -0700 (PDT)
X-Received: by 2002:a05:620a:2556:b0:939:13a7:70f0 with SMTP id af79cd13be357-93a40765af3mr102029085a.5.1789476924914;
        Tue, 15 Sep 2026 05:55:24 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939ecc38105sm1206322785a.4.2026.09.15.05.55.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 05:55:24 -0700 (PDT)
Message-ID: <9ba16818-ae60-49a3-8444-c1056c03c63a@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 18:25:16 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] ASoC: qcom: lpass-va-macro: Add shikra compatible
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260910-add_shikra_support-v2-0-fdd2129c696c@oss.qualcomm.com>
 <20260910-add_shikra_support-v2-5-fdd2129c696c@oss.qualcomm.com>
 <8acf2491-01f3-49d0-a357-39592ba991dc@oss.qualcomm.com>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <8acf2491-01f3-49d0-a357-39592ba991dc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE4NyBTYWx0ZWRfX1s9B8SMQESIo
 VuEKoyfEp8N5TEm0KjlLmbAaul17EguFx5HjFXmNnQlyi6zIsxMpPpUQTMSIGuX1dWnxlpucKPI
 kZ/X8mT2Dr9SC879plNpaoVLHQHAQzg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE4NyBTYWx0ZWRfX6TbGVm1X1TUc
 RNg7xbgE8HQXmpK0a1AIUqJxZ0HZNh9LSW1DbvwrIJebmqvRficuGxwxonjKmykbY/zilqoIS8e
 H1fV78yxHKgKTQZWahRlrHXuMbRxHxZCnhMSR9zhlA9wCCVAMzO0uaNlnUW3mdA3/8xr5eUAOFC
 gR0cc4Q+tfNkbxjlpE6oFTS3TigiDoD1WcS9RBj0NgffKS/Ouo6l5O+BrKUcafBToCCIGOwIFuU
 d5yRnL+JKccDs67AOUp9LjGEW0/3lbK0LaIqOLLuTszTafHGzfe5UsR/POdHxb7sfEN2NU9g/Dw
 YyLk77M3FG3tZP6lzOmiymvH4VKAiArXh3+SN7b/GAwTbAIBCYeBy/AffWLB9ioivtCn4ucld75
 l1vIBjFHnmZVihxmcf0rR/24JmzI1NTUxy9GH4ON54rSFbsIUUmhjyXpcijXd1pmBPMbDdtIkrg
 Kl5H/emDm0HaC3/SKEw==
X-Proofpoint-ORIG-GUID: 6aGSnwmMleqpR79NfNcsEQbmUOIPtPcP
X-Authority-Analysis: v=2.4 cv=LYepeTfi c=1 sm=1 tr=0 ts=6aa94043 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=xk92F0r0DzOCDTAHD88A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 6aGSnwmMleqpR79NfNcsEQbmUOIPtPcP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150187



On 9/14/2026 5:17 PM, Srinivas Kandagatla wrote:
> On 9/10/26 10:46 AM, Mohammad Rafi Shaik wrote:
>> Add shikra specific VA macro data and register programming needed by
>> the LPASS codec v4.0 implementation.
>> +static const struct regmap_config va_4_1_regmap_config = {
>> +	.name = "va_macro",
>> +	.reg_bits = 32,
>> +	.val_bits = 32,
>> +	.reg_stride = 4,
>> +	.cache_type = REGCACHE_FLAT,
> 
> Pl use MAPLE here.

Thanks for the suggestion. I will switch to REGCACHE_MAPLE and update it 
in the next revision.

> 
>>   		regmap_update_bits(regmap, CDC_VA_CLK_RST_CTRL_FS_CNT_CONTROL,
>>   				   CDC_VA_FS_CONTROL_EN | CDC_VA_FS_COUNTER_CLR,
>>   				   CDC_VA_FS_CONTROL_EN | CDC_VA_FS_COUNTER_CLR);
>> +
>> +		if (lpass_macro_get_codec_version() >= LPASS_CODEC_VERSION_4_1)
> same comment as in 4/5 patch use a flag.

Ack, Will introduce a flag or switch-case mechanism to handle this 
configuration.

Best Regards,
Rafi.
