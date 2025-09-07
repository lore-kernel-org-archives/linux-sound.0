Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8D5223DE8
	for <linux-sound@vger.kernel.org>; Sun,  7 Sep 2025 10:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757239224; cv=none; b=TejR2+qXYCJM68bYmaAsDKp4fzSMZRSpvPEBmuJ3SisgkFshh7Abh8cl35ApIVXJylRynRMTyCixtn6sg+LOawATuRmyG3cHF1lm8DWTRqXPLz7dmXe58yq6ucmNccDEcRuc8hBqf26t3S8AIEHc3Rl+plqihQscRslNv0cmZMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757239224; c=relaxed/simple;
	bh=JdRGVx4bHeaB9hxsshS++UJcE2XQe4YXg/1/cdY5kpc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gtp45A7eXFDlcScz2BtESHcDi4PQzGDt2gea/OLRAv0DJVIOm0cprMO3gnXF9BG6QqH5DGxYW3AvTU3AxZp85MIuv5osStFpurzvXufem9in1RmolyBVR/DfP1RyUF/bN7uSQXzaAmNyqiAvCTzz0R/T7KmZRP9jEB1GpqTX04s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ROsvt3gP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ROsvt3gP"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5878jcvY004835
	for <linux-sound@vger.kernel.org>; Sun, 7 Sep 2025 10:00:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qr3Czd9PwhhylBpPVieXHwCBf6HZ/rEjYpqLSCwU1MQ=; b=ROsvt3gPtum96m7O
	O+9R4aaL8zNmbnZ+R/3AfPkim2F6zAIbHwZq1T5fz/KNVz4e9KfKVXQhGVbESLb6
	m7iX3fXPgiMe59J1CbZJhtQp5nQ2hf7bdQDAWynMIqjnT+3Cq46IFcW+7f2ra7dk
	mUo3UwG1xETfod5qzQIyZpf+WCbg4V62gOa17zkTWQCjNDQv6boB/ojppi3UM1Y/
	/tsvSboIWkAaUBRpYUY5Tq/Sw3GyO8BTqLcQdIbgwTNWveXlCD76nMsoPc73uvVo
	kviLF5HEdr6HLO5uxptPcTtzMhPJhQ+PchDdTvJ4enNTGUcPsOwvZ45gWPjD5QYY
	o3K5ug==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490dqfsumf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 07 Sep 2025 10:00:20 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-7222232866aso93737556d6.0
        for <linux-sound@vger.kernel.org>; Sun, 07 Sep 2025 03:00:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757239219; x=1757844019;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qr3Czd9PwhhylBpPVieXHwCBf6HZ/rEjYpqLSCwU1MQ=;
        b=Wf8w41NAU3V4KuYvLX4rzfajPmTNwKtxcGRf77Pn1ugtPbXTpU8rG4FLY7euNshb7w
         8qf8Tq0BwEkkoH4gxrGr6PZ00c2I0FWMBuw2poPsmi1d/W/UYlAMo/OaxxiXBUSCBvHE
         9Z9Rs+iPQ8VyrsIAtbIOBgpEC6WI6FQycl4tdRL92E1c3PeNXf/OAVgWyxcYjZ799WnD
         F62UFF+OITtuwZEpAZ+wLh1buuo3EnIbwmFPx5lQhaIv/xXhQo3ST63+SkTXPzYXPPwi
         JEOwI/hqr3K845Zz1lxl60AfzthYZj5RjimmgTWwNR5z5DJf44YierxgxFa+x1x3uP4W
         WJag==
X-Gm-Message-State: AOJu0YwX3cETl7+zVgf7Xpr3vhODiIEjdsb0sP3YhwHRZBw4A/QYqDBX
	LOMAazl8tp0BscqITIf3lRzedaVtsd/7XgNozRH4pDL29MzqyFzRwOf1EcWpG+iKQNt+i57ZbiG
	cH8Z1VtP4j0a6jNEdCZP/NxyFZdGHz8Fm2vzGpWJ/G9DaOxnhJ7tlzRvK7SOzNO3JjA==
X-Gm-Gg: ASbGncv9KwRjpQea6HXh9kiUKM/KsoHqEBLM9JY5XL/dU3jb1couWY99l3eyA5qy0zi
	VNqnMFpR1yAsr1+06JVY0aytSeax5LCFe9kD2KKa+s1N1RHQZPBbV0KCj9gXq4f1hlx+1zs2ZnR
	WOySXJKmrR1nTE6NtVsbDsKisSUKfTWMix85ML5kv32RwS/eac0VOEuuBkFb0p6JZplYBb7Al3R
	BkPcgwe9xaDpqRLi/S5FcG+2nZZhdcYjG0wAPmpPyIMOSwEG11vhZsu+dJxasZMC3XJHqi3V0dG
	/uunyLGCsOe4rlBNTtqwncRCqIHPfuueoFpIymxohwgYHseWDnnMgJDgkPKtKL1hAgs=
X-Received: by 2002:a05:6214:2462:b0:70d:ae61:7ddd with SMTP id 6a1803df08f44-72bc5842ebcmr122738926d6.31.1757239219437;
        Sun, 07 Sep 2025 03:00:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZRn6PmHHN0WVzaevPq6eNyd0NSdg9SA4KKI1yKwL5vha/Px9Z7l0N1LQNsS6IGy0U+cad0g==
X-Received: by 2002:a05:6214:2462:b0:70d:ae61:7ddd with SMTP id 6a1803df08f44-72bc5842ebcmr122738456d6.31.1757239218799;
        Sun, 07 Sep 2025 03:00:18 -0700 (PDT)
Received: from [192.168.68.119] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45dd296ed51sm141015435e9.3.2025.09.07.03.00.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Sep 2025 03:00:18 -0700 (PDT)
Message-ID: <899db9f0-27f5-4404-8357-4985e084ac99@oss.qualcomm.com>
Date: Sun, 7 Sep 2025 11:00:17 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] ASoC: qcom: sc8280xp: Fix DAI format setting for
 MI2S interfaces
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        kernel@oss.qualcomm.com, prasad.kumpatla@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
References: <20250905150445.2596140-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250905150445.2596140-4-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250905150445.2596140-4-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: mmE-MIo7IQsgCoJ23VFymY_B72fGD-Zf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzNSBTYWx0ZWRfX//++mbg8pMvm
 wowXVkWSQGOOjTUDTUxX4x8p5JRmLHWu8DREy1XaACMG7NgFQu+0a4WC8lSTS5gnX3+IMR0zFmG
 VlO17C+JkqEJ+ni2xEAQrbiSGui+i9XN6vP4FJ8pY3CvAoS/m8PzpxD4MBJrNYMoBeiOdbNdzCE
 EAfJObxDgD+rThnlzTsvL5Gwp8hHWYkRc731TUc/cDceoMFgBA4Av57E6IObkliOAfo7URde0UG
 Nae6RqnHoUJGT3Nx6rapDB6/zE/8LElsTB1La1I8nQAJtcJ8nLsST+LM7RyT3aO/5w+dTWaIYme
 GPQAB1coz8EjTWBepKxL0gbrGWsWccoCCi+Fqz29P8tax41jbUcZaYjVvC6llQYhtaWZcxWn1eh
 x4WRXSsJ
X-Proofpoint-GUID: mmE-MIo7IQsgCoJ23VFymY_B72fGD-Zf
X-Authority-Analysis: v=2.4 cv=N8UpF39B c=1 sm=1 tr=0 ts=68bd57b4 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=VTWOZG3uf4wZYCvkMeEA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-07_03,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060035

On 9/5/25 4:04 PM, Mohammad Rafi Shaik wrote:
> The current implementation does not configure the CPU DAI format for
> MI2S interfaces, resulting in -EIO errors during audio playback and
> capture. This prevents the correct clock from being enabled for the
> MI2S interface. Configure the required DAI format to enable proper
> clock settings. Tested on Lemans evk platform.
> 
> Fixes: 295aeea6646ad ("ASoC: qcom: add machine driver for sc8280xp")

Am really not sure if this is a fix, because sc8280xp does not have any
Mi2S support. If you have added support for MI2S on any other platform
that uses sc8280xp machine driver, then that is the right fixes tag.

--srini
> Cc: <stable@vger.kernel.org>
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  sound/soc/qcom/sc8280xp.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index 73f9f82c4e25..3067b95bcdbb 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -32,6 +32,10 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
>  	int dp_pcm_id = 0;
>  
>  	switch (cpu_dai->id) {
> +	case PRIMARY_MI2S_RX...QUATERNARY_MI2S_TX:
> +	case QUINARY_MI2S_RX...QUINARY_MI2S_TX:
> +		snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
> +		break;
>  	case WSA_CODEC_DMA_RX_0:
>  	case WSA_CODEC_DMA_RX_1:
>  		/*

