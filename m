Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793182923;
	b=QlhIYssohEuEJKXW5ZEpCr4Qn1MCXUR4fKFkl6Yq9fuu8vFfd1lG+2KKKOIu5XX99lNi
	 3CglSUbfsWCH+BQ0UejXa7fhKDihGPNSV8DbTBKIq7K+VG3vg9fLZ3HknHotCxPlMngKs
	 LX4OGvooc33sYYQFhJWHp4YRZg88Y1897aq3/Yj7ZndvcUX5Cgku7dpeghl0nG3jPsRxJ
	 0bSWV/Npe02yX+ofeMg5IhBpNQGIxMCtvVSD+Hin3xGmu1KYO4qLUk8UIAWtwi0HlM/5I
	 M4FC9/Xhz0zoNea7CWMwjU5ugyl1cO2YgMMznM19PYuP8Qjvu2clVkOOZZcfX6kwQMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793182923;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fB+844XfQIYl5+SEECufGoMX1n1a++vVUgwHs31aKaU=;
	b=UEazNx/Nvwa8vkoGtf2BrS6JPkiuY3klM7Y/Cdg8eXTAwKrXWNgbTRxk55u/ILhKne+p
	 NtiUjTrTT8PFnfQXVEVoKgrnBRE9GMKmfyUqCI0b843M81E7STEJtoGXH+ZYeMYYI4+xH
	 v+ivdvD2XyhT0VUFCAp/PcMd2atXXYfmP8iE4JoZtWmMdHfm4s1PoA5061ArkllMRh8D1
	 104uOZpXdGSoOoHJTLStvRydD8f/e0rYB7GL3R+OVxuNPHsORjPwWvsJDVlQWam9wcpR7
	 8JwG/bORVbThXxtZLKn/RYChfo1hWCs465eDCC6iLC4HilZq1K2lZTpzYHqoVZzq/Lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fGZdpLIa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="hDY/B/fk";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5320E606A31E
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 10:22:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5320E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fGZdpLIa;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hDY/B/fk
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8KuHF1101840
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 10:22:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fB+844XfQIYl5+SEECufGoMX1n1a++vVUgwHs31aKaU=; b=fGZdpLIa/VlrNvbN
	7Rq32kkNW66ldkQAejOdCs7iuZ+OG8+j/hjP0NPWQ735Cyv/yueTy/s2X3IjflPX
	Je3R1070kGTwyX8ZdpPKOPhDLW81gEUc7o6tyIgc68P6kU0MsvgdQXmPjLfuEqSs
	7Qj2+DUr5GQ2lv0CYaACSa3jvlQIY5DVIeXAjpTcUBf7w5on4IrxX3gyflpCuUom
	IXDsHCUSx7W/FeNayyoIKQfXrr2ywe+xy88p4mYgJs3hvuCLmIxmMUgpJJSzbKpm
	nGERntRCVWuCrl3ZEFS37H8z4/fqJ5guGi4eRkG73CKW5EKqpE9Jyd1qaRVssgDU
	x251jA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdf7recv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 10:22:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93909014c85so149281385a.0
        for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 03:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793182921; x=1793787721; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fB+844XfQIYl5+SEECufGoMX1n1a++vVUgwHs31aKaU=;
        b=hDY/B/fk188q3nZQoM+wn86ThzOTmQeVESqlksbK85DFh0woSEzN2MjvQx5kEFST5W
         JuYxLtEuEkrjgJxVKqu264Vm+haXYox75FSysl/VHSUKNitt/8X8LuK9S86szqcTajHM
         ksw2GOoeWHOpstMJcpf/pyrQZInolUeZNaL6BmZe3KZx39HywWUhj/mxKu/J4UsdUxk3
         4MPYCEcg4YaipQKbv++jONUuAWONAkd2hnVHhG/3crfcS819z08B3GFgpF0+DWik0PIi
         AP2GZz/rC0ntU5DcO46gSNiYn7K0FVNHGsY9BEvFCGlQk6wd9C6UXkysiZFU4MG2NIse
         9VYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793182921; x=1793787721;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fB+844XfQIYl5+SEECufGoMX1n1a++vVUgwHs31aKaU=;
        b=rQbs2hzKFC1sdVPWluiyMUVfFzdcwbKZJoSEKfG2jESFF4GueUBOM6Dm0gKqoLanqp
         MHDcTeL4EI+NPl3jTzw8dC6oUag60Cni4qO8cmqtsG63V76q/u0zIX3BWPlGZxSdKPbr
         oMGhROtOqjbeJDQioYlRbM7wHJ4zhjZTzIK7guwo57SVPlaGMveUJmVof1MNA8n5FOeb
         6vk3/mij3VuFSreP8vtMzj8WnFqGIjwKs0N/r0O8KArw4K8SuDczWGtJO12faDrD3vym
         QMBW41Bv3ZDorgUheY+yrrRISZZDjteSj5oRgrgviLtnnu1qZhmRlwDzb0/KSr94mCkh
         i4Kw==
X-Forwarded-Encrypted: i=1; AKwUvBxAik1JD9UdJkx3A4BtNqBtMvg9vZx1dLz9xq8xnSYXSwtubHnkAggkTDj5M8A0Qpjndtd3pq0UWrD1Bg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJhofZPUv/vtGTv5j8T/1uxRVNTnA5qLbu6WTTFfLZHCF+HYK3+
	e/+LZEtfjyDsrsZLb1dMS6zFiwo61rU4PwxQ9bZ17l0cSj9jbDLU3+onsUSd3AkvCzAAeawPGi5
	gRsQIVT3KK2V3PrEoYocC/v7GykrcXgqV2/xmhhi8nFBflZwLwBjeG8OlpfrKJHckZQ==
X-Gm-Gg: AYBFou3frtCLbJJseP0fMunPXpMKhkLGq+75auAaDT5Fc7oCiR1KKWMjhgknE1VFF8j
	6F1bNoqtnjGYRnWQLmUxvr45yTRnXiasJM2BQPnXL/IgYvbXRqqI5YCUsUBMADYb33aKay+SrWH
	yoUEMzLOu7exP+jVguboZQY9vpnuSsx2ihXx9rbBWYH9bZiB7b3Bpfh6dESE6N3RUr/jwCor7kQ
	7Ax95i+Zras7rcj0vqX/TfDUVdgy98mkCqQciF/LRfdzLytfBRJRwaXkV+AdgOSdyno1dBNYY6v
	tE+rQ4spXKHCkKbK157+VlCknmfUYd9GXn/aF5HsnwrS/7kk/9sxC4/zZjAxuzHXxKZhyXSRxf3
	8/7H6pICJIAeGwvU6Qkr5ztQQ+prlfUiFGgtAaE5oEwY3gbQOyDHkR7GyGrJVyI54J8XXarSoO1
	s=
X-Received: by 2002:a05:620a:63c6:b0:93c:8544:6adb with SMTP id af79cd13be357-94408a5f81dmr245901485a.22.1793182921162;
        Wed, 28 Oct 2026 03:22:01 -0700 (PDT)
X-Received: by 2002:a05:620a:63c6:b0:93c:8544:6adb with SMTP id af79cd13be357-94408a5f81dmr245899185a.22.1793182920585;
        Wed, 28 Oct 2026 03:22:00 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a9797e98a7sm32949905e9.15.2026.10.28.03.21.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 03:21:59 -0700 (PDT)
Message-ID: <6c423837-b665-4635-9984-a3efc28a7922@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 10:21:58 +0000
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
Subject: Re: [PATCH] ASoC: qcom: qdsp6: clear stale channel_map entries
To: Fabian Renn-Giles <fabian@fielding.dev>, srini@kernel.org,
        broonie@kernel.org
Cc: lgirdwood@gmail.com, neil.armstrong@linaro.org,
        krzysztof.kozlowski@oss.qualcomm.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261028100708.6808-1-fabian@fielding.dev>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261028100708.6808-1-fabian@fielding.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=M4bYuCws c=1 sm=1 tr=0 ts=6ae1ccc9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gWL0RvtfYAzCyNj8DMQA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: TpGr6Ld5fSZU27JOQ5MM276RAZRIOtN-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0MSBTYWx0ZWRfXzzxbtDnPdP4I
 Cv2zmoeY4tFaQD9PwHyn7OpnU9KvnfNKrCwSmIfMg+TTETZUW4C0y4wWgY6G51LUc10IMwCG4eC
 NeYTXtf0B5PEMIpd7G5WSBVd7SQE830=
X-Proofpoint-ORIG-GUID: TpGr6Ld5fSZU27JOQ5MM276RAZRIOtN-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0MSBTYWx0ZWRfX7CtduQviHpMm
 KSRpPO4L1KYCyfW60uSdHH9Qyk0jpCYUdj1lL4tFnjjXp0DVm9e9HqZeoATcW5Tk4FjmneB+SYV
 9Ab+Qgs40lTPMM9z+3sjqbho8p8ZYhe4NFv0h3lKR1dh+9qfOVkPY0eBSHvkwX/z37LNFHkUclG
 Ri5r/hKDkkm5z1Kj2c8oGNXHraeeNh8KpkRkpNbxoG0e2AIDAFyy9VZSqOCszcdfFc/JGH27ytv
 W1/1wD/yMNOl55sFwRnn6qvQcuospj8Vrp8/O/l0OX6R2aI681riAuiG+JAooI6sQyZG6ZDkSk6
 z8LDqlqVcyHYVU2T0G2NlcHLEZfJXfk+DZvq8BVs2J4kIouOZ+Tox6lTyuCA79Yl9+V8LTaNzrQ
 TkSaqVoECidk0zqsqa5JfJe5EfOCk+SomMpxUvaPJekXokwTlRSF+jJUaNutnn8zPaqykrvmTBh
 aZZUaLP/oAjmnPRpydg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280041



On 10/28/26 10:07 AM, Fabian Renn-Giles wrote:
> Since commit c663014e452d ("ASoC: qcom: audioreach: compute active
> channel maps from channel_map"), the codec DMA active_channels_mask is
> built from the non-zero entries of the channel_map instead of from
> num_channels.
> 
> audioreach_set_default_channel_mapping() only writes the first
> num_channels entries, and q6dma_set_channel_map() only the first
> tx_num/rx_num entries. The per-DAI module_config in q6apm-lpass-dais is
> persistent, so entries written by an earlier, wider configuration
> survive a later narrower one. E.g. after a 4 channel setup, a 2 channel
> capture on VA_CODEC_DMA_TX_0 keeps the map 01 02 04 05 and sends
> active_channels_mask = 0xf with num_channels = 2. The DSP rejects the
> graph start:
> 
>   qcom-apm gprsvc:service:2:1: DSP returned error[1001002] 1
>   q6apm-lpass-dais ...: Failed to start APM port 110
>   MultiMedia4 Capture: ASoC error (-22): at dpcm_be_dai_trigger()
> 
> which breaks the built-in DMIC capture on the Lenovo Yoga Slim 7x
> (X1E80100).
> 
> Clear the whole channel_map before filling it in both places.
> 
> Note: this is my very first contribution to the linux kernel so I
> may be new to some of the processes. I apologize in advance.

Thanks for sending the patch and Welcome.
You can move this comment after --- as it does not make sense to be in
the commit log.

> 
> Fixes: c663014e452d ("ASoC: qcom: audioreach: compute active channel maps from channel_map")
> Signed-off-by: Fabian Renn-Giles <fabian@fielding.dev>
> Assisted-by: Claude:claude-sonnet-5-5
> ---
> Tested on a Lenovo Yoga Slim 7x (X1E80100): built-in DMIC capture on
> VA_CODEC_DMA_TX_0 (MultiMedia4 Capture) failed with the DSP error above;
> with this patch repeated arecord runs work. Based on broonie/sound.git
> for-next (d34a818a331f).
> 
>  sound/soc/qcom/qdsp6/audioreach.c       | 6 ++++++
>  sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 2 ++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
> index d2dc5d37bccf..4ac65d9b5543 100644
> --- a/sound/soc/qcom/qdsp6/audioreach.c
> +++ b/sound/soc/qcom/qdsp6/audioreach.c
> @@ -308,6 +308,12 @@ EXPORT_SYMBOL_GPL(audioreach_alloc_apm_cmd_pkt);
>  
>  void audioreach_set_default_channel_mapping(u8 *ch_map, int num_channels)

there is patch on the list to remove this function, could you please
take a look at
https://lore.kernel.org/all/20261028024720.981971-1-zhangfei.gao@oss.qualcomm.com/


q6dsp_map_channels() already does the memset,  pl recheck with that patch.

If your patch might be still relevant, please send patch against it.

--srini
>  {
> +	/*
> +	 * The active channel mask is derived from the non-zero entries, so
> +	 * stale entries from a previous, wider configuration must not survive.
> +	 */
> +	memset(ch_map, 0, AR_PCM_MAX_NUM_CHANNEL);
> +
>  	if (num_channels == 1) {
>  		ch_map[0] =  PCM_CHANNEL_FL;
>  	} else if (num_channels == 2) {
> diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> index 83f2711bceea..12f139af8ca0 100644
> --- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> +++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> @@ -99,6 +99,7 @@ static int q6dma_set_channel_map(struct snd_soc_dai *dai,
>  				tx_num);
>  			return -EINVAL;
>  		}
> +		memset(cfg->channel_map, 0, sizeof(cfg->channel_map));
>  		for (i = 0; i < tx_num; i++)
>  			cfg->channel_map[i] = tx_ch_mask[i];
>  
> @@ -123,6 +124,7 @@ static int q6dma_set_channel_map(struct snd_soc_dai *dai,
>  				rx_num);
>  			return -EINVAL;
>  		}
> +		memset(cfg->channel_map, 0, sizeof(cfg->channel_map));
>  		for (i = 0; i < rx_num; i++)
>  			cfg->channel_map[i] = rx_ch_mask[i];
>  
> 
> base-commit: d34a818a331f7e270fa9dc3db3d96f6a0d4fa7ab

