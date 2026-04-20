Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CA935AC35
	for <linux-sound@vger.kernel.org>; Mon, 20 Apr 2026 12:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776688654; cv=none; b=u8KGOykcJiclH4cekVoDDGTA2wsl4lK9Ln3txzYtO+UIJDybLl05xPpqGq2pYVBwewO8nawejWPYtFG4g/UIdM9/DBHBbrliTddwIHmf7JKKeN8FCu9fooR3IKlS8YAdJveAJZzwgmUZVayxKI7GPMtlcp34SmNqJveM+Vm1kwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776688654; c=relaxed/simple;
	bh=GewwbgHk+o2+xPkPmPhmuzTxmZwwfVsQHrlfNKQhGZM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=knEfWlJzkLRCFJ9My61sDUDJvqwZybUoNtpCU263htY4dymMz3LtnjJ7XVuiL8/S4/XykE+JVFSXyRqqQyR4d6IIIvqaV+Nc4OAPmTvKsXAneI8ST3nUowu4dEGeGz/66FjzptWOuMeDxH1Fqx3bCQx57jU/+PtX7XyIoUOpWxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=YftXYLZj; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="YftXYLZj"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43cfd832155so2164068f8f.1
        for <linux-sound@vger.kernel.org>; Mon, 20 Apr 2026 05:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1776688651; x=1777293451; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N5b8CCS1VSu5GvMJBIR3HgnPKkawuaeLOcBo8NsEW5g=;
        b=YftXYLZjI0O0j1/JVV89RjTA8cr7dtmA52b/Rny+aPevCNkQL1R25PNvDIRO7D0ubI
         u+nNmPkgaMEbztaSuME8fQTChrsXY+wIQU30poWghykDv5RABOauImLygJUDE+OjAEcF
         TlPyUSQjaW71N87zeXi+N+4IZFoBXUwLvh6IlE/cWDAIAmUKYGaDBSejjj9slLV66fzm
         yXMs/qy4e1GmYdfpq1phN5SFIARKOVbEV8mMwVJppRFOoT3jXQKGaBhI5fP01Pt9W0P4
         X3GqN98ErpAkkL60L36pePJNeWx0sV9NYxD8Q3sB9I0uqDFpybza09fEibD9GoJwIEwa
         rPRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776688651; x=1777293451;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N5b8CCS1VSu5GvMJBIR3HgnPKkawuaeLOcBo8NsEW5g=;
        b=WwQSZl+mYsx/HSShBiHL9UiEl3rR5UJ4AXAtE1zwtsoxdGJo6JNQ4skOME6ZCuXBD2
         49pWUwLKbYJfMvQhbyRERzpr0w5c4yRvjrbWNBS1JLeRQjkL6hpPJ18nPcV5K2BVyTWJ
         DTOvXAoiUdOw0ZDkiQMv0Y6mEEOI06dLvyJViGcNYA8zygED30Gw76IPAWW6JId2u63+
         HvaMbNPpuQZCDqCcqb+mbw81hPil16TcYBpCRzH3C2C4E+VMLsMtvl+N2uAYON9M+/mi
         x7CtFzsOyce+l2slBoNkwzbh/WUYEvf5ibSfHSo0dshh7nbUx6KF19j6KYU1iNx0ewlU
         dqeA==
X-Forwarded-Encrypted: i=1; AFNElJ9rz48orC6gmTau/uGQnU60NLUX5Z35eW2ZjnU2Cd4rJMPaJ+2T276G8ZNTTCFbhnbMWw6+vjcCtRCAzA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrMbXv0fHzPxAmPPaBRS5CGS5h+JZOUHdV2FtFFvg47F6LoVMX
	VvJBpeozyzeeS1/StZ74c6GlLYzfes1yQAaEn0CvpzpSGiQLm6puSARqoDE4ffpEI3gfDoWpDYo
	llm13
X-Gm-Gg: AeBDies5Gut8CEsQKXvCB79tvtUkxm0MqBdpKv/YG47u7AQ/VVCEjN6wSgHXtaZFFYp
	E67tgdxWt0fNdoynXp0Xo+4sxZpqQmsnY9AnMrNTCQ4DKBHFcJDU1zU3Gg97PzSVHuSK8lLhvBx
	OBrjOqbZ6hpK5gwDPpYNM1GE2HZH4XO+Z5jErKsDK+R7tQGfkHsaljH8VTnel1tY+vDQvhPc/w+
	/fY/rYm30Xh0KXvlMRedeoYnO77HJwgNGAdJssVJkX7hx+OkdQyyQjeFmXCasfx3Icb9+zIHvTR
	zaYSN0n298pcvyHhK7BXMvCagebQeJ3rMB/RC12ZX7uk8ar3AAm2SzTHBWrf4zY0a6a/ItBpc9p
	v7YQOa/HqxDpjBgtMRR6RmJZg1Jqme8LXsl9wMYYdSZdSpIwb6+vp4IuZy0j1zg+uZWg40EU1wk
	TSaI32vEDmOHrgILO7OD2UAAYIDlp4srYNL9OG7ntsfg==
X-Received: by 2002:a05:6000:2c0c:b0:43e:b0f7:9ce9 with SMTP id ffacd0b85a97d-43fe3dc49c6mr21458783f8f.14.1776688650474;
        Mon, 20 Apr 2026 05:37:30 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cc07bbsm30970515f8f.11.2026.04.20.05.37.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 05:37:29 -0700 (PDT)
Message-ID: <266efa0b-0cd8-496f-8ce1-6210593f5ae5@tuxon.dev>
Date: Mon, 20 Apr 2026 15:37:28 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: sashiko.dev review (Re: [PATCH v4 07/17] dmaengine: sh: rz-dmac: Save
 the start LM descriptor)
To: vkoul@kernel.org, Frank.Li@kernel.org, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 p.zabel@pengutronix.de, geert+renesas@glider.be,
 fabrizio.castro.jz@renesas.com, long.luu.ur@renesas.com
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20260411114303.2814115-1-claudiu.beznea.uj@bp.renesas.com>
 <20260411114303.2814115-8-claudiu.beznea.uj@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260411114303.2814115-8-claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

 > commit 3d17698f275248947e3d2df42293a89e89cafaa6
 > Author: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
 > dmaengine: sh: rz-dmac: Save the start LM descriptor
 > Save the start LM descriptor to avoid looping through the entire
 > channel's LM descriptor list when computing the residue. This avoids
 > unnecessary iterations.
 > > diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
 > > index 6bea7c8c70537..0f871c0a28bd9 100644
 > > --- a/drivers/dma/sh/rz-dmac.c
 > > +++ b/drivers/dma/sh/rz-dmac.c
 > [ ... ]
 > > @@ -377,6 +380,7 @@ static void rz_dmac_prepare_descs_for_slave_sg(struct 
rz_dmac_chan *channel)
 > >     }
 > >
 > >     lmdesc = channel->lmdesc.tail;
 > > +   d->start_lmdesc = lmdesc;
 > >
 > >     for (i = 0, sg = sgl; i < sg_len; i++, sg = sg_next(sg)) {
 > >             if (d->direction == DMA_DEV_TO_MEM) {
 > This isn't a bug introduced by this patch, but is there a potential buffer
 > overflow in the link descriptor ring due to a lack of bounds checking?

That can happen but this is not the scope of this series. Series is already long 
enough. I will address this in a separate series after the current one will be 
merged.

 > The driver allocates a fixed-size ring buffer of 64 link descriptors
 > (DMAC_NR_LMDESC). However, rz_dmac_prepare_descs_for_slave_sg() iterates over
 > the provided scatterlist and increments the lmdesc pointer without ever
 > verifying if the number of scatterlist elements exceeds 64.
 > If a client submits a sufficiently large scatterlist, will it silently
 > overflow the ring buffer, overwriting the descriptors it just wrote, and
 > cause the DMA controller to read a corrupted list of operations?
 > [ ... ]
 > > @@ -693,9 +697,10 @@ rz_dmac_get_next_lmdesc(struct rz_lmdesc *base, struct 
rz_lmdesc *lmdesc)
 > >     return next;
 > >  }
 > >
 > > -static u32 rz_dmac_calculate_residue_bytes_in_vd(struct rz_dmac_chan 
*channel, u32 crla)
 > > +static u32 rz_dmac_calculate_residue_bytes_in_vd(struct rz_dmac_chan *channel,
 > > +                                            struct rz_dmac_desc *desc, u32 
crla)
 > >  {
 > > -   struct rz_lmdesc *lmdesc = channel->lmdesc.head;
 > > +   struct rz_lmdesc *lmdesc = desc->start_lmdesc;
 > >     struct dma_chan *chan = &channel->vc.chan;
 > >     struct rz_dmac *dmac = to_rz_dmac(chan->device);
 > >     u32 residue = 0, i = 0;
 > Can this lead to a NULL pointer dereference?
 > In rz_dmac_prep_slave_sg(), a new descriptor is immediately added to
 > channel->ld_queue. If a previous transfer completes before the client calls
 > dma_async_issue_pending(), rz_dmac_irq_handler_thread() attempts to start the
 > next transfer from ld_queue.
 > However, vchan_next_desc() returns NULL since the transfer hasn't been
 > issued, causing rz_dmac_xfer_desc() to return 0 without executing the hardware
 > preparation function. The IRQ handler sees the 0 return value and erroneously
 > moves the unprepared descriptor to channel->ld_active.
 > If dmaengine_tx_status() is subsequently called, rz_dmac_chan_get_residue()
 > fetches this active descriptor. Because it was never prepared, the newly added
 > desc->start_lmdesc pointer remains NULL.
 > The loop while (lmdesc->nxla != crla) then immediately dereferences NULL.
 > Note that this issue was fixed later in the series by commit 'dmaengine: sh:
 > rz-dmac: Use virt-dma APIs for channel descriptor processing'.

All the above could happen and the scope of patch "dmaengine: sh:
rz-dmac: Use virt-dma APIs for channel descriptor processing" was to fix all 
these subtle issues. The patch here is only a preparation patch to keep things 
simple in "dmaengine: sh: rz-dmac: Use virt-dma APIs for channel descriptor 
processing"

 > Additionally, this isn't a bug introduced by this patch, but does the
 > mathematical logic in the residue calculation produce incorrect results?
 > The loop while (lmdesc->nxla != crla) in
 > rz_dmac_calculate_residue_bytes_in_vd() locates the link descriptor preceding
 > the currently executing one. The subsequent loop while (lmdesc->chcfg &
 > CHCFG_DEM) then iterates from this preceding descriptor, adding lmdesc->tb to
 > the residue.
 > If the hardware is executing the second descriptor of a transfer, it adds the
 > total size of the first (already completed) descriptor, the total size of the
 > second (currently executing) descriptor, and crtb (the remaining bytes of the
 > second descriptor). Does this mathematically double-count bytes and include
 > already transferred data?
 > Conversely, if executing the first descriptor, the first loop wraps around the
 > entire ring buffer, encounters the final descriptor of the previous transfer,
 > and since its CHCFG_DEM bit is cleared, the second loop immediately
 > terminates. Does this completely omit all subsequent descriptors from the
 > residue calculation?

I think this is a valid point that I also noticed and thought about it. However, 
I would like to keep it aside from this series, as it is already too big.

 > [ ... ]
 > This isn't a bug introduced by this patch, but is there a pre-existing race
 > condition with dma_async_issue_pending()?
 > rz_dmac_issue_pending() unconditionally calls rz_dmac_xfer_desc() if
 > vchan_issue_pending() returns true, without checking if a transfer is already
 > actively executing in hardware (e.g., if channel->desc is already set).
 > For RZ_DMAC_DESC_MEMCPY transfers, the driver does not advance
 > channel->lmdesc.tail, meaning the newly issued transfer will silently
 > overwrite the exact link descriptor currently being executed by the active
 > hardware. Does this lead to memory corruption and undefined hardware behavior?
 > Note that this is fixed later in the series by commit 'dmaengine: sh: rz-dmac:
 > Use virt-dma APIs for channel descriptor processing' which properly checks
 > !channel->desc.

The role of the pointed descriptors was to fix all these subtle issues.


