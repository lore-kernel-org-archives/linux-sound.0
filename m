Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793191779;
	b=fqT1dEhmTfDzev5TlwT8cVxDdQPAdRG0YQXtYHnQwHFbSCNcf348pIpGVf1YHY0+bDAA
	 duLgP0uqLrA/FM8LOVPPQL74pfEMomrSbrFZ2jTk0666unAujrGH+HQ62crdtjLpL/A5Y
	 VREexSJL5wKAf1HAP3Ne5cD22IMtplMO+cuIX3XdI3uh+Bk21LtE7lqweIwng3jJqyOJG
	 aEHSTHo7fUD1kNlKKdrUng1+58Lwi/4BxoRkTUVo5yU9HGICcXDbokPJpkhEyRtKd2OFp
	 lAhbhmSkzh9NvIjoSQGLak++/ry5emSuwCh2EEsio2X2+SKITEDSJjqwF6mZpiv8Dig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793191779;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rBxRy5SG66MmScsYDuUj/ykuDA1OANRhOsY43nPww/8=;
	b=XAwof5CHtGSF9aRNX0GMPdwL2iEnV5RrzgA9DEaIpbRKZEVz/NlL/n3N3rA6dwHF3WQw
	 GfmOh/Q0vTzDJ+ZyXC/YTWkHQ+0URbHw7X8i1LbZVX4UNzC+abx0SUgxLGuzpjmqP9AEx
	 TNPrYafWyUeSKDzQI8FKz/wduZgcQeCGrdZS99cIqFxKCZmKuewYhg44LzD/n2ZY8BOkJ
	 9EF/hD4GMYtO407jWVhSXnHB7NihPmwV1d8j8R8up0pNpqrvlJu5rUr75UMPQt3USNDs5
	 tPr9e6ibW/UUS3JqqCEvjYIv1rXp7xUVAkeBI0EvKUeyYZGPfx6gQoj5lhF3SXbhVWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kGcGygIb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iL22LZ4j;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76957606A31D
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 12:49:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76957606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kGcGygIb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iL22LZ4j
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe9uS994831
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 12:49:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rBxRy5SG66MmScsYDuUj/ykuDA1OANRhOsY43nPww/8=; b=kGcGygIba6OVMRxE
	/L4EQh1pss1+HCJmr6bFeuZrBp0KPi9d8ZCiWo2EnnbCgC863kY29hhjZGFy8wuB
	gljCm76hohmROgJTbQz1dmhtOpxCiCd9JRfP8CxiS/ruADla1YUKIuXMMxmKMXuD
	E2KdVRSrTocxh6Uc//aSyxDLFQ9gaJNSUZQPuIcyOiCrei52HoUhYzPItn5dtLix
	QTw8nz1uRyXkLyLJrbqKk0dlrpH3DZ56K0NamXVNql/oAvm7nzvlt7u/ulbjFB0r
	6sbkh6NdLyA6ASFXHX2BKXFh9H5gFtITLQcQUl5SDLwag9+qDUXLcMQwaSfTXC5N
	3ZD/pQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk82tt3sd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 12:49:37 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36a1e2485fdso2208500eec.1
        for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 05:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793191776; x=1793796576; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rBxRy5SG66MmScsYDuUj/ykuDA1OANRhOsY43nPww/8=;
        b=iL22LZ4jsIptRWNCO+1/ywPtlBXRsWgAWqMpS5PhtbSP4E5o4COnIbOKeVqxrG9e9D
         AAldAkT5l0FtRtiFgGHzQ8oI5yt2wcMKg+2yzbGFVXU3iUTPk6XGjEnEurtB77rv7gNY
         /iynt45QqwRUx+cq4r9Gh09qntVE/wSW9mZ3R+3xHgMS/0D82JwsLxIXsHY2FipeJFvJ
         cmEgSzUtmFodXflxhVmAj7aloIhD5KI+VQSRX3+Xqy1Hn4dQTdvTdvJCoc7qPMjeyZpP
         dOq96ddMobmZScCZE0QgUj5V8yisHtIfC6OWG9aohKM4yJT34fuk5xqAIxuQScz4eHjV
         2Fww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793191776; x=1793796576;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rBxRy5SG66MmScsYDuUj/ykuDA1OANRhOsY43nPww/8=;
        b=P6DTg3nlHmQEtK/3XhQOaFJ3sZZGe/1nlI2ZD7eZilGguqhrfnjN5K09IY42iMKQpZ
         Uzpv02B/hCz7mxgxS1nYjn6loBVKdJkRU/uqJ5dwHBzruMkvraO8l6IYNmZkFrmD2RhN
         Ry71W6u9wQQDUrmpJ9D8yshbbogun65V+D/eIZO3g6vKwqYM7Lv5j6dttPxGPgX0jlU3
         3kafqEFnncIoolGmB9KfOIW8NLXathGx4rp4EIO6IRwGACPMyTrAUaWG9cb7uBUPoY+U
         S2lh1l89E/62+CZ1qxBwEtvZRP/c53lBghJwKNh1+9RRfCCZ+4o/h/ahxCthg+cXSNLS
         4Oog==
X-Forwarded-Encrypted: i=1; AKwUvByjX+DR2s/HxoS3f+owxCpXYsNu1rZJ6zOLWA3lWzYlHPey/lUAsjxY4JSHEa/bOHPQe7kFtmQjyDW0Gg==@vger.kernel.org
X-Gm-Message-State: AFq9FYL7Djw9EBqWNGMkimOzKvTmyv3BZopFz11/aTk6MMbkRFSHzYPs
	Mr6xCdsEYG9o2sC4KSoVRYwaNV8ZkynGCnJL+ZmXuC3t0R1OqzxCh48oJpzZL3acvMl2bqtW8q9
	MQF4rpfqYUM8evt95MohQ3KFQYi9457/L6CSNt9QGUTaLR/QcHxnLkfoAihplboC0Fw==
X-Gm-Gg: AYBFou2TwnLkaMMdPddFYB5nJHuh0XtFWuApgqrGPgbGHa8BVXdNFX5fvgildjApd3z
	xAzz4PzkwR1l5eQk+v/D/TObc22MM544U47Ixse/kkxeIR3sBm9RKZbYOvKnD3PJDOAH3YWAQq/
	GdTPBscgy6MbORtizEpSXshHEOoo789I0+5LF5kRqDcjnFNreP+WsO8EWbVuUfPCpDeOjjigM2d
	8UoTxiRi+IcVqKU2SLXr+bB4PXkqjPZdxxT96r6BnB/jg16v08yjrI4OOwNp6ABX13xBZraLqkO
	sMTViWMoNULPfsXd4i+h/xD1Juvf1hm0DR3KBE7kbkKQipB+jwYZCxsDCVpsN7Mw6e8UQbWyu3Q
	DWzkZ5bKOLlMJsqEcK2ef4Pk7hI5rAfKXdYiX7zJwQa0noKTpASWo7aaam+3nS4zUt+PKnvKfiK
	qswkDZKtq3
X-Received: by 2002:a05:7300:e9c4:20b0:36a:13e1:c889 with SMTP id 5a478bee46e88-36a20427d57mr3806622eec.36.1793191776299;
        Wed, 28 Oct 2026 05:49:36 -0700 (PDT)
X-Received: by 2002:a05:7300:e9c4:20b0:36a:13e1:c889 with SMTP id 5a478bee46e88-36a20427d57mr3806595eec.36.1793191775704;
        Wed, 28 Oct 2026 05:49:35 -0700 (PDT)
Received: from [192.168.0.104] ([124.123.197.72])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a238dc80dsm7401232eec.9.2026.10.28.05.49.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 05:49:35 -0700 (PDT)
Message-ID: <c64d095a-d725-477f-8421-14cc74dd0a09@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 18:19:29 +0530
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
Subject: Re: [PATCH v2 5/5] ASoC: qcom: sc8280xp: Add shikra-iqs-evk
 compatible support
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260910-shikra-machine-v2-v2-0-9bf6bad589d8@oss.qualcomm.com>
 <20260910-shikra-machine-v2-v2-5-9bf6bad589d8@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20260910-shikra-machine-v2-v2-5-9bf6bad589d8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: QQvmncWbN6JBOaaBtleSZtJarrJ1YZ0x
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MCBTYWx0ZWRfX2nxWvisxovs+
 +ZCpBgpGjTWpxw/YcFtp+frXzVUCQ1MAwj0RVJuuC1EBfu+MAzOKeDSgaaMFCZNuKQodlDQDy4v
 GRrYvBvwEJtiW1V7Uj9IYaz18vwcxvo=
X-Authority-Analysis: v=2.4 cv=Tr1zFzXh c=1 sm=1 tr=0 ts=6ae1ef61 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ud/Gc3SFmwde3Mv7YyqU3w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=Udm-XXnTmhyVqvlFBioA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: QQvmncWbN6JBOaaBtleSZtJarrJ1YZ0x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MCBTYWx0ZWRfX4QCbrjp4E2ye
 1ZWJQmOlW0vpgGW7DsOpmpH4YTUJYj4M5u4Gwlqb2SYcGaOqt9DiSS08ZAJzmRkgdOlqzs5fsA/
 GGXa1EHlb5sHTcyDCtqwA85tkFAbXvWMivsHDHguUmvq4BbaJLi13uJAvyQCyyJ2iQiUSrYWo6e
 WVnczmZawaTsjHfSewPvW9qAKCgbOb7ucpUcfhc/qjaWmjFBvYFzN3gtO1oPHPsZbnY7YHYUY1j
 b94fIYzJZpe/ycw+hyIQAkdj1lfAToOcNRlqypHeCShzIOOinYxg/Gqwg88z4zoR+A0QqiqYvUi
 A3ibolf8sHH20nSR68QvoPb+uVSf3NvEMQO9H6lTcMnfVOj96PZXqWHa6ROgpHvyyhOe/C3JSfl
 Ekb9y+hD/17OA6WR47bjvVF2THMNytyfmZvI6Xyz54r5ZHK1qMmu9dY/v6gvucM0pCc8s8RtzhB
 kfvt5rIcB5z4JFtNEtA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280050

>   
> +static const struct snd_soc_dapm_widget shikra_iqs_dapm_widgets[] = {
> +	SND_SOC_DAPM_HP("Headphone", NULL),
> +	SND_SOC_DAPM_MIC("Headset Mic", NULL),
> +	SND_SOC_DAPM_MIC("Int Mic", NULL),
> +	SND_SOC_DAPM_SPK("Speaker", NULL),
> +};
> +
> +static const struct snd_kcontrol_new shikra_iqs_controls[] = {
> +	SOC_DAPM_PIN_SWITCH("Headset Mic"),
> +	SOC_DAPM_PIN_SWITCH("Headphone"),
> +	SOC_DAPM_PIN_SWITCH("Int Mic"),
> +	SOC_DAPM_PIN_SWITCH("Speaker"),
> +};
> +
>   struct qcom_snd_soc_common {
>   	const char *driver_name;
>   	const struct snd_soc_dapm_widget *dapm_widgets;
> @@ -543,6 +557,19 @@ static const struct qcom_snd_soc_common shikra_cqs_priv_data = {
>   	.codec_sysclk_set = true,
>   };
>   
> +static const struct qcom_snd_soc_common shikra_iqs_priv_data = {
> +	.driver_name = "shikra",
> +	.dapm_widgets = shikra_iqs_dapm_widgets,
> +	.num_dapm_widgets = ARRAY_SIZE(shikra_iqs_dapm_widgets),
> +	.controls = shikra_iqs_controls,
> +	.num_controls = ARRAY_SIZE(shikra_iqs_controls),
> +	.codec_dai_fmt = SND_SOC_DAIFMT_CBP_CFP |
> +			 SND_SOC_DAIFMT_NB_NF |
> +			 SND_SOC_DAIFMT_I2S,


With cpu_dai_fmt unset, the CPU DAI falls back to SND_SOC_DAIFMT_BP_FP, while codec_dai_fmt configures the codec as SND_SOC_DAIFMT_CBP_CFP.

Wouldn't this configure both sides as clock providers? Which side is intended to provide BCLK/FSYNC on IQS?

Thanks,
Prasad

> +	.codec_sysclk_set = true,
> +	.mi2s_bclk_enable = true,
> +};
> +
>   static const struct qcom_snd_soc_common sm8450_priv_data = {
>   	.driver_name = "sm8450",
>   	.dapm_widgets = sc8280xp_dapm_widgets,
> @@ -611,6 +638,7 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
>   	{ .compatible = "qcom,sc8280xp-sndcard", .data = &sc8280xp_priv_data },
>   	{ .compatible = "qcom,shikra-cqm-sndcard", .data = &shikra_cqm_priv_data },
>   	{ .compatible = "qcom,shikra-cqs-sndcard", .data = &shikra_cqs_priv_data },
> +	{ .compatible = "qcom,shikra-iqs-sndcard", .data = &shikra_iqs_priv_data },
>   	{ .compatible = "qcom,sm8450-sndcard", .data = &sm8450_priv_data },
>   	{ .compatible = "qcom,sm8475-sndcard", .data = &sm8475_priv_data },
>   	{ .compatible = "qcom,sm8550-sndcard", .data = &sm8550_priv_data },
>
