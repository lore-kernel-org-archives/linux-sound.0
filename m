Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793617340;
	b=EeeSj8Tc2TD5NUsd9rTID3FILbScpEt6EIzn+94evXC0dmEsL6R67BA9xDXzOAu+uIwB
	 fsyWB0yU4TX1uTBehv1ao137nZaoTg0p+CAGHjmcJB8nWfbCpKxU/I7vgcl5pS3F0wLgL
	 RlR+b2OS160Lw8s+ONXuFD012Eo5bhxa5xJIjlczmv1UOH5S6JeLKo+bg42RDyYivaOi2
	 jokz76Hgxu9HMlPH8GqyLXNcuNZml0fysFIaN+034+veKyprikW/YwCHBNrALZ2A/T13H
	 vuyqlxVHud9zA8x1jp+LuWKzkLS7EMuX408WjwLUFMh9SmomfsYJb0esgDMyvILNG/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793617340;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=tnBMgDIv1g4x+Wpl6HFNjTfqDD0V4317jb6jMDZ6D6Q=;
	b=BKR1QijovKkDahW+zVTeISlMMS9UmPjZZeiPQPMl8oOoGwXUMIfRXzaI05hjG4sg+z44
	 regHqni3hDRiY+/FR3Q9xVcD4iFCzIaJD9T4dYXP/nK9RHNm5LXnY/9E486zWiSC7zFCk
	 0lN0eb0ddJlogCbHNX3+mrdUARPxAJ3qBfCz/MMK+qnOLtxB6ZZf2uDQweprTK/80oQkV
	 ao1SVl72iV9JKpRJzc5qiHiepO65R4b4fiarbOn0HvQgLHs3UeA8hW9R1dKp9TE4cnBaN
	 qEqJRjSvex/0TvSs2PQxlUv6Sy30He6uwoO04/CcvRALjjiyLE8H01a5MkWmCYsY+uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SncOjSY1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eFsuONFg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72ED260A260D
	for <linux-sound@vger.kernel.org>; Mon,  2 Nov 2026 11:02:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72ED260A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SncOjSY1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eFsuONFg
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AO1j3086541
	for <linux-sound@vger.kernel.org>; Mon, 2 Nov 2026 11:02:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tnBMgDIv1g4x+Wpl6HFNjTfqDD0V4317jb6jMDZ6D6Q=; b=SncOjSY1ddiRF4py
	K2uzL76deqOxOHfj7Ie26KEzOJ09mcK77hDIx6kEYu+xCB+BLhpzvvDwwivks7gj
	4NEXLvzudhRYxya2uJDMX/v/f8xHgLxsshtYpVouEzFC1Z6Z4HjbTrpz7xVuUK4a
	KOM1ethTaXiU5g9zpqZW74Xzie39vtUuh58tFlDSr6HqaMnbCn1XG/8gTeG/kp0i
	kxO67hQkYAvM5LPlaY0A5ivDt285qWbDGcsGVxzJHzOQ5j+Bdc5i0+JSnaZYH7Wt
	4ls7skwIuPzywjlyklaX/bYJw7WekxwoNI4SqdriTK81M5Afcst+AoUOqjf15RxH
	cRG9bA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpka61ffm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 02 Nov 2026 11:02:19 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e8ba4757baso27593255ad.0
        for <linux-sound@vger.kernel.org>; Mon, 02 Nov 2026 03:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793617338; x=1794222138; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tnBMgDIv1g4x+Wpl6HFNjTfqDD0V4317jb6jMDZ6D6Q=;
        b=eFsuONFgjlH2UNw6qz6FevZB6gbZkc6xfjVCASsH5ydeJa1NOO+f0Ji4+t2qWq7Glt
         AO8nbk0jxZpmkRLadt88FXO0kW9VeytSedb57MTHk5s0NXzAoe5N7NmL01Xm/TqmPF6n
         H2D+tTHGnjWMdooIzTYGxmhVs0pj9+EXXZkLlpwORru0jfUATzftNUZnTPRYG0E23TUW
         UrcoO6EJTtPxu7Ruz+z0OY9nMEsW/aOUCMIGy9s+RucX5cRfd44YABJMZ8AN2jUJsQCf
         DVHG2r51uDezcomngLOqrzFmgHzpNH8Pc769JBn+XvrAvNFkbMuBUjxw5qIWwZPQ8XY+
         WsTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793617338; x=1794222138;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tnBMgDIv1g4x+Wpl6HFNjTfqDD0V4317jb6jMDZ6D6Q=;
        b=XNdPiaq1xD8rXWf9iivWZEz8T2UQaKDub1r3yr4chjj/k8E81eJ3EuzYgmkmm8cyUc
         a7KrjW6CwGaTPVGGGsk+OrtLHcwvg6sQ82qdb/fJ8+7N6gz4eUZRIqKgc4+X5t4Lm6Zg
         iCThxramTiRvPqTYnzL2941LyK8Uh2cek4DWKUiwT5UVGKQfeona2Ga+sNVUWLOXvI9+
         wjcj1yirxSIhWb9ZT7cEu2csKjloTCAM+M3ESI5eWCLmBmmu79tgWvn3zL3Y9wIdmRbQ
         k8sEc+tUz5V7J29m8v5c/hPWA3KpPK+c2qRPta1ngFgi9+m1JeiSSsngPzUtjNYZM/2F
         7ibA==
X-Forwarded-Encrypted: i=1; AKwUvByxHFyoBecsJXz6bGqn40/QzgwDtrXdd9H2v/5HMRTXYlz5DERyEFH/SkXnYP4b+NXHuTZon4Qi/8qb5w==@vger.kernel.org
X-Gm-Message-State: APuU4Z9rD1/BLp+ehLNM2Zc3/88B6pTHtBDi6DyBWqH+Db4AC8hk0rLs
	3sOHgw6qnQHq5fZmoffzAnvlulUso8r6epEnwVsyYHCs0NMP3jhMgl8W7accRJo6knIAAFuESuN
	6th7vDxzKxw7eybafr8NN4LeS1+ak6zGoX9LCGCGVgIitGecy8ou5othlKxM84o9uyA==
X-Gm-Gg: AYBFou3aQzNZCyOCb6fCZjM3zbV5cnnHHk9O7lVgFkzCycGmg/laeeGbScFZmsHuiwT
	pMF5SucZeU8ZhVELkujbHOYQjfR5M21037zUo1mnVbnKxsS9YKtt7ldhh2mGcI48s89ryjYBxlV
	zX7Bgk8rw6gKnKgFf91GzJSVTud4tJXV6TAbI4vZOR6ftIH2tz6ZESCsTso7J3VVlDi6qkWCMOT
	4jZF/g5AV79b95FI6+q+AFgW1/iifD8kFyvQQfBAXHx4QxyV/jTJuNIz+hZOZR8BcH0xxe3rmyY
	om45BaLauXqZ+rkxT28LOP2p3mWTj+KNOu+GY6GalScXblME0Vr735aRbZqSfwbUK1bqScX7lzu
	6+Nb3NHeNrtYvkZvxu9vY7hFA2b3p1k2uy8QB6mQhGXu+DEMapvpp9RWS0cmKF9zBSqVg8euOJ0
	jICMfh
X-Received: by 2002:a17:90b:164f:b0:3ac:9ed8:f310 with SMTP id 98e67ed59e1d1-3ae8984da7fmr8539612a91.49.1793617333291;
        Mon, 02 Nov 2026 03:02:13 -0800 (PST)
X-Received: by 2002:a17:90b:164f:b0:3ac:9ed8:f310 with SMTP id 98e67ed59e1d1-3ae8984da7fmr8539557a91.49.1793617332690;
        Mon, 02 Nov 2026 03:02:12 -0800 (PST)
Received: from [10.219.49.187] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae8441a5ecsm14215562a91.2.2026.11.02.03.02.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:02:12 -0800 (PST)
Message-ID: <e0e30cce-8772-4aed-b7c1-14c5e5090c24@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 16:32:06 +0530
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ASoC: qcom: sc8280xp: Derive TDM channels from DT mask
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261031082318.1146398-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20261031082318.1146398-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: pL4T7fB-GE-VPsXljp-yiiXZEYLwBR9q
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MyBTYWx0ZWRfX+tB/PyYUG43g
 +vqWzRuicS9NwJmRGAQqiUlwQ5g+UVMatyfxAxRlV35Bd99Ld4tJaPOVGZS28JxsQNh7hliehbZ
 CxREIHORc0bZ8GVk9Ub7VvZo0khS4MI=
X-Authority-Analysis: v=2.4 cv=ZbyIpcVA c=1 sm=1 tr=0 ts=6ae86dbb cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=q7gVV3EAPCriVcb_4XEA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MyBTYWx0ZWRfXxDTjTib4KRXD
 1z5hmigKG2nJ8JvzcDsGZ0VqfMWP4SK8xub+lQAPlVkV/hkv8nPYr97pOoDLdz+b2ONUyPSiWde
 mC8OdW9J1ft48z+SuEK11SxC3aryPtLKJClqG53XjA7c8/Jbpve6s5eierhekjT8u/4aILU34FV
 vrbCCuH1qCIvG+XlGGEqHN0WjLZl3G4FhraDwrHAzNHgMGGvvbJJWMbBYaA1mJ5g28lAU8QrFmy
 SZ+dtbCYl+cJwimJ2CMHLOQaV1hXPnjKpkGDyReGLd3uYZlGWKynp7oimFg9MdVd6VdE3UiiRPG
 2X66Pv00JCxPTIhV2AGMkd0hTVXgbJaVyd7bPQYKWN28/WvqRe+zv+grHMOKZs3n/OHMMibNEyT
 J65bt9bVVRXaNw492GRnec755QGHIUvzU1L9aafGw8C45PuPzUGSg8h3zR19p28ABITwvrmPSkc
 AxpORekYrVJhd5zRhLg==
X-Proofpoint-GUID: pL4T7fB-GE-VPsXljp-yiiXZEYLwBR9q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020043


On 10/31/2026 1:53 PM, Shawn Guo wrote:
> Derive the backend channel count of TDM DAIs from the cpu DAI TDM
> slot mask in the DT, using the same DAI ID ranges and tx/rx mask
> selection as q6tdm_set_tdm_slot(), so the channel count always matches
> the number of slots programmed into the DSP. Each board then gets the
> channel count its dai-link describes, e.g. 4/4 on Nord RRD, 6/4 on
> RIDE. Keep the default of two when the link has no TDM slot
> description, and fail the fixup on an invalid one.
>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
> Changes for v3:
> - Propagate qcom_snd_get_dai_tdm_slots() errors other than -ENOENT
>    instead of silently falling back to two channels (Prasad)
> - Link to v2: https://lore.kernel.org/all/20261029022340.591372-1-shengchao.guo@oss.qualcomm.com/
>
LGTM,

Reviewed-by: Prasad Kumpatla<prasad.kumpatla@oss.qualcomm.com>

Thanks,
Prasad

