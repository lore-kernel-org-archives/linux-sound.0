Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795508755;
	b=chPttJpLBL7r7X3q8ei5ypKQ2bIDkE6qNLCwd2omzSoQKbvtfi/waAJ1w/3+FkmcJPQg
	 fsZI4+r3s5tq7T7UuS8Ug/a8YQGn4K5XiCPrA/0J38EIVGQMHiq6rVPCMGOg6NAftc88L
	 aa8Cbn/Aci5kO9OMQuFN85pa57QqXkPmGw7SM5QhS+tlgYY5VKJlhCH5wO5/jtyOiTche
	 B/cJ0RkzsnitWDIn0323AmI7TTcN7fEW5bSqwXEYxv6yLKHYXtKWGYZChtXhTVAyHCCsw
	 DbDY6R8nguet7AmY/786ZhtFKy/4LGxoXRgyvAMuluoPNj/6XstATqTmSMLHrH9n92Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795508755;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CCEmSfJwCaNOoRbQ5GYphEUxAwNcUzHWoWJbLEdk9Tc=;
	b=hb/VudAWR65Bs11gtd/uG+MAkxstVOg3CSi0bxpPejZdkYCZmqdcpgv6t7HApZmZkKC2
	 +5oSikzewNjHmI2Eg/Qasu35uw3pjqKuSxsoOp2cr5OQmZhyZhCrirwwgYGWlU/YOw8nO
	 9XdLN2bovPqKH3jWeywxk2Q2Wzx+hh5dWDLFJiUosJLLiA2BN3GFidtXwrX9SrtC+MeVP
	 3jj2KJ45p2jnQG1vc4uPs6DD3ULkmtWizNdTKxTe5y9kPV9jTSSB/o8ipbzDX2yJXrM5m
	 qQHdpytO+Pk2ihfz8NstREbAhhZWCKbSi6nNL8+wEUbxDrO5bxFaKLWFmblWQxsjgGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oNZA+q8f;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GCw7tqzg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC731606A31E
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 08:25:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC731606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oNZA+q8f;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GCw7tqzg
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2k4UT4129094
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 08:25:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CCEmSfJwCaNOoRbQ5GYphEUxAwNcUzHWoWJbLEdk9Tc=; b=oNZA+q8fXJTa2NPb
	azkxlMkxsljvJPWDCOZUMq+Az1tLG6C9fN1uq02ZcgFlMkUYp9YNLe8P2S9OkVrn
	Esi9uE3+NBTpMPxqLCEpq/JOswyVRDWZaJaMuUmGShcRxozs7tqhGQmhXP4quTH6
	+KtVUSyUEdm2aa23c678MTB1646te/3JiIZmdHtghVKYEI9JMm0xRk4QND6EvXaP
	SBA+E3OScVz/QIUNW2mTGc1xu0XCZkTvEPbT9FYLAYq3P3rtFTi6hxQaaIkQes6Y
	lUyslgFa4WvQ5kvSmPwp2vpiXwdLXiKGF+YeNQLi2U5dbKfvdxZw202GolOFvZK2
	D0/wHA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yyt1mh5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 08:25:53 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3854627c1c8so6307126eec.1
        for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 00:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795508753; x=1796113553; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CCEmSfJwCaNOoRbQ5GYphEUxAwNcUzHWoWJbLEdk9Tc=;
        b=GCw7tqzgJiE9DuLZSN5Vhpps1euwcQhpyuv+EKoDbfg+cU2/SpQ7lfsFp/LufJQKCs
         lUfepUyJF4Nc15dUKi+NXKWUxTLZje6uBIy/QbUHkZPdy2O3YFfNSC5IUj81q1+3VQRQ
         bdyEnx8hrZWywulAx2U31P3qZsrYFKlum3CLMa9xL2b2scCKh+34i1ebcGrRJOhXgxwh
         e5hfF5Lu4Y7l4SpLvWUujEzPqO5KMiZc0taVJCvfu+SXP9SYdzITxIiWPlcwZSqoU0Nv
         YYf/I7EsZCerfX+40gHx9jFYQQOevveIafvENTq9NhuVXfbT8CGqUG3edb9YjVn33y+N
         j+sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795508753; x=1796113553;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CCEmSfJwCaNOoRbQ5GYphEUxAwNcUzHWoWJbLEdk9Tc=;
        b=1Nn9NRY5hrlvezoECI55x0zDfQzCK+muEKoZ8uY8VAMeB31SwNG5Y4gi3xDHQ0bEOg
         dCaFtNMQWDf0Ow6u/XWDL3OaRQ10au0vHkmPTVhsslsERgCxcpAk+A0YwJ9gM2HLr6Si
         1adaN/g6PHSJcg+WYDSXPX4P7kX85KlBILA+lhWKJ+6qBaoJJLNXrkQlqBQuzFjnr1EY
         x5SsgOyzaBLRFKnJvleF7nnO+YO/w/BYXgJl44O6WXccWImiwHX+ATjaSdTNndpAeM4i
         1IcIKn8Nw2vlV98GgCPAWHu4eVdYWyiQAwFNsKxj49jciluvktSJd/OBrjrknKPXem5R
         Fkrg==
X-Gm-Message-State: APuU4Z+8ibNcnBNzPPiXOGMGTheKb9pTVcs+J95dQMjgfa8p1DsKN/9F
	YUYArzSVGsgZwIGddtg1m3oQAli6J5GTn2vc9Y0hr7lYgG2/AiBLMP5P6gvj9LzxrpecyzeRoCG
	YSAQ+0Jz7P/M/pvf+qDpY85EbDBf00BsNeetJFQmb3tRCSpYvqkx9gRN9xm/jJVPWLYKhaxT3cQ
	==
X-Gm-Gg: AZFdTZfBqfTCB3b1YRAnfDJn3/QKnAUjTprFFND7nPXQqPWOZe6OAinrg7AtetwL1lC
	J+UcLCDVapkryZ9DC8VUVLH9CPggVBktiN64iioZg+negOEGxhq0iZCavu1usKIBefuxEhOgC72
	km1vJmJAtQogPGP8EaDTSCs3gi8gMaeB4JSUB7cP45Uo18z6pcgHBHqga4/yC39dpi9uPkrP8cz
	j/JfPJ8nODL+IGBT2u5fYO0smanwsB2GNMzofWfFrZaEIN7jYMdflLlo3Z2nnbsOPiKH2gOdif0
	Uun1QMZD0uiG1HGfWBhhtvPboVQwvoleWzHUUubq3nJvOVA+Prsy+/UvvYF/lWNt41QcBQ5v0nx
	rVYt0VGmYkHYL734e90Xc1wTd529ImBCQEgjjwZv4xCma5TeuZlQStVV7DcbzXmvGH5i4YU3hN/
	3sv9vMPJPbUjAi
X-Received: by 2002:a05:693c:37c8:b0:386:a0d1:1b41 with SMTP id 5a478bee46e88-386a0d136aemr14448008eec.34.1795508753140;
        Tue, 24 Nov 2026 00:25:53 -0800 (PST)
X-Received: by 2002:a05:693c:37c8:b0:386:a0d1:1b41 with SMTP id 5a478bee46e88-386a0d136aemr14447980eec.34.1795508752512;
        Tue, 24 Nov 2026 00:25:52 -0800 (PST)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7fc3sm37866957eec.8.2026.11.24.00.25.51
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 00:25:52 -0800 (PST)
Message-ID: <b15a6000-5c65-47b9-a26c-fed54a14c1c5@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 13:55:49 +0530
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
Subject: Re: [PATCH v1 1/2] ASoC: qcom: sc8280xp: add support for monaco-draco
To: linux-sound@vger.kernel.org
References: <20261123073459.2361169-1-karthik.s@oss.qualcomm.com>
 <20261123073459.2361169-2-karthik.s@oss.qualcomm.com>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <20261123073459.2361169-2-karthik.s@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzMiBTYWx0ZWRfX1OmF7NeSHCYx
 dXHKwPvHNEgq1qXVBWnl036Q8lkygs9iamVWE3OVBjy1T/uI+MiEm65eb4Fs5IxKtFx72zqA8zn
 W3Xd8gpCIdqfmFbx5j4H4UuqZENPm04=
X-Proofpoint-GUID: 80Hm8KxRPJJi1K3zPkzM3ynk6bDHNv7u
X-Proofpoint-ORIG-GUID: 80Hm8KxRPJJi1K3zPkzM3ynk6bDHNv7u
X-Authority-Analysis: v=2.4 cv=W9OtxhWk c=1 sm=1 tr=0 ts=6b054a11 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=zYGhswiE34W4Y21q3IsA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzMiBTYWx0ZWRfX5SMAFFTbTaYH
 IaIRcLOj6k4r0hAOCpz/owV7riXZxfYeBVCc509wvk8/M6x+Yrr6ogPUAecGPUa4bt/SjT9juun
 SEPrWe2CEztA3Clc2c5wv8J2o7K2AHuWABOhm2pTiXiGBMYD+393BJdiqsH1g811ZiIsORlUZ9e
 8M/BIdv2GoV5FCNE3XqeWltcsOf8LzdtrDqxr73sO5CU6WM/o3C1M0mgGqTiGaNbVKu3adLzuVl
 RRY0x5/awIio7yMI7Jp1F0kb1sPFwynskIdUFvu09LyfHgpew7fVnu20DsUjtf5poUjIwxVqcen
 VgKR8eljO5lEIxGdC29696i1Q1NRa7DKcEMbBDxgaPFDqn4oPztipp2wQzAmoepUelhFdJC6ABA
 TTuW3MEHuzy9+DJh1+xcWhBvYTrDP/PxNb9q2ceHbIs2kPIGjNtVz4VLcLdau4z4GsljFiDaKBB
 y5ARYzj099JT3iktiNg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240032



On 11/23/2026 1:04 PM, Karthik S wrote:
> add machine driver support for monaco-draco platform
> which includes routes for playback and capture over
> max98091 and capture over va_macro Codec DMA.
> 
> Signed-off-by: Karthik S <karthik.s@oss.qualcomm.com>
> ---
>   sound/soc/qcom/sc8280xp.c | 38 +++++++++++++++++++++++++++++++++++++-
>   1 file changed, 37 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index e136407c56bf..2b1804f3870c 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -44,8 +44,9 @@ static struct snd_soc_dapm_widget sc8280xp_dapm_widgets[] = {
>   
>   static const struct snd_kcontrol_new max98090_controls[] = {
>   	SOC_DAPM_PIN_SWITCH("Headset Mic12"),
> -	SOC_DAPM_PIN_SWITCH("Headphone"),
> +	SOC_DAPM_PIN_SWITCH("Headset Mic34"),
>   	SOC_DAPM_PIN_SWITCH("Headset Mic56"),
> +	SOC_DAPM_PIN_SWITCH("Headphone"),
>   	SOC_DAPM_PIN_SWITCH("Speaker"),
>   	SOC_DAPM_PIN_SWITCH("Receiver"),
>   	SOC_DAPM_PIN_SWITCH("Int Mic"),
> @@ -56,12 +57,34 @@ static const struct snd_soc_dapm_widget max98090_dapm_widgets[] = {
>   	SND_SOC_DAPM_MIC("Mic Jack", NULL),
>   	SND_SOC_DAPM_HP("Headphone", NULL),
>   	SND_SOC_DAPM_MIC("Headset Mic12", NULL),
> +	SND_SOC_DAPM_MIC("Headset Mic34", NULL),
>   	SND_SOC_DAPM_MIC("Headset Mic56", NULL),
>   	SND_SOC_DAPM_MIC("Int Mic", NULL),
>   	SND_SOC_DAPM_SPK("Receiver", NULL),
>   	SND_SOC_DAPM_SPK("Speaker", NULL),
>   };
>   
> +static const struct snd_soc_dapm_route draco_monaco_dapm_routes[] = {

Move the audio routes to the Device Tree.

Best Regards,
Rafi.

> +	{"IN12", NULL, "Headset Mic12"},
> +	{"Headset Mic12", NULL, "MICBIAS"},
> +	{"IN34", NULL, "Headset Mic34"},
> +	{"Headset Mic34", NULL, "MICBIAS"},
> +	{"IN56", NULL, "Headset Mic56"},
> +	{"Headset Mic56", NULL, "MICBIAS"},
> +	{"Headphone", NULL, "HPL"},
> +	{"Headphone", NULL, "HPR"},
> +	{"Receiver", NULL, "RCVL"},
> +	{"Receiver", NULL, "RCVR"},
> +	{"Speaker", NULL, "SPKL"},
> +	{"Speaker", NULL, "SPKR"},
> +	{"VA DMIC0", NULL, "vdd-micb"},
> +	{"VA DMIC1", NULL, "vdd-micb"},
> +	{"VA DMIC2", NULL, "vdd-micb"},
> +	{"VA DMIC3", NULL, "vdd-micb"},
> +	{"VA DMIC4", NULL, "vdd-micb"},
> +	{"VA DMIC5", NULL, "vdd-micb"},
> +};
> +
>   enum sc8280xp_jack_setup {
>   	SC8280XP_JACK_SETUP_NONE,
>   	SC8280XP_JACK_SETUP_CODEC,
> @@ -617,6 +640,18 @@ static const struct qcom_snd_soc_common qcs9100_priv_data = {
>   	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
>   };
>   
> +static const struct qcom_snd_soc_common draco_monaco_priv_data = {
> +	.driver_name = "qcs8300",
> +	.dapm_widgets = max98090_dapm_widgets,
> +	.num_dapm_widgets = ARRAY_SIZE(max98090_dapm_widgets),
> +	.dapm_routes = draco_monaco_dapm_routes,
> +	.num_dapm_routes = ARRAY_SIZE(draco_monaco_dapm_routes),
> +	.controls = max98090_controls,
> +	.num_controls = ARRAY_SIZE(max98090_controls),
> +	.codec_dai_fmt = SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_BC_FC,
> +	.codec_sysclk_set = true,
> +};
> +
>   static const struct qcom_snd_soc_common qcs615_priv_data = {
>   	.driver_name = "qcs615",
>   	.dapm_widgets = sc8280xp_dapm_widgets,
> @@ -742,6 +777,7 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
>   	{ .compatible = "qcom,qcs6490-rb3gen2-sndcard", .data = &qcs6490_priv_data },
>   	{ .compatible = "thundercomm,qcs6490-rubikpi3-sndcard", .data = &rubikpi3_priv_data },
>   	{ .compatible = "qcom,qcs8275-sndcard", .data = &qcs8275_priv_data },
> +	{ .compatible = "qcom,qcs8300-draco-sndcard", .data = &draco_monaco_priv_data },
>   	{ .compatible = "qcom,qcs9075-sndcard", .data = &qcs9100_priv_data },
>   	{ .compatible = "qcom,qcs9100-sndcard", .data = &qcs9100_priv_data },
>   	{ .compatible = "qcom,sc8280xp-sndcard", .data = &sc8280xp_priv_data },

