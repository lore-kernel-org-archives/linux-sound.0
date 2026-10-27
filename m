Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793090810;
	b=PALP9pnslqeAAxNTkFdP77amrxi+YRhOTtTT8z6WOpi83rbD6EVLk73dHlv6a4Qveo/u
	 LgkcK0yvSPn6rB+ZeOt1qIcvnaRi1c6fDUHADAnHSDOUMT7VojpHmLrOZUovl7eWF99CS
	 wr9Ifc0MKO4XGRvaQTUQF/GOILiuoKQAEJmNAk/+2Sa4UyvIWMFVJrxaTM86lonft5kHW
	 2dYBMxgOshD3dTCzxIL6YkI0VR0v6UG2NydieFi5f956EwKx3nm9tfqHmXwQ6CPx3nry+
	 Vy+FRLRrQPfCQR/n7uKnhx+7MdB0wbrzj18Ex8arJ96f1c6QDtB6lSYXznFosBLfpQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793090810;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ypDb7Fx0jCCgb71eZZNRxztqQABOHADboWn0F4UJcmI=;
	b=R8gLi6llC9TgDk5lOfRTTSUBU2lZ0s5JrW7wnFk/utrKcxPzIdqho3BXV32U6TOcCyft
	 LSqoHtH1QNnIMe+gWz18U8ABpbsmLU3VqoR36buLm2O1BcFvegiu+AFOiIeC7kj/C8f0V
	 Jq7ZVdrvshSjnILlDPI2QwxyhWcHz9iRdTILgRxNDjJno4jgQ1/jU8DqFoPI+xIWb24YY
	 f3tP67BOcdR+c3EHk6DvYoDg0doY5nWppuxZGx+mTgNc3e7jcQgyoGGrF2BGUhqhjFe4m
	 vSXjKtMmoBkxkD63IRbBxCoQytZ+HPO4+FfSbErpZdsguoFT+aXmef+ASEc0SqB7aDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KTdhWAjt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a0OjA57I;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E898C606A320
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 08:46:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E898C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KTdhWAjt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a0OjA57I
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R8fm4S1350052
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 08:46:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ypDb7Fx0jCCgb71eZZNRxztqQABOHADboWn0F4UJcmI=; b=KTdhWAjt5rkg4prv
	4SfvThM8b7bcb4GpC7SEFdioLLTO4J+0qVaNZ0+oIo4JAshlHyRDAjX4OPaMIJqL
	ggEOxJIVB7E5aZpcHjVAFj+bdb/rCpBZ+36HkLuR099m5id0pgfR06BNcAWTslL+
	sdkk1feYqlv7e216X9PVM4Sv2aezzxnPkyDEjGuk1sXJePEF1R6wfTakMoWchKhZ
	PvqQVJGtdWFLIfh9/LMGp4ZPkkQgURZxqJrUuNa0aVLJyGsSitZKCPR3/P+DcHJn
	mDRGaH6zeIWqUzX9T66gldRC0nesnkDTFLjFVbagjzWuuj4zgASp84AU9VxpndTk
	bxzppg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqf5ra8x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 08:46:48 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3adeba76cadso2123625a91.1
        for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 01:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793090805; x=1793695605; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ypDb7Fx0jCCgb71eZZNRxztqQABOHADboWn0F4UJcmI=;
        b=a0OjA57ICx4pRQJNOLTfymaINATwDTSwuJ/m0RuwXUt6PdfurrAI0tAw1Ndectyhnt
         MY1ix/xsZZQffMt6FC/ZqZal+wJvcoCjqj6sIKMi99Gm2AacGWCLqQC/W7mtNBjDy+7n
         b12cDKSpE95MpfDQCRqp1SvXVYpWEtNriiSEslAMBaO9gQfODmDVtGxzkH5poVKBqVnz
         Xd64icvYCXPKqRMDTyaFIffzV66/Px3EW+617f/s0dqvVF9+dpKJ2IWyNyMnchyEbQ3/
         ZhXgYve0855BzNkNI1tfwtb32xkdoLw01lBTUe+QKikcPS4N+qE6M3tbWGdnlYiW8Hjc
         uX+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793090805; x=1793695605;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ypDb7Fx0jCCgb71eZZNRxztqQABOHADboWn0F4UJcmI=;
        b=xzawpbBx9e3+0+6B1Oujpva+8xOfsJ8dMA5s76NrCrx/Mtv0n2XTWUZj9yUuCu1qOe
         36+2atGhXM1ccRCTDvULIUpt4HbScvgAuKu1Wc0aPWJChrRbF2Tn1mFfVRbmwMjRtuJN
         5iELEhHDbWqfX6N+2PVkPo1y7UpbQAuyMiaaAArbVClbFOMAefRr5T7p+gVRV7Dj1qxh
         N04qEZ5vp2vtviA6xkRPgKBTHyaFHJEgfsp/OQL4QCuLj/PIjRYxVrNP/o1NIPJXxNTB
         AxUxgpmbHr67Vvb6DAc8NGsNmSsJYY1Dn6P7Yv7GbkOH49R01el5Y1nRfYAnxs9i8pTf
         ipVQ==
X-Forwarded-Encrypted: i=1; AKwUvBxyw0A0kH71JSX3L+NEnj35QG3I9WcZVEkkBQYAPa3dYpYNFGiQ3og2QDwd5qsRZkKkYHkPAj22i3K3oQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYK46qQEbpSgdy0WthlG0+vbg5qNOlNj7R2XlTN2YacHbCV0EHFh
	zziW+dwGSje9lAewvKns03K3UBO9WrE69jcHZcobIMCqQBMW8OvDDBpYAnDf3/4lP3MD4D89H8H
	mtQQIAcP2xKIxkvWNbSc3GFbpABVBqciboAVc8lYmINZjPCxorn6FZ4FHgD1bO31qIw==
X-Gm-Gg: AYBFou2XrXJVftdH6RMOs9THKB2d5OxtqULqKOkJlUyblP7IEo2+1N80prP4Lk0ayBj
	nOmTqwYZotaRRf2YEcD++mGH69VuyajWIgGwD/8OPYGPayd/xRujWfF2E5mlB1e44UKAyxzJBMo
	B7KkNXYaGS66RYAVrSCbkBaPjifGc0fSHi8hyu9IdC7LX8vCuSAs37FmoCUIHzC5lGZvaCSNiAS
	0PspTATTPIl3r8T2mpLc1bqcgAF3a/Ozr9f2juJrK7HXUO3SBZBTn/okfRRLOE3UNg5Qc/0ucru
	D6Y+nRkubdM5xY8glqBXwUNx2RAbfv+QBxlLQySltEmERx7UR09Z7hb8TA5BM9HlUvC34XtCvwZ
	y+yYrSHEpUJi2FLRo7V8VVxRknWSfhMei
X-Received: by 2002:a17:90b:4a84:b0:3ac:ad90:7090 with SMTP id 98e67ed59e1d1-3adeb15557amr7792379a91.67.1793090804778;
        Tue, 27 Oct 2026 01:46:44 -0700 (PDT)
X-Received: by 2002:a17:90b:4a84:b0:3ac:ad90:7090 with SMTP id 98e67ed59e1d1-3adeb15557amr7792353a91.67.1793090804116;
        Tue, 27 Oct 2026 01:46:44 -0700 (PDT)
Received: from [10.219.49.187] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae404429a8sm2824282a91.8.2026.10.27.01.46.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 01:46:43 -0700 (PDT)
Message-ID: <2936b4ec-3203-4137-9d29-7f95f22186d8@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 14:16:37 +0530
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
Subject: Re: [PATCH v2] ASoC: qcom: audioreach: support multichannel PCM
 formats
To: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        shengchao.guo@oss.qualcomm.com, mohammad.rafi.shaik@oss.qualcomm.com,
        bartosz.golaszewski@oss.qualcomm.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261026082534.986449-1-zhangfei.gao@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20261026082534.986449-1-zhangfei.gao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzNCBTYWx0ZWRfXwhy/kUzcimFN
 2v2dX2+S1D7b0F1x9CCz1c1MISaYXCIY3fMffItLlDKoQnHgwBDrn5GQSuRCUOE9o1Viizrqq+Y
 KeExX7KeevTCc/Dm3YaEw1vuh8oSFfk=
X-Proofpoint-ORIG-GUID: EtvEF6KdBQkoffKLbtHS_KPGnrJxM0Sm
X-Proofpoint-GUID: EtvEF6KdBQkoffKLbtHS_KPGnrJxM0Sm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzNCBTYWx0ZWRfXziktM5T0oCr1
 MCJEXizhxf3tnqoRiF2d/i32YCQrL7xaQ0t3ffaA3Dt5FF7Fpqc5jEgCbRUPld4LATiGqOns6ry
 9dU+KCHRtsmp2dymkdAPigAmdAcunabIbJVElbXelxWAGxsSGjcbHyaS9/GZslz/nwAEQ7laggJ
 QhDVChRVLeCOpJE1X5J3ZSjUUE2z86NFKI8j87tHbvHmyFGoMcpqEKm7c3n2H5MsaDwPfphGRs8
 60zh0hjVVOgPwTVzW6qnfMPXE/Mrc9GQAL9mY7+4qy16Kz2Q8gbBIKGEzKeHfY72Bai4mie1GZN
 GLhlf0YIwklao0Yl6CNwhzIpIOfvJzgBS5ieduSn854MWmYEjHrdBmChc6SpFVZFV+/XnYRojJ9
 lD4rY9rB9Q4OSFhS3XuPaDo8/g9vyQWz2stxLy/xBrpFbli0CIxV+A9xSrwb+qxsS9LB5IhlkAe
 4rwG4ED6g4oKP8MZ3QA==
X-Authority-Analysis: v=2.4 cv=UOFIjyfy c=1 sm=1 tr=0 ts=6ae064f8 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=npAxPzOB_l-6x8PHPlgA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270034

>   #define DRV_NAME "q6apm-dai"
>   #define POS_BUFFER_BYTES	4096
> @@ -344,7 +345,10 @@ static int q6apm_dai_prepare(struct snd_soc_component *component,
>   	cfg.num_channels = runtime->channels;
>   	cfg.bit_width = prtd->bits_per_sample;
>   	cfg.fmt = SND_AUDIOCODEC_PCM;
> -	audioreach_set_default_channel_mapping(cfg.channel_map, runtime->channels);
> +	ret = q6dsp_map_channels(cfg.channel_map, runtime->channels);
> +	if (ret)
> +		return ret;
> +
>   	if (prtd->state) {
>   		/* clear the previous setup if any  */
>   		q6apm_graph_stop(prtd->graph);
> @@ -1007,8 +1011,10 @@ static int q6apm_dai_compr_set_params(struct snd_soc_component *component,
>   		cfg.num_channels = 2;
>   		cfg.bit_width = prtd->bits_per_sample;
>   		cfg.fmt = codec->id;
> -		audioreach_set_default_channel_mapping(cfg.channel_map,
> -						       cfg.num_channels);
> +		ret = q6dsp_map_channels(cfg.channel_map, cfg.num_channels);
|
|
|q6dsp_map_channels()| changes the mono mapping from |PCM_CHANNEL_FL| to 
|PCM_CHANNEL_FC| and does not handle 7 channels. Have these cases been 
checked and confirmed to be supported as expected for AudioReach ?

Thanks,
Prasad

> +		if (ret)
> +			return ret;
> +
>   		memcpy(&cfg.codec, codec, sizeof(*codec));
>   
>   		ret = q6apm_graph_media_format_shmem(prtd->graph, &cfg);
> diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> index 83f2711bceea..fcc0267d3657 100644
> --- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> +++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> @@ -147,7 +147,9 @@ static int q6hdmi_hw_params(struct snd_pcm_substream *substream,
>   	cfg->bit_width = params_width(params);
>   	cfg->sample_rate = params_rate(params);
>   	cfg->num_channels = channels;
> -	audioreach_set_default_channel_mapping(cfg->channel_map, channels);
> +	ret = q6dsp_map_channels(cfg->channel_map, channels);
> +	if (ret)
> +		return ret;
>   
>   	switch (dai->id) {
>   	case DISPLAY_PORT_RX_0:
> @@ -173,11 +175,14 @@ static int q6dma_hw_params(struct snd_pcm_substream *substream,
>   	struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
>   	struct audioreach_module_config *cfg = &dai_data->module_config[dai->id];
>   	int channels = hw_param_interval_c(params, SNDRV_PCM_HW_PARAM_CHANNELS)->max;
> +	int ret;
>   
>   	cfg->bit_width = params_width(params);
>   	cfg->sample_rate = params_rate(params);
>   	cfg->num_channels = channels;
> -	audioreach_set_default_channel_mapping(cfg->channel_map, channels);
> +	ret = q6dsp_map_channels(cfg->channel_map, channels);
> +	if (ret)
> +		return ret;
>   
>   	return 0;
>   }
