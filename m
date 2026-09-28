Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82141489FAC
	for <linux-sound@vger.kernel.org>; Mon, 28 Sep 2026 09:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790586434; cv=pass; b=KEK1rFLVyuddzq/6+inQHwqTXMMdnyWL3qIKyORJvR/pIg83fL+hJBOyhOoSn5uVULJaunSatDwUA4DncZ4Ouf07TLJlWb5jMh4Fx4Ph7IwYbB+7h9uEUVE2iEhhAQsnrY84bf/z/D/4sGCWPtxdVLss6q0p5/XiWf1OExkqrvA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790586434; c=relaxed/simple;
	bh=s2Enupyeibtnt7iImD86TsDrfkpy6GFHBVU2jucmNWs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KEyMklyCMYncPnlB/sv+CyPn5B323urx8iLwZtnIhI/4ixwX87j+dOVePnkhVliqKNsX1KbjOZ537nf0job4SBxWQbkYH7RFwFXJNGahuaEEfDx988E+DEbwnAAUwtouBkFVFs1KfZBomtuLKFMXsbSeXQYsdIYT1pSHCLGCHwU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IROmiQzM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BRgV31EC; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IROmiQzM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BRgV31EC"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S803tX1872252
	for <linux-sound@vger.kernel.org>; Mon, 28 Sep 2026 09:07:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=n19NZ2DZer6lB8ryYO/o4o4W
	WUSxviNywHDQ+d++mko=; b=IROmiQzMOCN35QWrXMKhPyYSyMmuA6jkxAyjmPhC
	0UETZgfIDwCqiu4QPlZUilAG1nVma42171hArilj2c7EALEaPO5jZc65CbeUadU9
	V9Q31Ks1rNu0G+K8HpRwd+cR1xTDB3VwgE+k2ieRVXXmzwWn2X7MITPKN74sC5sw
	ZQxAQ4aDFePZX4BB7nMOYUJiAdd8f/I6EJ2HsZdZadi7hSE35qV9t1cEIKDCSeml
	eK7v6lV8WzUmVpJyx+z9bOf9YA6EXyBYTqwGRw3U9/tadcoaOYG29myWOTpoMNd6
	kBGF8GMBR0iUv68rTTsWx+vGkZmb0ZzCxIOdPfLng6zgYg==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyhubgt9j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 28 Sep 2026 09:07:11 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-88322409239so39008027b3.1
        for <linux-sound@vger.kernel.org>; Mon, 28 Sep 2026 02:07:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790586430; cv=none;
        d=google.com; s=arc-20260327;
        b=ED2g4UBr5mk3frRTHmI+c6Zck8S6wQkwLeeEUORAKbk6AdHcpuT1MmL/tkOGs4FNm4
         nDtjnNNcxDI0bl17EbgnQI2o801z3KIsZ6/BandL11c7LR/O9eDGhevIlsg6zpoUSP2o
         HyJbCQpQO7xZ/IzS2aBGQj+myjaVOqHEpEMFj7ULYiG5b9W/h5tWWpyKnqMpJvSq8aLt
         6o+gAPBXsua0uT6dZiU2H3XEEHXBRXwJPR424nWeu7jQG92YtRBLXfQb8C8kt5BMYRFE
         oeAHNe6cz+55hGcRSMwoMxTanogmo2JFJ+80yk21bYPSQ2eR1nvfjz7o0y/uubvFxq2X
         4VDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=n19NZ2DZer6lB8ryYO/o4o4WWUSxviNywHDQ+d++mko=;
        fh=nb2uXfRqMEkWuqBPAopL2T/KNciaebQSdSDIsNoS3Wg=;
        b=hZoCUMJIy0Lt2x3X8ymg+O1eoeOGCwy9Yk20LY0tGalrfM0DMajgGgqjzqqjDUI3y9
         +ODFp3k5U6FmIa7FD7THV3Lt+3EsDKoFi9T3iTVo+7BHWLSLgRp5EfxtJg5kU3tJpikU
         KVmkfc4Afx77RfEE1UvqXfdQYei/fQBPGa7bsSpItHloES5kjzPmV0rEX6gyKH9tOyVw
         BNW2FuFzy+oVSHiEWUWB6/AR1tpAF0qBBFZ/fg0aRtr0g3G61gcSvzM2n5/IE8487Vmk
         pY1gZEIXdz1ASYFGZu8cb9UPUvkXibyqmwK4qqpVE5DNDiC9Xc5GX8snjKE/fiJEoaOz
         93GQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790586430; x=1791191230; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n19NZ2DZer6lB8ryYO/o4o4WWUSxviNywHDQ+d++mko=;
        b=BRgV31EC1wVDSY3eTEaG2gDR2V2Ay7vsWbRTpcni1sjY2fL9fzScoaX7ysyKzql+xS
         ypST2GZCO8b3W1RhJg1xkUx1Vx2cUsYyuqv+8g+vTQ033yLG1POBVWMtXWDn+6pEbVPR
         Y7lYUhKFVIVBZtlg/EoDnXedpATqN4A2qShCxKOB53bRzkwLseG6TBWGt8EM5Sn6Y7Ot
         QIlBhukufru7wyEb9g0RFQ7tgu4VvaNWfUbolBBdZEon0MhdjopYcWY49YPPjyYsVL2w
         +9TVS6oXT1/5e1SajbZQ3uS1eiNkD7aAIzOZ0NWUOgQVbjVcSNhl1WQCx3z6vPjRf9oB
         eNHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790586430; x=1791191230;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n19NZ2DZer6lB8ryYO/o4o4WWUSxviNywHDQ+d++mko=;
        b=anuZRm+cHpAInR6wuaPmOugnaY4k2KACOsh+bQlgrjiPDhJbIgdavVzubwCWFxzsL2
         FrwfzGjqlvfFN7pEKSnQFDyU3NCPAxbPi6f54CBlbSxp4PF6Bu09icHgYSwdRwcaPTfU
         f2W99Q4xbeBTMeI828351wX+C5DQ5G60CSIkcTY7AXg+Tg9P1y2NZCyoqJ+sF89eBXPC
         wTc4mSTfPEocnMC5izFYVpuYJs6fQGRn0r6yiU83mavUQOKnAs5Ze89iQ1+8si/8zmZE
         OZWyK19JwPsiMj7+SXm3PJ+SPTKmADGkDiwQxIlViXZKTFDUY0ejhQ5dnmpe4ZgbFvo4
         Mm4A==
X-Forwarded-Encrypted: i=1; AKwUvBzaW5K+CLjfSZKH2cc4yAMhiPHbTBPBjvR5m3wrwufThqeDZGV7o6wuHB+fdZfatcHmyREDtZOAnzjvfw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKtOEx6pV4C3etAY4k9Mm4CX7hVGRlQuySeLin+cbISMnuBNY/n
	pT90ImhNALHYeCEdHme45ZyUbv6xOYzv9197T52+XJL9cIojgKSI/sjGQvs5Sq0iGTI6A/EG4E7
	zmJFdJoG+6AiaQHpOrMWOuajc+UjFGDgZGYoPJMtuIgiDy+2O7iYi8+0LkaO2xuhgJyIWjtaErS
	EmLQsa0XX/E/EwDOBXHFs5MlYU4ByW14+ovIYoR9mf
X-Gm-Gg: AYBFou20D8N559b79kU6HWU7U+npbWtyCxyNqQczrv37CYEkrtmrQKHsab3HsUnVwPO
	LzfmKVXXiVfprmQWp1DdkmfkodeyFQagSLgBAYcE5eQ7ap/6k1F0GyRAyX3U5HKvDC45PmYGIEi
	t9IiqZ58nzvIQEfLjgzf3NKkaRSIcl6u/sau7V653XzNQtHIe/7UlWCw11YQ0=
X-Received: by 2002:a05:690c:281:b0:8a8:8f62:e92 with SMTP id 00721157ae682-8a88f6217a1mr34619237b3.55.1790586430106;
        Mon, 28 Sep 2026 02:07:10 -0700 (PDT)
X-Received: by 2002:a05:690c:281:b0:8a8:8f62:e92 with SMTP id
 00721157ae682-8a88f6217a1mr34618987b3.55.1790586429555; Mon, 28 Sep 2026
 02:07:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923-b4-qaif-shikra-audio-v7-0-d5b6f056568e@oss.qualcomm.com>
 <20260923-b4-qaif-shikra-audio-v7-7-d5b6f056568e@oss.qualcomm.com> <arOfufqav6zRT_Rd@sirena.co.uk>
In-Reply-To: <arOfufqav6zRT_Rd@sirena.co.uk>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 14:36:56 +0530
X-Gm-Features: AclHuK-5ndE__5TsHzpVHEV0m6dGW20Hk6VWjJY3Bt2Guaa4yktx6YOghplq7oM
Message-ID: <CAC-tS8BscYoSU41qHTC9_8Ajq-MuyfOHWzt4p6v6NN8HzsRVaQ@mail.gmail.com>
Subject: Re: [PATCH v7 07/10] ASoC: qcom: Add QAIF PCM operations
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: OK3FR7CrhN7kUC46KIcdzzH4wwgkqWLc
X-Authority-Analysis: v=2.4 cv=C7F8WgP+ c=1 sm=1 tr=0 ts=6aba2e3f cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=r2ZyNpLy9wB0e1xT6XIA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-ORIG-GUID: OK3FR7CrhN7kUC46KIcdzzH4wwgkqWLc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzNiBTYWx0ZWRfX4ugzaIJnw0yA
 pwxkkqbH8qVzWuqsR8J9hTJjGRmAOOh9PbG00BOoVmhPc6fVY7i4XWFLDeDTbhWuwAFOIPVFpqs
 dryW2RwV92oon/e6s2QSSEl+FIVDWEQZIhCmfaI8+/1wVuNbbUIb3J/zxHlnvav8JThvLR0C4nz
 Hd+0Go36h/C0jgqeiVAfVCINw77Op9w93TR9Vv+Xz9mijMger7d0y1xkPOincpLIM9bW5+9iESf
 sJB7cicgIksqudvkdp+REScfzh2uDeuMfn4Cc0sHOuljbHLYpxVvB7BAFZKTznuZl85wlrT02na
 HnGmKTdJf8AZa2K+MKfFlLSoGrxz9HdTRBon+DN0eJYAecV1hvpBeY6/Bh7sdNZuEWi7KV8u29k
 VPGiwdhfdH76mvKFeezeRw8ztXNr9rwUserjt+4rfJZ4a6G6jo6Ij9CRENrbPNq/GWs9SHyoyFd
 sX51QZoUBiEdgEg1W5w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzNiBTYWx0ZWRfXwBEJLcKVb42P
 h7CDXiNhUdu7fyNunSWcY6tMm4qeIsluVFjNqO7/Htr2oOCd6NTVnO6W85ufNSbqMo2DWegSM78
 dugM3Rl8gjdOF+IEiwCpKRwLpJdAM+s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280036

> > +     dma_mem_info->vaddr = dma_alloc_coherent(component->dev,
> > +                                              dma_mem_info->alloc_size,
> > +                                              &dma_mem_info->dma_addr,
> > +                                              GFP_KERNEL);
>
>
> snd_pcm_set_managed_buffer().
Thanks for the suggestion. Will switch to
snd_pcm_set_fixed_buffer_all() in a .pcm_new callback in the next
version.
>
> > +static int qaif_platform_copy(struct snd_soc_component *component,
> > +                           struct snd_pcm_substream *substream,
> > +                           int channel, unsigned long pos,
> > +                           struct iov_iter *buf, unsigned long bytes)
> > +{
> > +     struct snd_pcm_runtime *rt = substream->runtime;
> > +     size_t buffer_bytes = snd_pcm_lib_buffer_bytes(substream);
> > +     size_t channel_bytes = buffer_bytes / rt->channels;
> > +     unsigned long offset;
> > +     void *dma_buf;
> > +     size_t copied;
>
> If the buffers are already memory mapped why do we need a copy()
> operation?
With snd_pcm_set_fixed_buffer_all() in .pcm_new the buffer will be
coherent and directly mmap-able, making copy() redundant. Will drop it
in the next version.
-Harendra
