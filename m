Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794478166;
	b=j3gI6Bi43okEQOh9VQnDplKCoQsEvhBeX0yZz4tgQZUyi35SIaAGpOaFaetXgXK0qOZR
	 byuO3/bz3ifjZNCoKqw1L2Pj8clfxpxnVSPt+mAeH6ZVkXJ+2YokfiUy2hVKMGwr1A/CH
	 r+5ZfOk96avWKtC2CuI+GVdxTzYRmHP3e9p6SBvgQZB3edW0aFTpe8904/mUTXz9BlYzn
	 SjuBC1l6LrfCdyc/BH4GJAg21ckSgTUpvlf97MZUT+BnfLSMTL5PEJt64jwSuyPxlCXaK
	 z8YXUTZ/6RcroLM/S0OOmUXaI74WPiIngpFochy8DdNBh8z3/cgBvqrXTKkRzzej4sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794478166;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=O5L90x0qJtQLjtO8wu1AzKm3UqP/ZRrsRFZq7AMcdGQ=;
	b=bQVgFMHcV7mOJ5hUzzRijhRijhISWbZ6tnUnbJ97Tx5CdF9853cB07eWgpa6daHkxmZM
	 Thoawj/CpAaxVkkj8LJcGGpbEI11UgtPEso2kr9uqs7zAqDckvHDHo1VwypYzmcs9DDII
	 p8h7j1n833t1yYEClXByRNWLC5ePAY2h9LrBfMj/JhNCcPFNnRqthlGMj9Lc35t4cn+YZ
	 gsqHACvkyYxtqsiuMpZPBNSAB8vNd521xTkWNZJOSuDR9O4mTXxDVm8Vr2NYUmC6Z9T1J
	 QfSoFVXGMmaQmB9wbEbOfyaqmeMb9kQUUgzejJhUXoZWXD1x0/KRQoOow967U2mB/9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z+mVmidC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bhHQXAO6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71533606A327
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 10:09:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71533606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z+mVmidC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bhHQXAO6
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC7oWio2818579
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 10:09:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O5L90x0qJtQLjtO8wu1AzKm3UqP/ZRrsRFZq7AMcdGQ=; b=Z+mVmidC5pU/7H58
	ppN+5gd9fW4E9aupzUBR+8n3m18WAywMq22mlqus8et5Jj3bsd+QvVj++p1MkI6Z
	mtaufojodvfS074+xpddYk6YaOWa0dq4QZyvNQrGUWY9XwcINwFHXbEPhEUFFJG4
	hainEEeEQRmVfkhV4/dF51kPSxMkKkd88tj5mmMZSa+Z1u3sJ5ASONY+6P+sGfm0
	LBWHZY2N7camWy9NzgbhjlxYlWG39pYwSDAA2LAL/aDmVHoEksUbe2CvtRVsVw6V
	7NvKNKZ8E8Ny0cteehfuu7o6dGIMZyzk/gfKKFIURz96JfCw2wfDcMNWn7BCKTLS
	qGRWjA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9e18gs6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 10:09:25 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b0a9de9c2aso3094793a91.2
        for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 02:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794478164; x=1795082964; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O5L90x0qJtQLjtO8wu1AzKm3UqP/ZRrsRFZq7AMcdGQ=;
        b=bhHQXAO6YGRe3KAn2gun6jzd5J9mEP4cRt4RKjF5Iycvz0K46hLE/j2tIPkM6yv1LS
         q3FgrcAfPHZ3DTjhBg6x75aNBHiYS9GCqZ7HJfZSUmq3hgjMivPqC6N8xc2bV3eVMWDr
         bONhe5w23Rd7j01HSFDaIInuMrgkBx7qF0eMhrxDTs+65j5B86o83lLtX4uNoa6cyGGN
         /1lhrr52mLvrYcHDY34l+poUqWzXRww5llZtDgLWWYBvyGOuWqvarjXiM0Z7yqu5/3Pi
         SvRxgMXG426K39MEbfW9kglbQNJ77QYjPU3c4WwZ89W/uoHERXvDSz8z0o2EheZUpPNS
         HLSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794478164; x=1795082964;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O5L90x0qJtQLjtO8wu1AzKm3UqP/ZRrsRFZq7AMcdGQ=;
        b=iNEr99M+etEr/EkZU5YdixXi4mzYOOl2goJ9i9P8X1RvJF2II8USVorwZBMtaJRljX
         WDJgdAX0yUJywtKjxzotHquciLWhD2eNfVz93JkIs6ZHDYuqyQ5lO453q6az0DnAcm3C
         dxA2Y5oMDRWIFMpU5liGfAeTxFwsqvgPPb6Cqeq746ZPcnQhWLdISZklpvPuj8ehYaWw
         gI7+Mrji8OAxFVBub0IhPlR26Zj0yk8rNng1ukvtacvKmKYYXqOgZaUX2fQ0g/Shdhw5
         WGnXJm+GUURCwjc3hE5jp69fu8pqrfOPPlhsNsYj9tsMBYXqO3dwxkxrvX6Pih3nvNaa
         Hwlg==
X-Gm-Message-State: APuU4Z/j1oAaLvp5AkXwFyyEP/m5erxwoM+7PzNZ+Z2JI31uqTvbu+59
	NTiyZCF9ERozANU2T8Mjc/PGDRw35sHJPhoyJNLhaUGAUPgfQmHywouk2IEbw87awxMZ2Sbbzpm
	Bwdc4f/y4f5vJwy2aQY1yu95MifVgonDJWTu3Dhzy/ON4MlESPjwaduEvUXp760gr6A==
X-Gm-Gg: AYBFou05muN18SYnJMpUSz2m8yhMrg1vXWHxvv7F/fTLPYZQu/H1bA0DT6Tgqeg6lQY
	8zOKaopn6Vp6Q6OKpcFXmHbpWNz4zFNAFEUjk5e6O/EMvaKp3EkU85YQweg7mGhPeZUzmmKiHW3
	SdDNkivSgeYpaiaOHGca97tzh6gObyIFNXPL8GjC7slyPR+eq/mHiAeTS2Oifsuavvi8N+AoVdl
	fiHW8AwzapIeK+4N2/ALLmxFH7kfDyAMyRTBp9M5pqSx4LUI7PxtzdvYtfQXyL4u6cceKweeVaw
	SaI9nULhdh1wEemQN9WrqKGYIc6O0ch5moR77bzEKYkUMariWp8es7xh6VAB10IUUEckKBO/y9s
	iTqUY31DcfTGKWdNPUnXhUilvVpo4uuRH5uDNLoVPMtYTyuwCCW77bHsAFUox8PtfT2jWJyHEk1
	62UQgPyPUV+d8=
X-Received: by 2002:a17:90a:e7cd:b0:3ad:6090:a189 with SMTP id 98e67ed59e1d1-3b182f93b3cmr5126602a91.45.1794478164031;
        Thu, 12 Nov 2026 02:09:24 -0800 (PST)
X-Received: by 2002:a17:90a:e7cd:b0:3ad:6090:a189 with SMTP id 98e67ed59e1d1-3b182f93b3cmr5126569a91.45.1794478163557;
        Thu, 12 Nov 2026 02:09:23 -0800 (PST)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0f6e0sm4005578a91.9.2026.11.12.02.09.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 02:09:23 -0800 (PST)
Message-ID: <27de4b46-4fdc-493a-abd2-f28f22ed6c4a@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 15:39:18 +0530
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 v6 3/9] ASoC: qcom: lpass-rx-macro: Add shikra
 compatible
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
References: <20261106-add_shikra_support-v6-0-2cda302237cc@oss.qualcomm.com>
 <20261106-add_shikra_support-v6-3-2cda302237cc@oss.qualcomm.com>
 <c1dc47d0-676e-4b88-b904-34d193e61808@kernel.org>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <c1dc47d0-676e-4b88-b904-34d193e61808@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0MCBTYWx0ZWRfX9aOL2RXiZJ4e
 zwZkTex/UbPAqDiDxdUab9WEZsWDnqrC4wfwAS/SgtCg+9odbTo5n5TXYD/UXtVhv0+prWbX9I+
 gDdhV7uhSQkdCe/Wz6r2QHbjrMBvEvGcUxCH7xXY2wm1n+n/cMeeV0SG5RI8XHtMUl1qPVj/hLR
 Ip1tlmK6qf/qS30MrIL8WExdb6zhBlTx/+3zBmRM+t7y+TJN7zQrTPNm1saJvpf3EnjEVhjGtjy
 h/VA+urhSR8iMszcSMCyD25iT5zkTyhK+RX04BlS0AjFsCQNtYf903FN2YQcA6fPXOZhDihA3Y5
 gubgHq1DIgkPwbiJ3772texmk5nrj87MgiAm3uwQkbIo4lrMPJUlpSHvFDVXY3vBoNQWoSrJLcY
 mD2YUd7jIIM8M3rVRU+xL3IZi1MTBzI/KAt/qZfNAlM60uPWl8lGanCpN7mtYp58+ZGEUBU/IXN
 676zESxxx9WPwIJfb4Q==
X-Proofpoint-GUID: gaPoawfjeKbaWGsPULnCqMoj555mJ04U
X-Proofpoint-ORIG-GUID: gaPoawfjeKbaWGsPULnCqMoj555mJ04U
X-Authority-Analysis: v=2.4 cv=F6fC5ahN c=1 sm=1 tr=0 ts=6af59055 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=71XsD3E5Q5-dLC-WrCUA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0MCBTYWx0ZWRfXw4IG+ZHDBU62
 ESTqP1QG0oIik/Y2w4URgxaPiHqF09K1e1UG3kcQraWJC359IF5+4Jmn0E6YG9XrgrNbZBGFrCa
 wk1+q+WRMLjeRnkkCEwi9kk0NSQ28Zs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120040



On 11/9/2026 8:45 PM, Srinivas Kandagatla wrote:
> 
> 
> On 11/6/26 12:33 PM, Mohammad Rafi Shaik wrote:
>> Add shikra RX macro compatible data and hook it into the LPASS codec
>> v4.1 flow.
>>
>> The RX macro register layout of LPASS codec v4.1 matches the v2.5+
>> layout, so reuse the existing v2.5 register access helpers, controls
>> and widgets for it.
>>
>> v4.1 additionally requires the FS counter to be bypassed before it is
>> enabled during MCLK enable. This is a property of the codec version and
>> not of the board, so key it off the version detected by the VA macro
>> rather than off match data.
>>
>> Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
>>   sound/soc/codecs/lpass-macro-common.h |  3 +++
>>   sound/soc/codecs/lpass-rx-macro.c     | 14 ++++++++++++++
>>   2 files changed, 17 insertions(+)
>>
>> diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
>> index 573b2145e1c4..b52665b11e35 100644
>> --- a/sound/soc/codecs/lpass-macro-common.h
>> +++ b/sound/soc/codecs/lpass-macro-common.h
>> @@ -30,6 +30,7 @@ enum lpass_codec_version {
>>   	LPASS_CODEC_VERSION_2_7,
>>   	LPASS_CODEC_VERSION_2_8,
>>   	LPASS_CODEC_VERSION_2_9,
>> +	LPASS_CODEC_VERSION_4_1,
>>   };
>>   	case LPASS_CODEC_VERSION_2_8:
>> +	case LPASS_CODEC_VERSION_4_1:
>>   		rx->rxn_reg_stride = 0xc0;
>>   		rx->rxn_reg_stride2 = 0x0;
>> +		rx->fs_cnt_bypass = (rx->codec_version == LPASS_CODEC_VERSION_4_1);
> 
> This does not look great, can we move this to of data?
> 

The FS control bypass is version-specific rather than SoC-specific. I 
initially handled this through OF match data, but later moved it to the 
codec-version check since the behavior depends on the codec version.

Best Regards,
Rafi.


> --srini
> 
>>   		def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_2_5_defaults);
>>   		reg_defaults = kmalloc_objs(struct reg_default, def_count);
>>   		if (!reg_defaults)
>> @@ -3951,6 +3962,9 @@ static const struct of_device_id rx_macro_dt_match[] = {
>>   	}, {
>>   		.compatible = "qcom,sc8280xp-lpass-rx-macro",
>>   		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
>> +	}, {
>> +		.compatible = "qcom,shikra-lpass-rx-macro",
>> +		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
>>   	},
>>   	{ }
>>   };
>>
> 

