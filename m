Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191021FBCA7
	for <linux-sound@vger.kernel.org>; Wed, 14 May 2025 06:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747204968; cv=none; b=h5LcsIK8kxUOUkReSBEEHUeYah65vXo1BvPKFe2IJzhTFrpcx2OOMhn0LTz+h/XJJJS9HR8l1SwlEHehTwMPY2fI5cO7163PNA6KNMV6f9Zdd0s46Et8h81/i/vNjYF2JclUmgGfx1BLyQPyn6AyIsLgRAlyVIzfHWbTG8YHIX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747204968; c=relaxed/simple;
	bh=W2lPWkK0xtLvB6EVRo0hijyvktlOgtLlUSX5Erkw4Ns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t8/ZZ4ns+wI2o8v0+j0Wi1DwlKiG4fYhXgmRm4kTM3hV8O7ygqHqSBDppD70XeuDT2Zx8GQQGZ844lSIzxokeqQ6HN2FFheAPuBmo1Qj1u81crc1zidQct7hxC97PURKePZbP1rTdfVitQQQM2XpyN2C2v16Bu9KPxXgXkyb/GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FkY7rKVA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FkY7rKVA"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54E1ksHp025953
	for <linux-sound@vger.kernel.org>; Wed, 14 May 2025 06:42:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JE3ywahSgKeZLLk2eR+4hbG6tcJpuko/WfGL5GE2avk=; b=FkY7rKVAQBZQLgGs
	hhYD/mzVaCZ9Y52SZvnHOGxHF6AcOAp3ICdjiGOCzb6gUldH4k7bEu7OEWVwF++J
	U1objVR9edQ5PBMw91kobQbrTa7PmqtO+jGNbXJ4RKI7Ujo2KcWXN2QrdGFIxbPd
	JIFejx5Bq8I/PKX9fGnxLkFIvQ7PmUOOcaudB2v3SxFbC6j3c969KHmKpVarR3X6
	yEDKjkDNlfQbqBqXdLnZfZMlsKEL7b26HBn84gxIwAmjsN2lI04JIDwSbTXwuBaj
	dN9GfLwFA0nDJY0f6kBeqpl7i5zH2Y7yagE8FlII+liBhFsubUHdWo4IP/dKkWRr
	IPK3GQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbew1nu5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 14 May 2025 06:42:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c543ab40d3so935896585a.2
        for <linux-sound@vger.kernel.org>; Tue, 13 May 2025 23:42:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747204965; x=1747809765;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JE3ywahSgKeZLLk2eR+4hbG6tcJpuko/WfGL5GE2avk=;
        b=oOoeQDmsFRPc6s1aMkYf4Hgxcq7ggj03CINQXAoWLGMEHLFEIYXxqziiYIGn2M/lh1
         sZqoGdsP6VngH4tDirA3cWTtck/JqRmXkCPVDEdgLyEVLyI8KxMhb17m19ladArfpsvS
         GoXp6JTCy5VwyQNsUOvwaw2XkJ92mIjm7x6Lx81hofx0BK/7+SBNGtzPRRoDN4niJD4J
         fnevQwl75UUKrxXdcF/UCYLgTXfdJPQpSv4YeNL8l9UnCIjIk7js61qd9N9GPmii/XCt
         OhYa02ytTTsUn4gp9LIWyUES6/SLeJ6+GVJG+N1KA3avwOGoFL+n3F8VUIMCDyXi+PZD
         KHhw==
X-Forwarded-Encrypted: i=1; AJvYcCWQral9aURTlub4xStnBRuabWcuDNmHu8ZsQHvoO85p8KfP+Tv4+EMWkZnM5XgHEeZus1rwMj81CxY5Ww==@vger.kernel.org
X-Gm-Message-State: AOJu0YweA4mZaU6vtfFckUU5p9cBz0HH3q8Z8GWXCSb2FT0QsWP7ltib
	O+6vEwloESnYRl66ZJDKZ2YmWtumWRnxNXHRfqzwfyxJB9Xs13oUkr8MUXAglYqdxfAfKAML4qk
	LusYayDbECUX4LnFiixZ7eTRBgFBwd35G1yw5aQqAT8128EEnnrvZw79gvAV95Q==
X-Gm-Gg: ASbGncum3YZNGPTlDPwv5+hYuQxbCFxGt17nb/qUkJwpiAXW3eUPiYeP8YPPGte4XHX
	HZ986miFhoaY4xZCSiAEBoqalfTitbtuIec1dmO5XnKUsm/QParJIRWC5rPtYURqzMgq1uue3W3
	1q217JdNezJWDU7SqDZcLi619GZ59IkPi9nDbrS/wkNL3+ZTTQd1bo/xjpDAaZyx6wK5j72sxL2
	DFpYLbHtx9Mu0voKHxWoQ5UvEAlVbYDS1yWaaTYK+FiVjfCTVL6WTuRPPPJkzj8j//1EXr3T3lE
	aRbIlX+Q1Cs744Ygb2yyDD0Go7spgZVTVrM/3APiuHyP0PadyJPaKkANYt8qWw==
X-Received: by 2002:a05:620a:179f:b0:7ca:c6c7:be14 with SMTP id af79cd13be357-7cd287def2fmr311051485a.1.1747204965040;
        Tue, 13 May 2025 23:42:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/TX+EOyLGPx3RCZxzUdd7gY67Jbmj+T3fCNfY8HTMGXEWyH6YEm+X+YAuMYfMaxiKp8G7Lw==
X-Received: by 2002:a05:620a:179f:b0:7ca:c6c7:be14 with SMTP id af79cd13be357-7cd287def2fmr311048785a.1.1747204964660;
        Tue, 13 May 2025 23:42:44 -0700 (PDT)
Received: from [10.61.1.19] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4d0dbsm18271702f8f.88.2025.05.13.23.42.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 23:42:44 -0700 (PDT)
Message-ID: <ee60c802-f4b6-4d0d-9c0d-b16ab732e6c5@oss.qualcomm.com>
Date: Wed, 14 May 2025 07:42:42 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] ASoC: qcom: sm8250: set card driver name from
 match data
To: Luca Weiss <luca.weiss@fairphone.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20250507-fp5-dp-sound-v4-0-4098e918a29e@fairphone.com>
 <20250507-fp5-dp-sound-v4-2-4098e918a29e@fairphone.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250507-fp5-dp-sound-v4-2-4098e918a29e@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Y-aOZwYWdgN2DSTcgRQia-H_MD5C0ezp
X-Proofpoint-ORIG-GUID: Y-aOZwYWdgN2DSTcgRQia-H_MD5C0ezp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDA1NyBTYWx0ZWRfX0lakHq9xMfXY
 INra015eY9FcCPN/6Vgdyo9pGwqRlHakcDRmfzkgIQnanrLxwCSwZZHeibsIe4icX/d8Ahy+rCx
 bIVOoQyQ0GFdyWTkikmrEX0dxM86fohlvOUZnvgaiwN8CBrgCtGTGSzZld19gX9hGM85LaALPn2
 4c1fLBP8LPUwrQxwv4/60rsaqMJC50r7FxN/zgL4fmLVmBRZ/mHK3dPjBIIoXSc2KaLlJ+0AOdI
 uLtOBYPN6fmusWF2Plw4iPzGDzcc3SVv6eE/vMBTXE85pLwm9MaYgbRWG2tJyFYc1KolmDslTlL
 FLK0DIcfm0iwegianvaobM1dQvU5/s11fB7rQFhW9oUC703o2JmhEw6inu15EMDTDgQ5VwXpRVd
 ZfbFM44lGNianR7hi9mkonpTETWzgzzVMP52fTtnCilUXikih+y5XExV0yEKrTLX/YLLvTc3
X-Authority-Analysis: v=2.4 cv=LOFmQIW9 c=1 sm=1 tr=0 ts=68243b65 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=mS7wm7roH4dnaGY2uMEGzA==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=6H0WHjuAAAAA:8 a=WerGdG9rmgDbcAo0O2AA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_02,2025-05-14_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0 bulkscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140057



On 5/7/25 09:01, Luca Weiss wrote:
> Sound machine drivers for Qualcomm SoCs can be reused across multiple
> SoCs. But user space ALSA UCM files depend on the card driver name which
> should be set per board/SoC.
> 
> Allow such customization by using driver match data as sound card driver
> name. The QRB4210 RB2 gets its name set to "sm4250" as requested by
> Srinivas Kandagatla, and since no (known) UCM has been written yet this
> should not break anything.
> 
> Also while we're already touching these lines, sort the compatibles
> alphabetically.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

> ---
>  sound/soc/qcom/sm8250.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
> index b70b2a5031dfbf69024666f8a1049c263efcde0a..f0d83a843765d8dcdd51569e7cbc95eb72292497 100644
> --- a/sound/soc/qcom/sm8250.c
> +++ b/sound/soc/qcom/sm8250.c
> @@ -16,7 +16,6 @@
>  #include "usb_offload_utils.h"
>  #include "sdw.h"
>  
> -#define DRIVER_NAME		"sm8250"
>  #define MI2S_BCLK_RATE		1536000
>  
>  struct sm8250_snd_data {
> @@ -200,15 +199,15 @@ static int sm8250_platform_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	card->driver_name = DRIVER_NAME;
> +	card->driver_name = of_device_get_match_data(dev);
>  	sm8250_add_be_ops(card);
>  	return devm_snd_soc_register_card(dev, card);
>  }
>  
>  static const struct of_device_id snd_sm8250_dt_match[] = {
> -	{.compatible = "qcom,sm8250-sndcard"},
> -	{.compatible = "qcom,qrb4210-rb2-sndcard"},
> -	{.compatible = "qcom,qrb5165-rb5-sndcard"},
> +	{ .compatible = "qcom,qrb4210-rb2-sndcard", .data = "sm4250" },
> +	{ .compatible = "qcom,qrb5165-rb5-sndcard", .data = "sm8250" },
> +	{ .compatible = "qcom,sm8250-sndcard", .data = "sm8250" },
>  	{}
>  };
>  
> 

