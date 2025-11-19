Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D462F260E
	for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 15:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763566586; cv=none; b=meXfFQ+4ec59PnXlMc05GIEQ7ACIEk09uApp3uuwB4g6vATMyFajdA1QTeeicAYkuOFLN5QCgEnGCKs8X24tzoQyyfuXeKx5DJS85YDGjfEM9v2WcYslKjvK0PYsPnZfuTOqaq9Q/BPPN4qXqblPAHfVNUuiQh48obI8IRWvUuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763566586; c=relaxed/simple;
	bh=wTa40yMHXbA/hD3kwwRs4I02AX8q+hmhww5CzFpBfIs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dk7R4QHARXLZzwgoVXdjs0SHx6u4rXCIlU7HQf8B2mkZ7qVIs/mFDOm5CUVLS/sM2m+dnnmGBCSVYegI2hzdTRtDpbpRVjvpvCpi8PVE9M8Il8BBGHMKuUy+hL3eOIkMHyEtIfAqrQraN2d1HcsrvdJQCrzgxXV54nFEiB7OopM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HSaFDFQB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fnKiPT5Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HSaFDFQB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fnKiPT5Z"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJDTQvS826923
	for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 15:36:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wP9c2XnhztLAURhj3zwRP4AijueQ56rnmPiNweW8zA4=; b=HSaFDFQBv/9hndr9
	pGeruXzQJ8zJ5BiQW52RIcJbMgHow7HYJ4ozG/+v8xiFUh48JQZr4gMBouArt/GV
	COGx1EnbBiMTkmasCrosvfbS3bpeBjz3wdykH1Pv/PYbsVe+9D06zHe0DnYZN6md
	E6XEAfu3sHffwi7VJCc+NEH961MeiX0hU/VYND0+3WnbIGM6T8DfqAtqw7lqKPyo
	/8mFIoODqxbxzxiyfVesndv18BODZ2LE7MJqV1soSSupGti6VRiEEFdOpUeegpBW
	z0EfATo4TiFd18lmJMKEUHypfF0ukxmGhy1slbkFK9Ke+HPOeYtFd+ARpc+VUXFd
	gqu8vA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ah88w9nhx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 15:36:24 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee0c1c57bcso220086011cf.2
        for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 07:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763566583; x=1764171383; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wP9c2XnhztLAURhj3zwRP4AijueQ56rnmPiNweW8zA4=;
        b=fnKiPT5Z03QZZP1aHnvjuM1JJWQb43X3ptYo923nx/x6bys+Zdja1jQoZVy6r/IZBy
         JptbW3vKwJMUCEzlPiP1SpoQxGrcSY5N1NUJYoe8Ltg3GsMu4vVigHg3xmPW32TddUNM
         cv52TgMxL6QD/iC79XfIuSRJmEfj32UWdXeNFrOdfrzgbMIzA7+aA1A1JA9HXLUDM0q9
         ztPLL1ni0ns+vSFR5204TevemRf1pkYGWMIRSbqnyyM1ZBqW0J0P6qgbs4EMSnj+3GvX
         Tgc1UOlBACK1oRCAuX5uM0OTysIFvv3b484AeWbIWv1WRsNs5y43D15UrNnIHpw0sJvB
         kvVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763566583; x=1764171383;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wP9c2XnhztLAURhj3zwRP4AijueQ56rnmPiNweW8zA4=;
        b=rb5KhjgSNAAtwuh8GB4lFaZrJz35CrFMfvdAy84m6ADhAEKySr5en/O2o/NbXMQmIr
         uoj0tmV5W9QFJOMfX5Lg46SURXfmuer+Si2E183hyRrX24ASYe28QckPgJx+zQLfC8Jr
         4kXTBFCbbIeeF5QKY18xKzre8ibqziVchJCsVa0poCVYg+Cr6l+ifNelc2pDS/+BEpcg
         yqrH4qzFIDPBo+d3gHdGOUQQ4++Rhr7tvlB6kFZ0tT4AHakmQjKn3/NsOWbUO17nnSIA
         uZ1wLobSWoSeJl5PNU495Gc/z2UVU8AejQGgyi3boDWhgA34GOWJZwYnPkXEs040ggGj
         +dnA==
X-Forwarded-Encrypted: i=1; AJvYcCU3WXyDio/WWo63X3/Xk2knGojN/vDc/pYcjFi2YVAPLT8cWpuIQyyUGZcyoCtuSJ2sufQ0/y/uzbaMJg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3en4e53JXiPUeA0FmQIm27P8Gzbqcgim2TAmg22Uvlb9KDudm
	GGcgdxcSjv4bqc2WN4u+IVJcAp27++5Uy7mzHnxgPgCYAYZaZFfFT3zB676KltSvkri/LHhCTP/
	4BLoZVJrMplGk17OTHXUsA2TSABGGdv96wkKc0Z/rTAVA8P3f2C5nIuVmFV2fbRVlbQ==
X-Gm-Gg: ASbGncuZmbNbN6zyEl2uVqRprXqGXB8dAOkFlrfUMLPWEq/QkUehoCMH3Lm56mrdPBk
	lkkqMNTx4YHPHOIk1oNDkYv1DyR8vfSs+R8avbrFomqcWGrnrBI2FRwrGo/r3uqDB0b7Nq8Hy6s
	KGUacCjVtGiDdRrsXtp0BQbKFPUX/xRDU++7VBIve25dILqTEv68wpxG1QiwYizzAVA/a1kTw4m
	x/ot38Jpk/fgcZ3LLhYPoWXfP4d41ElQbOLq9dExgl3rnHykbQXvWXjbbSCimOKiFwqUyfKSb4i
	3QTUVFEIpouXsgPboId6txjs95s4iz783cD278clsZmthc6SdCrAtlaUtnEYgCfThE6HxkD2pTm
	38sBTSPjURmHcP8dxdc96XgHjqeWcDHMKVHxw
X-Received: by 2002:a05:622a:52:b0:4ec:ee7c:3165 with SMTP id d75a77b69052e-4edf214a917mr264089171cf.81.1763566583165;
        Wed, 19 Nov 2025 07:36:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG5uxE4x9fVe+zMA0r2RYYf4J9RcY1a3oV+0kiDa5+6vY8Fzo2+GVxSxUf3+QhzNzjfWm/LuA==
X-Received: by 2002:a05:622a:52:b0:4ec:ee7c:3165 with SMTP id d75a77b69052e-4edf214a917mr264088701cf.81.1763566582708;
        Wed, 19 Nov 2025 07:36:22 -0800 (PST)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-42b53f1fd50sm39044188f8f.38.2025.11.19.07.36.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 07:36:22 -0800 (PST)
Message-ID: <fa5c2a85-3098-4e16-95b0-76bb84e577fd@oss.qualcomm.com>
Date: Wed, 19 Nov 2025 15:36:21 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
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
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20251117051523.16462-2-jonathan@marek.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDEyNCBTYWx0ZWRfX6z3kasNNi7do
 BK28RtcV9g25oxdyGPV+haNASc7bem52arazsXM48Lnswvl2zyeEqQXdmXAMRK5zccw+P7n7tDT
 mqQ55iKdUtYG2CYTjLfQuPSQrWZ0L0nsbHF94bvcl7e7/7gjwIOxBem5n1c9pG7jqlvafuYLzYe
 R7rG8qWcGL7VpnK7EUqHrSY+Vv7GuDWVQtARMdhiRKuySVdjTCVEEb1xULFI2dUztkVuNdwAiyS
 0m0BJkQ+j3lbOL2P42zFIDpI1rcyd0QNGKePGzsAq5LkkpYSz1ZfPA3YPUGLXIb7poeVyJnVSmZ
 WnzHWTmNT2h7ePloKTM5gQVvLudQzhcLgnbamW8PQcPFtbgmkl/aBGrwGaJEjlAqnbO8LK/+TWF
 kphUPe2LudOb4QaCGUk25GorlNYitg==
X-Authority-Analysis: v=2.4 cv=YKqSCBGx c=1 sm=1 tr=0 ts=691de3f8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=RAbU-raeAAAA:8 a=EUspDBNiAAAA:8
 a=RmIaNmV--FFQmAx1t8oA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=JiizpSU_mAIq9zsZDqn2:22
X-Proofpoint-ORIG-GUID: 3VCfvx2PF6A23lsNloomis8w9WZ7bz3d
X-Proofpoint-GUID: 3VCfvx2PF6A23lsNloomis8w9WZ7bz3d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_04,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190124



On 11/17/25 5:15 AM, Jonathan Marek wrote:
> Reading and writing the same value to this register does nothing.
> 
> Looking at downstream driver it seems there was meant to be an offset added
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>


Tested-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
#on T14s
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>> ---


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

