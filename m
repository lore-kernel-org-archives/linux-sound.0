Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE464499A4
	for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 11:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790334171; cv=none; b=HAioUQcXDt8dUINAnpwZYE+FkgioO9PVsV5CJ39yUWt+g+YZF06QGk1QeU74Ce83C6+66QV9aUQ4Fl6dX/UHGPYZwUWcKFlRtX7W9UKyCIq6AI57QkHEMImuTakc6zKjbqj6fayW+j4JlLFBsEUnsgrIc/Rxaew7Pme90dJIn3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790334171; c=relaxed/simple;
	bh=LNOMjLy6wAcR7Zrv2JQzDuQOs+io2+5LVXSdmKnrQY0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c4vAm2C5/0LpF3QpLLhNTgvSFOxPj616p/Q+GGAgfbazPav3W/m+UAepQz3t7K/GZWxZC9av8ZAg9BMNn2iLgT/Y931utEahj+kPNFvQQ3S/pl1xOBIY/wvKFJnn591BvxK04BsC7RtkziEDCdHB/yXHF5T7c9d7jF7cndC0DHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KvFh2CFL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bisctOx5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KvFh2CFL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bisctOx5"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YeOG1193864
	for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 11:02:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VoIWBlJoo0FiwEjddlsFzE0cCw/HF0hLVfs9qwlvuz8=; b=KvFh2CFL0Ck4gOAb
	oI26+pbdmpqxQbPkecyHre41ejQiajPuhGGBInHpPGWQbdFySia5lL6pZ5F1B3Ma
	GIockcThtNcuuiBI1f0w7/fjjcsAu1GKzdpEgeYCTdOwzYWn4AQvrqeIl0GOA4w/
	5ZS7CAxkvhO5O/KFIuMTcE4xBxWRVDpewgKusJ0S1g5Gslp1tBg8Y1AC91ZVC16C
	I6bTOYJ5eJKQPjb/oE/8dHv85aGJ0OzjRfDTgppuAkWjFdZhjbFrN/W6MERqqKLF
	psjK+AiB+jJ2oD2ZC+/XHxzz7dYFhRGuLavtAkQLoPzyd2yvcW8iY/4TnOJUScbC
	MXKhrw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw874k4s1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 11:02:43 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1384427c3efso1080571c88.0
        for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 04:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790334162; x=1790938962; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VoIWBlJoo0FiwEjddlsFzE0cCw/HF0hLVfs9qwlvuz8=;
        b=bisctOx57CevOHI2baXrK83xChr3w0N3tdNDy232PBOtzftVnfyal2lpgJKvVt19yf
         XrIUHUm01XO0G+Kn4trf2YWcDtOgX05UqtsqlxK0kzxraXnXtG0MTWTnLF7uGfvFptZj
         U/SDWkKdFnUHh+8gpoU1xMh/vAlJAwbHHbPKhgS+6bHXhSJ8H6sr/FqZzvUJBduynveI
         8+FxgxSOghK0xwNaiiPNfxpdCsidFv9oRnbTh4PhoDc0gJRY1ihP84BHCWUyLj6GdaB3
         7lkQw53qvXE0xq6/0aQv49Vx48l5f5btY7jXYJdkWs51XD7EyNigrtKhbF3OkUoZDLuu
         qERg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790334162; x=1790938962;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VoIWBlJoo0FiwEjddlsFzE0cCw/HF0hLVfs9qwlvuz8=;
        b=xIENWpaI81mt4YnEI7BmXFJ8NDSeVDEvVTUDCBajAgmjxkSoSv1WYZfJlMUGAWNLL+
         GI+IMif1D+wliLh0rJFg5iob6fxcNSfUOIzLDJiMo7nVMNaxZNaiR0KqzKxaDllvFwNS
         Owo2NRKM68RGvFwQIOB64gv9SBdx9mEqC0x5ieOUHmF8Sdn7mDjTbQG1U8YuLP9LYQ8j
         BrUU/kUZhtcvlAID/vGyGEBEk0MnyfFzQ3WLxiNr5me6v8wePZdOdRl6fQf41ifkV+np
         bmJ49fItZEAFKo0fw9+c8/fH/JAaQl8Zg2MS3V4XEYSuNF5XPdnYCEYoEFQCg9ZDGNUm
         MSVQ==
X-Gm-Message-State: AFuF++noZgjVps28KSj8cozpXZIF0HRoulWoEJI2IZOY0s33ae7VWBI9
	mwDcP/OWOxHXg7tz0VO68w7irPXymashZjblTCm48/DQjEwweJklQPoMzGjQYU6HbrBcQ4RzbEd
	5cW4DOYFaTQAqsdqRitPTkzqKZU9rs5W44e9B331pUW9QED+ZgD7KMGtvvwtCw4Negg==
X-Gm-Gg: AYBFou26OLFvVzQ1tkYj640k3MS87AnDvRgYJt9KJW1Fi02OoiQMHcb316NpHu8wJUX
	7s0iXQMicRumI1MIxGN3BC2W+JNXV4uW/rrkCBQzZeyML3byGN16EIh7h8t9Vh4D99tSOWUnDit
	OiOvk69G4UCRC4Ppz77Bc4BT5SNibH2dRZK3RKVNw6qiBTh0LFcrGuwSAQMqF/IKQFH1sUpGUsf
	nmSwU93JfrdGNJYRPm938FS9aggj23kFcG0sXtT1BOcH5OZpbNomXmhdJYxa5spxHHT80LS15t2
	0Xb2xvzdEUOCMAkOaqYpw09eMcYQMPs+FvZlgmxqLLekudwHPMtmBGxlw+fzmBDIVuXEEVLU5sO
	+0SHSFUitaCqvjGEiGbiRUgKat1Wy
X-Received: by 2002:a05:701b:2085:20b0:144:eac6:cf37 with SMTP id a92af1059eb24-14503ffef9dmr4634826c88.47.1790334162232;
        Fri, 25 Sep 2026 04:02:42 -0700 (PDT)
X-Received: by 2002:a05:701b:2085:20b0:144:eac6:cf37 with SMTP id a92af1059eb24-14503ffef9dmr4634776c88.47.1790334161284;
        Fri, 25 Sep 2026 04:02:41 -0700 (PDT)
Received: from [192.168.1.25] ([122.183.173.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ac67c0ccsm5428954c88.4.2026.09.25.04.02.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 04:02:41 -0700 (PDT)
Message-ID: <6f2afa91-6355-45f8-b6be-6b556c679813@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 16:32:33 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 8/8] ASoC: qcom: lpass: Add support for LPASS codec
 v4.0
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
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
References: <20260922-add_shikra_support-v1-0-6c6cb6444caf@oss.qualcomm.com>
 <20260922-add_shikra_support-v1-8-6c6cb6444caf@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20260922-add_shikra_support-v1-8-6c6cb6444caf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9Ewdd_aH-TFN3h86xQWnZcnFWCSKRJL6
X-Authority-Analysis: v=2.4 cv=MI71C8Zl c=1 sm=1 tr=0 ts=6ab654d3 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=uk8ae9/F1LYL5lfeGCaUoA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=vpuhTeqA5xwXINrO_jgA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA0MyBTYWx0ZWRfX7RN8Vtmugl2z
 i78l+wPcsriTxStJ1S+/5+zT2kIpfe3QDh1H0phcbQXy8K/OIbhD0FBauHuc0YxisGy9xza7elJ
 X5P8BOfzBK6SzkirskHGg1uXXnaauBnv/mp9Phty3SJvBaqLwIqWi9pNCqySQ40UG00UIfa+JsE
 FCmahFEfaJySHtieUKeE/7pnSAn8mT+ri4huq4fjE6rmZ2OQCOfi1yoX+/REi2GkYv4bIX4Wej8
 IYuCooTrnfIaFVNf7+29fTgrAp9yjVIjkeCpbIxVvAVU3xtg9jdpPaKIRjU2zY8R38cbZokA05g
 IuRTZLTNNG7F2UmMeCPR6WpGivvaMxa0I41/EMty9tk8pofPSKNN9+L4ncGrbIvoeSWGjqFd7W0
 mAFtEGvIOJo758ivp75bq4bfRMLcek4SGPoH9cA05EIfUWg+6MTU4y42yVF7bYpMNl9Dulz8vaC
 jSHuorqtfjo7F6Qpy5w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA0MyBTYWx0ZWRfX4oWNf4kImJUU
 kfx9vrKiJjFBrlV40HjQtGc/ZaMtTwjfk9RM9RwhWD7RgnOpPB6/bLinIp/QaMjZvcWFg1wnIRf
 QIUSIVJZgZtLH8QGXbh29RCM9ql11Sc=
X-Proofpoint-GUID: 9Ewdd_aH-TFN3h86xQWnZcnFWCSKRJL6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250043


>   		rx->rxn_reg_stride = 0xc0;
>   		rx->rxn_reg_stride2 = 0x0;
> @@ -3959,6 +3962,8 @@ static const struct of_device_id rx_macro_dt_match[] = {
>   		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
>   	}, {
>   		.compatible = "qcom,sm8550-lpass-rx-macro",
> +	}, {
> +		.compatible = "qcom,hawi-lpass-rx-macro",
>   	}, {

Patch 6 documents qcom,hawi-lpass-rx-macro with `clock-names` containing 
`lpr` instead of `macro`:

     clock-names = "mclk", "lpr", "dcodec", "fsgen"

https://lore.kernel.org/all/20260922095522.193FC1F00893@smtp.kernel.org/

However, this patch only adds the compatible string and reuses the 
existing RX probe path, which still requests the clock as `macro`:

     rx->macro = devm_clk_get_optional(dev, "macro");

I do not see any Hawi-specific handling which requests or enables `lpr`.
Should the driver be updated to request `lpr` for the Hawi compatible, 
or should the binding continue to use `macro` if this is the same clock 
from the driver's point of view?

>   		.compatible = "qcom,sc8280xp-lpass-rx-macro",
>   		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
> diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
> index 79abbdd158b7..46ae627ca594 100644
> --- a/sound/soc/codecs/lpass-va-macro.c
> +++ b/sound/soc/codecs/lpass-va-macro.c
> @@ -1896,6 +1896,9 @@ static int va_macro_set_lpass_codec_version(struct va_macro *va)
>   		}
>   	} else if (maj == 4) {
>   		switch (min) {
> +		case 0:
> +			version = LPASS_CODEC_VERSION_4_0;
> +			break;
>   		case 1:
>   			version = LPASS_CODEC_VERSION_4_1;
>   			break;
> @@ -2166,6 +2169,7 @@ static const struct of_device_id va_macro_dt_match[] = {
>   	{ .compatible = "qcom,sm8250-lpass-va-macro", .data = &sm8250_va_data },
>   	{ .compatible = "qcom,sm8450-lpass-va-macro", .data = &sm8450_va_data },
>   	{ .compatible = "qcom,sm8550-lpass-va-macro", .data = &sm8550_va_data },
> +	{ .compatible = "qcom,hawi-lpass-va-macro", .data = &sm8550_va_data },
>   	{ .compatible = "qcom,sc8280xp-lpass-va-macro", .data = &sm8450_va_data },
>   	{ .compatible = "qcom,shikra-lpass-va-macro", .data = &shikra_va_data },
>   	{}
> 

