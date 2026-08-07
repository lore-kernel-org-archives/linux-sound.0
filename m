Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86ED23EFFC5
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 10:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786097159; cv=none; b=uv9sHlSnTXafu1juzRcikiLgyMrt1Qob8mZZiWqh18YQAnwedWrF1j+fg1I4BRC+VbL8sIX1sSgvX0G+11Xn0L5HiQWURC/mbwN8LiACqtalGEN42ENX8A7UewweGNI5CXD+NjCKChal/4Q3B0//nozlXKbE5nqOoGQNaBjGl1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786097159; c=relaxed/simple;
	bh=KgwvKXAeU1tKqTZ/b4GkpamsRcLVPSzaar6BWABYhfk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bgMTfVPt11Jl7HyOT5Vs+GU2wUneP+gFHOV/yzWDQX9jwmMqO3o+ipRrH/nkZzkXEvsWZnfvc2IlA4uOlgqpd7H/9aX2SqLERQAQxR4yKOjR89eUttUZnWBkaNTKpw2BIV3TBE2EoIkLc6UVNugHVriRZAK4HFzn56fLhxj9054=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pSAYHczW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TzJ5faKp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pSAYHczW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TzJ5faKp"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6778DLW13251822
	for <linux-sound@vger.kernel.org>; Fri, 7 Aug 2026 10:05:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q8nuOJzW+TPseumqr2G9zfr4l4ZosAXff19ht42hACc=; b=pSAYHczWQiBr/bdu
	Mbefu9AD8fgqQK89Ye6eknqaftr+Ouh4XxSZlDXIGLczdLiXaJXK92QNwxLNSkk8
	/ZL3yKaEE3bqGzZCyX1tf2CRZzV6NMdawBlHaVQNcNKm4fVR8V4Pz9NWAZOEBC3O
	SNYVzStLgiyHttdETNqegcH9rhKtGVt41N7Zfnnfxi4QR2y5IWbUx3wrKHMhyMFZ
	QINceboykyG0zKk6268qdPNXvQNn9qw5DPUc8EkZWVUTThlAwXkN83LQfzYA5yYT
	P0PHZD9M7PSH9Yyb5zahu5a9/vEkNhjVH7rfRcsPJ6/H+bZE3nBjVTcA25G3Ql+p
	Vm/7zQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6k3e9r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 07 Aug 2026 10:05:57 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ccb6823efcso30003565ad.0
        for <linux-sound@vger.kernel.org>; Fri, 07 Aug 2026 03:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786097156; x=1786701956; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q8nuOJzW+TPseumqr2G9zfr4l4ZosAXff19ht42hACc=;
        b=TzJ5faKpK7SztT1lRBkAMT+Ra7mrQka61ng9BvP+qW4OcYqFTSNgshbKbAefQiHmTg
         bYsrdfBf0Y7jc7cXZa1j0Q/7kv3I+rxnk3+1bRYNxikbe1zBzaT89e5EOzzxSu1kWE2+
         +1Uzfod77tPXiG1FitfJ94XN3f/oWa1DMBnhE7a44z41040/dhbyC2jB5b9kfq7zbdAU
         OLiK6cr/+s+e4CWGwec4asAGFyzX2BEFu7Ez1DbYOzacWJUTx7LeX4x+f3cdwfCkdNCx
         TlxuqpSESqq08IajMNxzsFUH/ZE846LkOE7mMu85JDWVOAHorQqqQukQA3yFjy8NyFsJ
         5/Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786097156; x=1786701956;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q8nuOJzW+TPseumqr2G9zfr4l4ZosAXff19ht42hACc=;
        b=rMt4AakSmXb+qXIthOfzaJS5ODVV+hU+Sx8jjr8hrqxchMzsq8W43ZStPxcuAF/eaF
         eG+OspDm8SK4hE00gJnHUIQyXx/AQrNbG6E0R1JrMFXzm8sZS3/129t3vwRWyF+3Shyr
         qMB0eiQHhYFFRmuN4itsIy3o7fLcO24RbWsXTXK36bHzy3vCrybIfy5Ldxa34wtG1g98
         eeTJN/+AJGKhvJQyXV+bCPvSQN0Q0f7Iw0JYzRMPNtyIWfWA/LOQU6e6ua7WJqkcrmV6
         TPmBu+xsa7/DG8SuFnFVRLCuIO4YyLsyWcWv8FX/kYXTZcC+pAc6YEGB7p1MBbi8vEtq
         m+Kw==
X-Gm-Message-State: AOJu0YxBOsGIizgEjt/ukaHsQc445h2uBKm5/+4muO0vgUb2/PQgFq+D
	kCajuf/K73YJXXySvpQ6HXb0eSbmmEbIPHUGH0UOCk5kigkC+m3XwDyTeBdsoF/HY/6czZLX+oO
	R0SC5aQr0TgyNVCgr4X2/2x3KG8k+kFwYsXRk7qetsXMwDRbZWyguQqKBpU5K/n9RZg==
X-Gm-Gg: AR+sD11KwLBrPOeuRzw1Ob3ZQuirlVnsadGtMysm7N/cI8x3qpl+5qgf/5s8wTJItcj
	/do+9rE5q/DmdLy8WtIIrDjESx7N8L3JoGWhbELbVWah7RQQV776Ec7JmLZPuZ3CUNiYRziPE7n
	MZbQb/nytMGX+L08zrZHPJU6crdFVmUINlv6NR2nithIeoEvpucY+Y54ThQF4DJ9FeKDg1kXicl
	PVvDENEJR0toUzGkamn9iui6YASuuZ2F9BU1qpwOKLmtL1ylLX5QYY8b/N03Fb1BF2LBqRj1UA7
	onYRLLDacyBagjpQMp2CeViXD+Md4q0KIHuzx7iFiCjlMFHRhtLsXoRs7nOkuY9PzfpY0TGWZll
	X3OO4a6C84ApBRmuLyK+HTlSrUnx1OO8DP5vqDiQ=
X-Received: by 2002:a17:902:ea01:b0:2d0:8b28:517c with SMTP id d9443c01a7336-2d0ca712ed0mr225824565ad.3.1786097156580;
        Fri, 07 Aug 2026 03:05:56 -0700 (PDT)
X-Received: by 2002:a17:902:ea01:b0:2d0:8b28:517c with SMTP id d9443c01a7336-2d0ca712ed0mr225824045ad.3.1786097156142;
        Fri, 07 Aug 2026 03:05:56 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d14d57fc23sm6650515ad.31.2026.08.07.03.05.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 03:05:55 -0700 (PDT)
Message-ID: <07f94571-ecd1-40a2-b47c-a732cd439b54@oss.qualcomm.com>
Date: Fri, 7 Aug 2026 15:35:51 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: qcom: sc8280xp: configure codec sysclk for QCS615
To: Le Qi <le.qi@oss.qualcomm.com>, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com
References: <20260807012450.1038180-1-le.qi@oss.qualcomm.com>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <20260807012450.1038180-1-le.qi@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RpX16imK c=1 sm=1 tr=0 ts=6a75ae05 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lATBp56xj2U5aXaEndAA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: RjSoXlMlpERDy61B5wGx7WEzeYj44ucS
X-Proofpoint-GUID: RjSoXlMlpERDy61B5wGx7WEzeYj44ucS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA3NiBTYWx0ZWRfX0iaKtqqzkzCB
 noQv2hpfiV3LZy3i6d8zh43Y3Iw8RTge6rqS+62gHXSK/8EuoD8m7Ej/PIsBU5ouD5E92GTL3CV
 DJ00Jnu6DuG/LuRUhxE3vSr4CrrSTn7i7B8YJCJDLaTihb0xL4L+5QM/LgXXSq2/qsfC0dtl7/s
 dogXArc1xUFjV7mkoaW3PKKDaG7dD+sAUeLZs+9mV2C6h6/GQi50NkNmgBt/uQcY9UoIJW+XTYJ
 VtroTLnbmYSZfHuQH0na2cN0CsYNP/F5tNtP03DUiUW2QryRb4ZtOtsNEMxYTfBj9MV+JQVG47K
 EHProtOVwfjfMxopRIxoLeO/eKiVWW3NY6gciD6kBDuCetNPkoW+5ia3Wfzq3pgz4BMCNc/uOgz
 o3ljeJ1Ssu6YVf2AlH4CIt8pq+1Y4jlST5sGKdraRvCEUV+x4zWPMffOVoV6ik1Zc3IgAo/BIV7
 zqIahl4VKe8UfcmCS7g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA3NiBTYWx0ZWRfX260d2OUpBHDV
 9wIN/Vmt06Gs0JBLPnrUOilQcPcg91N64/yjODNumhk6i25IOF8kkPEHfKTPtMPb666FaqOEoUs
 GZv3t2d4sQss+7+aHhduR06WVjacYtQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 impostorscore=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608070076



On 8/7/2026 6:54 AM, Le Qi wrote:
> Continuous high-amplitude noise could occur in the DA7213 microphone
> capture path after a Bluetooth out-of-range/reset event followed by
> reconnection. The noise was present in both the raw ALSA capture and
> PipeWire input, confirming that it originated before Bluetooth
> encoding.
> 
> The codec already obtains and enables MCLK through its DT clock and
> bias-level handling. However, the machine driver did not explicitly
> configure the codec sysclk during hw_params(). Enable
> codec_sysclk_set for QCS615 so that the DA7213 clock source and rate
> are configured before the codec power-up sequence.
> 
> Verified on QCS615 Talos with repeated Bluetooth disconnect and
> reconnect cycles. The noise was no longer reproducible.
> 
> Signed-off-by: Le Qi <le.qi@oss.qualcomm.com>
> ---
> This patch depends on:
> 
> ASoC: qcom: sc8280xp: enhance machine driver for board-specific config
> 
> Link: https://lore.kernel.org/r/20260727151230.408122-4-mohammad.rafi.shaik@oss.qualcomm.com/
> 
> The prerequisite patch introduces qcs615_priv_data and the
> codec_sysclk_set field used by this change. It has not yet been merged
> into linux-next.


Drop this dependency flag, as the change has already been applied.

Thanks & Regards,
Rafi.

> 
>   sound/soc/qcom/sc8280xp.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index cf272d0612fe..8d949e4dec5b 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -306,6 +306,7 @@ static const struct snd_soc_common qcs615_priv_data = {
>   	.driver_name = "qcs615",
>   	.dapm_widgets = sc8280xp_dapm_widgets,
>   	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
> +	.codec_sysclk_set = true,
>   };
>   
>   static const struct snd_soc_common qcm6490_priv_data = {

