Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609A43CBE6F
	for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 23:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785366132; cv=none; b=kjULdMvlndLpiRRm1WIvJ2Q5oQz7Tr8Ikd69BzE+u0mSaTMResXzZPg0JjQ3DnUSDvS0oXW5N0iG1mhNVAQXeWILR+TONOPJIdLFzJ6l7cHPU4zP0EW5tgakYLR8GDZWFk5v+h0QUKXvMQCVbzJECPD18Fa1OjuEu4WEwKWUKq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785366132; c=relaxed/simple;
	bh=BrEvI1zwzB7Ptq+Vlrj6FhFSru4RlM2jJ4WVrQjMYKE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RAV3uTnmU9Umq/xOfa4ThYN2OeduXQGByM/pUigvTAG6bAumgPFtooViZrzhE5wWC/saEoEvQv2rvUubSD8+J5jQtevIHniCOnl+gL8AHxzx2C9ujex6MXx6M2hQSVNAAEfSSCdUoSFVN5SjzKYKNlWIR6xCsuY8GZA9xQZh2gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ed2gkkWZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jCVeOzSM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ed2gkkWZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jCVeOzSM"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TL8BGX2997754
	for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 23:02:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PB1ac6uzEAO3h+Zzhmz7/ZBVfd0Yc1MPeEFZHK2O/MY=; b=ed2gkkWZ36NVWa5y
	FeBLRGYO+UY3GnbbnWnYSqnV7zgprIi9/rI1RVcC90rDnmR1alMT8R4ZYX6cIS7l
	ibJlx8TZnO8mMaguI1PXYAu6/rJABBmCamd7VbFWbugdV98jIIoSi53/LaESTUiv
	OKrDj7EpCO/OjnhbIlq/kBe7LQs7MJj+6J0uk2ehBd8NGXUhkSc6ESXstu2kfCOT
	47WOhS1ozvFnoZK3hZYsSOvFlcdMAoeZYJ2qKBHDUWx4Vu8iGwlenVQIMVyxNS6f
	MN/JSYNbva2PQXrD6HVgxaaYkKZ+T0AujbsIyO1DA4dYWLnbmDN6YKzP+/mO6xeD
	SFQCfA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqs5g8bk6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 23:02:09 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9771e566a02so261651241.1
        for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 16:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785366128; x=1785970928; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PB1ac6uzEAO3h+Zzhmz7/ZBVfd0Yc1MPeEFZHK2O/MY=;
        b=jCVeOzSM2AQRbQNqWloE5N3DASTTCyl3q4HJUTIWnJPAkyDZhORUFp+HPT89PfKINB
         tGlKhbqPphSr0OTP5MIfIOgQLuxJNhKsoBuBx7vKgI+ya88ZejvVH/t6l4pG4ufR9I64
         m4eiN5jlDvj7BWP5cLRPZIFpekeqhrjh/7A7OFNX089z3mMXAJMaeTL4rZDwMtOLP/rt
         gfP1SXM5+PbeGezuBq/AtYGaJvv4O5wYOTRY4pyiDNkbQhet4PPx83x9qp0VnmvF/I8q
         0K8pKXmbOWU0Yqy9BEI5Km3QXh/z1TnemEZcYDUsCeP9QS86JDS2QycSjg/qEhEBQQZL
         wdkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785366128; x=1785970928;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PB1ac6uzEAO3h+Zzhmz7/ZBVfd0Yc1MPeEFZHK2O/MY=;
        b=UVN3Mo15apS/22OH4CQ8bdpinEytOBT0WhSV89PGYlHP+kLsa+7hxdmHRMiHipfZPS
         57GmEueqJts9AuEJvKKeeUaHH1qYHGesFynsDaSjRx4o7P/ZChZkWV3iCdCNQ0HSU/tF
         R6e0AeKYPZStRk+bC0mkUscileLNuREtYAERO2SyOtaVQtqUTvAn5NUbgfjpNtROPB1p
         P0n29rXULPCxdlK60pEFpa5p7kFr3PNNDJi8oqDtYr4sWX6czhw2kc0ftNObqW2xQSH7
         xg1NW1LlLFLiINpiGiF84/WJPKFjtu4+gMVcK+/pylqLFFfco0lacjnpe0iu3ulfrT/Q
         wgrQ==
X-Gm-Message-State: AOJu0Yw5dry0GKdR+M5pAN4ITmds7mVdpWThbgvxNGAjAXO0zH3lyN3e
	3m3WsRncK0qSjMlk/2ExUiyaC5GDdRccvHfxakjwE9MKeMCVZoEi1BzFrrW+yA/dC1uoSibriwC
	XNjCHJB2VLm5Zf/4b5Y9YRvBoCs7efY8jnjoqpPaPYOXa5jSINN/7f8gogJWhGMc+Eg==
X-Gm-Gg: AR+sD11K6e9JcSMr6gI9L0dWbRYLoAK6pCL+WVevGiY78lCLRj554nQDIjs8qGlmCW/
	308O7KneWFjv52SQBxffNjw4hvVIsJ9ETWiQhZKHboEo/p1syJgofPkTZLpgsRim7RPZuDP6NAd
	w+GYZ4+nJgEcFf2lUBypeIJds8eyYtdY1rvpnZ2cb02gwCDX+BPJLExnpjP8g6Pj5nO5iEIsO9/
	b1wSGsdHJU0ewPh0tNPoC2iVaDCHWpsu85XOPH3NnBYx6d/boAN7gWMrWpOdVhaMqKMPIHTOWdx
	iMoa+7ssQP7d/6LEYrcOIZj0QhTP5/OJt+8vZz+mYZ8utFjwuhWJFBqGe9QWkMLW/Dt99GiMJqZ
	rUj+ITvAPQOvAizxrZRWwlEjWP8U=
X-Received: by 2002:a05:6122:3118:b0:5bf:a181:d46d with SMTP id 71dfb90a1353d-5c365ee550bmr46274e0c.3.1785366128414;
        Wed, 29 Jul 2026 16:02:08 -0700 (PDT)
X-Received: by 2002:a05:6122:3118:b0:5bf:a181:d46d with SMTP id 71dfb90a1353d-5c365ee550bmr46229e0c.3.1785366127936;
        Wed, 29 Jul 2026 16:02:07 -0700 (PDT)
Received: from [192.168.68.105] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47fc88e3c73sm177380f8f.10.2026.07.29.16.02.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 16:02:07 -0700 (PDT)
Message-ID: <8a60aef6-018f-475e-af0b-4553bc89f86e@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 00:02:06 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: codecs: lpass-tx-macro: Fix enum kcontrol
 accesses
To: me@dawidwrobel.com, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260729-worktree-lpass-tx-macro-enum-fix-v1-0-0cf02c681332@dawidwrobel.com>
 <20260729-worktree-lpass-tx-macro-enum-fix-v1-1-0cf02c681332@dawidwrobel.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260729-worktree-lpass-tx-macro-enum-fix-v1-1-0cf02c681332@dawidwrobel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 3bDJkyDswECY9d-FhlhWxwLZi0dnAVNi
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDE3MiBTYWx0ZWRfX9Di32pGLG+Dy
 uY+RP0xG1ORIQZLwxdpnKO1PKR7LyjqNw1ZZ+uFOlDd4iVfBrc9AH9BIeYTemwoiwDg+tiNhz+m
 nynZcloYFcloE18yJkdHfqH08lb/uzs=
X-Authority-Analysis: v=2.4 cv=OJEXGyaB c=1 sm=1 tr=0 ts=6a6a8671 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=br21HGidAAAA:8 a=EUspDBNiAAAA:8 a=l_TLitfX6ivw0kWHOzAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22 a=rq5_1Q1BYlbxkLLkNd_B:22
X-Proofpoint-GUID: 3bDJkyDswECY9d-FhlhWxwLZi0dnAVNi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDE3MiBTYWx0ZWRfX9zj0redEykeC
 NukQOwIdwXWRQ9NxO6IW2QbG7YTKpOEKS3VnRf8Vceg84dlmEzASgoU+ux+QQAspYOARUI+y7Rt
 2TeFmURFjaE0sB7vOQ7WYWeNlEOb1kfvLIQzZvShfIVYq+hqnC/8H48Fz/Q7pWOg7ZiKaw3g0Jc
 OEmjRMIxJj/3wbggeCwU5Px+4seLGi7azvM0ELF++zFoqC55f9DvpXyaqK1FmQACChFdDt/Kdr2
 Fgoy9Cet+0w7vLY6Tow80yRh+HIDNfA3piik1c0hXr5Y5UXEWDbN9ssD9I83n48ubTb7lt4QD/n
 UbTdvk32cPweiy6XHqMSa/6Px8/xKmjbP/ABKt/Usf+4wkY7lrkE97vNsp5bmOHXqUUJI6xWzwn
 MjRMnRXuR3HuHXd8FJDq3a118/SgOfaUNf8Bz3fvF8hqd4yojx/NqTnHG5ZyDRhCQpEeLr7YTQN
 3ec0tcbcgP7G2S/yqfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_08,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290172

On 7/29/26 8:38 PM, Dawid Wróbel via B4 Relay wrote:
> From: Dawid Wróbel <me@dawidwrobel.com>
> 
> The "DEC0 MODE" to "DEC7 MODE" controls are enumerated, but
> tx_macro_dec_mode_get() and tx_macro_dec_mode_put() access their
> value through ucontrol->value.integer.value[0] (a long) instead of
> ucontrol->value.enumerated.item[0] (an unsigned int).
> 
> This same pattern was fixed in the sibling drivers by
> commit bcfe5f76cc40 ("ASoC: codecs: rx-macro: fix accessing array
> out of bounds for enum type") and
> commit 0ea5eff7c606 ("ASoC: codecs: va-macro: fix accessing array
> out of bounds for enum type"), but tx-macro was missed.
> 
> On 64-bit kernels built with CONFIG_SND_CTL_DEBUG, the elem value
> sanity check catches the 4 bytes written past the enumerated item
> and every read of these controls fails with -EINVAL:
> 
>   snd-sm8250 sound: control 2:0:0:DEC0 MODE:0: access overflow
> 
> Fixes: c39667ddcfc5 ("ASoC: codecs: lpass-tx-macro: add support for lpass tx macro")
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Dawid Wróbel <me@dawidwrobel.com>

CC Stable

Once added


Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini
> ---
>  sound/soc/codecs/lpass-tx-macro.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
> index f7d168f557dd..0cbf50647ff5 100644
> --- a/sound/soc/codecs/lpass-tx-macro.c
> +++ b/sound/soc/codecs/lpass-tx-macro.c
> @@ -1075,7 +1075,7 @@ static int tx_macro_dec_mode_get(struct snd_kcontrol *kcontrol,
>  	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
>  	int path = e->shift_l;
>  
> -	ucontrol->value.integer.value[0] = tx->dec_mode[path];
> +	ucontrol->value.enumerated.item[0] = tx->dec_mode[path];
>  
>  	return 0;
>  }
> @@ -1084,7 +1084,7 @@ static int tx_macro_dec_mode_put(struct snd_kcontrol *kcontrol,
>  				 struct snd_ctl_elem_value *ucontrol)
>  {
>  	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
> -	int value = ucontrol->value.integer.value[0];
> +	int value = ucontrol->value.enumerated.item[0];
>  	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
>  	int path = e->shift_l;
>  	struct tx_macro *tx = snd_soc_component_get_drvdata(component);
> 

