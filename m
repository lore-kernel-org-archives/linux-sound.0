Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793677782;
	b=lGpk/gH5N/4DPaEur0Pj30bL+36lH9XGjzTLXsySN5XBAGlsliZmICVnciNDCK/+EfYF
	 74ABGXVPP1ZHytNKbp3XHy7CnTlwYlnGymoD1RcVzZESAOeWaPyjzPmJgEBsVttbxUXrb
	 /5YUGi0UrHgoPds0tePxdb2q8Y3TKQlfAH6kbxdzQGaAh3gogRtsZ/8uCKGV5/2d3H86D
	 HbjVIWm4rMqpqf5iyDNoP7KfRl1nzOY9ETHPEmqKZKkKrZvYhIq/IjMFLX3hbvUPQHCdE
	 Km0DDyUyHPVJ3WQm3dO/XCAD5FI3jdBRDNni+kiAdKX20wBr8apttl7nyxwwbZPi9ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793677782;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DZ/NX7uo8xloLOcGc8uQxWAK76padB8qKwhdHOOlzHc=;
	b=LeJAufs+PUiffcZunLQcmrwnuJxQ/E7Ezct8Cr5FjujOPBYI+0Bqx7u23d9Yjqqtbe+m
	 VhZQkIO3XDgUHzYCM0SekT9sTYtCo1ZuSrcuFfI6P2Rw0pwxq2XTb9NJ2Wdpjve2Bj4jP
	 zvn/GRKQnmMUmJXKjB7pKTXaHFeRc3QJpoEtD+k7L2A3V3GrF9IEn7+eN/yX1AZ3EC2UH
	 PLkK11rm7Nl86Wt+FDXvmRuHzG0RSPCWVJZUvUneO92h6EE5BKSztyNtF7iuDAU4FdRR1
	 rp8sjHtdN67YoncK71Y4TZ9bJljKekmnw5BGiyUR36W8lNlTT0uyGElEiLagorjGDkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jVXtSxUK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Qsd1z/Wd";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73E3606A32D
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 03:49:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E73E3606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jVXtSxUK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qsd1z/Wd
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A31ehfA2012453
	for <linux-sound@vger.kernel.org>; Tue, 3 Nov 2026 03:49:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DZ/NX7uo8xloLOcGc8uQxWAK76padB8qKwhdHOOlzHc=; b=jVXtSxUKddlNgSq9
	kpw8LMVJBMHdzSvYSjLUNvlr2VLJQJas7CrSh/IMyiVlyDVcE7I843TVHxQlneGm
	GICWBw0Db7gQkK/TqffKoDX5HfoNesmgtuhz2DHLQegvBfOKI1Qorp+yN5B30qIk
	lm3oE91pt6jQ2y3z0MLuQ7IuAazgv6liCmXM81JCeX0RiiL0MfLUAN6xqy/Lwj4M
	CS580V4m1b8JsJD3xNYkQ8l18t08tRgQ8ztnEKzowDQwap2bchnfHELCk1zbJV9s
	eCzoc4pFrhoo+WlpudCjRJCzYRYF+KfiFnO+ovXCtqTMIHQ2YFSK+KwaTuoKpuuB
	Z6RW8w==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsa6up7v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 03 Nov 2026 03:49:39 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35c3c370b17so6308569eec.0
        for <linux-sound@vger.kernel.org>; Mon, 02 Nov 2026 19:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793677779; x=1794282579; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DZ/NX7uo8xloLOcGc8uQxWAK76padB8qKwhdHOOlzHc=;
        b=Qsd1z/WdOBfyrl1XEGwf+xzSOFm4T97bdfqYmNi0YCix5/NqI5m2IMwbN/jqwRHcLK
         rGxSw4wtPec8PWwkRwdZHbn9HHSkZ9oXbU8bb5bJcz6DQE+hqL/5GiuyWsvLSmcBL+1t
         kr+lyeVToLNAzXE5Ppg+UXbFA/nmXfjF0Lij+kecnhbfMk8+v75rQy6G/Jj1eIleR/jN
         LlwS3JM6p6t2T86tlQ8l2eo+lfQeWdcHawDDuDPVd0NHwP73G8UXalo1aCQ49fiAMrC7
         uQzvk3+XPH1qy9+wcz2wl7K7KeP/VgS7X2NXYr5X+xDqv9PBVzaKL1rFkwqowfpWWXoo
         81ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793677779; x=1794282579;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DZ/NX7uo8xloLOcGc8uQxWAK76padB8qKwhdHOOlzHc=;
        b=X2a++LDwtzd13ocQUWbd0t6K50FLxiy4CJf/sLWqaDLQfP2qJQHaE469MQDFjqw20k
         NqSr5JeEquNSGbwTFO1gcrDs4LGVwNh9ggFf8kGX1ETwDUc8KL+PcxDWXDM15XSi9uBR
         HOSB6lUia6rq8Fk0O6yG/H+fWDCT3njH8bUgQbxSFJy6cRWJithsoPUl6gjRfxfI09Uq
         sVTXCwTMXteuH4+ZJsDwfBmASZg4yvfQf7oZShteyjkpJDS49U37+/J3aCZTczyw7zQR
         l3RYz+qPCPTGFQ/dot8uCmlR/2JRdvsR01+d9GnWf/mVOTChR6jLiPd9D2++/17fvR56
         WyHg==
X-Forwarded-Encrypted: i=1; AKwUvBycjDDWMtLv8gul35W44XgtpDaerAmdxMOoxRGVgHzc1tG8xh7ooxco4FT3X/WIybXFvcb+eVPJywQmpg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLo1R6k1/eyb9FOSoS0Yk54qQ17AJF4yOxOJJo/XnNAuE2Yrfgf
	BhKDztcKTjoNFnbwvfy5TtWdg+vQ0Yd+agdeb4fTyOY/tYrWu8yFCWSgqTfKsz+nauJYLhByitk
	0ii/L1T7z8bin8Z54W3/XmZYvkAXFEWJeco7W7KwtTtZy/M2hz7hrX8Gvw/AHakJagA==
X-Gm-Gg: AYBFou03a8WeqLoHyG4FRBCPpi6v9LsiusGXplE/ShQx5Zzg6/0ocgQNfrqVKtZR5O/
	IRqV/XM+eGYBa/GBUM57+G0AhPjZpCczsHSEhTeQGljvWtu8G+niDRQPsS/AND17ji6dUqvwKbR
	YowMxbHZ3Acy7dNePdSSJ6UOn9l3bixzmTVZsInJZTZCc5ZTtUXF6Avd2io71onrT5sKez2jG+h
	QLdR24knA7wW39rvmmgz1j38kR319YnQIvTkVP0Lls1tL+It8lgA58l5wcMsjquiNbioIKmIFrA
	pM3KqhT3KenRSLKmPjZcZAI8/hL5X1CXr2moa+SMHJTyAfr65A5m+NDxdDtyfUlo5UY5H5teY2a
	O0batsLnZdQxkAY+6h8ncOcpaBJKswUMtyccOVAeA5oyF6YrIG1+yqucIwzHUG/pHKYbEK++mKg
	xD6wpdVkw+
X-Received: by 2002:a05:7022:f115:b0:1a2:1a28:9348 with SMTP id a92af1059eb24-1ac5e22840emr15230878c88.37.1793677778598;
        Mon, 02 Nov 2026 19:49:38 -0800 (PST)
X-Received: by 2002:a05:7022:f115:b0:1a2:1a28:9348 with SMTP id a92af1059eb24-1ac5e22840emr15230837c88.37.1793677778005;
        Mon, 02 Nov 2026 19:49:38 -0800 (PST)
Received: from [192.168.1.5] ([182.65.247.97])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac192c27cdsm65455321c88.10.2026.11.02.19.49.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 19:49:37 -0800 (PST)
Message-ID: <dc441642-aa49-4f99-b10d-695f8d05fe2a@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 09:19:31 +0530
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
Subject: Re: [PATCH] ASoC: codec: pcm1681: Acquire sck when bound to a card
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Shenghao Ding
 <shenghao-ding@ti.com>,
        Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>,
        Sen Wang <sen@ti.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261021031228.2074402-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <20261021031228.2074402-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAxNCBTYWx0ZWRfX49QEoynUfm3V
 J/xOvhArGHE3Q+raZUhn6L3i3q9VyWZNH9/SYabaxSI/gOi+mxQP9i3xmdXzdOptRjzHZb/FA69
 jqslGoiS8djRoZ5HXyO4scLzT2DilkuSfhlB4PlFZKN2J3zkXWmqN0TBM+Af5pni8NERUNMD20j
 ePBJqVIOXzWG9U9aEMKb5s1xrjOZRa73hQxsibv+oU1NZsCPKVaOv03yL2tA9XuIVNKoRCSnE0H
 p0+noy+xW90Jj+tn9ae47eoruDkAcupH6/bg0nogIzk+d/HAggHN9gnm3r+axna7d9N2BJiMv1H
 RYafYgTKcOZhGjVKx+PRRn6NzsADTH9vdobhog2LbKh/Av11UVPS94gXpzyQvG6GqdTbMFymoz9
 MADMzX4VZnuqaCC4h0eyzz6oTj0VozIt9HwcPF/Hh1rjdxZ1fJlJJDZfmlEiaWmiPdeaZruANoJ
 NBUrMQd0bslxql0Wlsg==
X-Proofpoint-GUID: fOR9MfWkyFiTf1YPBhqiRsbWTfYQJa19
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAxNCBTYWx0ZWRfX42GtczF+GZ+h
 Kqo0pE2g/8KbUduzTammmZuXsmc2qpUEcKefLxyANnrFiZidGzzUoGM4tS9L9zmCTb6jjlcpAu9
 K9VXwtVfOi9iDJpPBb1l0bZiUUTDXsU=
X-Proofpoint-ORIG-GUID: fOR9MfWkyFiTf1YPBhqiRsbWTfYQJa19
X-Authority-Analysis: v=2.4 cv=I9fw19gg c=1 sm=1 tr=0 ts=6ae959d3 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ya3+xhBzxnqkq9vGoikweg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=k5KkOgXd54y_7d7CN8cA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030014



On 10/21/2026 8:42 AM, Shawn Guo wrote:
> The sck clock is taken once at i2c probe and held for the lifetime of
> the device. On Qualcomm boards it is an LPASS clock exported by the
> q6prm clock controller, which lives on the DSP and is unregistered and
> registered anew whenever the ADSP is stopped and restarted. fw_devlink
> cannot tie pcm1681 to that provider, since the provider node only gets
> a device once the DSP is up, so it falls back to the remoteproc device,
> which stays bound across a DSP restart. pcm1681 is therefore never
> unbound and keeps a clk handle to the dead provider.
> 
> After an ADSP restart the first runtime resume fails with:
> 
>    pcm1681 0-004c: Failed to enable sck: -6
> 
> and there is no playback through the DAC. Even with a fresh handle the
> DAC stays silent: the new provider registers its clocks at their
> default rate (19.2 MHz), while assigned-clock-rates (12.288 MHz) was
> only applied by the i2c core at probe time.
> 
> The sound card, however, is torn down and re-created on a DSP restart.
> Move sck handling into the component probe/remove callbacks: get the
> clock, re-apply the assigned clock rates and enable it each time the
> component is bound, and release it on removal. The i2c probe now only
> sets up supplies and the regmap, keeping the cache in cache-only mode
> until the clock is running, and the cache is synced once sck is up.
> Runtime PM is enabled and disabled together with the clock.
> 
> Fixes: 8987e9a24f45 ("ASoC: codec: pcm1681: Add optional SCK clock and runtime PM support")
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

LGTM,

Reviewed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

> ---
>   sound/soc/codecs/pcm1681.c | 122 ++++++++++++++++++++++++++-----------
>   1 file changed, 88 insertions(+), 34 deletions(-)
> 
> diff --git a/sound/soc/codecs/pcm1681.c b/sound/soc/codecs/pcm1681.c
> index 6002da3a5666..2cc34561aa83 100644
> --- a/sound/soc/codecs/pcm1681.c
> +++ b/sound/soc/codecs/pcm1681.c
