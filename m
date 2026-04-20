Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80EE3A3838
	for <linux-sound@vger.kernel.org>; Mon, 20 Apr 2026 12:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776689469; cv=none; b=GbyOjMUZD79Kn8s+UbzEhL3cURzfssTEhJ1m30wj3fujahpjfrz7xbFptgTbKpNFgxs7OzFSqX2w4scZ42P9BtX7/xjPecy1po2WTm8DTI0xG6uGrnYHdhGVdsJ0XYOfyhkZ3JoFMs5stHp4Zg2V2KiqEoykTF618NmZFpB8rSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776689469; c=relaxed/simple;
	bh=GjzpQGSlzmq4JGLEUzkRDbk43l5X0HJhsEu+aFSgxak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QIqDgh+MUg2nOq2JstsFzWNZHO7S4yf1tLVLkMZt0glSGDCqVPr8IPg9DotXUn0DwVtDUE62JSjy0xX3ENDRilUO0VT+6SJP+ic0ZNMQdRmE9AXhKx0yx1EGrHKQgW0sbrh9tXYP3ZHDiDpXVe+BiW+mbiHOO9SDaRdu/qrmP6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Hk91EX9i; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Hk91EX9i"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so44294285e9.2
        for <linux-sound@vger.kernel.org>; Mon, 20 Apr 2026 05:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1776689465; x=1777294265; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DwmFMA4VViFtwcMmrRs7UsG2wa49WxvRCvYdPiRzSRg=;
        b=Hk91EX9iPQQFRWP7bM+GPkpq9Y8JpinhvrnRbGS9JC+4MWxY0+vUYsgOIcgY2ogBnD
         1EYM7ttCOhnq9AbuSAK5u5WF6oMG9pSE9JFqVK1bKG8nRBInEVZez9C+vQR9AC4LYkYr
         EOobxykzNmG1knboi5GFrGGFyjLguPprNhiEg7AkgPEOI3BWt2ecS+2J++OZjGYzBBCV
         frdbEWZ2iGmbOfEnT3tUJUh75GzYmB0R8F3Kwx0yED2RcpBpCh5YnL/eLkT/I3+Q/YjY
         KsxbjNtWzdLcGtpQ6/NIXwr0oZhXpqc3uX40QW8gy5Kf9ymnnBXu8lkzWWFRG29yjjx2
         d0og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776689465; x=1777294265;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DwmFMA4VViFtwcMmrRs7UsG2wa49WxvRCvYdPiRzSRg=;
        b=jQSw64gkfIvJFOD0Tuv4orsGkT4Ru/IY6501SKc+eANdTQbmipvad0V4fqAVj2y4py
         M1St1F2l8aYrjk/7zJEgK/QzWxtPtP18JdRrIXM2Eqj5WGRxw8LuCIo7x0XxOdQFmGjR
         Fcl9lIKCUC71ZjlFg9V3Qe1vRamJkEN5Dq6bsVaj6zOsFY/UPG713P+Np1ysdDOqEz6N
         MWb9Hs4tvffO+5LVfT2knRAFsXQ7NPvR3kUjOohDd3D1JlePEjDw6jDTF+OP/tfxk6ym
         4oNwtiqC+LenD0xNp8+n/ghDXJdlZyqis09712TH/iLoz6GOCEOTWkeK1Ej+2mv8+Ypw
         dpQQ==
X-Forwarded-Encrypted: i=1; AFNElJ9G1Vzhgv4xkCB5We8nEQn4g2mGSzE3j5nv+OqcRhwHzUHM8TrRVadzz01NiE1liykSbwasKTI3+xr54g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqQKXa+9FHwI7fCTfedQCg75zeGzq2DB8Ht9VU9GmRwzrPRUB5
	7/uGUGkhflx2qdKbkQ1FkfS+NEZTiWC3U5uYpcpWyuggkb/uUmhp8sMav9ABqwE0UdE=
X-Gm-Gg: AeBDiev2aGi31OYiHs2X4sQZMhVbRMGK04v0CQVmtQiVLb143Vii9NdOu6NiQBvRhor
	Rg60d4Cv6SXA38vhHEJceFu6Hzb3rVRSmpsssEmQc9c7AhCZnXQdT1QGOGPqCgIoRs/u4iu/5JY
	GYyBOncGAMoufZifjKA0IjzBa/KRUi0YEDG07v0Q5QSB5Y7+biEkbg4CX92tr2zmT+2XM7Do3mR
	g6rJUEAiHQTBzuhz73XrOzou58mmi6klDuFGCk1cMpesySdOs2zCDp8/IPhMUrqTD2k2yMA2vWt
	c9Mv7/VroeWyb8HRegfgupneCxEpNV7sUD66bp4cHpDaQlWbibn5Bxym7hgwfteMnSUGP87CQK/
	7lYHE6NKpHK+YvH7xA4poStdz3KCo6AqljSq/M2AZyVFuLntM8sKsuXVPvR08T1maLa6qFnPBxR
	bdi816dAfAGAQ5uEav5AbygkPDoTyHh4ht+hGM7tTtBA==
X-Received: by 2002:a05:600c:348b:b0:489:5022:39a4 with SMTP id 5b1f17b1804b1-4895040c025mr31948545e9.9.1776689465141;
        Mon, 20 Apr 2026 05:51:05 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc100162sm307580375e9.5.2026.04.20.05.51.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 05:51:04 -0700 (PDT)
Message-ID: <047007f9-d5cc-401a-846a-ab13ad0380b6@tuxon.dev>
Date: Mon, 20 Apr 2026 15:51:03 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: sashiko.dev review (Re: [PATCH v4 13/17] dmaengine: sh: rz-dmac: Add
 cyclic DMA support)
To: vkoul@kernel.org, Frank.Li@kernel.org, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 p.zabel@pengutronix.de, geert+renesas@glider.be,
 fabrizio.castro.jz@renesas.com, long.luu.ur@renesas.com
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20260411114303.2814115-1-claudiu.beznea.uj@bp.renesas.com>
 <20260411114303.2814115-14-claudiu.beznea.uj@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260411114303.2814115-14-claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

 > commit cb66d54ec04fe2598560135c66410142d7295633
 > Author: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
 > dmaengine: sh: rz-dmac: Add cyclic DMA support
 > This commit introduces cyclic DMA support to the RZ DMAC driver. It adds a
 > per-channel status bit to mark cyclic channels and sets it during the DMA
 > prepare callback. The IRQ handler then uses this bit to determine whether
 > to invoke the cyclic callback function.
 > > diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
 > > index 958ee45abc700..9a10430109e59 100644
 > > --- a/drivers/dma/sh/rz-dmac.c
 > > +++ b/drivers/dma/sh/rz-dmac.c
 > [ ... ]
 > > @@ -586,6 +645,55 @@ rz_dmac_prep_slave_sg(struct dma_chan *chan, struct 
scatterlist *sgl,
 > [ ... ]
 > > +   scoped_guard(spinlock_irqsave, &channel->vc.lock) {
 > > +           if (channel->status & BIT(RZ_DMAC_CHAN_STATUS_CYCLIC))
 > > +                   return NULL;
 > > +
 > > +           desc = list_first_entry_or_null(&channel->ld_free, struct 
rz_dmac_desc, node);
 > > +           if (!desc)
 > > +                   return NULL;
 > > +
 > > +           list_del(&desc->node);
 > > +
 > > +           channel->status |= BIT(RZ_DMAC_CHAN_STATUS_CYCLIC);
 > > +   }
 > > +
 > > +   desc->type = RZ_DMAC_DESC_CYCLIC;
 > > +   desc->sgcount = period_len;
 > Can tracking cyclic state via the global channel->status flag lead to
 > cross-descriptor state corruption?
 > If a prepared cyclic descriptor is freed via dmaengine_desc_free(), the
 > global flag might not be cleared during virt-dma desc release, leaving
 > the channel poisoned.

dmaengine_desc_free() works only for reusable descriptors. This functionality is 
not implemented by the rz-dmac driver.


 > Also, because the lock is dropped when exiting the scoped_guard before
 > vchan_tx_prep() is called, a concurrent terminate_all() could potentially
 > clear the flag before the descriptor is queued.
 > Could the driver rely on the desc->type field instead of a global state
 > flag to identify cyclic transfers?

I'm going to explore that but I think this will complicates the code further.

Vinod, Frank,

Could you please let me know if this is a valid expected usecase?

 > [ ... ]
 > > @@ -733,9 +841,18 @@ static u32 
rz_dmac_calculate_residue_bytes_in_vd(struct rz_dmac_chan *channel,
 > >     }
 > >
 > >     /* Calculate residue from next lmdesc to end of virtual desc */
 > > -   while (lmdesc->chcfg & CHCFG_DEM) {
 > > -           residue += lmdesc->tb;
 > > -           lmdesc = rz_dmac_get_next_lmdesc(channel->lmdesc.base, lmdesc);
 > > +   if (channel->status & BIT(RZ_DMAC_CHAN_STATUS_CYCLIC)) {
 > > +           u32 start_lmdesc_addr = rz_dmac_lmdesc_addr(channel, 
desc->start_lmdesc);
 > > +
 > > +           while (lmdesc->nxla != start_lmdesc_addr) {
 > > +                   residue += lmdesc->tb;
 > > +                   lmdesc = rz_dmac_get_next_lmdesc(channel->lmdesc.base, 
lmdesc);
 > > +           }
 > Will this loop calculate a monotonically decreasing residue for cyclic
 > transfers?

Yes, according to my testing.

 > ALSA requires the residue to be the exact, monotonically decreasing number
 > of bytes remaining in the buffer. Iterating until the end of the descriptor
 > ring and adding the lengths of subsequent periods might cause the returned
 > residue to jump wildly depending on which period is currently executing.
 > For example, in a 3-period buffer (A, B, C), executing period B might
 > return a much larger residue than executing period A, since it would add
 > the remaining bytes in the ring differently.
 > Could this non-monotonic behavior trigger 'PCM position is invalid'
 > errors in the ALSA framework, breaking audio playback?

Never see this in my testing.

 > [ ... ]
 > > @@ -924,10 +1041,14 @@ static irqreturn_t rz_dmac_irq_handler_thread(int 
irq, void *dev_id)
 > >     if (!desc)
 > >             return IRQ_HANDLED;
 > >
 > > -   vchan_cookie_complete(&desc->vd);
 > > -   channel->desc = NULL;
 > > +   if (channel->status & BIT(RZ_DMAC_CHAN_STATUS_CYCLIC)) {
 > > +           vchan_cyclic_callback(&desc->vd);
 > > +   } else {
 > > +           vchan_cookie_complete(&desc->vd);
 > > +           channel->desc = NULL;
 > If a non-cyclic transfer completes while the global channel->status flag
 > is set, could the IRQ handler erroneously call vchan_cyclic_callback()
 > instead of vchan_cookie_complete(), permanently hanging the channel?
 > Checking desc->type == RZ_DMAC_DESC_CYCLIC here instead might prevent
 > misidentifying non-cyclic transfers as cyclic.

Once the channel is configured as cyclic it cannot be used otherwise. The use 
has to call terminate_all(), synchornize() + re-get + re-prepare the transfers.
So, this exact scenario here is invalid according to the current use case.

If the status is set it means the channel->desc = NULL, which means the IRQ 
handler is not executed up to this point.
