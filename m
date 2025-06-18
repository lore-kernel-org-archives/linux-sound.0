Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336D3296153
	for <linux-sound@vger.kernel.org>; Wed, 18 Jun 2025 12:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750250040; cv=none; b=TA5pmatU722IbatJNmqWR5SiH0AcWsSa9CM5a0522ItlzqAPoeRQV7pfaQD7dRftra530kMQLYiL6BtVHO5qhHdQY+D77lls6pO/E1WKlabQ3m3GJfI0T7M+K42FKBfrQ3XMT3OYFjJC+l0WCfJ3zNBSQmUHr0x0Ss5iSk8XTCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750250040; c=relaxed/simple;
	bh=A6NjSmVsSO2npuGJxvk9PvX0G4YIisDe+7dizzTEci0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=tF9IXcwpYp9kFmlCh2uS7uXgXWEvxsfVl5lsLaYiDffeLh/G/6FHRryE9AnTKxhHmSmOV9JR+PD0dTJ1Pf2ITfWaE5WT7LdJbnU+0VmKXgoHwmySUtcuy/d21HPwFfzgs/9N/sPjDn8B9swKM29VnPaAAh2yrYtDv6koHqU7vkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SFMg8b+J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SFMg8b+J"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I9JNX2004610
	for <linux-sound@vger.kernel.org>; Wed, 18 Jun 2025 12:33:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g0cZJ9wdJVEr+Iy5G1RNIzGoPSb9HC/vXx1omHgkSqk=; b=SFMg8b+JtCUqNQb5
	AEGC9NXcyWl8/LBX8K3W/UHViMVdau80S6KW0FsXvtNnnU5arwf5lB3xkMSkSpzM
	cFU0VtV7W/DQRb07I0JEh4kpmrfX6STXmhYCC1TisSdawLk510lWViFrjEVlptfN
	6+CZ2FU0nO4SjMkqOS9fUr9yKC5OLq/NjuvvT6wa00L1s6jr6q4ncWVGQhvIGubu
	JbVI3Tbx/b1lbElMlOu1kBUOc4FWQoDrPhO7m0iw3EQ8moUInvX6NXuJLBVYZ3hH
	lO1d/FrkFRHu3Ifi6OtEWPGROl2EjYK+hZ5QOK/JN0ObGCYRoLFijQqlA5WJZeKZ
	4CbnXQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hfm6tj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 18 Jun 2025 12:33:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5cd0f8961so169063485a.1
        for <linux-sound@vger.kernel.org>; Wed, 18 Jun 2025 05:33:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750250035; x=1750854835;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g0cZJ9wdJVEr+Iy5G1RNIzGoPSb9HC/vXx1omHgkSqk=;
        b=rKniRwixqz+hprGXC4+Vn8G57DTpRPrxA/VmU3C50shkcQ0Lm/akp1157FVVv2ZGzt
         fs79FFnaz/sG+lwTROtW1ENoS9bHV1JtGAs7Gfz5wSBw3YxLBXuVrR3uXf/g6BqrFx9Y
         PeKpuOUCfW6UBQw2jAPotAjHb2qyBwmGQYW0SHfUBIfhyRMvrnZhGADKmwVo4s8Mzs4E
         8cucn3zEjlwtuAo5WAQk7D30X2HOEP+OnBTcLb2vlM/pjFGY9FLVTxz1rp1t9z5m8IcU
         Q8eGklEmPigprHJhf3t34RAFoyr95EWScNDpWBsb+WSiHMa1vBRYhKpKA42AsjBD9+tN
         1Eqw==
X-Forwarded-Encrypted: i=1; AJvYcCVAxvOuE+TLDlSd+DzEIAh8yBdHAK9vczW/xP8Gniu2K8gsNy8F975pNajhajtlVa2W+zF+Wo10SoGjuA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzsgZXCqjBJSJyhQAc997kbHepak7XgzoqBNGFPw+S1xge172i
	dJtbYZzR/VgCukGeYELYZITf8G4m1ntNkLnCmzpHuu4wYwaBHgQAvIg6EsFJ0vIWOSJhx7RhDx4
	gH5HcAMnstaCpYMKRqaKufb1hImuL5dFEcWsGgLJ0g8u+ZfgCKz+K1HnNrIovFOwALA==
X-Gm-Gg: ASbGncsve0bRTeuRpXVTYbz2jUkzvPSMLzsM5n7HVm7TsFQUo7ltVYtqCTRtfCQIdXi
	F9ai010jTPWCHAkUeniO3jUTw/yc5FdcPc8u+46X6LOEX5P+HOQN6KXDqvGfMuq8dyYJ4On2S9w
	C6z7u488H5YcTFSj87yWqNIUM6eE1ywa/8WRdybTwyTQKJpV5CQg2wiEcwkEiyd4P5d+oogs/fV
	YrihnrDDun9Im3Imls1N7vQWKkhghh3n0BieqmgBezaD/jUkoGvMKUf5qgNiI/P3AbOY8hL07It
	vyygifZPOsIXkRSkD9oDQ+HDJXz9oAE8YRzWln9ovUXybia1
X-Received: by 2002:a05:620a:2983:b0:7d2:1930:52a4 with SMTP id af79cd13be357-7d3c6ced9e7mr2424726685a.46.1750250034865;
        Wed, 18 Jun 2025 05:33:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEI+AWOdi/ZgaHOvkfAm6gX6AJORuDaq8N+TiWh2ZVfC8kbV6/9mB2L8oD1BL0NI9UN0eauDw==
X-Received: by 2002:a05:620a:2983:b0:7d2:1930:52a4 with SMTP id af79cd13be357-7d3c6ced9e7mr2424722885a.46.1750250034480;
        Wed, 18 Jun 2025 05:33:54 -0700 (PDT)
Received: from [192.168.68.111] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4532ddd29ffsm204308935e9.0.2025.06.18.05.33.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 05:33:53 -0700 (PDT)
Message-ID: <1317c3c5-967d-4013-9c0b-f68844c63908@oss.qualcomm.com>
Date: Wed, 18 Jun 2025 13:33:52 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH RFC 1/2] ALSA: compress: add raw opus codec define and
 struct snd_dec_opus
To: Alexey Klimov <alexey.klimov@linaro.org>, Vinod Koul <vkoul@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Patrick Lai <plai@qti.qualcomm.com>,
        Annemarie Porter <annemari@quicinc.com>, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        kernel@oss.qualcomm.com, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
References: <20250616-opus_codec_rfc_v1-v1-0-1f70b0a41a70@linaro.org>
 <20250616-opus_codec_rfc_v1-v1-1-1f70b0a41a70@linaro.org>
Content-Language: en-US
In-Reply-To: <20250616-opus_codec_rfc_v1-v1-1-1f70b0a41a70@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDEwNSBTYWx0ZWRfXyPaa2SJATj1n
 og4sRE8TnGqGOzyqRhNseyku0jD+2kmwMae6xJlz5v37tXycVJB4UBy2NxEnAB36ZGhU+U7xRLe
 EtKsNChNLWQcmu1lH+oKjV17MqDZ6HGwPF/6I6g56DSOWwUb9t0b7qaQMx6D5OCW7eAAvdMJJoh
 4UQ4Vw6pumefc3UWcCFmiA135opFH6QttPL7+U7pvycmK15lYoogF8PAjIjYMFGRo+IYJvVxtRX
 edpveVsyiuHWlr7NTNJ7nNSpkRhdBjduBJXxnAAhJwhZ4Co4huVCiGCUnkeTYuJWLAmwhQCJT8Y
 V94hBQeP0JOrS7zvCtXXDWFATOEWkNkKcopjA0kdgOSWCCcnOIoPfum9Rcs0p6817rB0KRO1dTG
 qehg5F5Mnx1yfkaiHL3sLnLGWIGYvIugvQ8KPisnChXu49HgZMw6/+5vP3tRxjuPgrOV0xUT
X-Authority-Analysis: v=2.4 cv=VvEjA/2n c=1 sm=1 tr=0 ts=6852b234 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=BqEg4_3jAAAA:8 a=COk6AnOGAAAA:8
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=LhU3g7bnflL2ouMbDHkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=0mFWnFbQd5xWBqmg7tTt:22 a=TjNXssC_j7lpFel5tvFf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: LvZAOeNRp6DHuJvOl-O7iW4REql20Uo8
X-Proofpoint-ORIG-GUID: LvZAOeNRp6DHuJvOl-O7iW4REql20Uo8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506180105



On 6/16/25 4:26 PM, Alexey Klimov wrote:
> Adds a raw opus codec define and raw opus decoder struct.
> This is for raw OPUS packets not packed in any type of container
> (for instance OGG container). The decoder struct fields
> are taken from corresponding RFC document.
> 
> This is based on earlier work done by
> Annemarie Porter <annemari@quicinc.com>
> 
May be co-dev by would be good option.

> Cc: Annemarie Porter <annemari@quicinc.com>
> Cc: Srinivas Kandagatla <srini@kernel.org>
> Cc: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  include/uapi/sound/compress_params.h | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/include/uapi/sound/compress_params.h b/include/uapi/sound/compress_params.h
> index bc7648a30746f4632ecf6695868e79550a431dfa..f80989f7bdd2f1bfad843b1dc30fa263e083d17a 100644
> --- a/include/uapi/sound/compress_params.h
> +++ b/include/uapi/sound/compress_params.h
> @@ -43,7 +43,8 @@
>  #define SND_AUDIOCODEC_BESPOKE               ((__u32) 0x0000000E)
>  #define SND_AUDIOCODEC_ALAC                  ((__u32) 0x0000000F)
>  #define SND_AUDIOCODEC_APE                   ((__u32) 0x00000010)
> -#define SND_AUDIOCODEC_MAX                   SND_AUDIOCODEC_APE
> +#define SND_AUDIOCODEC_OPUS_RAW              ((__u32) 0x00000011)
> +#define SND_AUDIOCODEC_MAX                   SND_AUDIOCODEC_OPUS_RAW
>  
>  /*
>   * Profile and modes are listed with bit masks. This allows for a
> @@ -324,6 +325,23 @@ struct snd_dec_ape {
>  	__u32 seek_table_present;
>  } __attribute__((packed, aligned(4)));
>  
> +/*
> + * RFC with info on below OPUS decoder fields:
> + * https://www.rfc-editor.org/rfc/rfc7845#section-5
> + */
> +struct snd_dec_opus {
> +	__u8 version;		/* must be 1 */
> +	__u8 num_channels;
> +	__u16 pre_skip;
> +	__u32 sample_rate;
> +	__u16 output_gain;	/* in Q7.8 format */
> +	__u8 mapping_family;

This is where optional Channel Mapping Table starts in the structure.

Should this all these channel mapping memnbers go into a dedicated
struct snd_dec_opus_ch_map?

> +	__u8 stream_count;	/* part of channel mapping */
> +	__u8 coupled_count;	/* part of channel mapping */
Comments are bit misleading. Either we document them in detail or point to
the rfc which has this documented in more detail.

> +	__u8 channel_map;

Channel Mapping is (8*C bits), one octet per output channel.

The way this is represented/split in this struct is confusing should it
be just channel_map[8]


> +	__u8 reserved[7];	/* space for channel mapping */
Any reason only 7?

> +} __attribute__((packed, aligned(4)));
> +
>  union snd_codec_options {
>  	struct snd_enc_wma wma;
>  	struct snd_enc_vorbis vorbis;
> @@ -334,6 +352,7 @@ union snd_codec_options {
>  	struct snd_dec_wma wma_d;
>  	struct snd_dec_alac alac_d;
>  	struct snd_dec_ape ape_d;
> +	struct snd_dec_opus opus_d;
>  	struct {
>  		__u32 out_sample_rate;
>  	} src_d;
> 

