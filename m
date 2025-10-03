Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBFF221578
	for <linux-sound@vger.kernel.org>; Fri,  3 Oct 2025 07:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759474856; cv=none; b=s5Lx3LzDvBwtU66pF4yayQi3DdcXhS+TSjsjPY66kwBnHNp/4LVgr4O9000opciT7/hSN4uvdfXGlumnwZ1rlTOz+9DYC9mTs/md44mMp29Cs5pAekF1i8YB7Nzzl+ZwyrZel7gDQjUh1HmOeqQfoT8wuRW+A4fmwSStiYeEn2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759474856; c=relaxed/simple;
	bh=5Exm/8PLdaYIQsbxEm7CrsQS0hKOILQWwFq03IzluZo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oQO4Dbp0asJQ8glFnhI3dvdeZfO9w44YmndL6uRVOPZw0DdxQveRcRRK4OR2s1kjhJfbbVWKdlOhoMWzmyiQ+dw2XxtVy89DHXBHrvKXVmWqjiO5mYoM0SHiti9gAL+OupsxtT/J+iifSwVe4C8XIgk+LmLTQ6YWa8nfyLa0lz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NBs5Rh5g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NBs5Rh5g"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 592Lm5CE000852
	for <linux-sound@vger.kernel.org>; Fri, 3 Oct 2025 07:00:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Co5VzprZsR81aFpnYkYXzmF6KQjbt0d229OVKm0YBpM=; b=NBs5Rh5giHTu0yIG
	fp3IUgm2pJos2/MW3R/9TvxauMsylD+rNDtBlCQWXTj2lG4mgTtlj/tc8jzPqRwp
	9p9thZzJNaiS+0drtWdS+gFdWJ1WewKKeGyBNs3GP+FkthMom72/HRve+yLV0iPD
	Pe13nZuQ/Z1OaITbRrRevj9YJqDUBpMi8U8CUElBi8U0uocGYaqrCh5eHm4spqPz
	I0N/Hy+y5l9fa5tm+FIT0fcXy2PgpKMRgjZx+m+rnrM2yRMxwvtXBc4F1q8M9t+Z
	CLLwAqWJmAnJyOF37CKywJ84MlLpV+09p4hVf713stV3IDmzsuo7H4ciA4+KoO+4
	NBzulg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6x626s2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 03 Oct 2025 07:00:53 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-268149e1c28so20851855ad.1
        for <linux-sound@vger.kernel.org>; Fri, 03 Oct 2025 00:00:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759474852; x=1760079652;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Co5VzprZsR81aFpnYkYXzmF6KQjbt0d229OVKm0YBpM=;
        b=nDeOIBK/tQtgEB9q86CYI4YV1yGI7/FUwWr/wWdD5mrRxcR0dx6+uAmFmIfxMLvuju
         yI+QqXmD9Xzmvg2enLEKROuglPOxEN/q4OxQhkFDAhs/SwkYt0M1r4x4ADL+1hmRMa5c
         pHLWcnCh47zC/G9DjVy+x+iUfBJFhlD1WurbXWgtBc1yxlhd9AaLvO5OQ/Xe16wI4Vri
         7qWg/Lq89c9UnheBrY2NwUml6JSxuCmV/Wnmax72Zajepdj62A96DKM63Lmr0Z1B+P3z
         Pw1fkcq23J0JllLmpbajksIHiEuzt7kLTnhamBNBXDVLLT5DCqVbxbH/MkDhhQ5xPIaC
         lr3A==
X-Forwarded-Encrypted: i=1; AJvYcCVSxu+XUlvwOGT9pdl+H3mCUhC473pefMyUZh/0nexpGI3BpwSv1tMhwRdj7gXp1W4N6zg/Nr8BRJ+sFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMQxJo4J0UZGnht1kib7TzcPIRzVuhia895v85CLmjqPc91zWV
	MW1aKU+gGhpubbNzYrDErfQInYp/TXf9trau61DsfTujVPG1i4SsGnLyVjUz7T7dv7qpah+jkP/
	uoIprYw07uZgDMMm1H1tA94T6BLs+A0Vaq4DdF8BPJQYLRgVib9FoJ87sIOIeHYsjpw==
X-Gm-Gg: ASbGncuGlMcOWi5lzJHhjM3RV3OcB7Q6urPe/yzsqAoLTTw7k2sYq1te9l+S5Ia3AaV
	CmSPzxi9xTYmYZhg5oIbps12yXsBMHBW9GdvdcuVYKG9sgbdXDbCTe6gf0g7BzBnWjOu2SlablF
	ntePY2BTRkMXhR8MHozpvSTqdGAKiNJWfNqz5likKwiSqrLoNj9DVzY9QPaMqOueAuM2DClNxDg
	FciRs1IIn/Wzpiul8ouEDMCPM6KSN8qFG8aIHYMcxorvsKNtN9mCxxjmfL2aDglalNpNNHM/B/A
	q8A3gwCYTc60zmNyUrNPrPgMf0prS3kF4PLagIf7tSNMVCCYyNz8S17kn+gEbw89PcxZyqmetYr
	eml76x23o
X-Received: by 2002:a17:903:287:b0:26d:d860:3db1 with SMTP id d9443c01a7336-28e9a56700amr25147495ad.24.1759474852294;
        Fri, 03 Oct 2025 00:00:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHryjKfAj9HgoLio+jseaVb7X04rOxIe8KAqRAkzFtrkbcwQLuvAuQxIWXpvFYBtK4NEGv3tQ==
X-Received: by 2002:a17:903:287:b0:26d:d860:3db1 with SMTP id d9443c01a7336-28e9a56700amr25147165ad.24.1759474851714;
        Fri, 03 Oct 2025 00:00:51 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d126012sm40739195ad.41.2025.10.03.00.00.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Oct 2025 00:00:51 -0700 (PDT)
Message-ID: <ec31379a-4bc9-4cc5-b90e-ca380f5334aa@oss.qualcomm.com>
Date: Fri, 3 Oct 2025 12:30:45 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: codecs: lpass-macro: Add support for channel map
 mixer control
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        prasad.kumpatla@oss.qualcomm.com
References: <20250902062300.212021-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <DD71KONODHKJ.15RI1DXF5T6PJ@linaro.org>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <DD71KONODHKJ.15RI1DXF5T6PJ@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UCiQ0-KmssEN9dWWn9IAsZBpACXVOxhj
X-Proofpoint-ORIG-GUID: UCiQ0-KmssEN9dWWn9IAsZBpACXVOxhj
X-Authority-Analysis: v=2.4 cv=ZtPg6t7G c=1 sm=1 tr=0 ts=68df74a5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=onMMKnJRGUs5ctigZmYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxOCBTYWx0ZWRfX+0uF7Zwlu4/8
 RNEcR4+1+VbHp1WFvHQuTPH11Hmu8JOLX9dmy09dwnaqucCtfA2dCeKzL6ItNzIWGt3E7gcBMH4
 Q+bVuHO1KjrgymSzQiOf985J6za2E4L0RZ57KA6LV7AVws3XTx3qkRXeuWSc163igGRWGi52kdB
 hy8SnSCXDjcnurv5YRwIO8tVtBUPv1wOQyf/IRxKOreF5U8bjIqoUAlohNuivlMB+e3l/QDn1ND
 2vYh+4IM1yjme4PR8PUXVok6+2oyDuuVU546sUlcmm3jeiVdjjbf2l6RtttSk/ZUdxfIPBTD/oP
 F7h0zKeWasD+ovx4FCKeXvV/JLQcivqQ+KkP4lcc5JmRvXHHi2aZxGrDNhTwyMI0fsdoczpB1xx
 YeLe+prAFPoYCa8OlvtUmxyP1nxOYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_01,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270018



On 10/1/2025 7:36 PM, Alexey Klimov wrote:
> On Tue Sep 2, 2025 at 7:23 AM BST, Mohammad Rafi Shaik wrote:
>> Introduce the channel map mixer control support for LPASS macro
>> codec Digital Audio Interfaces (DAIs). The channel map mixer controls
>> are required by APPS to configure usecase-specific audio routing and
> 
> What is APPS here? Will be good to have this abbreviation or acronym explained.
> 

Ack,

will write proper commit description.

>> channel mapping.
>>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Updated patch with improved commit description..
>> - Link to v1: https://lore.kernel.org/linux-sound/20240930053111.3986838-1-quic_mohs@quicinc.com/
>> ---
>>   sound/soc/codecs/lpass-macro-common.c | 55 +++++++++++++++++++++++++++
>>   sound/soc/codecs/lpass-macro-common.h |  2 +
>>   sound/soc/codecs/lpass-rx-macro.c     | 12 ++++++
>>   sound/soc/codecs/lpass-tx-macro.c     |  9 +++++
>>   sound/soc/codecs/lpass-va-macro.c     |  9 +++++
>>   sound/soc/codecs/lpass-wsa-macro.c    | 12 ++++++
>>   6 files changed, 99 insertions(+)
>>
>> diff --git a/sound/soc/codecs/lpass-macro-common.c b/sound/soc/codecs/lpass-macro-common.c
>> index 6e3b8d0897dd..777af4885245 100644
>> --- a/sound/soc/codecs/lpass-macro-common.c
>> +++ b/sound/soc/codecs/lpass-macro-common.c
>> @@ -8,12 +8,67 @@
>>   #include <linux/platform_device.h>
>>   #include <linux/pm_domain.h>
>>   #include <linux/pm_runtime.h>
>> +#include <sound/control.h>
>> +#include <sound/pcm.h>
>> +#include <sound/soc.h>
>>   
>>   #include "lpass-macro-common.h"
>>   
>>   static DEFINE_MUTEX(lpass_codec_mutex);
>>   static enum lpass_codec_version lpass_codec_version;
>>   
>> +static int lpass_macro_chmap_ctl_get(struct snd_kcontrol *kcontrol,
>> +				     struct snd_ctl_elem_value *ucontrol)
>> +{
>> +	struct snd_pcm_chmap *info = snd_kcontrol_chip(kcontrol);
>> +	struct snd_soc_dai *dai = info->private_data;
>> +	u32 *chmap_data = NULL;
> 
> You probably don't need to set it to NULL here, if it will be overwritten
> by kzalloc() call few lines below
>

Ack,

will fix in next version.

Thanks & Regards,
Rafi.


>> +	u32 rx_ch_cnt = 0;
>> +	u32 tx_ch_cnt = 0;
>> +	u32 rx_ch, tx_ch;
>> +
>> +	chmap_data = kzalloc(sizeof(u32) * 2, GFP_KERNEL);
> 
> here.
> 
> [..]
> 
> Thanks,
> Alexey
> 
> 

