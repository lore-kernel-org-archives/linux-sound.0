Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D56305976
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 09:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761211519; cv=none; b=LAhjdP5aIBFXIEpmFfn+PWAdJ420aPjQf57oH17yFRFEdgoWgEM16zaweULnZruaYcE7hUbsoJPlzlpsNmLDmGlkqv5gJB0XV8CCgzV+3XD2FN+eZWnono1CP7PcuFB6qVXrHQSYnGogq/4Ky4HM321L8SK3JRmtKw7ZJelftkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761211519; c=relaxed/simple;
	bh=wmbjSv87Nv9bq7/iWiWTXBzwhGsEf6wKoE1uZMnunns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QBsodUMwxzNRa4OoEUjVUw0B6M9fsc90IjRdBBxGn3IeC1rZMAsxUUVjin6vhZw+GjP9m8ZwIMGGS1HgLPIAF/fzY0rLBZJXL3AnI/JgAoBNWjXhFp5GAkzoneTmNOu55AtVBz9ZEpK1dK/qP4zHRNgK1cs9eDN+lQdcNcolJ+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SInV+6Nv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SInV+6Nv"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N8OEoF019075
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 09:25:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dSvA5ngEs9hohgjB5Ua67zCoZZ2sfiQpQyL73F1VaHM=; b=SInV+6Nv4aMHarb+
	NWFK/2S/OMbzkxzAgBbQF5fe1y5WMLvr/Gyn/ef9MW2NyYydVazkwBFwjuBbS9nI
	1pAtAxCvp8UwDiVj1Gnog3jhXzl7bjXxnbIq5EvPE4Ul5AEsJTHQHLDUd4Q3XYmk
	O9kVuhrdyytNBc2Al6uFoqbDoIOns6dmq3298XOcZgMHyvUDaU62TgFizNx7hNxi
	Cl4z5ZdeCjm0FtqMfIahhSQUIfYQvtyRemw12Dm9ZJQYp3+i5ho6odreg5rh8WrS
	/avTK/LgfSTm533KUqGKFp0w6+KNYrzTO0Tbx+eJ6kPNHyiG+wq9bZ9Z9FVx57wh
	kv7XrA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y67qhstj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 09:25:16 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e8a2ef0249so19103441cf.3
        for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 02:25:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761211510; x=1761816310;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dSvA5ngEs9hohgjB5Ua67zCoZZ2sfiQpQyL73F1VaHM=;
        b=VQ8YwoDWTKY5jaKlYnVH7NwnS41v2RI59L4eTnRCQ+R7qDzoMZSb3MKBEQWVaCVrp5
         MNAc8ORm6AwCHunqxauEISK3JG/xekrz5rRWOlmeGy1dzO+sfbe3paQLQaoqvBy5lo+o
         KKHsxGIQ52t02lqOgQp3lvoMQ4w/zpMG+yQ8DcYLvuKM3Iu384b5RAwSYrY+Nqb7YEHv
         C9mZsigNRpSAG6liRcyVsWtPneStZTXAD0cU0lyiiCcqo1BYzH7uNGT9VGlktUXoymsk
         Z+VBuBFiZ3LtIfsskKCK3PKXtdi1n3uyUm47BhLJAKpqnE+NIQA30Xgm/GGGqWAAVCsM
         oZzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcddMjw40PCzA8OoHGPuyuH7uh2miZHLtb3nbmHzMdouT18Rh2ggDJVINCuL05wH+yU91oLDPTs8XafA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUe56uroeEcFgXO3QbBDsTBmlj7RoKri+a6uogKkZ5WOO9HvNW
	RzxxnksV07l1XzS87ZXPKZHx7ADIzDZzOmntOIaWoRC9dMZLgaeJGYjb5kkiyAldDC4FfBVeRI9
	9Ec13K5kF8BCX6m9y8gRBt+Mm8Gc4trnP6afWo0PWqWk8xFJNYPMSz5tefD0eFZz2MQ==
X-Gm-Gg: ASbGncvxo8dH2wYXAHKYEEz+7T3d0XVVvSFKcBBezAQsj/7NfDpeHv55eCXOEKtWqjN
	6t/we/sTaeSrzYM5nJTOehnrA4zB87ZB+gMTP9nxke84MUcyi73DpMyHlNm7YPCznAjkCVQpKRC
	PyL9fLcsFsF+0lKvKcVRmHUGtgxc58ErQTzaxY3U0/Sa4Hs6fPPdrp7bSzuagBD+Ae4oVBQ6NBT
	5nAdLekiWLArwNISpmAksfXsLmM+6rpAIuGKvODqdjnFXM8sEDwhD8AqYAIwnOm6kTIqbWSMgZ2
	T0MZkKgJkTsAJvgwzK5uSFhb3fnOvnl5whrEz3sj4AEJgin1Gc86K9BH015pgoKYwCOMJ62+rdS
	dYgdto9UMfdJrQmUfb0VFnD6+Jg==
X-Received: by 2002:a05:622a:1a08:b0:4e8:a332:ae5d with SMTP id d75a77b69052e-4e8a332af4emr245184381cf.48.1761211510234;
        Thu, 23 Oct 2025 02:25:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAB+oVptSREj0nu0ZIfPtl07Xl6ZMfqdzD6A25TQqGnq7DB1t0Z5Qr5ZYnfCesq9hliBUFUw==
X-Received: by 2002:a05:622a:1a08:b0:4e8:a332:ae5d with SMTP id d75a77b69052e-4e8a332af4emr245184131cf.48.1761211509684;
        Thu, 23 Oct 2025 02:25:09 -0700 (PDT)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-429898cce3bsm2896783f8f.38.2025.10.23.02.25.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 02:25:09 -0700 (PDT)
Message-ID: <e3bbd92e-57bc-4848-b7e4-1aa10202e9fa@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 10:25:08 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] ASoC: qcom: q6asm-dai: schedule all available frames
 to avoid dsp under-runs
To: Alexey Klimov <alexey.klimov@linaro.org>, broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, m.facchin@arduino.cc,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20251015131740.340258-1-srinivas.kandagatla@oss.qualcomm.com>
 <20251015131740.340258-7-srinivas.kandagatla@oss.qualcomm.com>
 <DDNA1IMADB2J.1RQMGCQKDL7PG@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <DDNA1IMADB2J.1RQMGCQKDL7PG@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE2OCBTYWx0ZWRfX8t9pxKo7jyJD
 q+wZ/voDPu2H5ORUmk8oY7JCiceQ9jxB2+HN1LL4s4SJBpn/6Db6K3l5VYqom1vX8Mqz4BDMCrN
 YhDoQEN4xZ54AqKJEb/bPmVZqGuOuczsKWPRgaKNMrQlkm2N8ZwLhmqhG2iyvM7v6s+Tg0rKmqh
 z7e93x9Ra4sPoXzJa5LJBr+umbsdoHrGi3jueNjYEh72ILPQloERXhIurvIVF1tMbdpNkMxhxvO
 +2JeD+PdhiK5O3FRjCSe4FBAmtXYEoN7sOzfVUSlfYhJKeXX5uE61gtm4HLgv3HJeaYArIW/wTs
 UuX6HK+YgWlziSLlQ3GX3heNDWLCJPpAhlICbmoXTjKA4hM5blhoV/z72ib20zGdu+wi6UftF22
 n0gBCP9bwpD5NlJ0puCg+gr7joWEtQ==
X-Authority-Analysis: v=2.4 cv=LMRrgZW9 c=1 sm=1 tr=0 ts=68f9f47c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=YRt9Bv_rGBO17N10jG4A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: FQCtp5HFxt2fbfW7rczndHUepbGXhk2q
X-Proofpoint-ORIG-GUID: FQCtp5HFxt2fbfW7rczndHUepbGXhk2q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220168

On 10/20/25 5:06 PM, Alexey Klimov wrote:
> On Wed Oct 15, 2025 at 2:17 PM BST, Srinivas Kandagatla wrote:
>> With the existing code, we are only setting up one period at a time, in a
>> ping-pong buffer style. This triggers lot of underruns in the dsp
>> leading to jitter noise during audio playback.
>>
>> Fix this by scheduling all available periods, this will ensure that the dsp
>> has enough buffer feed and ultimatley fixing the underruns and audio distortion.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  sound/soc/qcom/qdsp6/q6asm-dai.c | 34 +++++++++++++++++++++++++-------
> 
> [..]
> 
>> +static int q6asm_dai_ack(struct snd_soc_component *component, struct snd_pcm_substream *substream)
>> +{
>> +	struct snd_pcm_runtime *runtime = substream->runtime;
>> +	struct q6asm_dai_rtd *prtd = runtime->private_data;
>> +	int i, ret = 0, avail_periods;
>> +
>> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK && prtd->state == Q6ASM_STREAM_RUNNING) {
>> +		avail_periods = (runtime->control->appl_ptr - prtd->queue_ptr)/runtime->period_size;
>> +		for (i = 0; i < avail_periods; i++) {
>> +			ret = q6asm_write_async(prtd->audio_client, prtd->stream_id,
>> +					   prtd->pcm_count, 0, 0, 0);
>> +
>> +			if (ret < 0) {
>> +				dev_err(component->dev, "Error queuing playback buffer %d\n", ret);
>> +				return ret;
>> +			}
>> +			prtd->queue_ptr += runtime->period_size;
>> +		}
>> +	}
>> +
>> +	return ret;
>> +}

We have exactly same logic in q6apm-dai.c I will keep this as it is for
this patch series, we can always improve this over time. Patches welcome.>
> So when I compiled this on a common arm64 desktop machine with defconfig,
> nothing fancy, with gcc, this loop and function really does compile with
> udiv instruction.
> 
> avail_periods = (runtime->control->appl_ptr - prtd->queue_ptr)/runtime->period_size;
>      350:       f9001bf7        str     x23, [sp, #48]
>      354:       f94086a0        ldr     x0, [x21, #264]
>      358:       f9408262        ldr     x2, [x19, #256]
>      35c:       f9400000        ldr     x0, [x0]
>      360:       f9403ea1        ldr     x1, [x21, #120]
>      364:       cb020000        sub     x0, x0, x2
>      368:       9ac10800        udiv    x0, x0, x1  <--- here
>      36c:       2a0003f7        mov     w23, w0
> 
> What do you think about rewriting this loop without division and
> without using additional iterator? I don't think this is a hot path
> but anyway.
> 
> The first iteration that I came up with is (1):
> 
> 
> diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
> index 97256313c01a..d01f805947b8 100644
> --- a/sound/soc/qcom/qdsp6/q6asm-dai.c
> +++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
> @@ -310,6 +310,23 @@ static int q6asm_dai_ack(struct snd_soc_component *component, struct snd_pcm_sub
>  	int ret = 0;
>  
>  	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK && prtd->state == Q6ASM_STREAM_RUNNING) {
> +		if (prtd->queue_ptr < runtime->control->appl_ptr) {
This is not going to work, as we need alteast 1 period of data.> +
> +			do {
> +				ret = q6asm_write_async(prtd->audio_client, prtd->stream_id,
> +							prtd->pcm_count, 0, 0, 0);
> +
> +				if (ret < 0) {
> +						dev_err(component->dev, "Error queuing playback buffer %d\n", ret);
> +						return ret;
> +				}
> +
> +				prtd->queue_ptr += runtime->period_size;
This queue_ptr can go over appl_ptr.. can impact sound quality as we
will be queuing something that is not in the data yet.

--srini> +
> +			} while (prtd->queue_ptr < runtime->control->appl_ptr);
> +
> +		}
> 
> No division and no calculation of iterator and avail_periods.
> 
> Rewriting it further (2):
> 
> diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
> index 97256313c01a..317f06d07a09 100644
> --- a/sound/soc/qcom/qdsp6/q6asm-dai.c
> +++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
> @@ -307,9 +307,26 @@ static int q6asm_dai_ack(struct snd_soc_component *component, struct snd_pcm_sub
>  {
>  	struct snd_pcm_runtime *runtime = substream->runtime;
>  	struct q6asm_dai_rtd *prtd = runtime->private_data;
> -	int i, ret = 0, avail_periods;
> +	int ret = 0, diff;
>  
>  	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK && prtd->state == Q6ASM_STREAM_RUNNING) {
> +		diff = (runtime->control->appl_ptr - prtd->queue_ptr);
> +		
> +		while (diff >= runtime->period_size) {
> +			ret = q6asm_write_async(prtd->audio_client, prtd->stream_id,
> +						prtd->pcm_count, 0, 0, 0);
> +			
> +			if (ret < 0) {
> +				dev_err(component->dev, "Error queuing playback buffer %d\n", ret);
> +				return ret;
> +			}
> +
> +			prtd->queue_ptr += runtime->period_size;
> +			diff -= runtime->period_size;
> +		};
> +
> +
> 
> Surprisingly, in (1) the size of resulting object file is smaller than in (2):
> 
> With original patch:	110008 Oct 20 15:26 sound/soc/qcom/qdsp6/q6asm-dai.o
> with (1): 		109776 Oct 20 16:53 sound/soc/qcom/qdsp6/q6asm-dai.o
> with (2):		109896 Oct 20 16:52 sound/soc/qcom/qdsp6/q6asm-dai.o
> 
> I think the readability won't be damaged as a result of the rewriting
> and the code seems to be smaller.
> Obviusly, this needs to be verified for some corner cases and etc.
> I'd go with (1) but it is up to you. I tested (1) and it seems to work.
> 
> Best regards,
> Alexey
> 
> 
> 
> 
> 

