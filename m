Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794743542;
	b=hKPrkwXwRKx3B5zLZGuDhK2Hfi3fyuRjkzgiNwtyF7h2QGobuKs6adVbGubgI//Yklqd
	 qxmbbNmf/YTdwVDoNZbDiJ6H9sw5Mwh47VmzNFL4OaMkhFIQSs/qxbjnSCmX3/V170gjo
	 4Ovy1cgU2x9/j+4E7S1aLc/23+ypmTg6vOKjzSVaFS9nREPdQBWdUiINbJeHifAHmBp6c
	 ECfM3mGntBtcrYQ68P6NzGT0mJgjUArxWALJIXK9RwpPUIU5/Z3LbVgaQM/L8TDaj0QL2
	 YomhuqGWgh9nyM1fVlItjSmkJ/vmSiyRD7rU9PVBFcZnSg5N3zEiedxdtBAQBx2vLHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794743542;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=oxYiqKJNYD9KdwN7WAZXVLTObyEuT47URNMJY5W5BKU=;
	b=j0Y7lR27F26s0uy06J5/pCAauNKoo/JTzJF2X4qw/y/5i2dWDJVE2zOGu/cgMuEp0VqC
	 rgtKZde4GmvFimaZsRhyN0flozoJxkRl2bCkfcMXXdsgPlS1iWkxNfKteoH7jBAqzYW7+
	 vuUBqb3MfMZu5x7AOqxG9WK+cYv2fhnbD41O69MyZLR8ApIA2/6FU9WNnulw/UoMlxSyj
	 KrNbFm8dWncLzB+e24Dtpm+KAxEK2AploT8PI8wTJKV9VxWDf3r+AUo3v+iZYFdI+yK0R
	 ksJu8DMxUIlIyFT7U3+e1RJlhMc9X0RvPS7qU/d+mrBe2ScY/kVjYD1yZ6Rk3qhPgAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gpZwIVyR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hER6r06X;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F46606A31E
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 11:52:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9F46606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gpZwIVyR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hER6r06X
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AFBmGtV048172
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 11:52:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oxYiqKJNYD9KdwN7WAZXVLTObyEuT47URNMJY5W5BKU=; b=gpZwIVyRgd1j6fy7
	dcYCnJJYu0zIvOCxOyoatxcJDiwNFyLqip9pHtPveVY2+ferjcMo6Q4fcZPlqdlV
	zrs76Xo2AMXnitQejM3RYw6p1Mx0Z01qDIPRpnHlvU+hDj0uYvwiciEorTQlgDSi
	A/+G0ngnkN9P0fnc8AqcVc9YLp3aHM8BPJupXikd7aqjQ80ryXhUFMuTRlkV1iry
	mToXGICmpHo/augQYxe8+Tct9Dn7xkkCNFLXZ260COSULf/K1Y4cGhPOHgbCW2OJ
	gOEZg1nPB+T0bMgvvPkd6zVt4IAsXJBKXOPu95VC3o1rL/P6HWgW43Jp5XiFyVsO
	KjmTIQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhm8tsqe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 11:52:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f26dd2165so811216585a.3
        for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 03:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794743540; x=1795348340; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oxYiqKJNYD9KdwN7WAZXVLTObyEuT47URNMJY5W5BKU=;
        b=hER6r06Xo6bDW7lTR4W6w7xZuYtoW16ZRUcDan9PtrGu6X76NhAIQk3fSX2BsCQRmN
         uurXUCWAP0HZGBlqMyDQvIwCSzeFefOy5PlqudDOz4rGWEgiQ1j//8B8UnNLitMSQjQ9
         bOuonyXPeqiXMWJuouG6SSHk4mmTp2tx0iTqGv0d9T6+ezokh40cb2k56i4hgoATOjyZ
         klpj8x5VHU/bJMqeCKx8cbI0/sWo8GnMDyjnnBhPFtLyXX1B1QEbSRhZQorsVhJJjKA3
         NZn1g0BFv47kmMeKNpQI19Gr6fcvooFfPyUh5feQLpTMVthIDE/0/d7KzPlcPTrJQJFe
         25ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794743540; x=1795348340;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oxYiqKJNYD9KdwN7WAZXVLTObyEuT47URNMJY5W5BKU=;
        b=sw4fsYDlxypGJXOjEFbZ3jAxPE+S1StxzcTRbAGUKXaU2D7EuPrbVemqrMGTX9+XeP
         921CtOjgCZqapBbzqlnUApRv9TJKCEeuJvCdiyuZ8IEyl0pJJoo4t+5QtiTDmvQvG90l
         OUAW3lOZMwkWfXXXsOT5RylotNmGfOhpux9Wy8khixl4ThTKWzguR52wUsEBzaV89hpe
         BxdE+pltyFtavbl5W/OMpt5ahidRrqbpMLBWaNnCntfPDMCmr8zyTt5NUmkr2gM9PwYZ
         xNDCMQQTfmIe0StHOdvKxuFKso3NCZ+OTvH6+tZz+lenPYfQueOvxTeUeZOAqWc4qrYF
         jG/w==
X-Gm-Message-State: APuU4Z9ZaOOSociyGGjQTWBCxcggUcpb6FuQ+IbfJQe1jQwf7MzLQisr
	mH/WL/mE0REN6B8aS/qwKWkYDEMQYpcHJgfCInAwrAUUG4v50V+AiRUNEBzwKpbRkkGoH0jlIzN
	2XXpG1ATEIxsbNBQoSO5uqVpD1gFPZx/HXlWCLMKm2/97/6isS3kkXFw2gAnPuhTcN+86J+nCiw
	==
X-Gm-Gg: AYBFou3jGHBoHH39nqkUnTP/KmnFGW51amKZuXAdLacXG+vqKVwiqfMrdqpedVKf17z
	4ys++j+z52V4qGC4wLFmGOevBP9QteUOxhot+xkqzg4gW6iNsKr9xTquwz4YKLP0ibS4fx0jgC8
	Ea0EkpVg10Mw7nR6QIZODDXiUGx7WC4tcSkdzjfQ+4anYPgM2DLIDkNNBrojIq6CuI5erux/aSl
	Fn6LLWXu94gFG6VOM+sx2kgqpE5Vr1JAjjAEWj4IM8qF2YFEWQX3Y0hI7b/f5AbgLGZg/9ZlnLd
	44X+/jVZAjh8m8SvlzI4qaUKEuRDcIoHIM3flBarqcQMdW6fC8CTqwGva35Q8HvStNg/FsDLGss
	CWYI1iXGmy1WEZRCY5h2rw7/dd/KrURsBtu2P7cMCWJw8tanJrYds7+bYzH477SWS05Qlx/XSrw
	WI
X-Received: by 2002:a05:620a:880a:b0:93f:3bb5:5452 with SMTP id af79cd13be357-9494bb77243mr1195838585a.15.1794743540130;
        Sun, 15 Nov 2026 03:52:20 -0800 (PST)
X-Received: by 2002:a05:620a:880a:b0:93f:3bb5:5452 with SMTP id af79cd13be357-9494bb77243mr1195836985a.15.1794743539691;
        Sun, 15 Nov 2026 03:52:19 -0800 (PST)
Received: from [10.2.25.60] ([212.140.138.201])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c60116323sm15767904f8f.32.2026.11.15.03.52.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 03:52:18 -0800 (PST)
Message-ID: <9cb2cc9e-7224-48d6-84d2-308ce31fd93d@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 11:52:17 +0000
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
Subject: Re: [PATCH 1/2] ASoC: qcom: audioreach: use a 32-bit container for
 S24_LE PCM
To: marcht@proton.me, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261111-q6apm-fixes-v1-0-1beb5702b372@proton.me>
 <20261111-q6apm-fixes-v1-1-1beb5702b372@proton.me>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261111-q6apm-fixes-v1-1-1beb5702b372@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ItKL47/g c=1 sm=1 tr=0 ts=6af99cf4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=YCedeovXjpRL1ZDdAGOthw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=05h1Iz1xiaL5QSpjF5EA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDA0NiBTYWx0ZWRfX6T2tlDb8yXR4
 2AT4/QTLu/EHhS5nQ7ymZsfqoy+DVmzdMldjMyZ0iJXhWaSyJuPwI0SUWbSSj4k5G+3gzbDJ05r
 ViSCW+nPA9aSYV0qPGK1KVTG2VZZsfM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDA0NiBTYWx0ZWRfX+qdUARJn+P2W
 UWjUpp0+q+RlFxrpHci/YFX78e1bvKx6zLOyCZtX5cy41xVF/KS2k2exq6qxO+oI9l5kRl91E+q
 s42m1BVMTCP2EIxTnDy0pTci4wloSZlWi8sp5a6jx0YQzX1Dj3ni6YFqK34SSrf5aR3lTgqy9Y1
 tOemeGjV/maMMXhisD5cbOV5pWMBDI6gfb8p2wLOdoRsv+t1TrkC8iKzvZhm+xcMdD1L3hLHAId
 SSMe6Kt1/iISW56qXeMqNA0jum8aDIBvZqxn6/HOnzUa/4GcwVuQaVQGgbMQRJb/JxykG3Nj7JM
 UBEOHToC0PmqOjLTnv6RMuWZevx4V7dIkN4ZQOAEfGiX7PqSgLBp3ETJWYmjnSxSgXwm5TZmyj1
 4wL/AYQR06i2sk/SiR5SY6yT1ZbVNoipaDr85Hug7b46LHyX27x89B4jnABOGhbuHYmJQGhmVCc
 Rgh/S+Gsv5nVI/VE11A==
X-Proofpoint-ORIG-GUID: YkBFRuXvOenA1Pe7fe2RCyxtaryoDHjF
X-Proofpoint-GUID: YkBFRuXvOenA1Pe7fe2RCyxtaryoDHjF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611150046

On 11/11/26 10:54 AM, Marc Herrero via B4 Relay wrote:
> From: Marc Herrero <marcht@proton.me>
> 
> SNDRV_PCM_FORMAT_S24_LE carries 24 valid bits in a 32-bit container, but
> audioreach_shmem_set_media_format() and audioreach_pcm_set_media_format()
> set bits_per_sample = bit_width = 24 in PARAM_ID_MEDIA_FORMAT and
> PARAM_ID_PCM_OUTPUT_FORMAT_CFG, which tells the DSP that the samples are
> packed 3-byte words.
> 
> q6apm-dai advertises S24_LE, so with a topology that allows it on a
> playback front end the DSP walks the buffer with the wrong stride. On
> QCS6490 (Radxa Dragon Q6A) this crashes the ADSP audio_process:
> 
>   PDM: service 'audio_process' crash: 'EX:audio_process:0x2:...'
>   q6apm-lpass-dais ...: Failed to start APM port 113
>   remoteproc remoteproc0: crash detected in adsp: type fatal error
> 
> Use the container size (32) for 24-bit data and keep bit_width = 24,
> alignment = PCM_LSB_ALIGNED and q_factor = 23. With this change S24_LE
> playback works on the headphone path (codec DMA RX -> LPASS RX macro ->
> WCD9385), tested with the back end at S16_LE, S24_LE and S32_LE and at
> 48, 96 and 192 kHz.
> 
> The DSP then reads each 32-bit word as Q23, so S24_LE samples must be
> sign-extended into the top byte, as alsa-lib's conversions do.
> 
> Fixes: 25ab80db6b13 ("ASoC: qdsp6: audioreach: add module configuration command helpers")
> Cc: stable@vger.kernel.org
> Signed-off-by: Marc Herrero <marcht@proton.me>
> ---

Thanks Marc for fixing this,

>  sound/soc/qcom/qdsp6/audioreach.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
> index d2dc5d37bccf..937506edf34a 100644
> --- a/sound/soc/qcom/qdsp6/audioreach.c
> +++ b/sound/soc/qcom/qdsp6/audioreach.c
> @@ -1216,7 +1216,7 @@ static int audioreach_pcm_set_media_format(struct q6apm_graph *graph,
>  	media_cfg->interleaved = module->interleave_type;
>  	media_cfg->num_channels = mcfg->num_channels;
>  	media_cfg->q_factor = mcfg->bit_width - 1;
> -	media_cfg->bits_per_sample = mcfg->bit_width;
> +	media_cfg->bits_per_sample = mcfg->bit_width == 24 ? 32 : mcfg->bit_width;

I think it will be worth adding a comment about the wire format vs the
sample format so it helps others.

other than that it looks good to me.

Reviewed-by: Srinivas Kandagatla<srinivas.kandagatla@oss.qualcomm.com>

--Srini


>  	/* Convert the physical mapping to a logical mapping of the channels */
>  	for (i = 0, j = 0; i < AR_PCM_MAX_NUM_CHANNEL && j < mcfg->num_channels; i++) {
>  		if (!mcfg->channel_map[i])
> @@ -1308,7 +1308,7 @@ static int audioreach_shmem_set_media_format(struct q6apm_graph *graph,
>  		cfg->sample_rate = mcfg->sample_rate;
>  		cfg->bit_width = mcfg->bit_width;
>  		cfg->alignment = PCM_LSB_ALIGNED;
> -		cfg->bits_per_sample = mcfg->bit_width;
> +		cfg->bits_per_sample = mcfg->bit_width == 24 ? 32 : mcfg->bit_width;
>  		cfg->q_factor = mcfg->bit_width - 1;
>  		cfg->endianness = PCM_LITTLE_ENDIAN;
>  		cfg->num_channels = mcfg->num_channels;
> 

