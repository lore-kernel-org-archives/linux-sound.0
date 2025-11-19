Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D103563D2
	for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 15:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763566575; cv=none; b=t1ZBWj8BS6hgnlr1ydFKbWcPsQiG2151U18B00ie6teQAk+Qqb1rFh9uavxCkP84cGVrOxnxwTef4jofHQ/WZoq9clEQoQ2kPndzeZOoTD/1/5j2XxtkcIhrAaUnUaKDhuXJPXlqp7p67E+s22KxLxA0q4rpMOyxOsQF8jKfIGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763566575; c=relaxed/simple;
	bh=H6DO/DNOAK8r7LOb8c2flayKt4mHB//bqUtHLakHRSg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=LeQuSYUchjO/2ZYjwBhfnydfOUkZV0ao96MW8BKp5WZvJLzL4cAKx7caEb3NxP7HQecl/h4DSLpwB40r1wH1igU0o7ef9uRkaHcye8pVQJD1ZLWb2mgSAjLg6c9LL8fqChG0CtIEAuFMzpaYrwvSfZXtXrjgP+nKEJp9LbIw8DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FloBbVr0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VsSw/fY2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FloBbVr0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VsSw/fY2"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJC6VsS884822
	for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 15:36:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6S57lJR6lKRo3qdLi+GChr4nY3+rRqb2kkwWE6UisHY=; b=FloBbVr09lGcclax
	TaXWbkC0tmWY1jFmqrUE+jxv5vFd5FrF7HKgNQGcFOCSKdkMLOKZGE1MNvgPwiYZ
	rA0jG4HWeDvjJ6yf3FtJU2NGtiByCyz/SQX1Zp8SEJBuzSz3mw/6PL8DkIdwgdNx
	uN70wQBj1Xz8IfUxa1DuPuixJIXZed1G5LpqeV9BoG6RK56jBz+y/kxYXBRV931/
	z2h8I/Y/Wdd3lg3mpkMb95WI0mB1Fa35ats9mPgmB2j5TvukXTGhYbPgbxOTcf1Y
	6HGX4RMUgsgx4vM9GBQgwgMgndz1ElDCZMQJt+k9LsEY9jSLcmNSZP7tfvIxQfl2
	r9YNAw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ah6yq9vh3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 15:36:11 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed74e6c468so94452941cf.3
        for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 07:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763566570; x=1764171370; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6S57lJR6lKRo3qdLi+GChr4nY3+rRqb2kkwWE6UisHY=;
        b=VsSw/fY2yfECmmqs60Zok1yAj4Aery9kCiFeEQf9qaSGuXWOAbutOxs3tgq+Seb2gJ
         8SYHWR8C1wdQrBcBPw+wzfseOGceRkkDpe5nMo7UgybXgNlE/KDsKy8jXYfJd+MCgs+N
         x7y2oONDKYkzbVZMGgXm02YhzooO6NpElmvQk036pCViXeN3H7x/QB3VDBtnVNP6fgiH
         4TljiKt7T4zw8//+zgJH/IMjN1M5TfZdAWY7G3Zo9tEfJTZySVAZde2UhIMnaJtRtheB
         RaMa9KrJHyYZlCnpjb1wuhO4IMoksk8t6SB3zNDmVgEsgGa33BTby8osjp3yPLdiVno6
         8akQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763566570; x=1764171370;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6S57lJR6lKRo3qdLi+GChr4nY3+rRqb2kkwWE6UisHY=;
        b=rgKmfQAu3zbkBIO7efp6AvgUtOXxY5ykuFsxoPjwEld1Vr8h4ufZcqaERT8Ow7QhT3
         yTeolpU4o6IUGmQjGu7mBXFdIPi7hCUPphAj7D5WHby/mSIab4FFJr6F7665FuURYSLt
         4UKU1JhgIq3Q+TR2CsarLMEqkR1Fzg0vCj/PDf94i9ao3ybdOawfbuWVGTzsHUHCoGod
         R92IsngrmOo3qth8Xn8Gx9sf7sXovkMuQvv1fNhxbucW0cO+Uxeo7qDlfk08mf1PzgJ1
         9iVYdhZ5W6lXe85dd+3e7ythtvFEDEqeB7fvpwNbV1ADcfdgsm4jIvB1f6vLzohbeX5c
         g1hw==
X-Forwarded-Encrypted: i=1; AJvYcCXoBMed4Mg7mn0Ej+vuIXoj5mjMeGsucusKILmFNJHJDWSvJWfXmyP0ELs7Kjyi882XXE7hJRfvlBl4oQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHdSPw7qOjQNydUq2vi/m/jzP6gMrAvrJ64r3TpjfCbNolNDPj
	OnmflDi4KAcG+w0aXjupFfeyZX/2+mEvZn5LLQ3T7Xbq5VNLOd+pz2dwYTqBy9Qyfoyaa8mUaxl
	hGsh8ucQT2J/jYPB8upl0IQWLhKN6SNeEFIBgYHbQ0rB4dUo85ZyKOdSS4552o8JCGg==
X-Gm-Gg: ASbGnctDIMqnQspPDOxmLRQP3rGIwl5TLtVQLWUj8nled0Q+CwB9t1fPe0fMUKtqxW3
	IMW0F+nq6W9Mle2mZPnX6XmInkzp+Wx3CxtsYQG3tQNf7NvQf2BLytZtkxjc2wFRgDFJospzsFq
	PWc09Gyf/VbMLl9fiYGZPGUN8/knPFI0T50uTJmCRmBIc6RwggNOihO0CliIDkiRTjjUqkvvHDR
	bb9r13pD+2lPd9gEG1ZZUnfvDf2FJ15inQ28xblC391ipbCawOViprL7wCFdLJUjBJzU2BTQnSc
	DSubWb49gtbxJv7MJxmFAByZ50MStUMMsg4twcGB0hpQ6w9aq37JW98kZRYGfhZ8BOjt7+X1YEx
	4SAJ8glGqidR1E68AQfr8yFxPM3w/Rejy5ums
X-Received: by 2002:a05:622a:1115:b0:4e8:8372:d435 with SMTP id d75a77b69052e-4edf2045b19mr266115771cf.3.1763566570276;
        Wed, 19 Nov 2025 07:36:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHRD6358tFM3tNK0GybZvyhnKDUxrxLeyixXpUSBQe6otQO470BIJt5Qb4sB0/rryyO8waPDQ==
X-Received: by 2002:a05:622a:1115:b0:4e8:8372:d435 with SMTP id d75a77b69052e-4edf2045b19mr266115231cf.3.1763566569476;
        Wed, 19 Nov 2025 07:36:09 -0800 (PST)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-42b5ce849ddsm32231884f8f.14.2025.11.19.07.36.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 07:36:09 -0800 (PST)
Message-ID: <bda65fbd-045e-4ed9-b98e-04326053a835@oss.qualcomm.com>
Date: Wed, 19 Nov 2025 15:36:07 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH 2/9] ASoC: codecs: lpass-wsa-macro: remove useless gain
 read/write sequence
To: Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        "open list:QCOM AUDIO (ASoC) DRIVERS" <linux-sound@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20251117051523.16462-1-jonathan@marek.ca>
 <20251117051523.16462-2-jonathan@marek.ca>
Content-Language: en-US
In-Reply-To: <20251117051523.16462-2-jonathan@marek.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: PHaR2_oUyYIDybrEQwAIFQIVRC8vaXpx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDEyNCBTYWx0ZWRfX0p6KoDsj0hOn
 BvvPRIEGKM68qxx8vXiy7bZAsYNZK8cl4WMmp9nws9aH48FmXiWlpKAtfOGauZxHTd1Gt5kyTmH
 HORUc9g50a9hmoE2MRTNhyTHbGFKDSEtZsMdiJAC5Jx8nSBf6eaMWz6gnegGVreb9h260sQFwMo
 6IDB84lDT2G+n7Q1FOWoaMGF34hK7ie6OxVOt63ze3VPZWqDqvg0il+gmuarZ5nxxy/978zn5q5
 yVwa1OTAm8uXwklsaTgpgvvn/IuebbhtBjufq6s2bIUUp8S4nUfbLUChT7+iKBRG4yAWXi1Fu4G
 jmpFbjGVFbwlVa6ARpK6fjgr9eK9MjoQphvXdJ3Ww==
X-Authority-Analysis: v=2.4 cv=Ut1u9uwB c=1 sm=1 tr=0 ts=691de3eb cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=RAbU-raeAAAA:8 a=EUspDBNiAAAA:8
 a=RmIaNmV--FFQmAx1t8oA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=JiizpSU_mAIq9zsZDqn2:22
X-Proofpoint-GUID: PHaR2_oUyYIDybrEQwAIFQIVRC8vaXpx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_04,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2510240001 definitions=main-2511190124



On 11/17/25 5:15 AM, Jonathan Marek wrote:
> Reading and writing the same value to this register does nothing.
> 
> Looking at downstream driver it seems there was meant to be an offset added
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>



Tested-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
#on T14s
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>


> ---
>  sound/soc/codecs/lpass-wsa-macro.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
> index 6e54c1beac8f9..6f16d54aee401 100644
> --- a/sound/soc/codecs/lpass-wsa-macro.c
> +++ b/sound/soc/codecs/lpass-wsa-macro.c
> @@ -1567,17 +1567,14 @@ static int wsa_macro_enable_mix_path(struct snd_soc_dapm_widget *w,
>  				     struct snd_kcontrol *kcontrol, int event)
>  {
>  	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
> -	u16 path_reg, gain_reg;
> -	int val;
> +	u16 path_reg;
>  
>  	switch (w->shift) {
>  	case WSA_MACRO_RX_MIX0:
>  		path_reg = CDC_WSA_RX0_RX_PATH_MIX_CTL;
> -		gain_reg = CDC_WSA_RX0_RX_VOL_MIX_CTL;
>  		break;
>  	case WSA_MACRO_RX_MIX1:
>  		path_reg = CDC_WSA_RX1_RX_PATH_MIX_CTL;
> -		gain_reg = CDC_WSA_RX1_RX_VOL_MIX_CTL;
>  		break;
>  	default:
>  		return 0;
> @@ -1585,8 +1582,6 @@ static int wsa_macro_enable_mix_path(struct snd_soc_dapm_widget *w,
>  
>  	switch (event) {
>  	case SND_SOC_DAPM_POST_PMU:
> -		val = snd_soc_component_read(component, gain_reg);
> -		snd_soc_component_write(component, gain_reg, val);
>  		break;
>  	case SND_SOC_DAPM_POST_PMD:
>  		snd_soc_component_update_bits(component, path_reg,
> @@ -1931,7 +1926,6 @@ static int wsa_macro_enable_interpolator(struct snd_soc_dapm_widget *w,
>  	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
>  	u16 gain_reg;
>  	u16 reg;
> -	int val;
>  	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
>  
>  	if (w->shift == WSA_MACRO_COMP1) {
> @@ -1971,8 +1965,6 @@ static int wsa_macro_enable_interpolator(struct snd_soc_dapm_widget *w,
>  					CDC_WSA_RX_PGA_HALF_DB_MASK,
>  					CDC_WSA_RX_PGA_HALF_DB_ENABLE);
>  		}
> -		val = snd_soc_component_read(component, gain_reg);
> -		snd_soc_component_write(component, gain_reg, val);
>  		wsa_macro_config_ear_spkr_gain(component, wsa,
>  						event, gain_reg);
>  		break;

