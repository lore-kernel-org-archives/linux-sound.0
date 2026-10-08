Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FBD392C46
	for <linux-sound@vger.kernel.org>; Thu,  8 Oct 2026 11:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791458604; cv=none; b=tc1PAZP+fed1TJp7YdHHLJsv/Y9eAazXKrFuUVSFGJFVFHk/Vy1L3y92PYsmNkFOfS6PzSw87QJxZSGUMO0Omvx6CKwSGZ3oie3mt/bsqCXR452eGP8Vw7AM7DzNZgbs8ZLv+uC6vZFJrtBqiwHBG1ByUdt5xGP3z69PSr2JFkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791458604; c=relaxed/simple;
	bh=1MXFfWSFch0oZCCDVrQKuSZj39a0kkAvGe/j7kt4CJU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qDUQB7cC+hqWsnaA/+eW2wzabo0aIxyOjmh1/DkI+Jn6T/AIinLvqxLIz+mDS7+MHURnMN63CHGt/IIthPJEvZenrJNwqL90gRtPjW/VWOmowobDg2gxC87vO/OTIi9/zcdFwuZckDB+ck7w8zVQs4Aa5chO6hBTmJpHKdHM1ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VjHjNCFE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C+J8whKb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VjHjNCFE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C+J8whKb"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698BK7eX2705105
	for <linux-sound@vger.kernel.org>; Thu, 8 Oct 2026 11:23:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OFp4V6SKAU1XN9gI7+cVTXpRsxuFNLjU7XndKESAotU=; b=VjHjNCFEpz2ijCdu
	HWpKMMEfNmoXuKfLgB4mFb2PXcZ/QkvsW4sWU9+AGlaa+DTwOOyDpkh0fXiqgMTx
	MVdLeT+VzcqhvZTrOzAaAOeEmyefHZ/B4TM2bQybvFKYsl/FBIg58Pq6dwmxAbaY
	kg5VJfzLTwmANbbiHSSAVccKp3mrC/JdKyIVcEDgVWxs9oT/ABj98+96atHb/mM4
	valAhFMJvqcXcyeEQR1CYipzUyWtESOQ/skMNnXV158o6BTJj0oMb2DotzLi2+es
	DJCNIc/6Bzz7is4ckqFaqDJKYr+brUJyAYzA4mjXdImRrNjtMArkmtXFvRbUA4zo
	xdprLg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2trsa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 08 Oct 2026 11:23:22 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a46f0f158dso650016a91.1
        for <linux-sound@vger.kernel.org>; Thu, 08 Oct 2026 04:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791458602; x=1792063402; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OFp4V6SKAU1XN9gI7+cVTXpRsxuFNLjU7XndKESAotU=;
        b=C+J8whKbgamBz37cD1jX6RZGOwfA2BepJnSc4QoQLlL/S95ig3hMoybfOPoyvHsLId
         0Q8R8zUKjrO9rNBlYS/glWR6p7DQxV7naxhmHDO5CpneugENyoLv6xBEgEg/Yub3jARq
         KaJUZY4F3ucbNwXasIlEIkExR6OhMsYEFBswLWEShmuj4ZQrJNgfXbQHMYeUcoRnm7++
         qd41aWfTBaVFGjecFBYROaGIyHsOXxiFpx+rTGLUVBqcSJObiJEb5GhqA0YnGw7o/Mxi
         dUIMEiqyUxluB33TppGTYMbCtRjx3Nyef9BRSgy6fblm5yv4r1e2TGPkpJYKE/lZM1OK
         KI7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791458602; x=1792063402;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OFp4V6SKAU1XN9gI7+cVTXpRsxuFNLjU7XndKESAotU=;
        b=AtInChNpCgfDVOf01/sD6A2TISnIS1sKX84qPTRvefIhWHZOyR80x4oev9VNwoLYvh
         UsCrMAH0DhgXop2EAezEIO5mbpumiL6tVN6RXZTH4BPPOqEM0g3ZPNsl8inrkABpYQKC
         5R13zeRG8cDRnEAZ1ksQfqrW/VR6yQT7HZx67f0Krz/uoQqOS/7Xf2/QIdPJJu2UXVhK
         liAwwuL9vngXToZcbLG2E9WemwQ8ryMMsl5XdN1wh8qiK4NHsBmlms0xl6otXM3A7aoL
         jW41VK/cxDw7YlubXSTcrJYSU4BHdVVrTX8aTvuD+fugnaK1MFiuGifSOtIN20OdXC4S
         Dfcg==
X-Forwarded-Encrypted: i=1; AKwUvBy/PYAjGB1D9kzK0JWD9xyUb7PMdlNez9DWdsKzfdANMXuy2zSh6K9aMoPZMBIdueNJfqtf/WUmz7sJoA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIO/zrbJtXhSX8hnP/LdXX9c7UdaJsm29pfWf4NYys1qs6qJH36
	VUWqO3pZbF7yIYxAmcXqBDCf7TqXIYZ6jEQD4Kqi6Cj52WipUP3EWJPJB9czXnVIT/RJlzkOiNX
	VcuS33w/cHz0xBzqULuqcgL5kHj56GNTbpgRoyTbQxoXRr6cJ5zPMf5/bqpwYm5ShDg==
X-Gm-Gg: AYBFou0snnmG20ePXXjAo7mpUeOCkky3wUif5MDB63ALLVKvqZmSZXPyAx7DZdjDtD8
	4dWl2M6J7rpJkn6pPbwb5T1szIUEGlv5FGglLO/27Ycn+3qb+dJ48ZEFSJiFTVEE6Jx8bN30v6c
	5qfQxfTnSumHhQ24lab6d3+uf/Dc5xM1m9didcafbPOIjZj0fwhSYr2Y3NPrMrIAWmoAOrISWs4
	kTRp/TgqQKmBon7aZlrMAtc+DBUgimaNmWy3DNd663UYSVzR3Ct6fznxfesqZw4cwnj/35O2B1Q
	c8aW7CVZZhnEXhFNwsUv54ohlcvV+BRqNFh4bQMykbn+WLnt5bpaxtk4ajOVl79MLa9PGUbNP9O
	a3eIAltKOZF8huApCD58O2jMDRmQ=
X-Received: by 2002:a17:90b:5490:b0:3a6:d2ac:74ce with SMTP id 98e67ed59e1d1-3aaec84421fmr1191041a91.19.1791458601617;
        Thu, 08 Oct 2026 04:23:21 -0700 (PDT)
X-Received: by 2002:a17:90b:5490:b0:3a6:d2ac:74ce with SMTP id 98e67ed59e1d1-3aaec84421fmr1191015a91.19.1791458600997;
        Thu, 08 Oct 2026 04:23:20 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3aa0cbc4f08sm4001995a91.13.2026.10.08.04.23.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 04:23:20 -0700 (PDT)
Message-ID: <07d6b3ba-3d1a-4300-b8f1-66253885311c@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 16:53:14 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/14] ASoC: mediatek: mt8195: Use dev_err_probe() in
 mt8195_afe_init_clock()
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
 <20261005110257.50145-3-phucduc.bui@gmail.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261005110257.50145-3-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AbMkjHXG c=1 sm=1 tr=0 ts=6ac77d2a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=U5QAfnhbshI7i7es_x4A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: yrOEfSIoi02sVJ3wLHrHKZazldg1zfq6
X-Proofpoint-ORIG-GUID: yrOEfSIoi02sVJ3wLHrHKZazldg1zfq6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0NSBTYWx0ZWRfX6/l4HQOsr0JH
 s8CMcvDDMB/A8K9FU4Nap4y+3wmcK1KbSAdI4wg8P5aM4k7uq+HLPt4iZaL2fjvDZ8XzefT3DX/
 1djofJCIgIy+s3BEmkBTJIhMkEi4t8M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0NSBTYWx0ZWRfX9Bzp6h3PZec8
 bxFbLFdhUl/7FQAPGLSRi1GV1RKFljwmVnymzi9Ck3N8zBxYRZvEE4qtiElO4cG5SPkF58ghtUO
 6VxkQkaSLrQGDxIIRW0ltLYLnzAXPP4TLVl2LIWNirPJ/0gjM/LEYDAbPmpOz1CG0dd/pxwulkT
 B841ZkdO08EcWrooYdtQWrB0uLUsy+nC7alWxKKNn5SJeO3KcJPrhL5AQuHuKaea6wmD5a14ELe
 fk+cki5LpmVeQ8xjsskYsqd2vllgMrjz7sJfkr2dBXbU6br0pX0JXQuTJIuPSGAiWg1TWWMqLNU
 OuSvNaAns64NNBS0yO+TePk33o0Nbs+TPdirc7CSkRAK1CFkfs1AJHI3/f4zyeLISnQzAoauA2/
 4wuMUMBVzC/kewVg+SJhaPevIiBfXVc38+iQtxga2N4vn186HlAIEaYiAiV7F/GaZ5tzdYA7vx2
 EDIz20zULtv45FBVl8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080045



On 10/5/2026 4:32 PM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Use dev_err_probe() when obtaining clocks to avoid redundant error
> messages, particularly for probe deferral.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

LGTM

Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

> ---
>   sound/soc/mediatek/mt8195/mt8195-afe-clk.c | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
> index ec1ea5b988ff..12d8159338be 100644
> --- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
> +++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
> @@ -397,12 +397,9 @@ int mt8195_afe_init_clock(struct mtk_base_afe *afe)
>   
>   	for (i = 0; i < MT8195_CLK_NUM; i++) {
>   		afe_priv->clk[i] = devm_clk_get(afe->dev, aud_clks[i]);
> -		if (IS_ERR(afe_priv->clk[i])) {
> -			dev_dbg(afe->dev, "%s(), devm_clk_get %s fail, ret %ld\n",
> -				__func__, aud_clks[i],
> -				PTR_ERR(afe_priv->clk[i]));
> -			return PTR_ERR(afe_priv->clk[i]);
> -		}
> +		if (IS_ERR(afe_priv->clk[i]))
> +			return dev_err_probe(afe->dev, PTR_ERR(afe_priv->clk[i]),
> +					     "failed to get clock %s\n", aud_clks[i]);
>   	}
>   
>   	/* initial tuner */

