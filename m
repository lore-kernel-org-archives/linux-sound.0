Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792685280;
	b=SrmAwBEydu4rA0C3LukLjHvOWsVdoPCITapjGasULDO782MukAPf4pVNjQVPz9W+OJfV
	 /HnaZTqeqw0/Ne+bSg7qmviTlZIBNIhdSYqba/sTAsduZebqWtFL6idgp43XNXQp4OZbF
	 h5/+yPb88T8vZiQdMT8zAzNMl9CmMWm2RT4Q8Vro/liSalaKrQBzYal5pW8+kRK5AdAIl
	 3sVm+gq8etdGX+uQrVhDvmJthgM2C29YHC6M9E46vAPFPLqF0P7HShDisPTCW9Pu3xoK1
	 rFuaHc8wG8LPOw6jw4H91BzcV6UNDCOMuq55Nn6vmqcA7cCOjB5MbC98QPYJ4jz8ukg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792685280;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=EvLjnA+g80xDDOloUKTJVnDZv7ahI9jhwQBN1yw6YCE=;
	b=xg9e971XmeSetcuOnJ56QSNx578dLKQR0Lo6hrghNrp3VTYwkKlrrIMrM/2HP9LKqU2O
	 Y6h7uhumSUkDuW9lQRNXLrv5cJPtpuHmi2Vwkhaou9/8wQJtlS3axfl3UfOKPUoUxIvyE
	 3QeYbRvvcat82THt9vCN+Ph/sGDsepMIxkFvy4fPUnCBXHEPehMGJFY7l3JjupiSuz9pg
	 2h58+fIg52ZrF9cAd6v+MEHWKxsLhlGSdrPhpEs7LUpKiaNm5tCk08HCtz6R9Mo8WZnuE
	 WqzISX8NGHF2YHcJoq1MDRlzScAsSXSPQ1y3qqcMzw406HdiEEmsLtK7T9KiquhhuKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SDvJatAA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TOhkkQMr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E75606A320
	for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 16:07:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5E75606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SDvJatAA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TOhkkQMr
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MEFWaG3771429
	for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 16:07:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EvLjnA+g80xDDOloUKTJVnDZv7ahI9jhwQBN1yw6YCE=; b=SDvJatAAVPIIVtEt
	EheiKoLEV5P/+uT9bE17Ch9o19/8L9giDLTqZMjB0N/WJeeiKADlhBI5fzEuimj2
	Txjfgk3th7MAzvKboQwBE1shfw8PDnjYFPPmR+uJlYHnQOpkHDYB06d2J00jtEo0
	FJBxsORhB01j0D+NHf8rQH3qzmXUb1DQPQDJmOQnGj9GulgZCf0XuJU+uTrxiVPh
	j2YS5SzK8GFKNoO4CZPFCHTLhBU4vES8LAdljQXn5wpsoavkjfQTxi7PQVcYosEz
	KkqYZz+1t6F1LAc6ig7nHBrTm3UyYfO1UKJJNpBKJEpHEKsXc/Pw0zo//JfYQcNU
	axx0Uw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bvm9u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 16:07:52 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3548cdfd2fbso2996921eec.1
        for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 09:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792685272; x=1793290072; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EvLjnA+g80xDDOloUKTJVnDZv7ahI9jhwQBN1yw6YCE=;
        b=TOhkkQMrbFikNyiGk1LgwmHcJyae4EdAtbpvige1UQTTx3LUhGbcDHuOGVCF6cqxhr
         6waYErcAI5XempbzwjDXCwsyEMMjkZhZuJ+1DJ1BUZc2efaU3GWzii+FWEWIAMzwjMF9
         BQivbkoQt77Jq6f6aO8cCHIFiVWRnSgO1znjvmLoc91S3B5XAEoBz5XpEWLA+8JNxX4N
         wIF4Bzeo5Cx/AO0FNl0K3YPQu4I1HbjU5sIy0OFMB3FDwj6dsb5YAGyTFCze/9zClM7w
         WsyBwcTW/lvOrVawtt5VP87vNA5OppmluXUjrdgzE6vN78o5pXOCi4qBaI64hSS7NwpZ
         TvxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792685272; x=1793290072;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EvLjnA+g80xDDOloUKTJVnDZv7ahI9jhwQBN1yw6YCE=;
        b=vjYyNSVN0aXIEp3Zcnn0jX5Io7eg+C4g+ltlP1LqAqohnuxH+6mKhdG0dLxmvOmOtJ
         fYRcav3b62vfv+DC4JhiV/dF8UdxamgzCe231FYXg2ot4qOuMdjOi8mh8OXhrR5ICKfl
         OmV6TQoQTr5j6u81aR03UIulwtVx6GgkPG5rn+WWn/pmvqGhPtW0Rw+7fX9dPq+uZIMP
         xBAp0HIajx5bYzeQVwGqKYTv/Zpf60/2HUeNL2fAenoIi+Y+0OHDmtmfPXdYfgANR1Of
         WU9FH+Q1l3mGaM6Bj25Y3u61LyXnBPGa4a44eWBhSgcDs6ypI4lDnhTqogKUZaXMg0UL
         1Ceg==
X-Gm-Message-State: AFq9FYIqw/7/kTeziz48VZCMzZZCk4ZUOFSR//ZsBcHgO3Tm4YdYE2DP
	7Ok4h6rs/d75Em96h6MkhpyueXzC7QGOSsHyz1dJFGcIDxvQAOfUzc6/BKTMKWOCTpdQpB3/U8F
	U0sQG2jtIj/aWWJNjv6bZqFSCab5BkJiZFVr0Yw03vBQDP/VTln64Ww+arDnyjA4zfQ==
X-Gm-Gg: AYBFou3HMkI5bN8i1J7iyJ2L0QrPS+z15JpA86trtruupthi9x/5dTggCshhkpn9od8
	y52Dz41CysfrAZzhw0NNChMBeEYnA1amqQozRdYhkyexe4ZU4htB+5kfEKb+IXsYX9d7nS8lr22
	dUmjc7jQBkckMtFymysHT3w7s/q0EC+c6100iYkm4IeibvcqR04COtrkDKn47LOjqZEsCz2ykYv
	LWjO4xEVZ3kj9wKBKhDPAA3mbWvbTFdnql7i0GZ9cU7mpwoqlCdwdNCKSFSEHMZ4aX3pTvu6SJq
	wmg44TvVVZI5oA+aHDK1HG+dy6L0VD4IJRh+iPBn0xXoU4JLC+JoHuDTEZGZpUb1KsFRPvP140E
	3njsgBR8opYOCEnL2pWNPmzvhqQ==
X-Received: by 2002:a05:7300:a206:b0:35d:8c39:b314 with SMTP id 5a478bee46e88-3674f22497bmr6741543eec.37.1792685271536;
        Thu, 22 Oct 2026 09:07:51 -0700 (PDT)
X-Received: by 2002:a05:7300:a206:b0:35d:8c39:b314 with SMTP id 5a478bee46e88-3674f22497bmr6741516eec.37.1792685270960;
        Thu, 22 Oct 2026 09:07:50 -0700 (PDT)
Received: from [192.168.1.11] ([171.61.216.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3674198f1d8sm25689760eec.24.2026.10.22.09.07.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 09:07:50 -0700 (PDT)
Message-ID: <4e08bcac-66ee-41b4-a2b7-65797ec0e3f0@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 21:37:44 +0530
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
Subject: Re: [PATCH v1 5/5] ASoC: qcom: sc8280xp: Add shikra-iqs-lt9611uxd-evk
 compatible support
To: Karthik S <karthik.s@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ajay.nandam@oss.qualcomm.com
References: <20261022094313.1074873-1-karthik.s@oss.qualcomm.com>
 <20261022094313.1074873-6-karthik.s@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261022094313.1074873-6-karthik.s@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MHiSuEV6-2AUqGzFlSgOi1vcifIqv70p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA2NCBTYWx0ZWRfX8qlqdmr4ntcs
 iwyOetYbysxN0mNG5y2CQpVB4jn3tIR3wEBb6jg6w3ZICz527Y6NKZNJBV1e7DSFoiMa2ATCZGG
 rN+g/+pyenJLX1yD2s/rxE93oM+jAoTn+UWmpVNJx6XsG6pta1yzI1BSks5Yx97I6n9tTq0wgMh
 c97bdKPa3msYTMXCGLXZuni+x7wTD+NUjBiAItEx+Gm5llqK3sRxqcvmPYz3zfarhXpPVHtcTIK
 /uSJqrg93inJnkALBZrYOFBuKp5vS6SgiOCUEmZkivrHlsLt0GHhKNMO97UrwLDByzyV9gkuIr2
 Nccr9WLmstrJbSk58IPov81FUvOAvqv80uBqwSXpymtFXyUBlVIFTK1j7vBgcL3my9a3tNto+74
 WqYPMdb/ah5Ql9HNvjrRd5JOQmKvHXm11kpkWPPkImryhZWw/27N0o6oEpE+LBo9U40nQAx0lPS
 GlU2oeP8X7L16Lh8sHA==
X-Authority-Analysis: v=2.4 cv=HJxWhYtv c=1 sm=1 tr=0 ts=6ada34d8 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Vglx2bvqrojy+vbCC2YzaQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=YK1r8bVAkC-uCLGTKrwA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA2NCBTYWx0ZWRfXzWONkwMb5Rpm
 B44lagMp52IaE1yhHr8xBLJznETXPsH9GDjBmItQbkPNWQ6wfAuVzy38FWLpk181FrSC40lHzAU
 3uVvVQLCpJnrlujH9HkD363VpoCp9M4=
X-Proofpoint-ORIG-GUID: MHiSuEV6-2AUqGzFlSgOi1vcifIqv70p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220064



On 10/22/2026 3:13 PM, Karthik S wrote:
> Add machine driver support for the Shikra IQS EVK variant that uses the
> LT9611UXD HDMI bridge as an I2S audio codec instead of the MAX98091.
> The new compatible reuses the generic sc8280xp DAPM widgets and configures
> the codec DAI format for I2S with bit/frame clock driven by the codec.
> 
> Signed-off-by: Karthik S <karthik.s@oss.qualcomm.com>
> ---
>   sound/soc/qcom/sc8280xp.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index 9860a68e2add..66064c31136b 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -541,6 +541,15 @@ static const struct qcom_snd_soc_common shikra_iqs_priv_data = {
>   	.mi2s_bclk_enable = true,
>   };
>   
> +static const struct qcom_snd_soc_common shikra_iqs_lt9611uxd_priv_data = {
> +	.driver_name = "shikra",
> +	.dapm_widgets = sc8280xp_dapm_widgets,
> +	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
> +	.codec_dai_fmt = SND_SOC_DAIFMT_BC_FC |
> +			 SND_SOC_DAIFMT_NB_NF |
> +			 SND_SOC_DAIFMT_I2S,
> +};

Since the codec is configured as SND_SOC_DAIFMT_BC_FC, shouldn't we also 
set .mi2s_bclk_enable = true here?

> +
>   static const struct qcom_snd_soc_common sm8450_priv_data = {
>   	.driver_name = "sm8450",
>   	.dapm_widgets = sc8280xp_dapm_widgets,
> @@ -608,6 +617,8 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
>   	{ .compatible = "qcom,qcs9100-sndcard", .data = &qcs9100_priv_data },
>   	{ .compatible = "qcom,sc8280xp-sndcard", .data = &sc8280xp_priv_data },
>   	{ .compatible = "qcom,shikra-iqs-sndcard", .data = &shikra_iqs_priv_data },
> +	{ .compatible = "qcom,shikra-iqs-lt9611uxd-sndcard",
> +	  .data = &shikra_iqs_lt9611uxd_priv_data },
>   	{ .compatible = "qcom,sm8450-sndcard", .data = &sm8450_priv_data },

Nit: please keep the compatible list sorted alphabetically.

Thanks
Ajay Kumar Nandam

>   	{ .compatible = "qcom,sm8475-sndcard", .data = &sm8475_priv_data },
>   	{ .compatible = "qcom,sm8550-sndcard", .data = &sm8550_priv_data },

