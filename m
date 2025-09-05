Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A819F2E4258
	for <linux-sound@vger.kernel.org>; Fri,  5 Sep 2025 10:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757069087; cv=none; b=oIy8iIWwo5mdNSLPI3f8WVTr8W4oXtzzqeOPR3lP8zoKQbmqZrCDffB2vnK3auBo6PhkYGlraDa1Nbd37qAqXGdfMoetqOB3odxDSVJ+FHntiIOp6OiICl3A/TY/I44xB8gKzUmuzl9hRmTCu0SMA3XU5WOcC64vAsN5RQHFzK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757069087; c=relaxed/simple;
	bh=6Piiy6NTMH97WhADbYD3/LlJoh5Nv2lDCU6EvR4Cu6A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h9r7c0Xoe/h11i9jaST6hEkjXUlSTjLuMRioF56iWgKPh7zxyuEsuQ/Fj3ykPiyHNi3NipV048+jLwsoBYv4uUP9eQVQgNmwKIGJF23dLe8Cbi6yGfJFLUebwdrAd8qjOYY+KQgVzAq/miDS99E2vRWeRKKX6XK4JIJq4tl4sN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oapHd31n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oapHd31n"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5857AkcY007841
	for <linux-sound@vger.kernel.org>; Fri, 5 Sep 2025 10:44:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gux6kMZiUumXBSjwEoH1kzz+HuiKLKIvCan0EKUg7As=; b=oapHd31nIext8y0p
	K7fPX9gXAP9vEGEc07m77KS9wKrnN+p1iaUau13Ru8mIjhiLa/VEuGm3727j0zhl
	wHLJkdHatgMtuTBwaNFDvSxsm+L0GmrbIgxusJQVhJ9TPBKK7KGMLt90YKiKuoOB
	I/+y0mSjQNgwL/8HXdXJRA6ZTIMmtjOeD9Ef5jGFA16QliazE4S1z8I/BZHeA3HI
	3fNDkBVXo2TYemkhBLGN8zIhzaO3TDj/Q8KXf5ZsaRdpMNAyP7qVoig/yukgAiAT
	F1ML1uWful/8A6QNnjlNqUTssiJBGq+7xY3GtvnSCJXcsx07HdAZ045zM1xUnUPr
	rOf8AA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura92qjf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 10:44:44 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70ddadde46bso36929916d6.2
        for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 03:44:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757069083; x=1757673883;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gux6kMZiUumXBSjwEoH1kzz+HuiKLKIvCan0EKUg7As=;
        b=uBcSh+FwjhlbEp0KDohaw2qyAH/B2tCrgvJ0F/U/1ZUnwe3w+uMkkCdW9bZAtLDDgm
         v0FRT1sUqgcnM7nJwbysR/4se8Cw9AbGJ3/TgeV1OHUCGpmbQMDpNqNneRjupyGptFBy
         5yWkDtKXhzVISpnPsp+8FFsNDbn1oQlRyz3eA5H4cpX6fDLOtb3hM0USTmA5lvyWJF+s
         GAxiEOkqLW5NLVQrGQahTLBFNBQYmrZN/38hrwHo9u76IRpCxtz6WMjfcghx/ri6BvWb
         mL/Msyfgh4QBuCKyQ0AZfd7o8TDY+xEbM9AwXl8aRZ0GHuQjrHUfZAj1ELGD+oDLGzH0
         sdCQ==
X-Gm-Message-State: AOJu0YzLqEV8QO4Q7gYDtGjQ7D1IfdrGCRdMuXNdANwasCDizBas+nNL
	ejjs7g35+FkTiJjrObTvvQxj1eQAedDwuzioOlioFelNdT6zpMK7TqSh4wwBx151e1Ak1hi/4tD
	Hib94+fK9lxbNcVm4IQOYN7c7JDg3LnotgmCxAXhAYdk2OOBYaIiv1eQOyp0qUiI3WQ7ywjAnuA
	==
X-Gm-Gg: ASbGncvfzIYmPqJWAdIlJDgJGbE2keS00+gL8Bz4cQtEitPG+K2eU2Zg829uJof6E8L
	rLolF5Wz4lhiCxL6aRmAPZcotsAxOlklHrZxk93/XnaVCQqMCQAv8FDo7O4k24Df4/tmLk1TgIN
	swqCYTUfbUZVoKUl/RZxgDlNv6xwwqgxhPz5mzyPuUHv/VLH54kgiXrO6/lePnN+nRSk43huDBf
	DrAifrFMjJmSwfSE4MF8kCDnlXC/dVx/ApUy2UDjEiysc4o3gAGA4v4DkBSpVinPx+UfILjQHBC
	9ZJ+9o+Cf+b+VZEAGxn4jxE8onMU2RkB2dKrAr7Z3gfUMvoHJyl9EEa8NEB81O5NgfI=
X-Received: by 2002:a05:6214:485:b0:705:16d9:16d8 with SMTP id 6a1803df08f44-70fac6ffe91mr215640556d6.6.1757069083378;
        Fri, 05 Sep 2025 03:44:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAm6CcVTYr13hDSdqICOxT447TVJsFuVSMbJeTafnfVtIojb7sQBZPcJnhCg4YWD1Rwy+Vyw==
X-Received: by 2002:a05:6214:485:b0:705:16d9:16d8 with SMTP id 6a1803df08f44-70fac6ffe91mr215640206d6.6.1757069082703;
        Fri, 05 Sep 2025 03:44:42 -0700 (PDT)
Received: from [192.168.68.119] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3dc1cd4a7d2sm11220748f8f.33.2025.09.05.03.44.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 03:44:42 -0700 (PDT)
Message-ID: <59775bbf-5e8d-4302-910f-94c7e1d5d9e3@oss.qualcomm.com>
Date: Fri, 5 Sep 2025 11:44:41 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] ASoC: qcom: q6apm-lpass-dais: Fix missing set_fmt
 DAI op for I2S
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        prasad.kumpatla@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
References: <20250905104020.2463473-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250905104020.2463473-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250905104020.2463473-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: G2JXmxBPD7ox90IJtm_edsFlCYrkoRJF
X-Proofpoint-GUID: G2JXmxBPD7ox90IJtm_edsFlCYrkoRJF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfX4aERrSxNDizQ
 KgDc69GfguiP7y9soKKh2g34M93Sfkt/w9eGeLMpTBXyqMZLjdpWvH0F340nJJSiSSG8zoozMqM
 HIZT2mdZLNu4H2/BrKe63X8xh2k7Zq3/6fBmMw6eVSY1RazznA9VGrr/Rn6yB2arwlDvXACkLh3
 if0ELd/3kXVaWIYq62S65ED9ED7qmwbgkAJXGXlXgG5mzqeWQut2/DVgvEqhhfJVrOJJblX/0eL
 3t9H2FQSGoaqyOA+4rgYrJB9J6vGMgXaHkzZt4zVtH2KC5UWjm90jqP6TUU4O1vvFshEQYTw65i
 nSTe4Eu2iRv1UhGPD/v/5qHJ42O634rwHtDR7zKe8WuP8tn+mesUgx+apK4Kh5VNqAKghuqT+T/
 Obkw0GRH
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68babf1c cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=bCJSiAZF6pK8vonFiLAA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_03,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020

On 9/5/25 11:40 AM, Mohammad Rafi Shaik wrote:
> The q6i2s_set_fmt() function was defined but never linked into the
> I2S DAI operations, resulting DAI format settings is being ignored
> during stream setup. This change fixes the issue by properly linking
> the .set_fmt handler within the DAI ops.
> 
> Fixes: 30ad723b93ade ("ASoC: qdsp6: audioreach: add q6apm lpass dai support")

Missing CC stable?

> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---

other than that, LGTM,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini

>  sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> index 20974f10406b..528756f1332b 100644
> --- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> +++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> @@ -262,6 +262,7 @@ static const struct snd_soc_dai_ops q6i2s_ops = {
>  	.shutdown	= q6apm_lpass_dai_shutdown,
>  	.set_channel_map  = q6dma_set_channel_map,
>  	.hw_params        = q6dma_hw_params,
> +	.set_fmt	= q6i2s_set_fmt,
>  };
>  
>  static const struct snd_soc_dai_ops q6hdmi_ops = {

