Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C80436BF4
	for <linux-sound@vger.kernel.org>; Thu,  8 Oct 2026 11:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791460262; cv=none; b=BmWTob3mAiDfer1NcZV0tqCeWLLfKdc+BfpTdDhCGh0GDSdfso8L1OeBp+cUkRdAsFFtn5b7oe4LiXKGgRFpbyeCcEjFWFqZaUo/uW2nAOZupEM/5uGp4a2BBGr25jv9/w9xdhBMfXe7sgrwNNDveoLWJ9MQcEnk8c58rZgjGmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791460262; c=relaxed/simple;
	bh=zEBx508/RQcpNMZV46M+QMsQvaYOL2nukMD6OutAkt0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qPMVbSjkflPTPVvjMe0sxD4McPDOtBLbjQVsJpdKjAqBaOBbc3tG8LroN8Ig1zeT/iLgrG2vGikoPVZnv/pRZyrQjOVgnuIkDeAPnn+igRkH9vARnQlN1HULD8nYko4g0oZNni9LqngpcRU2qMs1qDKbSyAZ+F1JbfhdMsJ1/bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fUcqI1O/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YxPYgFtv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fUcqI1O/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YxPYgFtv"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698BK54U3732924
	for <linux-sound@vger.kernel.org>; Thu, 8 Oct 2026 11:51:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dERFh+6tgQKI7QA2ghVyFA6Snc4VzECI2TsSXb2K9k4=; b=fUcqI1O/4rl7SyIx
	NhvkJS+F42bLnU8/JqymQMwotM2ZGA3Bv3GJEabhst0ap0I9ZyiPdqo9RwxmsHAf
	RG1uyKqBvm9IJ31XbftFhTJFYMKMkn+KUSIzZkoI5sO8LEA4z9hoEJ0haBXRMI65
	bWQSqIBFcPYKU7+6ZwX6R4mThDR5kBs9FzWRo+uVyj9gKJ+tdnR91G9OfVXCEeOp
	ULj264Da5qCYqdSWVE2iHUc/9Rs2p2SraB2dlfw/pV0O48FI2hiV/nkBF5A2rQnF
	ddYbUzLNV+A5+uKm3P0EAs8NEG6Bp4voHyTEjunTlkbHW5apV7keHZzMwt46ZBSn
	tvN34g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe6as3p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 08 Oct 2026 11:51:00 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc11b5dd54dso8617558a12.3
        for <linux-sound@vger.kernel.org>; Thu, 08 Oct 2026 04:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791460260; x=1792065060; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dERFh+6tgQKI7QA2ghVyFA6Snc4VzECI2TsSXb2K9k4=;
        b=YxPYgFtvDbyCOAwPj2J9LACOqxcvbiUE7L7xOb1P/HN0Y9OYIu8j0g3IQ2SQ1O9suD
         TjfCiWRnLh/VFOfD+g6op5lwDmGS1S/bIB+X4JvwrC8f2feRi/nNSrp4xP1fFltCYxZo
         n4JESmRxEcysx7cX9lSHmj43omLtxlyNuX3zB1MZkNIOQcxiGAfFGrtUyj2HQfuxXzVa
         MUtMdeGRsa7oHiLLWOPhaV6hFFPC9LMuQbHqADfqY/qyqPzFl5PfatBEwk64hav/oaXM
         c4Org2n7eXOvg98VFzQgt0Rsv6YyRhSJwQnmps7YmD1YH1d5zVxuo5DWQODUEhOQd76l
         5diA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791460260; x=1792065060;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dERFh+6tgQKI7QA2ghVyFA6Snc4VzECI2TsSXb2K9k4=;
        b=Zh/CKAryvTz+J2MiaSBZzsWOmDfZ7Ix4vE6OY0tJj6ss4dhqGu1UTmU8H6RHcTa7v4
         WF4ENUQGA/oUU+pWfDjTfhXHHHjYZV+sjxC7neMLKzFo/vQGKiYBkl6ZavfLKSThloZ0
         FowoX6VJ1UtJUV3ODE7oypysWQRtvFcpFD4wgNslq0ZV5OObqnf/s1+kILqPvKWkPywr
         e1aGTNO7qIzY73yi4prPN9/oRdpNe3/6gRfmzL5Wm7yui4BL5PwxN4Tv2moWjgbRQgwg
         Lwgj7kr+tx7KNoNoKWJoU5KrnrqBuuqXHbZMTE6GFSHS22buceQkP8GknYiEi6XPjh9D
         LRsQ==
X-Forwarded-Encrypted: i=1; AKwUvBxTo6hi0kGwpTfzzfR9zY/56S8fqMEbGCfDe1hNPEtrYuGHWR3BAyUYi3Dw3DSAYikf/JeKB2c6Zr7aUw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIPxWt7WOJLbr41FFChG81v/LEzfx+cOVtAe9tCqSfJAPYnM2pZ
	D3FRWz8x0jXBoxgLrX0wZHjXiMFuxRiQAhpvtCP5AcUESwHJiYGB1Nlf8xWiyHRy+4AXfdHib/R
	UGcPH91tUgg3ivqFg7HtM+AbgW8FaCheZPoWgokn9f1Nw8a93V1vzead/ko/ebo97/Q==
X-Gm-Gg: AYBFou0WDJDbLwzw8Qx2ZSFPGUxVLJv6jxY4UQ9mdr9nx6vh+y/M4ArPNkV0fVjUIXj
	aRJleV+W+H248lIN2GtLeoZP3eVliK4OxXBmtI/5a4EDDoINY8lpYdK+cZxxJGvJZNk0gyY4CyO
	TKjptwuwzDcbxw1658zQiuChP+2DpdrT2J7HPp6J8POOwqaqy77Jxfn/kA3g61HIhdnV/Bcnop+
	e1u41oWWepJsmpyzhHhtB+T2iRhyPbRNDMY5Zk6GZdgQ4MrEcFgLLWPiycr8UTJ9KSZEL14Ayc6
	TUF4i4dXNUYEYJCHK/LT9oQDTib2Iq9I+S91pATr/FS3rF3+ke07JhE7Oj/QmvTDjZDI0k1oWMn
	cX2l+x7jyV6AyOpZ3d+Pwsq3MEto=
X-Received: by 2002:a17:90b:3946:b0:3ab:1b19:78f4 with SMTP id 98e67ed59e1d1-3ab1b1979d8mr232243a91.6.1791460259598;
        Thu, 08 Oct 2026 04:50:59 -0700 (PDT)
X-Received: by 2002:a17:90b:3946:b0:3ab:1b19:78f4 with SMTP id 98e67ed59e1d1-3ab1b1979d8mr232209a91.6.1791460259138;
        Thu, 08 Oct 2026 04:50:59 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9ff817537sm3864991a91.8.2026.10.08.04.50.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 04:50:58 -0700 (PDT)
Message-ID: <eb3bb86d-3d73-4dad-8041-8d8e26c2cd21@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 17:20:52 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/14] ASoC: mediatek: mt8195: Propagate IRQ lookup
 errors
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
 <20261005110257.50145-10-phucduc.bui@gmail.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261005110257.50145-10-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8eF6h8vlrN4aGl9cGOeGNIOnLGybdAce
X-Authority-Analysis: v=2.4 cv=HcWB3SE8 c=1 sm=1 tr=0 ts=6ac783a4 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=fkDIAU-C-wBUwbiI5OYA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: 8eF6h8vlrN4aGl9cGOeGNIOnLGybdAce
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0NyBTYWx0ZWRfXz+VLRHGVua23
 hyAsf3Vrb6F92IY1qGNNHjPyfR34zYebhUmk0NznsAvsOMeRrQ2kUzKUsj537nlnKwTfcO6FTKr
 7/0z2dB4gHVhhRJQtsLRYnQlDqeYQJhU2AyvQPW7udBhKCrvNSd8+/e40vqO4IGXff7jQ+OsGfB
 Vc4qTbLSI31sCG90d5PVTdfSF58dgf4ozyoFMiXSVoa8S5oaI7+bKcCOWfZLpfVtGyxntCbBYoN
 AkIbCoBNiU439dT93VVQx+A/SCFiTda0LQ1nkWQgailaHDrk/TWXWh43cMTuOtAyHrBG22+Zf/P
 ScqSWoSWFavJZJjrulDhVSkfzQziGNFm4hfL+vqGHqwaaTdZF3gWDQFb4oTt1KYHmFFpWgj1vCb
 oHDMWTltUIZTA2LIEIY9BVj9uRk6zSWOqJg0T00LJ1QYNEHE8eAMbxjb5KmeBtxuo0lcqzr3vvx
 BOIrz/Jz6U1AZ7I1PbA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0NyBTYWx0ZWRfX4LH85u3qu/D4
 55B7jVbC/ZJpO0+XHF1SGx5BL/oDIDXchn9/aKUIVK8kQf5dZZHxelLW0p/NPqv83z2QLytnkVK
 m9ru92aSa8Z1LEuUQV1LwhUIQ7g5DYw=
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
> Propagate the error returned by platform_get_irq() instead of
> replacing it with -ENXIO.
> 
> This preserves errors such as -EPROBE_DEFER for proper handling
> by the caller.
> 
> Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

LGTM

Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

> ---
>   sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
> index 1bca2f62e76e..4ddf2114a1ab 100644
> --- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
> +++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
> @@ -3125,7 +3125,7 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
>   	/* request irq */
>   	irq_id = platform_get_irq(pdev, 0);
>   	if (irq_id < 0)
> -		return -ENXIO;
> +		return irq_id;
>   
>   	ret = devm_request_irq(dev, irq_id, mt8195_afe_irq_handler,
>   			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);

