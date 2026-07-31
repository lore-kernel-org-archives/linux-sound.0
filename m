Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1643469FC
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 06:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785480398; cv=none; b=JBdbDEUOB1rI5kUhs1fqrJcHPzPYfcpAOhdBEcBQeV9N1hiAQEMLLpcf/Nu4UpDOTTSPDWl1/owmFpb9Yxg2+NHII7fmLqFvmJx5GSg2tAnIgFthuY3UZXONE7WqbVsncGY1UjGYr57SULgEziajb1teZPWJpzwAlDWsfD4wORs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785480398; c=relaxed/simple;
	bh=ubQZpwX6MN713NaFuM0ZgivNDMCQILkt19Tn9nXCg0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GnGqGCeX6fOBmIZTdMH0o+k9sPq2IOLFr/FDyTYC+AyXkdoN8IU00P0XTYLEqfuWKX4H9Uu5eXJvTBzNJ6q/xhoNznT4GtyNocNHpXJ83gtKG2vzeq33zDsQm5mFB855Bj/+UYCgxxZYQoLUvTn+lCQM2c/9rxMZkYPiENEJNXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pZUFZDDg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bv/rVttr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pZUFZDDg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bv/rVttr"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V69KlF3161904
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 06:46:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eL9Q91zHjUvVqHl/f6Mp19GgzqRDdTiEyNxa24aO6Cc=; b=pZUFZDDgJRuFM+ib
	lOoaczhESiu4hPpJ/R2CSzKcwBaIGp+4ZO6q6Wd6YKVVSvRAPEcYOqp/augTKOhX
	VSy9WVGAOTDk36TQQtmzcZym2NMF0GMTy9/qEoTkjXMA3mS5BsP1RQfZ9z3T8ce5
	jZSI2gMNDf/kYbfzvw5AbiKwGt+fdKIh1s0nw/1DeZXzXoU5GLyhMxNwbJ1dUnXu
	rsoAn9675Nx2fiYmLHf9l9ojqsBdxTGz5qgwJZJJm9Hl/FfwbDyHbbmGp4Hf1A/3
	VWEayHHVgmCI3OzX6w9mNY3xuA28CvXFR9gJp0SD+rO8ZEn1yiwziGBkf0kEmQZq
	JUmWsg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frp6k84vg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 06:46:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e538afe65so68263985a.3
        for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 23:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785480394; x=1786085194; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eL9Q91zHjUvVqHl/f6Mp19GgzqRDdTiEyNxa24aO6Cc=;
        b=bv/rVttrKO2WjQ0zpdYJ4R1O8uhlfgr0qZCLQhQO7Zswd45N0KR77TPwrjAete8hl3
         shbKxLKD0fstn6ZdI6+EAY/TMF1fXINvWFNNHWMDh4BEM9J381WOrBJc2GiGK4fpQPWf
         /sRws7rvrjDUglIFP58ndzqUxfCnylbthpyrYJrG6TDXJePJFjQmiOP0YX+HGPecgYrb
         r706iKYlVyGdeTgTN9WBvEymdikQrgaqw2fogiM4UxLK7Zp06nid9uS+EX+5gh9wiRd8
         Sjepm6LfX+nfQCnKDUHp8q/NOxQ4ds6Syh/HipzP+x5EJX9/MPN2BVXC6s70n1a153Lz
         b4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785480394; x=1786085194;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eL9Q91zHjUvVqHl/f6Mp19GgzqRDdTiEyNxa24aO6Cc=;
        b=XECbpuz9BmM+HesnvcCMX0zM+bmS5Q6IzAIMWqApR0QQhhqhy1+KOMPVv4gZbc7ZiY
         vyGtv/oyc6vrszcRMSQIBcv5Eh3u24YRoETJ+DSBLRUjDydQqh4J+A6Atr5bm9iCRqqc
         QC6XoiBLgrhyrq2I0oRABTmqtnD+M1REA+4qJ+y04RSDS7D6tGJUGniUD+ZgizE1sP42
         aO2MnfvA6ZjTQY77DNvYxbSfYUewAuMD0Bm5dmUE5LqKEeISiVPPb8HpfdSfxJ7jDTVn
         R+GEVZ/9bl5MDnYL66ibiSMcYzwZoq7H5cefKY7TBYr6BSy1tqa5Fng4DM2ko+HvHba/
         bN7g==
X-Forwarded-Encrypted: i=1; AHgh+RqFMUPblecxckjmKvI43t4gK/i0bLGr5gQB8m7Uhr+qEPK7n+2sOiwAToDDm75CqNJ/A//efAminlpDCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLGt5eLG21z1fUUgRpBekSUILnC1jTH8xT9O9MEpakbsqAhHdh
	rrW1DeE7mVRaUneDYt90Bc+e7nc44iLLQkUoZZJXF6EgsZ9SFlEaE4JgSYDwNmfl5W0LNZPXty5
	h4d0vSo58SuI7XGyXvN+KT8ayAPe3/ZC0xbhvVoH1ZybaUoOjx+eGUJZTxyNcn2LXlA==
X-Gm-Gg: AR+sD11Vib0T9YiHdCw8mzOWsq3BC0XafzEoTssIFa3kMdyKiIE6Ug83wbHWdZ7I6jN
	utg8kbFExC+qVMT/cuiU9K528oJB5WX5BEk8he0DKw3iCp5Qqii1xbiObJ1bwL8/XVH987Yqysm
	n58oZIXQa719GVc4j6tiuKnhYWk6VrYrZ4AP/1R8W7NL28hAtLXlH/zr+1FPHa8zXkPRp80OYf/
	wQR19LAZBwdn5jqFIR77Ss9xX27ZQSjaptWCy/hEucgnqrLsaGDWzNOfJ7/vY/KC/9nsbnk5Lnp
	3YXyFEkSsXCxiRMy0qB1bazzSjFQhOhY+MHKGRKQPJ90dpABmWOu1cInusHHpGkglcVfyhwMx43
	jOcfuTlpoxERjD4gHCYiP/0gDZsA=
X-Received: by 2002:a05:622a:4b17:b0:516:d955:ea6 with SMTP id d75a77b69052e-52b4afe0afemr8922471cf.14.1785480394210;
        Thu, 30 Jul 2026 23:46:34 -0700 (PDT)
X-Received: by 2002:a05:622a:4b17:b0:516:d955:ea6 with SMTP id d75a77b69052e-52b4afe0afemr8921991cf.14.1785480393615;
        Thu, 30 Jul 2026 23:46:33 -0700 (PDT)
Received: from [192.168.68.104] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c1fd3c90f38sm36886166b.17.2026.07.30.23.46.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 23:46:32 -0700 (PDT)
Message-ID: <60d72f9f-3768-4e2d-9fad-adbb71214abf@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 07:46:31 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/15] ASoC: qcom: sm8250: add support for
 LPI_MI2S_RX_0 and LPI_MI2S_TX_3
To: Richard Acayan <mailingradian@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Konrad Dybcio <konradybcio@kernel.org>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
        Adam Skladowski <a39.skl@gmail.com>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Johan Hovold <johan@kernel.org>, Kees Cook <kees@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <20260730174353.108023-1-mailingradian@gmail.com>
 <20260730174353.108023-12-mailingradian@gmail.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260730174353.108023-12-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H/nrBeYi c=1 sm=1 tr=0 ts=6a6c44ca cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=gjZ7DTAbrms9DNMwUrcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: a6r1wzsWYNz-P71-CefK84eUGSfi2Pn2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA0NSBTYWx0ZWRfXyF+pnpBcorLl
 2zUnwrridjn3un7/d3zqEWTFxlQBpqVcyPrz6++ibozG1Clqip/+mwqPpiLWiL+QrW36us7G8sk
 FILqs7vR81+Rxdv7jJheMZ3yjpR8usLGcWY42P47Ca3EUGl0alPmykFPybhZaELz7IvvEqyu1Es
 YNway26XhsCkbNkqQhodrjx0Ky9V/X5+UkG2Ut69gtcgiCPxXcYTYj9N91r8VLZtbOEN9MWyODX
 fLIB7owg/0ODbG4B7/5czzQOrzL/MEemefaiUt1omkoMSr1BeerOXYBUUJlw0HWRfORsTbxw/ef
 YNg5G+cw36gjr3W9c/kKb23WKbscoiGJu/waA2FD0+wsN0A5h+XF9YkpTm64/DHlMigA073vRRO
 P0m0aAqMMjqcthw0I+A0tv3+ZkEid4W7MJ9UBhd8+asycL0KjN5FBfvP/Es0MsLehlKXTf3Wdy4
 JfRWUO3grTNF8B/cblg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA0NSBTYWx0ZWRfXwqJPAWo5OpZ5
 1SBESL3WftdoPJhmmPvA5/gKsK7T19AW715hkucNFaaXSqLTlN7Z7+pe4r7ehtmjOgmEQNyEqvi
 F+dqYm4Ziu5LnLvFdOBeNPVVoiqy3Uk=
X-Proofpoint-ORIG-GUID: a6r1wzsWYNz-P71-CefK84eUGSfi2Pn2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310045



On 7/30/26 6:43 PM, Richard Acayan wrote:
> The LPI_MI2S_RX_0 and LPI_MI2S_TX_3 ports on SDM660 can be connected to
> the digital and analog WCD codecs. They can be supported with the same
> logic for other ports, but just need to be explicitly stated. Add
> support for these ports.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---


Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini
>  sound/soc/qcom/sm8250.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
> index f193d0ba63d0..1952c599e004 100644
> --- a/sound/soc/qcom/sm8250.c
> +++ b/sound/soc/qcom/sm8250.c
> @@ -112,6 +112,22 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
>  		snd_soc_dai_set_fmt(cpu_dai, fmt);
>  		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
>  		break;
> +	case LPI_MI2S_RX_0:
> +		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
> +		snd_soc_dai_set_sysclk(cpu_dai,
> +			Q6AFE_LPASS_CLK_ID_INT0_MI2S_IBIT,
> +			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
> +		snd_soc_dai_set_fmt(cpu_dai, fmt);
> +		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
> +		break;
> +	case LPI_MI2S_TX_3:
> +		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
> +		snd_soc_dai_set_sysclk(cpu_dai,
> +			Q6AFE_LPASS_CLK_ID_INT3_MI2S_IBIT,
> +			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_CAPTURE);
> +		snd_soc_dai_set_fmt(cpu_dai, fmt);
> +		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
> +		break;
>  	default:
>  		break;
>  	}

