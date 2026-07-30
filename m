Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8E637647E;
	Thu, 30 Jul 2026 02:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785377835; cv=none; b=gRqJimZoMiHPMZ////TQwNhbAqld8CN2IBCxJF8pc6NfYlWtUIUQQvyjhAQdL+wbmjeJV1bak7XPnubWFOXWekSvrqmt1SpJfvCpn85YvgXVas+G1ZQ2WXyjnWrJEgpGqmJDNT0XawkvLQelTVrzLOo+/QiDA2kVZZ7RMhW3WgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785377835; c=relaxed/simple;
	bh=gzxBLMrktABt2fEpNZqIwdeNV0O2M8hZNJ6mZC6kTLw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J+cyCqwUnCAKJdKUeGBKUgjrv4juFjjrxR9l+BtxfVb2xTuAsZHh34ygDTaj0BDTotEgh3jDyyv6hYuniRObONkv3/uvCMScRim38X/o7guM7Jna6uhXNbav32K20BFRnG28OSN4wrWjJondyuNa5AuUnQkcNnT9AKtqDGDFBUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=sX0CD5Cw; arc=none smtp.client-ip=115.124.30.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="sX0CD5Cw"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1785377813; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=icD8mWr0OneLb3hur5lEpVpdURE7d/DQyUSKKtu38HI=;
	b=sX0CD5CwZIO7KXv3Vfj9+00ezECtVfaI0RHmXXc/bnB7mlF/nj/L6gtdP8eAVdVCEcUKlc/zGmepSXac0JQxGnKZR+q50lJLnfh0X/J8Hd1Wujyv7BCrhoZ+7f+wowWSyHkwOzyi6Ohwa4jonY7yt7YRpxZ7U0x/nL28UfujoSc=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R651e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0X83U1Fc_1785377812;
Received: from 30.74.144.124(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X83U1Fc_1785377812 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 30 Jul 2026 10:16:52 +0800
Message-ID: <cb40c8ba-ea17-46eb-938f-c49470a59b40@linux.alibaba.com>
Date: Thu, 30 Jul 2026 10:16:52 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ASoC: sprd: sprd-pcm-dma: Drop redundant error
 messages
To: phucduc.bui@gmail.com, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Orson Zhai <orsonzhai@gmail.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260729073532.56468-1-phucduc.bui@gmail.com>
 <20260729073532.56468-2-phucduc.bui@gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260729073532.56468-2-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/29/26 3:35 PM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> The called functions already log failures where appropriate. Remove the
> error log here to avoid duplicate error messages.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---

LGTM.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>

>   sound/soc/sprd/sprd-pcm-dma.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/sound/soc/sprd/sprd-pcm-dma.c b/sound/soc/sprd/sprd-pcm-dma.c
> index cbf5bf82d96e..f509a4601de2 100644
> --- a/sound/soc/sprd/sprd-pcm-dma.c
> +++ b/sound/soc/sprd/sprd-pcm-dma.c
> @@ -469,8 +469,6 @@ static int sprd_soc_platform_probe(struct platform_device *pdev)
>   
>   	ret = devm_snd_soc_register_component(&pdev->dev, &sprd_soc_component,
>   					      NULL, 0);
> -	if (ret)
> -		dev_err(&pdev->dev, "could not register platform:%d\n", ret);
>   
>   	return ret;
>   }

