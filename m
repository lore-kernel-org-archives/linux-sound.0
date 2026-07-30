Received: from out30-111.freemail.mail.aliyun.com (out30-111.freemail.mail.aliyun.com [115.124.30.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7DE3750D6;
	Thu, 30 Jul 2026 02:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785377817; cv=none; b=L4ERgNiRcqkAWl9Uuc3L/vcXDXVbt4nvOvlGs9dOWMdtXEBxM5H0opfqN1J2CTWwd4t74uJb+1hE97ZBT+O3f2f2AUYIUDZSqRxP2lU7Eh+kHPkshKyASbrjq/k+IbYdxHSPbO4DpMDuxHUXvPgKWlBmhcDPEvFFBOwq2fv/W4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785377817; c=relaxed/simple;
	bh=noX+bN3J0pjKRkKyW6fRqzeuFaSLEUlHd13SOlY3Ins=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SPQmtmWe7L9DuPAlZf4j7oQ2V0GuTvzGW/02QXOXilj6/5w3wdLPlnSpXD3pCYoM9X8bZNCVPbC7G56rI+kVmjsN3dzJ89rgEbFGJGNM9MVgLmemvvSZUwP2CI+LkEGcL09Q+MBnIjRrkIHIAqC2DOwQuZ0L0kVA9B4mBGi9iOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=N8/TjPnD; arc=none smtp.client-ip=115.124.30.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="N8/TjPnD"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1785377802; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=xPoFIGiYUCKLZFN+jxU/2X7f3pXNHpcSbDxEep7GaNM=;
	b=N8/TjPnDvS9T/KWMhdFn4IZ0yaxsbf7SN4stTuIhEP9GRYCQ2LxeQd88tre576S7XwYwE0Yxt5G+L7Gwpnac5+n9jX+wfCGDf7yepqVZtlQoV1oziLjfJTmCeMPMttu/TukMJJ7KZ6jNsFf3unMhWnezNDS1ZBgSptkARg77HeM=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R461e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0X83cT-N_1785377801;
Received: from 30.74.144.124(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X83cT-N_1785377801 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 30 Jul 2026 10:16:42 +0800
Message-ID: <0a244759-4524-4e4e-9aa8-cd73eda2ccf9@linux.alibaba.com>
Date: Thu, 30 Jul 2026 10:16:40 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: sprd: sprd-mcdt: Drop redundant error messages
To: phucduc.bui@gmail.com, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Orson Zhai <orsonzhai@gmail.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260729073532.56468-1-phucduc.bui@gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260729073532.56468-1-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/29/26 3:35 PM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> The called functions already log failures where appropriate. Return the
> original error directly and avoid duplicate error messages.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---

LGTM.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>

>   sound/soc/sprd/sprd-mcdt.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/sound/soc/sprd/sprd-mcdt.c b/sound/soc/sprd/sprd-mcdt.c
> index 5f3a2a7bce31..d9a7bbd6c0b6 100644
> --- a/sound/soc/sprd/sprd-mcdt.c
> +++ b/sound/soc/sprd/sprd-mcdt.c
> @@ -931,10 +931,8 @@ static int sprd_mcdt_probe(struct platform_device *pdev)
>   
>   	ret = devm_request_irq(&pdev->dev, irq, sprd_mcdt_irq_handler,
>   			       0, "sprd-mcdt", mcdt);
> -	if (ret) {
> -		dev_err(&pdev->dev, "Failed to request MCDT IRQ\n");
> +	if (ret)
>   		return ret;
> -	}
>   
>   	sprd_mcdt_init_chans(mcdt, res);
>   

