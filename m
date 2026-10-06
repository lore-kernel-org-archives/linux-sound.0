Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB13B3C3BE0
	for <linux-sound@vger.kernel.org>; Tue,  6 Oct 2026 08:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791275613; cv=none; b=WBnhoAPuBFLaRdX6bMzLS9rbrCGzx3LUH8EEil+KZDi4aoLLlzIDMImap03E1Nr410Goe09D7tU9ZHj8FStQ419ktKg5EjErhs03ObUjn5b73MkXgVojC09t39jcsV9MsGrhuRX4A8Gi+RdYiomoN3y/nXsQDKQpfozoDVxriK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791275613; c=relaxed/simple;
	bh=0QG05hN2bjHzC1maR4PCWp+0jd73NMhzdsmgGsdufyg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Znbe2FgRtrlTtQ8vphqJSxvhv6Fx10YIk67a7Uo1JJT9pbtxxI5/BgZipczTPc+U32XG8UTP+YW7l7IUXH42XsIoPncDjrxj49+gcX2j9S4XSAJV6GFLHOF4oZaAVbzSkFbY2fEioF33x2+Jv6o+LYWypVPjmHc065AcXXmwMA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UeM5zSvD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eocuntHd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UeM5zSvD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eocuntHd"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6966eKP3418960
	for <linux-sound@vger.kernel.org>; Tue, 6 Oct 2026 08:33:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dOjLxqEjz9TY9CmUoh/ZCCERCiVQQE6LX+zeibVYX+s=; b=UeM5zSvD2cC44SSo
	4iUZsbRqFEuTwpY3DlsehqmM/VPC2c+cxNx49BZ8jWjYA1iX1vfe/vmB9jz3uFaR
	7gPcQAITpTeA1tbF//cUEjnIq/Hesg/hJaC+H+OqdpCdlapEDEKH2gWgQ9Bu3gC1
	CyTUf2drYcYsSG07qUx+mthLxrC25WuJUsbjN/nzb5cCESPLVIA2YqvODpxroiNl
	UYvkpIYKBBYW7pKvEFgRcvvrqU/z3YWv0uaNxj9mrUDv35yF30cZPaBPIkB7BCxD
	effqU0h4ml5jbQOrGkBkQDEMPAYdtqjjl0uUFL0SRiFiAv0qqw82npv03FVzYQZO
	lhvDFw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4bhg47gv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 06 Oct 2026 08:33:30 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a4a0017549so4005047a91.3
        for <linux-sound@vger.kernel.org>; Tue, 06 Oct 2026 01:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791275610; x=1791880410; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dOjLxqEjz9TY9CmUoh/ZCCERCiVQQE6LX+zeibVYX+s=;
        b=eocuntHd05Hl5dydE0H422p/M0PSvqmoDp9SDPBGjR4T8yxaleEL2p1Znz9yKoFm1G
         oGe+kJisIWfB9d8yHopcO66s6WoEkaWCm4+EIgHUfvm2VjQI/ZyRJ3oURWbZ69gXIyAW
         1GHd0qjd+yJlyq6G30fsAIL3A4WegNUtyKuT3yX8amJhI9vz0+p9cdLCqO/BSsNoxsH7
         rgHBtHiyE4KVIgrN05Ei+E1bBdXXAESuywfWN+njkEgCywOno07n2PkmTJk2F/LGtxG3
         XV9UY5g3HCIs8J7MqbMqBsLXAyDYL1OqR16YbpdhjeAp5VPMa627yiKazZ5V9Kuq4ntk
         R3oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791275610; x=1791880410;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dOjLxqEjz9TY9CmUoh/ZCCERCiVQQE6LX+zeibVYX+s=;
        b=VfGhr7Z9r9XIQNAajPIttPazfJB8vn+UX/V7oe2S7Wj6saqRjA+PxwLPJClsn2OCE3
         84vVRnKS4ZBWpe2LjiQoo3Ae9a4T3WYZrQ4AbP4WgwGj9g/Y6i96ZHpqLN/kfz5yhhMG
         KJRm1k79pyG9lm7l3YMQ28Wh0KDuOaK5l0JYeswxThsyyg6dXjQFpAHHK6sEhmHWWILz
         G58Nm+/hJsVzc/EXHCXL7d08zXXbnKiBFZacBaUzDxstIVEt8uFAK6aSw4RDeC4YdiMK
         PWA5i81SpwjTLTDrcdaxlMN4PltPLhZVzSH4/TYoC0Ktbm8afiozbMOPZZVsDjpg8AFP
         IfVA==
X-Forwarded-Encrypted: i=1; AKwUvBxWand4zGTS4S/K7rvbYvZHhMQx83cFmcmCH3T+pF5ci4FIPIVIp9b6NYs7APebP7Qk0QJPbXffqdjH9A==@vger.kernel.org
X-Gm-Message-State: AFq9FYKOv6VntwLjEV+6OiGqgn0/fw8hjjn+RIGcOmHo822FNYM90jet
	14l/KrpeHJLTb70MrsM8n8aJ4JoPB/xKMO2j8GEJDDpqYsqtd2fuargDzVlLw+/pCbnku3LzbZe
	3l0+n/IfEJdiS6r7+JgGa6jTxwhXKSKC7F/MrsGqsAQbuMkGnNwBS9tgPa7MNrCxYVQ==
X-Gm-Gg: AYBFou0GgUQiEStnt1elX1SG8IRHR7d1r1rx0rcKsrn4QPd5h7EQy45u+s5izEHGS3S
	ZCRl5/j+01AAxR0ljeP0JmW+74dV/yGvn1l7HCcIO+TNuuV+u+DZTESlZZ5c+vWJfvhXqGSxjmq
	bHufyc1Cpgx48Euuo/lgX+10DePntePvlmxJPpGA0/UypiJRHtilOzXZfSm5MCR7uqdsL/cd2/K
	FBzzbVkcrgV/H4z0CiIL9NkEw4mUfVUFehLveLwjCeyKpAC/biLuLSUYzVkkyHZXBLJq4/Gg+gZ
	cCQzCF39KVLPSnUWfYw2hT50IR4LjpeKywhRK15xpVj0aSqKwFaj5VInjjpn6VtZtseNPlmMCH/
	PyYQ1Z6GPnkJ3uVHxla25PJTuong=
X-Received: by 2002:a17:90b:1c09:b0:39e:6c68:c787 with SMTP id 98e67ed59e1d1-3a873793baamr602584a91.61.1791275609579;
        Tue, 06 Oct 2026 01:33:29 -0700 (PDT)
X-Received: by 2002:a17:90b:1c09:b0:39e:6c68:c787 with SMTP id 98e67ed59e1d1-3a873793baamr602568a91.61.1791275609071;
        Tue, 06 Oct 2026 01:33:29 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8543b0c1fsm4707716a91.14.2026.10.06.01.33.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 01:33:28 -0700 (PDT)
Message-ID: <47a42c54-d3b8-44ec-8017-cdc34b474798@oss.qualcomm.com>
Date: Tue, 6 Oct 2026 14:03:23 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] ASoC: codecs: wsa885x: Reset registers on teardown
 for B2B playback
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, ajay.nandam@oss.qualcomm.com
References: <20261006053717.3455143-1-prasad.kumpatla@oss.qualcomm.com>
 <20261006053717.3455143-2-prasad.kumpatla@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261006053717.3455143-2-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: t0I8mXvmzREEcawZAL98fnVxVQ2w1AAa
X-Authority-Analysis: v=2.4 cv=GMGdgeNK c=1 sm=1 tr=0 ts=6ac4b25a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Rl-Sov5dAngERj82jmUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAzMyBTYWx0ZWRfX0ocbR5j67X61
 O8a7eMoVYgPI56MT4GKYaANUQXIyNQWeRth30WwScRKDhObluPF7MyZNuHptZmWxbHvFRYZcejJ
 scrlDXa5cNrNuA1RWytPO6tIwGoHysQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAzMyBTYWx0ZWRfX3Q2GF03X/7Az
 0mv/R4rct7TLokvpz+AzbAEl2xXHgb+raKY5aObSjWQ9PV1EPYcizqs1WduBRecKCeHXEqYRW2K
 3ntgQf7o97J3P4J9ma9fDrS4CbVgZDU3DHPCHuBnUwiKbVjUw/zfNLn0rphyiA3SBEEgDROgT8l
 okdINpFnoEl/Car4wHUd9v+kM06qHkLDXygEgc/F8qtGz5uxh3sp7IOThMCD37xPktHbDv0vPdf
 tHhJyI5iFwghnjjgegmRaEBeboKwWXXSbha+Dp4vPQIyptPlfix55VECM7kQlZ0g+k1YJX0InZO
 tZPqOkQ+HR0Gz1ewql9tEE6HJzpltUx5Je07qKE5d7r1HgyuFbITWiK7mlGqwG5QET/J4si9rEB
 d1cybnWExRZfPQGRGApPG/5Idr6czDK9d8DuZkIFx3EpoLx91k0evf04UMw+DUZAr+/JDgZ7ZHS
 D6nwif7NIqgB0vSgD1Q==
X-Proofpoint-GUID: t0I8mXvmzREEcawZAL98fnVxVQ2w1AAa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610060033



On 10/6/2026 11:07 AM, Prasad Kumpatla wrote:
> During back-to-back speaker playback the PA sometimes fails to enable
> because a few I2S/TDM and clock source registers retain their previous
> state and are not reprogrammed on the next stream.
> 
> Reset the relevant I2S/TDM, clock source and bandgap override registers
> in hw_free() so the codec is torn down cleanly and the speaker amplifier
> comes up reliably on back-to-back use cases. Move the bandgap override
> reset out of set_sysclk() into the teardown path where it belongs.
> 
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> ---
>   sound/soc/codecs/wsa885x.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/wsa885x.c b/sound/soc/codecs/wsa885x.c
> index 1faa8541a872..5ffbf9e89fd9 100644
> --- a/sound/soc/codecs/wsa885x.c
> +++ b/sound/soc/codecs/wsa885x.c
> @@ -896,7 +896,6 @@ static int wsa885x_codec_set_sysclk(struct snd_soc_dai *dai, int clk_id,
>   
>   	regmap_write(wsa885x->regmap, WSA885X_DIG_CTRL0_SYS_CLK_SEL, 0x00);
>   	regmap_write(wsa885x->regmap, WSA885X_DIG_CTRL0_POWER_FSM_CTL1, 0x01);
> -	regmap_write(wsa885x->regmap, WSA885X_ANA_TOP_BG_TVP_OVRD_CTL, 0x00);
>   
>   	return 0;
>   }
> @@ -1006,6 +1005,16 @@ static int wsa885x_codec_hw_free(struct snd_pcm_substream *substream,
>   				 struct snd_soc_dai *dai)
>   {
>   	static const struct reg_sequence regs[] = {
> +		{ WSA885X_DIG_CTRL1_I2S_RESET_CTL, 0x00 },
> +		{ WSA885X_DIG_CTRL1_I2S_CFG0_TDM_TX, 0x00 },
> +		{ WSA885X_DIG_CTRL1_I2S_CFG1_TDM_TX, 0x00 },
> +		{ WSA885X_DIG_CTRL1_I2S_TDM_CTL1, 0x05 },
> +		{ WSA885X_DIG_CTRL1_I2S_TDM_CTL0, 0x00 },
> +		{ WSA885X_DIG_CTRL1_I2S_TDM_CH_TX, 0x00 },
> +		{ WSA885X_DIG_CTRL1_I2S_CTL0, 0x06 },
> +		{ WSA885X_DIG_CTRL1_I2S_TDM_CH_RX, 0x08 },
> +		{ WSA885X_DIG_CTRL0_CLK_SOURCE_ENABLE, 0x00 },
> +		{ WSA885X_ANA_TOP_BG_TVP_OVRD_CTL, 0x00 },


This moves the BG_TVP override clear from immediately after a successful 
PLL lock to hw_free(), so WSA885X_ANA_TOP_BG_TVP_OVRD_CTL appears to 
remain at 0x03 for the lifetime of the active stream.

Is that intentional for the back-to-back playback fix? If the override 
is only needed during PLL programming/lock, keeping the old immediate 
clear and also resetting it during hw_free() would preserve the existing 
active-stream behavior while still cleaning up the teardown path.

Thanks
Ajay Kumar Nandam


>   		{ WSA885X_DIG_CTRL0_PA_FSM_CTL, 0x00 },
>   	};
>   	struct wsa885x_priv *wsa885x;

