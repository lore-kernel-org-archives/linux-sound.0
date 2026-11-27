Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769535;
	b=1S1QQ9No6kiUQFSKMBtcHaL3HvZpz+V8uLaxCr3liEcINuI6uNwb1zlgh07yIcEGY4qz
	 G5QYjPeA87FYp2ppm4OPj8TTQOXOo+wXZiY7fxhKCoulNNBNisthGdL79/8QavdnxqNJH
	 AznZYNOzxHgiioZd3Lv/Dsbk80AJMpRjXbpcjHggTjvHD+7bAPI8hnZOZetTDS7VWOsSK
	 p6KkgpMLCDd6mW0z24h1/0XpJH0iUGpQqIXqg5RgY64LAsSGOkdt+KVgddoyitGWfbElv
	 DJ4AFCP2ev92YnB9XxXnvHle5xnmcVM3GySEUZRwRfsK60rAk4JH2SB4YMpQ8sYkuGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769535;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bf7mXKMlC17WwCEUPjDtaWn5doXh6SdMr0C4yldwOlE=;
	b=jd5rhy/PBuFI+RewCCFDtlyAAkcv+EbUrNmlYhEBCh6IkoV1IchV7epm+9GceDsZzK70
	 O1vzuO38Mr3FhyZo21Yp7FnIAGMdgeked7tNZF1zDFAIwAQ9Y4wS027D9qnEy0CJqQ4AY
	 LCZCJq0JnTKOqpyBfV4Lz3v3QTiQ3ox+yoe9uHDA2Do1Hc/Q0wqjb/ENODXDCG2rKcB+F
	 OlpQ3LdSvOQJzkrq4+xGHGem+1ZjzadmnmMzWjoZ7sG0eQmmQWvJbJ3PQtdiDJUDoZr5w
	 uJL+0TrsSGPC5380R5YmlaogDYWq3yAsQX2J0ZAZLZJBIew6u3v/iH2nRa7OAc031Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fSjcd+rb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="ksvd/Mk+";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FAA4606A321
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 08:52:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FAA4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fSjcd+rb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ksvd/Mk+
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GeNI1475097
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 08:52:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bf7mXKMlC17WwCEUPjDtaWn5doXh6SdMr0C4yldwOlE=; b=fSjcd+rb/O9U4FCK
	0Wn0CsYWgmd1LO59RLxKF8jetafFya742j5JB1EG5PNImzpw74sYWSxEDWSFL3Nc
	MGcnYNTBr8J6zgRoGbAs4bE+dlRQQPncobYN+jt06VGyIDBG/7h+FCkL7F9uOtNt
	QXHDkWLxS4w9Qgp2cF0rz5fWoIL0IjVgRE60fxVEVuY4DfsgIjXsIToiiFYGDGq6
	9XfP/VY1dGo999gluq7nIt6izHPJwHHKgF6+P3UjYn84X3qhBJU+WMB7Okxm5EwN
	Se4F4Fmyy50HhrGMXZ+KXJx4vZgcFMMTG675slXQYbvFo1UhnpdMOI1BK4fkI32b
	BZAZRw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u4ht5qj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 08:52:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e92aad34aso1322738685a.0
        for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 00:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795769533; x=1796374333; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bf7mXKMlC17WwCEUPjDtaWn5doXh6SdMr0C4yldwOlE=;
        b=ksvd/Mk+UHfYQaLQb9m+tLIjBhnHRVQsnhCYRRmpY40qlwoFpgN7Iyg1ybwpCGdWtu
         2JEIvkc2hp38g9JMT80ymGBVZTyXOjjvBuAb+Te1Yp7JkT9KU9WhBBpwOVA9RtbZkg1R
         LUfwdjC5fjH0iZbRa2RVTV6ndF+CsV94VA6JNkXQObGiG5G5A2K6xhLS/6ZVpmpUASwN
         y1T0vOp/JzYXR1cNprMIieVxTj9DEukowsudhU2iC10i6ZrPpBEdDOTAyHoH3IrrXpVV
         1DUSZq0L8pFXiutwKGX+2hyrEddHEaL32nItatU092R6ofoZxqTOdldbVzra5Hcu4hAw
         xVKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769533; x=1796374333;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bf7mXKMlC17WwCEUPjDtaWn5doXh6SdMr0C4yldwOlE=;
        b=0KfA078dllIweRsPSA3E68PfaUJba3E4FrlFl+PjlnOnrgk6oY/hjlpI4Wxm3hl0Dp
         biGxcG2jjNExV4j6c51Nx6TgdbEUTfZU6b9+AMFskbUReroukV+SZnTTHM8cpkxpff8D
         J3x7QTmtJeS/N76zwQ8ZjYFbvaA4zYQi5N8EA13irC5Z7iF3VqU1/r25AYWjmdVAmeXt
         BWWKHFKIzF0TTUGqQrSyN0aWmO/liIZt43LTi+1KCwLIWJWE5KKvSqQvTRKSlX2UplQ4
         akPuVCtTWXd78kErx6OYYN2qWTDbGty7+4I9VERs2qkIMgz5ZqZQWl2XGSayNE3B6OCJ
         xh3Q==
X-Gm-Message-State: APuU4Z+4KZtdVg6v2mLuHrdkkZ31HfSAO5huCj1BYyA09Y9g/O2F8gNg
	TKqC+Ptyhy1bl+ZESWFoLo1qATVsOfI0/zx7exHvsPXWL8rXl93TfetXUv9I4aAF5PQwK3gLNT+
	1dDxUfNiJGBwLz2fDntZnh/C8qkM4VET3AiZIhHdTQNi2s5BYPpjxyMFhQyrTWiylHg==
X-Gm-Gg: AZFdTZfxohdNSLsVhSh2wHKtj1ynMvlAnOiaym9SF9a4zqWKXd2d/I9pbPUpYMaZDmm
	no2TwdiLIRHe59tYkYctr6+kXRR/1ntUUOHlMauPWPDXwWXBpIFHomYICYrgzyWH0MkS2JIAdxb
	sZvZQuFKz9NXxgz3ZdGJMuwrKn45ig2BCDU6NboPG7xD+Xhb718JzBpmq/r41USzkt8f+mQZ59e
	oIYlg2+9L02a75aA7HT3X9JOEtUo51QKV+BY+TtZfcklkm8Rg1x4twAYKcbMGOowdtAT5v/H65C
	mfiHJ0vJO1mSMOgY7WgysbhMuXWBlWvxGORE1PS2d1XHuiJqoJLxVZHumxtjHnMidNxlRZdwlr+
	xXr1Okti8xa/0vK3T0UfIB3p7PwBQwxKM5YAQP4SiTGPTxuEQsNIWlcDkLIpht/opYZpcYDUvBe
	cMhg==
X-Received: by 2002:a05:620a:2a12:b0:949:7497:7c1c with SMTP id af79cd13be357-949bab5ae05mr3991120785a.60.1795769533264;
        Fri, 27 Nov 2026 00:52:13 -0800 (PST)
X-Received: by 2002:a05:620a:2a12:b0:949:7497:7c1c with SMTP id af79cd13be357-949bab5ae05mr3991117785a.60.1795769532775;
        Fri, 27 Nov 2026 00:52:12 -0800 (PST)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4b34e9c3ffesm30247576f8f.19.2026.11.27.00.52.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 00:52:12 -0800 (PST)
Message-ID: <6211f2a2-f313-48cc-99c8-157a65736350@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 08:52:11 +0000
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
Subject: Re: [PATCH] ASoC: qcom: sm8250: Add SM8350 sound card
To: me@fromdisposition.org, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261127-sm8350-sndcard-v1-1-50cbf3db3cb0@fromdisposition.org>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261127-sm8350-sndcard-v1-1-50cbf3db3cb0@fromdisposition.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNSBTYWx0ZWRfX+VuxmdCzFgqB
 b9CgvfsvN54N1jYA25+COarc07sW6f4CCk5WsSqKqNKCiG7sxUks/MLdGDUp8vHdfGrW9+aFk1u
 qIn3hYE6o6dT+0AbQ47l8Mzj0TuJzH4=
X-Proofpoint-GUID: c1moIZ_yeNx4g_9StziMevxaOHCaYq1h
X-Proofpoint-ORIG-GUID: c1moIZ_yeNx4g_9StziMevxaOHCaYq1h
X-Authority-Analysis: v=2.4 cv=M9fYuCws c=1 sm=1 tr=0 ts=6b0944be cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=Tt5JBQAfAAAA:8 a=EUspDBNiAAAA:8 a=OV9TyUFxCiMX8QcW4tkA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=kpHMOrJS8sLNr5ru0mYA:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNSBTYWx0ZWRfXzliYFim3nVm7
 tgAuLEBsBKZ80ho6NJp4A0eo7WQjP2tGINwFJOlmwcrTGplofPA5BIyqI0rb2xvWO7KD2M9lo49
 u3iydV7JF5y5PRn2IzUIz2w3UeQ2hXXODjTOAG5GPw1j72OdMZIPPx5eh4TLxWv6YvB35jdPtIq
 yncMhJ+/xSnqjSQtThw0opi+89XPg6QgJeht3j9Af+0KNbr2jB2okpaxc5hN1oYZmxFKNt2jZ+X
 PW274DzRL98Tb6Kq3iTecuvFZPAs2jnCkZGHKOQwdtZ+feGgeIidX1q8NS/QQMUmRIN0WQG7GVO
 4TCWvU69CPSLLqZwxaECh4NlridkexlPOuf42KEyek1xj8pAB8J9ZB4MABwoZ2yx/6+2iEAS+73
 CxRhhtHIZ/X6Td6AmAasdUaA/zDZu8ECIICMB+e/QCs49uv9yK6I/vvtNV2AU5VfaLq//agGvia
 tNkZ/tU0sVsWflZLxNA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270035

On 11/27/26 12:49 AM, Demeter Barna via B4 Relay wrote:
> From: Demeter Barna <me@fromdisposition.org>
> 
> Give the SM8350 sound card its own driver name, so UCM files can tell
> it from SM8250.
> 
> Signed-off-by: Demeter Barna <me@fromdisposition.org>
> ---
> The qcom,sm8350-sndcard binding this matches is already in for-7.5
> (a5b5d062b40c).
> ---
>  sound/soc/qcom/sm8250.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
> index d0015e5f5..ba0aaf428 100644
> --- a/sound/soc/qcom/sm8250.c
> +++ b/sound/soc/qcom/sm8250.c
> @@ -231,6 +231,7 @@ static const struct of_device_id snd_sm8250_dt_match[] = {
>  	{ .compatible = "qcom,qrb5165-rb5-sndcard", .data = "sm8250" },
>  	{ .compatible = "qcom,sdm660-sndcard", .data = "sdm660" },
>  	{ .compatible = "qcom,sm8250-sndcard", .data = "sm8250" },
> +	{ .compatible = "qcom,sm8350-sndcard", .data = "sm8350" },

Reviewed-by: Srinivas Kandagatla<srinivas.kandagatla@oss.qualcomm.com>

--Srini
>  	{}
>  };
>  
> 
> ---
> base-commit: 0fe506c81cc421509660163da72dac79adfb959a
> change-id: 20261127-sm8350-sndcard-f2367f4568d2
> 
> Best regards,
> --  
> Demeter Barna <me@fromdisposition.org>
> 
> 
> 

