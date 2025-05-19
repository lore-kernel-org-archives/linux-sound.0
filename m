Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9BA1F4612
	for <linux-sound@vger.kernel.org>; Mon, 19 May 2025 08:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747644958; cv=none; b=dOEPnDc6EgLoUXE5EAjDkPwDZ74laerXtlbMiTNebfRm537ZF3qvds9/lUm0RyRT/VTRTiOIG7+ZJHEOB5SEUNNXeI6Hw0FqvudHuYJplyFdd/clrhCi7h1NY0Y55EhsmtiHJ8QUeMoybB1gj1vJ6prEbqwzjc9DI209MWXskt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747644958; c=relaxed/simple;
	bh=K0vti24UgOSsQ4ruq6gZQvCZo2mbAS4mzkYfBLYUldI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ogbidP7gZZsDq0zjYFa8nXPVM8BPB6NvGjrGCF61Ks4fxmb2Ao1iPXisljrUX3+KiO+TWOZC36dso/S02fgDctxv0MOjVGOb56Lkx10d+zKSMRsb8aqMp4/+WULQchylYZ8trsOvOxeyWYHVk1cRPpgbp98ElUO8CdIWHpmdtHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tg49GI5R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tg49GI5R"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J7GhUq023337
	for <linux-sound@vger.kernel.org>; Mon, 19 May 2025 08:55:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AJDrsvBMltYMjK35MmAzj2BbAZsdbSWYh/aKVvhjTsY=; b=Tg49GI5RYdEpbsFT
	GUJKTFbPoaIHSIUfT+TlVxqmYhV7LLkdTxJo1v1oNHP7A7q3dZftqy7lGfIEyeEN
	duPsmDLheDz8AfsTHE/Okv9dkTqkdsI4VYFQYID3crWt/xV4tRPs2/4dMUksx/0E
	Y5aQNpFIdXcmve+D09cik8hntNtLa/wgwjH/eCzkmz2K3XDkP6XOwQYxmoe1cAQu
	4Ys5eDgq2tqYzp1uTXULGZJdEx+ockK4x3vvKYuBxppAmoVTfbezU/WMpaC7dn6C
	YTx8mnq0K7gkUkk5EcN1x43k4/otOaL3ndAx4qVYPvqWWD1r1xx/dbmL7aKoycEK
	Jhk/BQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r041r8pt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 19 May 2025 08:55:55 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f8dfae341eso3000946d6.2
        for <linux-sound@vger.kernel.org>; Mon, 19 May 2025 01:55:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747644954; x=1748249754;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AJDrsvBMltYMjK35MmAzj2BbAZsdbSWYh/aKVvhjTsY=;
        b=eWLMG0h75Brn8hrCn9t1sQnvNJ2VeMEaXdyUQsIFZpLdAJ15PLcRLcxxDusrHdExzH
         KrsqRKIiSSnnPNb04AuW4854yASCLomgi1OtRhk8aqO5RWIkA80yjdFQ9IzJUsWsLgFt
         kILk9+YE/+6BEhQ++mul2SptwPzFGerljl74K6zkUa44NYZ0tSOsmSm4Bq5pXK+xfwJ2
         mztol6+7srvM/we5loJ2QsShxIdOIeRqV3JQd2AoQK3blbIAPpB2TDnPN70OjcGbNcXe
         u5iyNoB1qQU+gCiorXwmNqoLUpXIYvtfecmzVBN1tJrB0zqaCc9miGWtjNOHQRi6kKwS
         QEJw==
X-Gm-Message-State: AOJu0Yy5Zj3PWtY6S4IIiSf4kNjs55dgbywQf9lvJ7inV6qYjZHge5+f
	NU+NpFyRisBC2Y9aicTqcNl1ncSqodavO3laODrHh4D1wmH1P9QiRp2cq4I1SyFgCQZVsQft/Ak
	RSgoQVQhjjzuI+rfp7U+Luwd4pKvVCMB3XyljIyYQEulNVhmZROB6SwGZfg3ig+v74g==
X-Gm-Gg: ASbGncuP+H+PUX7AWRCjNqAzWGW+kuKcHguB/hMce7/toxrFCG+oveW6X00y4571k8z
	qXEwiE814kBr+mOsE2nx088CBq5BAZOTHG5dd/Rfqto87p3mNDCg3CnTTIZBr5CuwW1lhFFgJyl
	ZFHlsfWuB7zg4NF9S7tFPBq0omH6jNzpMI+SGv1AepRmty1P8nv5Z2xqH1UcmKzTPnz4AIiAdOo
	4ZvvocDNHzSF97+Axb9sZnxBdJ/SpsW0i555I+OEnTjjLZGjWCHLMIgBMQ+zMlBrYpFkAWLTCc2
	C5dCCrmJDsBiYaQQVwv1JHDcRYMCBZfxBzExdA==
X-Received: by 2002:ad4:5e8f:0:b0:6f4:c15a:62d2 with SMTP id 6a1803df08f44-6f8b0877c06mr205380566d6.20.1747644954538;
        Mon, 19 May 2025 01:55:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErzNEm9Jhf+vM6qFifeQXZGioPWFCKXVSnYAhJt7/k+6Qe2F/OgdHap1Eg9GiydsmOPQVlaw==
X-Received: by 2002:ad4:5e8f:0:b0:6f4:c15a:62d2 with SMTP id 6a1803df08f44-6f8b0877c06mr205380316d6.20.1747644954157;
        Mon, 19 May 2025 01:55:54 -0700 (PDT)
Received: from [192.168.68.115] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a367205338sm8348074f8f.98.2025.05.19.01.55.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 01:55:53 -0700 (PDT)
Message-ID: <9d59167e-6fd7-462c-8a5e-5781babdae02@oss.qualcomm.com>
Date: Mon, 19 May 2025 09:55:52 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] ASoC: qcom: sc8280xp: Add sound card support for
 QCS9100 and QCS9075
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_pkumpatl@quicinc.com, kernel@oss.qualcomm.com
References: <20250519083244.4070689-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250519083244.4070689-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250519083244.4070689-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA4NCBTYWx0ZWRfX9rVQjJG/PejS
 HnGXZTOwmWj3x87oMjwFAZnyYY2llrAs8/Gr5LJ6y0nrrygviX3AL5IqAf7WdssIAmRppHDu66O
 /uAekqHRYuMOBNH40zDmL6blHIF6wiYI99fomB4fGiusB5E72L5LHVd2jmXJJQV8wB1G65Qr9p5
 DadUAxqYIa+OV59g6tdg0t4HNlf8VP25LzhuKkF/YLp5b6dqZ8i3PbUgvGEdtMja8P3BdjKpYsA
 kW8YWTyeS5GeSFov+Dj82uQUC6sZDVx+aZa3Ci/F6jnOkL5ErmGBxxbkQBraHAwoGgdG3lV3YOK
 glYU6hyLpNPLpnM4XXigOCKKVZgXFBEO/A+IDJ0bBbYAiqe+cPgVQ+c2SXPAh6dQf8UYww0eCQj
 WcQs/RKP6IaEK2eNSqdgpCz6a8MKldNPquJN0E02tF9SrxeqscTYPjW5iZCKETlBZ97mLHT8
X-Proofpoint-ORIG-GUID: y1iv4YCQ3yicBM91W9VsdF2jkk2k3xzX
X-Proofpoint-GUID: y1iv4YCQ3yicBM91W9VsdF2jkk2k3xzX
X-Authority-Analysis: v=2.4 cv=HIjDFptv c=1 sm=1 tr=0 ts=682af21b cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=JQYwrvYeIx7NCKdDp24A:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_03,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 mlxlogscore=950 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190084



On 5/19/25 09:32, Mohammad Rafi Shaik wrote:
> Add compatibles for sound card on Qualcomm QCS9100 and
> QCS9075 boards.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---


LGTM,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

>  sound/soc/qcom/sc8280xp.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index 311377317176..99fd34728e38 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -186,6 +186,8 @@ static int sc8280xp_platform_probe(struct platform_device *pdev)
>  static const struct of_device_id snd_sc8280xp_dt_match[] = {
>  	{.compatible = "qcom,qcm6490-idp-sndcard", "qcm6490"},
>  	{.compatible = "qcom,qcs6490-rb3gen2-sndcard", "qcs6490"},
> +	{.compatible = "qcom,qcs9075-sndcard", "qcs9075"},
> +	{.compatible = "qcom,qcs9100-sndcard", "qcs9100"},
>  	{.compatible = "qcom,sc8280xp-sndcard", "sc8280xp"},
>  	{.compatible = "qcom,sm8450-sndcard", "sm8450"},
>  	{.compatible = "qcom,sm8550-sndcard", "sm8550"},

