Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685E73A1A5B
	for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 08:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776155300; cv=none; b=qmBTPzruqHUFPVFJpujM9K04CCSVhEd0btuPdkHnRTVY+oJMkKOZSsm3xv/NzwI64vFlnjNGrErYJyztKW4/NqgOPfRrAOqgEp6kdCDPGaQPERBhwKOxK3YxPyrdlFag87/1+J/1IEiJ57II4P3PQEjzinpB4lkHhr3jzhH5o2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776155300; c=relaxed/simple;
	bh=A0A0SRk1zjT+GpcK54V4mSJXuPt0aQvZfkQIiF5d4Xc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bFiAiGNSDSqdlsh1pdQE5nXrsYkiS2eP8B2oes4qP/jOvVLxJtNakHQ9y4aq9kjLke39cwi7+XcGfieEnxawQHDjAV6S4S2GP9mpiCG6CdoUbi+yC1dFZHnsTM7NRa0HAeeggBTc0mu6xFI225ZhPZ0UyN6mB7MBKwALIYEOIJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=refL2xOD; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="refL2xOD"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488c2690057so51511145e9.0
        for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 01:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1776155297; x=1776760097; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uelHwNikEBg5tHyCN4f5ieipMicy2BHQBsPBzqFR0dE=;
        b=refL2xODmskYXu30XW1dHd0e1WwGAUfj2qGO13omkKc9jVT/bTa8n7VbqgXlm9HFwI
         WNXAVy+URJH8V0O01i0wr+hPAOqZjevCLdXhkoWKQ+u3hTCRsLiap6bXSw69/Q/qAaUH
         y06x5/YwO8d1webNJa7vZLOlaSPIatZ93WyqCxUefiSmqrJf990VNGf+6eqfFzpTqHyP
         I5i4GgeDZfGd/YGvt3lruBn5mb+jUuODAB0ZRZ4tOXvTY73QjuvyzbJKHc18A8PHYrYJ
         kqq5KUjNNxQhQYhJp+59KpFeC2TcDO4uWorkW8gVvwCidT+7LlTU+QXfQ/HnfR0ed1OC
         HYdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776155297; x=1776760097;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uelHwNikEBg5tHyCN4f5ieipMicy2BHQBsPBzqFR0dE=;
        b=ru27uu1lUIoS2FCX1e3WEhyLUOQUeISqgfXhlnSnbVeKFNwc8VUarmalFHuO1ojdVG
         vbOdMT03UaQM5aHx4U2Rh+bJpaPisbZpHXDY2QARw2UiefqhC9p9Zsv81/YGGx/grWM+
         mhoR51lTotxvWpgWWM1luZdAOGV4SoC9t17RUm9grJfVvhJisVFiyPKBAOVeWs+OjCh0
         pOEqCaUsAnRJ54F2N6MBKPr58pMIEiBPSa4RbRxXaXZszR9sNlCshv6H8k1eBBbEfaVj
         EVYBW/4HKxr3lVI+ZRO9xONZ4ZhoPzSIMp3CAUy2odOeCYVu61P1LKlUBfGlxZGXwsgh
         8IvA==
X-Forwarded-Encrypted: i=1; AFNElJ+QuUSIN/3bFhfuzZnM0Zha8H/snP+81ognu2lJ+XN+WM1L4cUyafLYR40aPmEB1Y+6Cx/Z51fCA2W1nA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv5h4Pj9fmOdbs5eVA4DcgOQdrz6uhxhRFEi3aQkNBnMgdKPKS
	+3bhoHSgEEdmEfyqFQL0vpKWI9w45ODeoGDvBFF1dU0aHW7ngJD5sBf2IxcnMFTR6dM=
X-Gm-Gg: AeBDies0EEfSU+mgPW9tElD6cv8FguJzRa7ac8bmaMpWphe/ghJ7QDDxGrABu3T3CzX
	djcjm7Y+enU20Ymkg09TJxgSKGJfO8GvjFb7lBw/4C17mTRc8vIUJQ5uDYZ8gE8NLZqLqNkgJk9
	aF6Vfi2KVcH9+SIzdp4gv2Bgp4AQjzRHotwxpThEpeDpcMhfTGfOaNYs1vPN6A0w1Z6czydKrw7
	8BFZmogE2xXw3IxEKzHpQi2UGRcxUwkvRQfyVAYbEnkYxzkLpuu8QYXPpVPVepyegiwqE8g31gP
	h2loeuM/lwqIaK6riiIcYNf29DCrHoDwyXy+RjeaQ7IfqNKG61mgdAP03xAQ5kAhfjiDlfNJHKL
	qKCIjHURRANAi65Vnd9Oxm1rm4fQOip7yBYxML7fF5+37fjQ0mf7tkv7C2lZCkvK90ICnrPdTx3
	LGES90C6wGN7ypsYUQ+8AwfnH7jH5D0ZM=
X-Received: by 2002:a05:600c:528c:b0:488:a2ac:a337 with SMTP id 5b1f17b1804b1-488d68c2bffmr213398185e9.21.1776155296847;
        Tue, 14 Apr 2026 01:28:16 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488ec77508csm54500935e9.0.2026.04.14.01.28.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 01:28:16 -0700 (PDT)
Message-ID: <a2362c89-e9ea-4c11-80ac-b65786da1e32@tuxon.dev>
Date: Tue, 14 Apr 2026 11:28:13 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/17] dmaengine: sh: rz-dmac: Do not disable the
 channel on error
To: Biju Das <biju.das.jz@bp.renesas.com>, "vkoul@kernel.org"
 <vkoul@kernel.org>, "Frank.Li@kernel.org" <Frank.Li@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>, "perex@perex.cz"
 <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Long Luu <long.luu.ur@renesas.com>
Cc: "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20260411114303.2814115-1-claudiu.beznea.uj@bp.renesas.com>
 <20260411114303.2814115-6-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB11346923D8D18E79A9F7AC10086262@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <TY3PR01MB11346923D8D18E79A9F7AC10086262@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/11/26 15:30, Biju Das wrote:
> 
> 
>> -----Original Message-----
>> From: Claudiu <claudiu.beznea@tuxon.dev>
>> Sent: 11 April 2026 12:43
> -soc@vger.kernel.org; Claudiu Beznea
>> <claudiu.beznea.uj@bp.renesas.com>
>> Subject: [PATCH v4 05/17] dmaengine: sh: rz-dmac: Do not disable the channel on error
>>
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Disabling the channel on error is pointless, as if other transfers are queued, the IRQ thread will be
>> woken up and will execute them anyway by calling rz_dmac_xfer_desc().
>>
>> rz_dmac_xfer_desc() re-enables the transfer. Before doing so, it sets CHCTRL.SWRST, which clears
>> CHSTAT.DER and CHSTAT.END anyway.
>>
>> Skip disabling the DMA channel and just log the error instead.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>
>> Changes in v4:
>> - none
>>
>> Changes in v3:
>> - none, this patch is new
>>
>>   drivers/dma/sh/rz-dmac.c | 4 ----
>>   1 file changed, 4 deletions(-)
>>
>> diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c index 40ddf534c094..943c005f52bd
>> 100644
>> --- a/drivers/dma/sh/rz-dmac.c
>> +++ b/drivers/dma/sh/rz-dmac.c
>> @@ -871,10 +871,6 @@ static void rz_dmac_irq_handle_channel(struct rz_dmac_chan *channel)
>>   	if (chstat & CHSTAT_ER) {
>>   		dev_err(dmac->dev, "DMAC err CHSTAT_%d = %08X\n",
>>   			channel->index, chstat);
>> -
>> -		scoped_guard(spinlock_irqsave, &channel
> ->vc.lock)
>> -			rz_dmac_disable_hw(channel);
> 
> On previous patch, rz_dmac_disable_hw() for initializing each register
> 
> +	/* Initialize register for each channel */
> +	rz_dmac_disable_hw(channel);

This initializes a single register by clearing various bits.

> 
> 
> As per hardware manual,
> 
> Once an error occurs, the data of the whole transfer cannot be guaranteed.
> Be sure to start the transaction again from the
> beginning by following the procedure below.
> 1. Set 1 in the SWRST bit of the CHCTRL_n/nS register.
> 2. Set each register again.

I wasn't aware of this sequence. Thank for pointing it. However, calling 
rz_dmac_disable_hw() as it previously was may be wrong from my point of view. 
According to the sequence you pointed, I think the code here should have only 
set the SWRST, if any, and let the rz_dmac_xfer_desc() "set each register 
again". According to "Figure 14.26 Setting Example 4", of RZ/G3S HW manual, rev 
1.20, the registers that need to be set when starting DMAC ch in Link mode are:

- DCTRL = 0x1
- NXLA = 0x1000
- CHCFG = 0x80000000
- CHCTRL = 0x8 // swreset
- CHCTRL = 0x5 // enable

So, I think these are the registers that need to be re-configured again (handled 
though the rz_dmac_xfer_desc()).

Anyway, I'll drop this patch from the next version, as it is not the subject of 
cyclic DMA.

Thank you,
Claudiu
