Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4226748032C
	for <linux-sound@vger.kernel.org>; Thu,  8 Oct 2026 11:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791459775; cv=none; b=F6YPL67fTUuJZnAS9s4kEOkRfxXgO2stl7iGXHEQ/79BsKpU/WcjJPIF7+d90IGJAVkVBqg3Ln2MsoaN7mREbONhEIvet29TBb8VfqWPK5duwIi9Rtt5zrhCOpR/PUB1xAcx7pvKWdy2eRA06nhgUrPSYErNAVCQdkAkWZYkut0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791459775; c=relaxed/simple;
	bh=VTIEEDm8x+KKy+VmwZWQoxl64FVHkw1TFIhAMFeKchE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gjIgBcOc9S7yz7EWTFsXnS3Zi4uNheHzrXMDOdn6m2Ho8rLT0Ovg1jYixARj5AA3YpUiUGW73eLMNp3KmgTFGe89b4yffCrsdjLJUL0RnCYuznKzQ2PUk7eS+gaIQ6MCghI5SfhHcr5G2E8TarkIeEzEnQMrHftzrbH270Ce8AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=At1Jql3E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d3lR5W3+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="At1Jql3E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d3lR5W3+"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698BKCxI2604418
	for <linux-sound@vger.kernel.org>; Thu, 8 Oct 2026 11:42:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CjZbxDwM0WjPpEr48TjC2geEGFyibd9+X1oZ7NXBEZI=; b=At1Jql3EGdrWhOW7
	NuPq60MwP0gjrEGtwxAWWf68t5bnUtuFk2x2aOL7N/Gozfo0KvRnY3mCe5R2TsAw
	WorVmwJB5Cr0QabS6TT9dYKt0HasWXHER8ADk8h+iK+H6tZxYWNL1nlsW8ASvOSs
	rX2wc/ucoDS+JCKMgFpELxZNiU16nwCvoyIw9kHyDNWSPlIyf9yv5EjneiAMUxCR
	heUoR5yq81U8DPBeAeJue0D+vTu2ViXz2DuRxbVpBESHBarWMtiNXkpTzsO9xp0y
	7zeU9NtBCio2DkqClLdhf5toYm7cAjqeYBOezG8V7Xn0UIEXuwf6OibKw6+jC4mh
	1lDFtg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3jpqs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 08 Oct 2026 11:42:53 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd0b795aa8cso418988a12.0
        for <linux-sound@vger.kernel.org>; Thu, 08 Oct 2026 04:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791459772; x=1792064572; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CjZbxDwM0WjPpEr48TjC2geEGFyibd9+X1oZ7NXBEZI=;
        b=d3lR5W3+YTYAUXBNW7HmRSkjtqEWYsoS6Ou0wuVuS2BMaoqGuUCSrvjmElZt78+B8A
         rWmvD1zeGLrzPS0IXBp4Mi8Lf5Gou1P7/NV1M6LMFjI2BKerQCu0bXui9m5x4RNlwCQm
         ac2m3c1JkTc/FFFrbhbFH0VJJ47I/P72QTPoTXrUqTm69LLZJ7eYBqDO7x1Tx1hRDqvF
         1tywp3RkKJprOAwyWTOpAWzZ/2naRaMA+BnfkFCQN4GuxhwiyyyIVE6hcJ0SL4aa+Ho4
         t/Tr9IM2xWgu4+lY6T7+/F7un3iG44qeJKYnCBzKpQWvR6hMyv4BrygHFdTPo/BwsWoH
         9+yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791459772; x=1792064572;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CjZbxDwM0WjPpEr48TjC2geEGFyibd9+X1oZ7NXBEZI=;
        b=zNnp7OPQ2gnzx8HGxwBcLQw3zWqEgiqt0U/c99izBeTjg42L3R4bl8Smm35eYVYSv7
         oWaV02ik99Cx4hGSPcvfA2Mbohy0Ym+zEYAVrk0T/R2SI/x/tygQrSkwcgskOHxqHHmr
         noeeBEz41RVeCIXnWZhqCN2outNFdBUEvEJVU5CP2VTs/bbKjRjcm30YTtr6gJOu0MYN
         qPk4FaP2DKINpA1L9wsKMMnUUQ+T5y7MJhYnp/efOXhjgaIoLlofmjhYQJIkj3udWbs0
         hspJwoADevmrhiMA3OSLylbb3QhwOPrWpo+AcfpgIwmlZvFuH5KQjXQN+Hat5LNmZZRO
         khfg==
X-Forwarded-Encrypted: i=1; AKwUvBweQVDkO1VK6WNXwD4e2cyzpwBjbWsNeHLHWnGkrqOo5/76dFTLkg4MWC/M9BsP9xPVKJ4TdOP7MEj35Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYK77dd7TZYXrcNmuIF27g+ql07YpZRZHesEhhQZ7gbINi1XKd6u
	feX3e9a/h/stjoAONJ7xXJRVe9bqtxTUUcL3JZ1qrzFieFRkeTZEMzGOWHdfFowgixZ9+iUpHRp
	QOSnyMM2P9ojPw05s4IfZh01qgemgINV29DEK0mWj2ehCGeZsIbzkizHrAjw1Gnw8aA==
X-Gm-Gg: AYBFou2KUnt8hjPcSNVKYr99+2twiYAOz8Zeb1Q36LCgiBVoLh1rdpouAi3phkz36ie
	J3lJ1+bM5XbZV8aCyr9zJwHI2jBns9rcXJWHX0/mWhG7IPH76rMLpai0xvoBlmBLjoj+NeiJt4l
	V8kKdJBwTblLY+99Zlg963oKOcH1zS/mTY7MEQF2/2x+OOmTzl/3R+eYd9dvW3IHjS6U1N5IueX
	a00q/yg8wmNnWL2NEDzxB2umGQ4BQC1+XKDXsqWsaRTRWQJUARtbyX0SgQkMolJBeG17fHZWcxi
	q48Ls20hqO98tVMpNUFDKGmHMC2W8rbP+b2SqaEvs10lXc4oX8H+chTam7u3TETfJ3qqAS5vaiq
	SOvTTIS6FXxiaYBgyeqbuXz6h1eo=
X-Received: by 2002:a17:90b:5490:b0:3a6:d2ac:74ce with SMTP id 98e67ed59e1d1-3aaec84421fmr1220462a91.19.1791459771662;
        Thu, 08 Oct 2026 04:42:51 -0700 (PDT)
X-Received: by 2002:a17:90b:5490:b0:3a6:d2ac:74ce with SMTP id 98e67ed59e1d1-3aaec84421fmr1220424a91.19.1791459771026;
        Thu, 08 Oct 2026 04:42:51 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3aa0cc1fbb2sm3776475a91.17.2026.10.08.04.42.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 04:42:50 -0700 (PDT)
Message-ID: <018b4233-8a2c-48b4-bbd6-4c471dd14568@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 17:12:43 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/14] ASoC: mediatek: mt8195: Fix paired memif clock
 error handling
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
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        ajay.nandam@oss.qualcomm.com
References: <20261005110257.50145-1-phucduc.bui@gmail.com>
 <20261005110257.50145-6-phucduc.bui@gmail.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261005110257.50145-6-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NchzRGD4 c=1 sm=1 tr=0 ts=6ac781bd cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=JvgeKo86Odfbx7RWJVYA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0NiBTYWx0ZWRfXxc1B7GV5+Yv/
 4gFD6y3A3DDpKy7jMZI/g5Q95fMY3viKix/patKOCqG0vnRDuJj4zPCs/Ch87p+5mlH4EeqnN2f
 KZVRnUzFp+ywgxY/uhyLoNVgQAh2LEU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0NiBTYWx0ZWRfX2kfKQuhUoMXA
 YSfmQ2dw4ixKmT325VvrmL7lwjWG2jh2n8cHgvPvBy8zz2cE2K5ayJ5HKYhC7vnJqUk3f4Pf0Nh
 xmZKHtM13oGCHpSHH/kGyKtosZ0jKQO1VDyz17nxIVuYqO8nzv7Tz5VI1pBcX0Ys4c0rWTawjpn
 8lyd0UezTtitOkRoHOIAWG+bFEfozNIsbEfroZSc3QvkTStA/tYEJIvMXZl+aUkQZ9KBGksm3D6
 E/jre/TcFSISopDB7iUfXg1D9shsii1v9IXmGNLhJFpHHjkb2/FgKI8w9z1L6MvBI/R5Dqo3F7a
 dl8m7Wlhu6qAxyjMcTHxDkF7HawgKbCkiyOvcqtFp/EE34y9vJcHuCLc1yyQEx4W824jqD1B4o/
 0faxkh5k6H/gI7NoohKP0seOxsButjgiWwQOh+GH3XA8BTw2hlsWFWNPeGpSYjf2vbB0P7xKZ3u
 aooULqCIeep+y+NDrEQ==
X-Proofpoint-ORIG-GUID: QUzNBYPAQX3YifCtNbVOFHxD-PK69hJi
X-Proofpoint-GUID: QUzNBYPAQX3YifCtNbVOFHxD-PK69hJi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080046



On 10/5/2026 4:32 PM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Check and propagate errors when preparing and enabling the paired
> DL8/DL10 memif clocks.
> 
> If enabling the second clock fails, undo the clock that was already
> prepared or enabled to keep the clock state balanced.
> 
> Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>   sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 24 ++++++++++++++++++----
>   1 file changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
> index 52c3381e6766..1d3e01e2c3e7 100644
> --- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
> +++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
> @@ -286,15 +286,23 @@ mt8195_afe_paired_memif_clk_prepare(struct snd_pcm_substream *substream,
>   	struct mt8195_afe_private *afe_priv = afe->platform_priv;
>   	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
>   	int clk_id;
> +	int ret;
>   
>   	if (id != MT8195_AFE_MEMIF_DL8 && id != MT8195_AFE_MEMIF_DL10)
>   		return 0;
>   
>   	if (enable) {
>   		clk_id = MT8195_CLK_AUD_MEMIF_DL10;
> -		mt8195_afe_prepare_clk(afe, afe_priv->clk[clk_id]);
> +		ret = mt8195_afe_prepare_clk(afe, afe_priv->clk[clk_id]);
> +		if (ret)
> +			return ret;
>   		clk_id = MT8195_CLK_AUD_MEMIF_DL8;
> -		mt8195_afe_prepare_clk(afe, afe_priv->clk[clk_id]);
> +		ret = mt8195_afe_prepare_clk(afe, afe_priv->clk[clk_id]);
> +		if (ret) {
> +			clk_id = MT8195_CLK_AUD_MEMIF_DL10;
> +			mt8195_afe_unprepare_clk(afe, afe_priv->clk[clk_id]);
> +			return ret;
> +		}
>   	} else {
>   		clk_id = MT8195_CLK_AUD_MEMIF_DL8;
>   		mt8195_afe_unprepare_clk(afe, afe_priv->clk[clk_id]);
> @@ -315,6 +323,7 @@ mt8195_afe_paired_memif_clk_enable(struct snd_pcm_substream *substream,
>   	struct mt8195_afe_private *afe_priv = afe->platform_priv;
>   	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
>   	int clk_id;
> +	int ret;
>   
>   	if (id != MT8195_AFE_MEMIF_DL8 && id != MT8195_AFE_MEMIF_DL10)
>   		return 0;
> @@ -322,11 +331,18 @@ mt8195_afe_paired_memif_clk_enable(struct snd_pcm_substream *substream,
>   	if (enable) {
>   		/* DL8_DL10_MEM */
>   		clk_id = MT8195_CLK_AUD_MEMIF_DL10;
> -		mt8195_afe_enable_clk_atomic(afe, afe_priv->clk[clk_id]);
> +		ret = mt8195_afe_enable_clk_atomic(afe, afe_priv->clk[clk_id]);
> +		if (ret)
> +			return ret;
>   		udelay(1);
>   		/* DL8_DL10_AGENT */
>   		clk_id = MT8195_CLK_AUD_MEMIF_DL8;
> -		mt8195_afe_enable_clk_atomic(afe, afe_priv->clk[clk_id]);
> +		ret = mt8195_afe_enable_clk_atomic(afe, afe_priv->clk[clk_id]);
> +		if (ret) {
> +			clk_id = MT8195_CLK_AUD_MEMIF_DL10;
> +			mt8195_afe_disable_clk_atomic(afe, afe_priv->clk[clk_id]);
> +			return ret;
> +		}

This makes mt8195_afe_paired_memif_clk_enable() return failures from the
paired DL8/DL10 clock enables, but the return value still appears to be
dropped by the trigger path.

After applying the full series, mt8195_afe_fe_trigger() still calls the
enable helper like this on START/RESUME:

    mt8195_afe_paired_memif_clk_enable(substream, dai, 1);

so a failure from clk_enable() would not be propagated back through the 
DAI .trigger callback. Patch 6 handles the prepare-side helper in 
startup(), but I do not see the enable-side helper being handled by any 
later patch.

Should the START/RESUME path check this return value and unwind the 
trigger state if enabling the paired MEMIF clock fails?

Thanks
Ajay Kumar Nandam


>   	} else {
>   		/* DL8_DL10_AGENT */
>   		clk_id = MT8195_CLK_AUD_MEMIF_DL8;

