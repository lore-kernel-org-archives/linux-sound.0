Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416A7466AF1
	for <linux-sound@vger.kernel.org>; Thu,  8 Oct 2026 12:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791461037; cv=none; b=uELRrgdnCwfR7wjQ3ZMp6TitHZPjzzFPIp7Apl9XHQ4YfB6frATj3/IiCsVLzrwmNwk/0v47dY58DEB2mKlFmAGlRAD3fjqKXdIqEobmfoOBbZ1kMqKJTDnD8eoHae0l3DuMbACzHl5QSeFYJ08yLxihTCZsVTuTPq6en3SRACs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791461037; c=relaxed/simple;
	bh=/Zdcwly4bpuwYHi4pwV6T6GnqST2wvug7GVi7XeY5xM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M1bspA1QjGogr+f10cUt9IzVZZA3qHyy2ZmjZH8pkBES9UDlJgCfDISC8csrjSc8H/rtdX2oKWRpetM1zA6BVeZxZNPl0u8r8ek6J+PR9FIGVZlY97uAK2kSODibjYG1psqwoffzXv4NUMDsGyTYfre7nfooseuxim9Gy4SyKAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZB8HrEaF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ydw5Rbva; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZB8HrEaF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ydw5Rbva"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698BKDgF3733277
	for <linux-sound@vger.kernel.org>; Thu, 8 Oct 2026 12:03:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IZKv9cqgH4HTSKDf2wA9wGyhNJ6KF/zvEMsfNsfC2i0=; b=ZB8HrEaFAa5wL3qp
	5OwDbl0eAnpOsGCz0KS+PUlQC9X+zwDXXT8/Ypq/hRXKNAT3kVv26VPPpLubgizT
	5/Cz/MGvgQl7MPjTnIHXVwavRGsNVpVvnuduiQcOCarMI/H1AykaoadZLY5WWyjf
	2FmBkPDWvOiNekarQnVrljgOSOfnfjKyCxI2FsNizaGl8xWQsQZmPjeYe2LL5Xt1
	QjLqXmI2ZyWTtnA9JOVhOnkyBzPkN5lYanvustmEOoceXLsawXLN+IoRQePvrtwb
	8jZAtBACYiyarf5iQDdccfYrqzsdU08vZkKGJ1RV3FFYzVXCOoSiRBEBovuJMpmY
	3pXc5A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe6atfk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 08 Oct 2026 12:03:55 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3965ba1ba3eso6571087a91.2
        for <linux-sound@vger.kernel.org>; Thu, 08 Oct 2026 05:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791461035; x=1792065835; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IZKv9cqgH4HTSKDf2wA9wGyhNJ6KF/zvEMsfNsfC2i0=;
        b=Ydw5RbvadaQLi+ZGjAMtdjafyiuIpn+TGKWvLaT5zukKZgEK73200ObfZxCb3CprD+
         iqyRA9kmkMHRV4ZvL2N3tk59eD+nlrz6rpx30dT7JOVlKBULYgJdZCTkMx44O9sluh1Y
         kRZ6eSblkQPCtGztEN/kDJOKJjFQwHRfRSKoIABETgfyahRXmGHZuB+RrakcOSLnnYtd
         ngfbKXJFro9bUPBCNNdH1HZkPNAEyGY8+36iX4V4z1euolJfrKnbRYzlplEbsc9a7V+e
         LhYYN6g2Hecdm6SMTlE91eTRYE4mPLt8GRCpfWY7Sp76bHoa+s9dsclOZJXPem1+flSY
         8JTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791461035; x=1792065835;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IZKv9cqgH4HTSKDf2wA9wGyhNJ6KF/zvEMsfNsfC2i0=;
        b=jVtqRqUyVXSn+YcguurlLJz6w/VDx4urP00tB0Hx6He+8kTNqHUJafdyrFLlgbXs+/
         Q3Rf2ik6aAMWPuZ1siapEBe1/lRuOO35Rn52rZ5+4xNnPd9I4DWbdnwTSL+Gn98Fnau3
         NhxDQboXQ+5nCiVBVBpXwRJLoTYnVOiF9f1wsBDF7xBawPPswPq3JL0Ixvt36QNezPii
         SYCS6SOeDn8BtUUPzsB7vfGjYcgMcFBI492Nzw0Tbr6wRy5JEbvtss9GrZU2zfeX40Hc
         H2gLwYhsaxGIJ1dYvcvzO8IqpdJT1ubotr6JSX6B1OUipXH8k8fcUOtTuqTw39wA4fg/
         G4qw==
X-Forwarded-Encrypted: i=1; AKwUvBxvLjETJAcUS+WJnYe13coAEsUhLGPmOh1JlA+YGPXAwK4waqhIQYc/94bPsg4VggGNG4kd25T7akAU6g==@vger.kernel.org
X-Gm-Message-State: AFq9FYKZoMQbKkJMNYmMSy0nk6yfbxuBnwXfTi4qsqzxa9gm6Dw+Kuvf
	fC/JkzsvH09IpxTLRd40oqZX4ZUl6N9SH7ElgHPDdd18sBMLj0iO2Z9WA+x2U1qP5S1P5lubzlA
	cTPxzrxT0kCVeQvVyU+OE/B4GOsnJdDq/f35RLl9WvRlZ4PDXeh6zZaHwL2dmIw8RJA==
X-Gm-Gg: AYBFou1x6Nos0txRJlTQL0ABWyOD/BfODBIe9P5VFbne6U0s6vO+q6/BVbC7PGP6D1l
	H9nw2LIDPF/VQ6CVSI40tTwRu8dUtpB0Q0W36jRB9pdY1BTbH6QVfhccfbSm5K9FnBbCIOcjYsO
	1m93iNWNxhueWehqF4u1uMJfhxKBFCribc0s82jOCL02bGNZZ7vPrkSdT5ybd7DCkwWCJm3aQss
	5rp2AyRI3QGfCwVMLrnzHo+Ur20jIDx+wcTRUSVVvw/ToUxr5ZEuCKuE7fDZiBwQnPbrwsG3hFJ
	OdkCTYSArTpdXphsKTCjtuxV7t8sfzSitBPI5Fq3n7LB9jlwVj44W13jJtfQ6vrymfeON3Fp8L0
	oP14EnzPDlfsQSOhVTITR+RHolaI=
X-Received: by 2002:a17:90b:4fd0:b0:3ab:188b:c5b2 with SMTP id 98e67ed59e1d1-3ab188bc8efmr396401a91.49.1791461034790;
        Thu, 08 Oct 2026 05:03:54 -0700 (PDT)
X-Received: by 2002:a17:90b:4fd0:b0:3ab:188b:c5b2 with SMTP id 98e67ed59e1d1-3ab188bc8efmr396354a91.49.1791461034281;
        Thu, 08 Oct 2026 05:03:54 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd0a9ba4f24sm2810782a12.23.2026.10.08.05.03.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 05:03:54 -0700 (PDT)
Message-ID: <24ffbf82-adad-4153-a2b9-f2123189c722@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 17:33:47 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/14] ASoC: mediatek: mt8195: Fix clock parent error
 handling
To: phucduc.bui@gmail.com, Mark Brown <broonie@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Trevor Wu <trevor.wu@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        cassiogabrielcontato@gmail.com,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Liviu Dudau <liviu.dudau@arm.com>, Haotian Zhang <vulab@iscas.ac.cn>,
        HariKrishna Sagala <hariconscious@gmail.com>,
        linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261005110257.50145-1-phucduc.bui@gmail.com>
 <20261005110257.50145-15-phucduc.bui@gmail.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261005110257.50145-15-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: HQl30pw8II3e97pmZVl4gfR9lQbHAEge
X-Authority-Analysis: v=2.4 cv=HcWB3SE8 c=1 sm=1 tr=0 ts=6ac786ab cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=gEnLFtKB0XLziNsE2NQA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: HQl30pw8II3e97pmZVl4gfR9lQbHAEge
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0NyBTYWx0ZWRfXyM9s0S1+M+E5
 1uso0DTh/brBPJRnI27rbDJar7JotLnEMhfdYLAx6FR+MtaQUFscJRdKMlXZ1Fxh2+2Gvu2+IW7
 Pd0R0Y4lFyEB1WS0DGVMZHauSw0KtYLBstWA+uBDwkMvlhSBW+MTwyr12axRJIvAX/MC3NsEUst
 mqE2uwAzOWw1UG5YHtSwe7HAO/NtlGMyjqpJFVQMzdOcCVzqilG0Sw34eeCZGxjo9WegeLMfA2r
 dUlbrRylMpwN1z+F27H0w+ohvaFifStPGb66jjgWqPQzIsDCgiaajI70RmCyjUkVD4356i/QViK
 Zjt3yqHHi0S3YPlymHUEkH+BM1RqpYWr1/Zvg56uEmtDwkIru+KxVXXPtpbo64vfgBSmUqHw+gH
 7bi2pbBoqAJJ/AnMc+uYlQEybMZ2HjPkZkXSZDJGLD5Vadhmni1pDP0ai3b9aOnVcEL6APVq0Sr
 P2L/dlnRGxm2QOoFqGA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0NyBTYWx0ZWRfX6wxPS89JDBpJ
 X0ACDV/yu8bVMfFGwBC64OOApm6/D/BOiGO+QViVj3gzubCdbvJl0Z/TeddgnACXbsEw8JMTNFi
 5BZb7e5v6AYq/hnPlxAcYrYxrrKSQUI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610080047



On 10/5/2026 4:32 PM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Propagate the error returned by mt8195_afe_set_clk_parent() instead of
> ignoring it.
> 
> This allows clock parent configuration failures to be properly handled
> by the caller.
> 
> Fixes: 3de3eba588bb ("ASoC: mediatek: mt8195: support adda in platform driver")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>   sound/soc/mediatek/mt8195/mt8195-dai-adda.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-adda.c b/sound/soc/mediatek/mt8195/mt8195-dai-adda.c
> index 94abde15ea09..8a58a142064d 100644
> --- a/sound/soc/mediatek/mt8195/mt8195-dai-adda.c
> +++ b/sound/soc/mediatek/mt8195/mt8195-dai-adda.c
> @@ -262,9 +262,8 @@ static int mtk_audio_hires_event(struct snd_soc_dapm_widget *w,
>   	default:
>   		return 0;
>   	}
> -	mt8195_afe_set_clk_parent(afe, clk, clk_parent);
>   
> -	return 0;
> +	return mt8195_afe_set_clk_parent(afe, clk, clk_parent);


The commit message says this allows clock parent configuration failures
to be properly handled by the caller, but I don't think the current DAPM
event path propagates this error back to the operation that triggered 
the power change.

mtk_audio_hires_event() now returns the error from 
mt8195_afe_set_clk_parent(), but the caller in the DAPM core is
dapm_seq_check_event(), which is a void helper. It logs a negative event
return with "event failed", but it does not return that error up through
the DAPM sequencing path.

So this looks like it improves error reporting, but not actual failure
handling/propagation. Was the intent only to get the DAPM error log 
here, or should the commit message/code be adjusted so the behavior 
matches the "properly handled by the caller" wording?

Thanks
Ajay Kumar Nandam

>   }
>   
>   static struct mtk_dai_adda_priv *get_adda_priv_by_name(struct mtk_base_afe *afe,

