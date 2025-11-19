Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42D32D8390
	for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 15:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763566563; cv=none; b=lZ/k2hVBN3YFZcq9CI4vVEamsqD4Wwj1wMt1Kuc6RG7AuMR5YQEcHLC6xXkvBW3549ebqUCMjR3B4u3TN14F7pPGaoMzsFOUzoQrpUUR8OVFb/Nnt33oAgKVt9g0Rdw36QK5OpTz0ChJLE5eUiT8qi07dAfPBmK9DxLZ2atyEno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763566563; c=relaxed/simple;
	bh=l5iD3Cx/sDru2iSVerjAtGkme0f3lppIf3EZeVr009s=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=I10QnQVJMqOlUNZ90EqwWGmUcF4Xi/sMMoMaJHm3DdLH0+KT7tXW5UhUqMqYgPvQy+JZZFzhgG1n3K59XHgcyLPUuZRc42O+pL2XvKyQzhKUu5DYvDZIgCxSLOnrGW2T72JiCV99oazkUJheuThUUIXYflm2xbE198boS4xMY7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nLQJya2f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LqW/7uzG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nLQJya2f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LqW/7uzG"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ7aBE7718623
	for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 15:36:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eEmkXxHDUOZ364AJ8xpE5szLredmiGGmXw7ny/xja+8=; b=nLQJya2fWbSvuJ4K
	ww7awPL2eWRwCKR6Yu8UU6XQ+PhKfraa1Qj0MnDrS0sCqAgQEgTItlOUrnP5j1sz
	Fi4vp8Fc1dA/ajJ+ZXYlEt44xBOkhh44rWyDqu5Q6cnZVj6Cx6HTcaZmULGA0LOt
	cbVkRJ4/KZ6wJdppl4zK5H34fvnQNrLh2b+8WWauW14UKFk0ifnITVHyqPxUqeN+
	DgfR+P8NtifJLAAclJkHTUvvBUUVl8B0tl07g07rxtg0MaNU+QVa5pWszL4d7Ny3
	V5RFDFFowlKv0twnEgSN9dh9r07ui/z8A4ZVnaa0JutgIBQblL7cW28oBD4gccck
	BO9AeA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ah9n0sctt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 15:36:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee16c5a681so71041951cf.1
        for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 07:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763566560; x=1764171360; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eEmkXxHDUOZ364AJ8xpE5szLredmiGGmXw7ny/xja+8=;
        b=LqW/7uzGLOS01xSDkaoekKxJ7QTXnNPizwkNEcMBybDsx86pkdg/1lnlIVWCXi6Mpp
         s5JYGqvOr0ZEYZvoCmHxAWShvZVwsgGqlIAJCpqwHSWmqPH3OmRnlbZcdnP4v/jUIE87
         dYN/9aNlBgY3CK4bCkdIx1q41PiPrvOZ5MY+ZYVhJhf2+WdeLbBY3tGrIL4zdwdC3PcA
         XixRAX6oKtp0lKyIj2/boPxrl7OeH69jv6YTzIAkShl5CW8QUSG/QoNdfZnrC8QK+1Mu
         XpJuxGgCHyn0BMLc9kpSrkZGl8ILDL3OWK4ldbW9kzotVkvYaNxZf6L0/cedcgvv3HaS
         xP/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763566560; x=1764171360;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eEmkXxHDUOZ364AJ8xpE5szLredmiGGmXw7ny/xja+8=;
        b=vI4NbLbKqV2RxMHrxk90n3xznHfkJKrLx28LtULd0G2E3dRLc4wEqhB0Q5QyR74xsJ
         V+ipa5NXYEZ/l1DdHZEhTrx9PXL5enHNYIeykBHVhQiU01gor0TI7g/Ny+tmQCk9ZDCS
         ISwVy6I+xXnMkuytzrqyR5D9wd3F1ArEv5o76DCsNrp3gvt60dWBBIuACg4f6ZxTvu8B
         F9Zbma4a8Rxfcg0AzL4myxUBxZR1Vo8/VUvo7kvrC81c3ThWI16+ikRF+I3wm5yAwG2o
         A7cUruFFRsr7BzNKenl29NZJeRfvaj4m9seZw5xoxwbj+TXnLmHPWYEqblwYSUpdY7G+
         jsFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQX5N2JgTKVb6kMBI53m35kHCPOt2lcoyAaeO0rqAn7a35gXC3n9VYicIjd6XAxdp1aAAplaDEcmiSRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqflUjdsUKPlw6iGgvd7k7v/or3Ui8Rg9oF8aq5B7y/95eBh0d
	Btv13+9kDEwRX45mN9trOnGdSn40sRWQER+jBex42P/mrhDmuUGIT+v++Yr6VV+sYYu4jUKgdLp
	qPeycOTqhs2kDA4KR3rYJ6Ked9xeULsVm3oTVZAoxYs2o+ayBWIC0ryw3sfNyi6hCtQ==
X-Gm-Gg: ASbGncugbVDDEecB99FZs8II7f6KyGCP/m0Jdpw5cFYAvGbFh7Od71Ap142Vv4xrQgU
	smGgeEWUkCh+VtmPVkMj1a1fWQfusTi+aJ51hA3ABPj2Wqq4gKoKk4gM2t1r0yGlT9OWZ2Iqzzn
	AX1gz6/A3VS5DyeoN4Gyv+JYVWFh/z/eKO+zLaJQJ5Zgj1kj8lZ/yaeGBh+zgjtNWYIuGtnQ6RL
	1skAoqj6Jla5Jh+HIcuCENdpYkNLrFvp2HXbOcGVVcUPOsBCp27N47Qvbc3jExxEMNgInFOiLSI
	YBZMdQZ8OzENyD9G7OuMPdAzmKUXqvaVDNH9fTZeQ42Ej0O4yNfv2OJxc6MQ8bkkRcxdnGVPbjB
	qP/5tyjGwfH5EA5owj/XTlex2CCA7kQpMrdus
X-Received: by 2002:a05:622a:1886:b0:4e8:9ca2:b9ea with SMTP id d75a77b69052e-4edf21408b8mr252901831cf.56.1763566559928;
        Wed, 19 Nov 2025 07:35:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IExw6h9e9OPKWc55w3FluIcrQAm0qTZheVRXVXHH0RkBcCUdKwa3aUi8Z7yEe88tQr330YH+Q==
X-Received: by 2002:a05:622a:1886:b0:4e8:9ca2:b9ea with SMTP id d75a77b69052e-4edf21408b8mr252901461cf.56.1763566559470;
        Wed, 19 Nov 2025 07:35:59 -0800 (PST)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-42b53f0b8d6sm40179217f8f.28.2025.11.19.07.35.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 07:35:59 -0800 (PST)
Message-ID: <a77f0c42-70bf-4d6a-bb45-d435e4f29809@oss.qualcomm.com>
Date: Wed, 19 Nov 2025 15:35:57 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH 1/9] ASoC: codecs: lpass-wsa-macro: remove unnecessary
 bounds check
To: Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        "open list:QCOM AUDIO (ASoC) DRIVERS" <linux-sound@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20251117051523.16462-1-jonathan@marek.ca>
Content-Language: en-US
In-Reply-To: <20251117051523.16462-1-jonathan@marek.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDEyNCBTYWx0ZWRfX479SEWwu8xrq
 tjJhmuoJh84XZWK84bgTnete/fX//7OFES2zW3B9TA9teSKEnUlRRpvLnjRlTsAVQb2QcOqYZWZ
 4GHApLeESsc1HDps/2SpR9+zAZkhKvG9/VfQGP2jqibNnSl5aT+oxKOJw3AOkjdYdfIPPRB5Btk
 O6ShWW18hPzplQ8cpJsVRIJGKWCZInhOByaYZBI9eGBo40K+DmkesZk7PKx4dcprcniue0IX/rN
 fw1ZY+XpGGDv3N5iBjatgOPc4PvgqF1GTgIQCUuIvqMcM8IjobAV1E8+59jJRw+o/Mvd4FHVBUp
 HK/MYhVjWfSlchr2q6ULZnXd9Wbik8hQ+TArCU2kJa1FLegXhwSjkNrKwCh9Gb4vRan2RFfXP7x
 nfuptZsJ1ePRnjgxMR3gd1ANnHKG4Q==
X-Proofpoint-GUID: i0f3PbSlVF3pNX1QQoT8PcGUgIRlCTaW
X-Authority-Analysis: v=2.4 cv=QZlrf8bv c=1 sm=1 tr=0 ts=691de3e0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=RAbU-raeAAAA:8 a=EUspDBNiAAAA:8
 a=D4_jThNCTOB2YhlUUkcA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=JiizpSU_mAIq9zsZDqn2:22
X-Proofpoint-ORIG-GUID: i0f3PbSlVF3pNX1QQoT8PcGUgIRlCTaW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_04,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511190124



On 11/17/25 5:15 AM, Jonathan Marek wrote:
> WSA_MACRO_RX0 is 0 and WSA_MACRO_RX_MIX1 is (WSA_MACRO_RX_MAX-1), which
> means it is not possible for the bounds check to fail.
> 
> Removing the WSA_MACRO_RX_MIX1 limit is needed to add support for other
> ports (RX4, RX5, etc.), in which case the valid range depends on the HW
> version: rely on the driver only setting valid ports in active_ch_mask
> instead (already the case).
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  sound/soc/codecs/lpass-wsa-macro.c | 11 -----------
>  1 file changed, 11 deletions(-)
> 

Thanks for Cleaning these invalid checks.

Its convenient to have a cover letter for this series, which makes easy
for giving Rb and Tb's,

Consider this next time when you send more than one patch.



Tested-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
#on T14s
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

> diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
> index 38faa9074ca3e..6e54c1beac8f9 100644
> --- a/sound/soc/codecs/lpass-wsa-macro.c
> +++ b/sound/soc/codecs/lpass-wsa-macro.c
> @@ -1168,12 +1168,6 @@ static int wsa_macro_set_prim_interpolator_rate(struct snd_soc_dai *dai,
>  
>  	for_each_set_bit(port, &wsa->active_ch_mask[dai->id], WSA_MACRO_RX_MAX) {
>  		int_1_mix1_inp = port;
> -		if ((int_1_mix1_inp < WSA_MACRO_RX0) || (int_1_mix1_inp > WSA_MACRO_RX_MIX1)) {
> -			dev_err(component->dev,	"%s: Invalid RX port, Dai ID is %d\n",
> -				__func__, dai->id);
> -			return -EINVAL;
> -		}
> -
>  		int_mux_cfg0 = CDC_WSA_RX_INP_MUX_RX_INT0_CFG0;
>  
>  		/*
> @@ -1220,11 +1214,6 @@ static int wsa_macro_set_mix_interpolator_rate(struct snd_soc_dai *dai,
>  
>  	for_each_set_bit(port, &wsa->active_ch_mask[dai->id], WSA_MACRO_RX_MAX) {
>  		int_2_inp = port;
> -		if ((int_2_inp < WSA_MACRO_RX0) || (int_2_inp > WSA_MACRO_RX_MIX1)) {
> -			dev_err(component->dev,	"%s: Invalid RX port, Dai ID is %d\n",
> -				__func__, dai->id);
> -			return -EINVAL;
> -		}
>  
>  		int_mux_cfg1 = CDC_WSA_RX_INP_MUX_RX_INT0_CFG1;
>  		for (j = 0; j < NUM_INTERPOLATORS; j++) {

