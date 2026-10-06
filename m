Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310E63CAA52
	for <linux-sound@vger.kernel.org>; Tue,  6 Oct 2026 08:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791275692; cv=none; b=WF//M4ikg9jJsB3kWIXHjs4JT/u+OAeoBkd7YUoN0H0fujSbngLyygBaLgXrbQTUHHHVH6kuobWiPOYjjVVlZ2jx/msC6GN5tY0QNPW06m9AlBXI8dS7UWdRaQiE3U1BJ4XBZ32Q7WD2T4nXr1NfM/ajLKtO2pTS6vvpdyappFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791275692; c=relaxed/simple;
	bh=+XvS/7VQak0O4jyronPTM/UFIshl3Xjzp1mkgAzzb8o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k0fCUlxmlX/GRirkiaJoBYYDHkTaixVozsVtIuxQA1b0gHcUk1FXbin0OsyiZaDfj0gPtYnM/RYIiTGzEcWlFvNJ7qLnTd9tGrtMSqscGPxMtonSFADXT0WdMpSCKuS9fKfJLtM7bEYFb1kaPAQJXlHibxiQUsYq+4nAmypkRtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lLx090vw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZaBgeBad; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lLx090vw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZaBgeBad"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6966eHB4548442
	for <linux-sound@vger.kernel.org>; Tue, 6 Oct 2026 08:34:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VnmxMp0r5ixzzTeVg5OCJiFNwXuXZwtAl9/6k2tk5wA=; b=lLx090vwxF4LM4Pu
	2W0AqW4AjGgS+2AadwMvjhXO4VFy5TVKmd0tH1ChGGNOX6i+PQ6mnN8UOpFkpvhd
	m/E1bjnrm295472i13nsm29ohYn+WuFSSz7BcktWWQ3uoFHK2DEgmhU8vjZLkhDk
	iIvtbIIoIue2UFj15Q7J/3bS5QJg+nlsrn2bCFV+yxT/82wh7qW706AjM7/TKPsF
	CWyD/vDzrbJx+OgPljhuCnCh0y6+lsg5p3TKj34bX+gTAiIgO4XkkDBvNuRmK0jk
	w0XCdBQD29mDblhkK9BqGZ6tGpOvOq/Oxhbhm9EuIjdq4/LBpnBvutrB5Zc/4ntB
	q16EIg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h49tvvdrh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 06 Oct 2026 08:34:50 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a8041a532eso1685551a91.3
        for <linux-sound@vger.kernel.org>; Tue, 06 Oct 2026 01:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791275689; x=1791880489; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VnmxMp0r5ixzzTeVg5OCJiFNwXuXZwtAl9/6k2tk5wA=;
        b=ZaBgeBadYHLRQ1kvVQCuoZa3s8DVL8ImI8D0ZyCVS5pBArI2GH3CCea6Bf+HOx8uHs
         jseFfIch+JzkAbBTMFpHPMVxdOgOcIAfQ6YUgrHmTPQi1Mws7plw5SKT8mPvfj+KAC9d
         74vrGmjKJykq/X6MErrTssuwu1XTO2sDLNupsRCb5f3dpSM/bGuSfPajKclvEUGWkKqY
         RNFrj32X9IRsQI4Z/ZzD5Us9TuQCKA/O4ZAi8sq3HdIb72PJUaX4VTW05TkpMkVtVu7h
         NYP5Kvcd9YraXbqNDRUUj/uGn4+OBoV1gB+Waz650LKsrNiRzy82OL7TeYdiPV5Hh26t
         Mw0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791275689; x=1791880489;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VnmxMp0r5ixzzTeVg5OCJiFNwXuXZwtAl9/6k2tk5wA=;
        b=NcctzfllUGhC7+npQH7USNI9bgAD1ks44tTEHOa1xwj8s7BSGOclOojDpnxg3v3HDb
         HNV91AFwis+UH4ufxXvoX6guVhNirXCxiURkOo6245lDlCkmnDBPuCtoETDLvVaUFM5C
         7OuqJ+Jzgpom1/08nm4abjRDY/hdlEEZ1rJx94z9AtRmJgfoU7HdXGcK2Nv095Sa4mas
         P84z1Q+LNEYeVNIgV7LY9FijHTPbUCkHFIKzu9hQQWReogIHNyTYOCPiXGPV3Q+F68iw
         3ahZYRXoFLq8SRDPQb2uZsplX2tKVyNG2dARFyK0tTa9dsWzswpYJPHIOGX7ulV0zMIg
         dnww==
X-Forwarded-Encrypted: i=1; AKwUvBwQl9NvQmbw3c+/Dhp39g4XQcd7OtDt9tRuJybs2GxgThbQtcsMrg94wMpzy0N634JTpVul7MRFjmScSg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJHQvW2vPPppoqFCUhubhn3dmuVTzbmmWItKSXAwz55iiONTX+6
	KoNTX3HGiS2Rs8vBTqiAYW+6K+7dcrHZOCczsM5L9t3KzqezOe4TM31nHe3sdInkQLH31yUmnR+
	qznF28GCR3jeR7DeUqsC8ukIan/t9LezwER+7rLFCudCZL8f03S4uqS2nOh5SFNxjMA==
X-Gm-Gg: AYBFou22JW0vrAZTMjsVGCzIRgA11u72WAxhYh7c/OXHQZIkcSnvwkX2dGrp7CZQR0O
	qOw9vhjivwV5Ly5Jmev938pj20dEuAmQTi6aQq1ZGfwEDY/HNtIVocPPCLpGllgCWptK+YCNcJQ
	7s8NcWq8Z2WQBWwkyomIjoDxzPt4gKkLQUwAk6L4OWUaCRdnxRd/tnk9kwBeQdNFvfjB4naTPfF
	YE3MitQ0CW3XzZL9IeZrRT2EB4+tDHPMbRwg8HCpK0mbeFhJSX4EKzLlKuOfXlyDAQPIGOPmqG1
	KF07ew7z8tYX9BIGu6+9IWNzfBMmm68rozTsEPjtmDflzy5vp36EKbKznYGG+gx0QrxVdNwmYiA
	5ms51pomIywQGHPwY34ys41/RV5Y=
X-Received: by 2002:a17:90b:4a48:b0:3a4:85c4:68fc with SMTP id 98e67ed59e1d1-3a7872b2480mr9306322a91.29.1791275689012;
        Tue, 06 Oct 2026 01:34:49 -0700 (PDT)
X-Received: by 2002:a17:90b:4a48:b0:3a4:85c4:68fc with SMTP id 98e67ed59e1d1-3a7872b2480mr9306289a91.29.1791275688568;
        Tue, 06 Oct 2026 01:34:48 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d8ffc38sm2059180a12.15.2026.10.06.01.34.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 01:34:48 -0700 (PDT)
Message-ID: <1beff4cd-d279-4f34-ab6a-102ae272e762@oss.qualcomm.com>
Date: Tue, 6 Oct 2026 14:04:43 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] ASoC: qcom: sc8280xp: add Maili sound card
 configuration
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, ajay.nandam@oss.qualcomm.com
References: <20261006053717.3455143-1-prasad.kumpatla@oss.qualcomm.com>
 <20261006053717.3455143-3-prasad.kumpatla@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261006053717.3455143-3-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aN9lOr9m c=1 sm=1 tr=0 ts=6ac4b2aa cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=FjxXEj_nMBCEV1V2K9QA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: kkh1U1esvapIrOeqpf6aoyDqTYe9T1Pt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAzNCBTYWx0ZWRfXwXTEHEW4JsSk
 YT3Ey6BUygmxLE9fuuf61DRp9BE1C5iRX/Y+RcVuhndyII4cEdhAM7ZBLO+x+fXn3c9JwbfEOt5
 VnEewzmlZxg5rSGLWh+SEUTCGZmVtzfA0ZTxwyy9z1iVNfVxwaYO+/p8YF6fMaJYya7lKqAmkOi
 8FUzYZ4uJVTytHFFiryIbNXZPCX5Z0nsOEl6T2vMI+udAnPcqKUn7x1RYxlahodHqQuzoDkz9f/
 xz1Lg91knTatx/vTS0TINVmqLUhHkJoe/guQRayA0i8gkT6Z2a2DIXSmxfXQcyO1pNir0ubFgx0
 zqF17Nq371V9V5vWR00ffR5e7fOwAkj1qCfF8UaPHzvXs1/2+8U4EK03+alX/2z0PxMvGvVeqyI
 TvbMzX7eC05nkB1FvCYIQgE/mTPYUMUgQMLPH+CT4UAiyivkChJRE01/mj8DJQC2uLui4FHo3wD
 2s2rOITR0o/epBDwpvw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAzNCBTYWx0ZWRfXyYn6ers/ydHR
 jvoLzHomeDcxGm91HEzFnyPz2SPRPAwMRbf8EOFQCJEvgCggu7GPF9sJijKeGT1Dd33PmcL3+/S
 w6aBHEchXOq07VUOzG8KoL9dUlWl21A=
X-Proofpoint-ORIG-GUID: kkh1U1esvapIrOeqpf6aoyDqTYe9T1Pt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060034



On 10/6/2026 11:07 AM, Prasad Kumpatla wrote:
> Maili ships its own firmware, so its topology file has to live in a
> separate maili/ firmware directory. The topology load path is derived
> from the sound card driver_name, so reusing the Hawi data would look
> up the topology under hawi/ instead.
> 
> Add a dedicated maili_priv_data with driver_name "maili" for the
> qcom,maili-sndcard compatible so the topology is loaded from the maili/
> directory. It keeps the same DAPM widgets and enables codec sysclk,
> MI2S BCLK and WCD jack detection for the Maili audio pipeline.
> 
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

LGTM

Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

Thanks
Ajay Kumar Nandam

> ---
>   sound/soc/qcom/sc8280xp.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index b5d367486d56..b97cafeb8e78 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -552,6 +552,15 @@ static const struct qcom_snd_soc_common kaanapali_priv_data = {
>   	.wcd_jack = true,
>   };
>   
> +static const struct qcom_snd_soc_common maili_priv_data = {
> +	.driver_name = "maili",
> +	.dapm_widgets = sc8280xp_dapm_widgets,
> +	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
> +	.codec_sysclk_set = true,
> +	.mi2s_bclk_enable = true,
> +	.wcd_jack = true,
> +};
> +
>   static const struct qcom_snd_soc_common qcs9100_priv_data = {
>   	.driver_name = "sa8775p",
>   	.dapm_widgets = sc8280xp_dapm_widgets,
> @@ -676,7 +685,7 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
>   	{ .compatible = "qcom,eliza-sndcard", .data = &eliza_priv_data },
>   	{ .compatible = "qcom,hawi-sndcard", .data = &hawi_priv_data },
>   	{ .compatible = "qcom,kaanapali-sndcard", .data = &kaanapali_priv_data },
> -	{ .compatible = "qcom,maili-sndcard", .data = &hawi_priv_data },
> +	{ .compatible = "qcom,maili-sndcard", .data = &maili_priv_data },
>   	{ .compatible = "qcom,qcm6490-idp-sndcard", .data = &qcm6490_priv_data },
>   	{ .compatible = "qcom,qcs615-sndcard", .data = &qcs615_priv_data },
>   	{ .compatible = "qcom,qcs6490-rb3gen2-sndcard", .data = &qcs6490_priv_data },

