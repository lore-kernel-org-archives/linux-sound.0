Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DFA1799F
	for <linux-sound@vger.kernel.org>; Mon, 20 Apr 2026 12:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776688917; cv=none; b=iTZTltnJZFWEVl+ZsvlDbDE7p0oPEKMbe6Na0aTgzOMfk68hkgLouDcplQQVLkkcuPHa2/vd4UkbGYUARP1vuIa9kw0f+lLqwV2wlfUysRnsx1EE1GSLfcmPbQ9MoGCEhd7W5uUzeOyCxtZe773cR+S+4IoSL8ADWxjKIw5zhoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776688917; c=relaxed/simple;
	bh=TG8h+neqjkYZC2m8rnh+3a6LVcDlYr68NmZwI4Mo0Wo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZrK/VHSZsFtSvOUZrE75DB2ZAgnf6wlP8Gh9OhsVgXB5dBYN8dZ40pqPAmWbLPhdD9Pxkr2zvV+yCvT0Qu/etmu8GchABUR4RWkBKqxnmt6C+37lu3mO8BB8ZKHW6taoFOICexP+vvJDnDhwK8t8Gg0zQz/amueeNOkaT5PkhnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Ws1s+v8O; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Ws1s+v8O"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48896199cbaso31863135e9.1
        for <linux-sound@vger.kernel.org>; Mon, 20 Apr 2026 05:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1776688913; x=1777293713; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lYErRyGVokWgLMlqXgqLxaehKz8xzZzJqzxhe78OldQ=;
        b=Ws1s+v8OS9LLvtmGYFtTZY0CpVvFa/RYvsjnnoEuNsO6EeztzlO/fje+YGPXf8BgQl
         ibvJ+5Hv/0NYVisnpUq2vssaa4qUfNuH004KRXmyi5E7JC+5q7E3ZuP3vX1cnz4UBu6w
         Reg/2gRoJEsijz7E1LrsCFAsBzPUMp2yFeYU95ks+NRFEd5xP44Ip/nqB1PKip/T/tX+
         p970oDzS9kS03h32WFyQCOZPhnQczxhTo0Foyp0Zya2M4t+kPG7VQHQoqk/tbGW7id+G
         3Qm923ju7D8b35MO1H9L5QubF7CovvG8p3n+HZ+lY0dm2gYmjyNTr8Gb1HKk0Hj71xhI
         ciMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776688913; x=1777293713;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lYErRyGVokWgLMlqXgqLxaehKz8xzZzJqzxhe78OldQ=;
        b=ho2Fp7Pap4g4Te9b8oZsb3uObTs4JXtdRZGmgPTPwY/lIckOajaNtt07rHKSWz1grr
         PCgDzByBtcXK6v6FeDvD0Z8EoMPeeC9nsP9BNZJFy79fH2jiUchigaPisq57VgXf/grI
         mhCYJ6dILqb3HHY9mC/yFALvshlKCkPsyY/ag87rkhf8PkwffCGZjrO/JDDywVPEIcif
         MYgEDdcyPQ1Khc/34dNqtT0mTKFpmY4rEUxmocyvpmV3ITJyLNI/phfZPVImM9OzRMoc
         Uf5GCg25zt8Y6uAM/OMCOqGnLco4VDuNODsEB0tLGFY0yad7C5KDMFszI3iBMnvNdqs8
         qBzA==
X-Forwarded-Encrypted: i=1; AFNElJ8Dtf6Mgm5UZHOMYOO3QubTm7EdDlF6nXjcFh811TviWjgpLQrhGtXGxQYtkWGSTtDa/1y2fg8AQmg0CA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgzzbOtI2hXX5Wl9riXMQJB7xSNm0oVRT4B2+7XXV5SLnK90Q3
	lAzLr9/LL1JnO7hGSFvtHvTpmlTylPg8LvVBEUdd1P9cXhGClaYdf36OuOWsCxmo38U=
X-Gm-Gg: AeBDievI/V56PT0pKNDXdVs2hApyEUzuPbP/yIKRUO/3nWsrmkfzAkWmzQvdp5qdAZB
	60ywiqV9vRV0dTJY3Lz9SxjmI7onMFwjJOBDnKat1f2J0Q2yfxS4DEXDnJPpYf5O1iM1e0HDSlZ
	S9cvBBuibknKxG8A2CnkpE7S1O4/9Sfi4kHoM4yb4bJYcEDjNdYPn2TvzvTZoyNQi0DE1Edy4Bp
	Ik50wQ543XR83iToEbMylkSsU3r3LF5RLdzMfOh0AtRAg6wjzDCn5fpKDqKCzQyw5LMlSMZ5uDv
	cyZTXg30t+QKbeB55YI4uqaX4/GdH/UN/gvN6tHX1zi9M1nq1TmUDnDSUO+bkWSLD6CZKdZ5xa7
	zFMW6Y0q7JLgOuib2o9psjNL6WTr25GVeQ6FsdNBp36OqUpF9Ht2tg/Wb6ugWiOHfliSRX+OLfS
	50cDOjE8h8p2KA31RchDaKlseginqH8Dgu6/MF0KogdQ==
X-Received: by 2002:a05:600c:8115:b0:488:8577:d9cc with SMTP id 5b1f17b1804b1-488fb77faacmr157970525e9.20.1776688912595;
        Mon, 20 Apr 2026 05:41:52 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb796ea2sm125264435e9.7.2026.04.20.05.41.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 05:41:52 -0700 (PDT)
Message-ID: <51d92b2a-152e-4b7a-a066-3bb43687ac5f@tuxon.dev>
Date: Mon, 20 Apr 2026 15:41:50 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: sashiko.dev review (Re: [PATCH v4 10/17] dmaengine: sh: rz-dmac: Use
 virt-dma APIs for channel descriptor processing)
To: vkoul@kernel.org, Frank.Li@kernel.org, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 p.zabel@pengutronix.de, geert+renesas@glider.be,
 fabrizio.castro.jz@renesas.com, long.luu.ur@renesas.com
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20260411114303.2814115-1-claudiu.beznea.uj@bp.renesas.com>
 <20260411114303.2814115-11-claudiu.beznea.uj@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260411114303.2814115-11-claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

 > commit c2a00d64377d19d3ae2ce858af0fab6e9fae6f1a
 > Author: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
 > Subject: dmaengine: sh: rz-dmac: Use virt-dma APIs for channel descriptor 
processing
 > This commit converts the rz-dmac driver to fully use virt-dma APIs for
 > descriptor processing. It removes custom queue management (ld_queue,
 > ld_active), keeping only ld_free to track pre-allocated descriptors. It also
 > simplifies residue calculation and synchronization mechanisms.
 > > diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
 > > index f35ff57397189..04eb1a7f1e627 100644
 > > --- a/drivers/dma/sh/rz-dmac.c
 > > +++ b/drivers/dma/sh/rz-dmac.c
 > [ ... ]
 > > @@ -494,8 +485,6 @@ static void rz_dmac_free_chan_resources(struct dma_chan 
*chan)
 > >     rz_lmdesc_setup(channel, channel->lmdesc.base);
 > >
 > >     rz_dmac_disable_hw(channel);
 > > -   list_splice_tail_init(&channel->ld_active, &channel->ld_free);
 > > -   list_splice_tail_init(&channel->ld_queue, &channel->ld_free);
 > >
 > >     if (channel->mid_rid >= 0) {
 > >             clear_bit(channel->mid_rid, dmac->modules);
 > > @@ -504,13 +493,19 @@ static void rz_dmac_free_chan_resources(struct 
dma_chan *chan)
 > >
 > >     spin_unlock_irqrestore(&channel->vc.lock, flags);
 > >
 > > +   vchan_free_chan_resources(&channel->vc);
 > > +
 > > +   spin_lock_irqsave(&channel->vc.lock, flags);
 > Can this result in a memory leak and use-after-free regression?
 > The patch removes the old list splicing but does not clear channel->desc.
 > If rz_dmac_free_chan_resources() is called without a prior terminate,
 > channel->desc is not returned to ld_free or freed by
 > vchan_free_chan_resources(), leading to a memory leak of the descriptor.

AFAIK, it is expected hat device_terminate_all() is called before before 
device_free_chan_resources().

Vinod, Frank,

Could you please let me know if my assumption is wrong?

Thank you!

 > Additionally, the hardware is disabled and the lock is temporarily dropped
 > before calling vchan_free_chan_resources(). During this unlocked window, the
 > rz_dmac_irq_handler_thread could execute since channel->desc is not NULL.
 > This would complete the descriptor, call rz_dmac_xfer_desc(), fetch the next
 > descriptor, and restart the hardware while the channel is being destroyed.

If device_terminate_all() is called before before device_free_chan_resources() 
this shouldn't happen. channel->desc is set to null in device_terminate_all().

 > Should vchan_terminate_vdesc() be called to clear channel->desc under the
 > lock before dropping it?

This is already done in device_terminate_all().

 > [ ... ]
 > > @@ -558,22 +553,22 @@ rz_dmac_prep_slave_sg(struct dma_chan *chan, struct 
scatterlist *sgl,
 > >             if (!desc)
 > >                     return NULL;
 > >
 > > -           for_each_sg(sgl, sg, sg_len, i)
 > > -                   dma_length += sg_dma_len(sg);
 > > +           list_del(&desc->node);
 > > +   }
 > >
 > > -           desc->type = RZ_DMAC_DESC_SLAVE_SG;
 > > -           desc->sg = sgl;
 > > -           desc->sgcount = sg_len;
 > This issue is not introduced by this commit, but could this assignment cause a
 > buffer overflow?
 > The variable sg_len is assigned to desc->sgcount without validating that it is
 > less than or equal to the hardware limit (DMAC_NR_LMDESC, which is 64). Later
 > in rz_dmac_prepare_descs_for_slave_sg(), the code iterates sgcount times to
 > populate the hardware descriptor ring. If an SG list with more than 64 entries
 > is provided, the loop will wrap around and overwrite the beginning of the DMA
 > ring, corrupting the DMA descriptors.

As mentioned in a previous review comment, this can happen but, as it is not 
introduced by this series, I'll prepare a cleanup patch later, after this series 
will be integrated, as it is already big enough.

 > [ ... ]
 > > @@ -692,6 +681,8 @@ static void rz_dmac_device_synchronize(struct dma_chan 
*chan)
 > >     u32 chstat;
 > >     int ret;
 > >
 > > +   vchan_synchronize(&channel->vc);
 > > +
 > >     ret = read_poll_timeout(rz_dmac_ch_readl, chstat, !(chstat & CHSTAT_EN),
 > >                             100, 100000, false, channel, CHSTAT, 1);
 > Could calling vchan_synchronize() before polling the hardware lead to a
 > use-after-free?
 > If the hardware is actively processing a transfer, vchan_synchronize() will
 > return immediately because no completion tasklet has been scheduled yet.
 > The hardware is then polled until it finishes, at which point it asserts an
 > IRQ and schedules the virt-dma tasklet.
 > However, the caller of rz_dmac_device_synchronize() would have already
 > resumed assuming all activity is finished, potentially freeing the transfer
 > context before the delayed tasklet runs.
 > Should vchan_synchronize() be called after read_poll_timeout() ensures the
 > hardware has actually stopped?

AFAIK, it is expected at this point that the user alredy called 
device_terminate_all(). That frees the active transfer and sets channel->desc = 
NULL which don't allow scheduling any tasklet.

Vinod, Frank,

Could you please let me know if I'm wrong here?


 > [ ... ]
 > > @@ -739,58 +730,22 @@ static u32 
rz_dmac_calculate_residue_bytes_in_vd(struct rz_dmac_chan *channel,
 > >  static u32 rz_dmac_chan_get_residue(struct rz_dmac_chan *channel,
 > >                                 dma_cookie_t cookie)
 > >  {
 > > -   struct rz_dmac_desc *current_desc, *desc;
 > > -   enum dma_status status;
 > > +   struct rz_dmac_desc *desc = NULL;
 > > +   struct virt_dma_desc *vd;
 > >     u32 crla, crtb, i;
 > >
 > > -   /* Get current processing virtual descriptor */
 > > -   current_desc = list_first_entry_or_null(&channel->ld_active,
 > > -                                           struct rz_dmac_desc, node);
 > > -   if (!current_desc)
 > > -           return 0;
 > [ ... ]
 > > +   vd = vchan_find_desc(&channel->vc, cookie);
 > > +   if (vd) {
 > > +           /* Descriptor has been issued but not yet processed. */
 > > +           desc = to_rz_dmac_desc(vd);
 > > +           return desc->len;
 > > +   } else if (channel->desc && channel->desc->vd.tx.cookie == cookie) {
 > > +           /* Descriptor is currently processed. */
 > > +           desc = channel->desc;
 > > +   }
 > >
 > > -           /*
 > > -            * No descriptor found for the cookie, there's thus no residue.
 > > -            * This shouldn't happen if the calling driver passes a correct
 > > -            * cookie value.
 > > -            */
 > > -           WARN(1, "No descriptor for cookie!");
 > > +   if (!desc) {
 > > +           /* Descriptor was not found. May be already completed by now. */
 > >             return 0;
 > >     }
 > Does this logic correctly handle descriptors that have been submitted but not
 > yet issued?
 > The vchan_find_desc() function only searches the desc_issued list. If a client
 > has submitted a transfer using vchan_tx_submit() but has not yet called
 > dma_async_issue_pending(), the descriptor will be in the desc_submitted list.
 > As a result, vd will be NULL, and the function will fall through to return
 > 0 bytes instead of the descriptor's true length. This changes the behavior
 > from the previous implementation and may break clients that rely on
 > dmaengine_tx_status() to check the progress of submitted transfers.

Investigating the already existing drivers using the pattern proposed in this 
set found that this is the way the checked drivers are implemeinting the 
tx_status API. Based on that, I've adjusted it like this.

Vinod, Frank,

Could you please let me know what is expected here?

Thank you!

 > [ ... ]
 > > @@ -914,28 +865,18 @@ static irqreturn_t rz_dmac_irq_handler(int irq, void 
*dev_id)
 > >  static irqreturn_t rz_dmac_irq_handler_thread(int irq, void *dev_id)
 > >  {
 > >     struct rz_dmac_chan *channel = dev_id;
 > > -   struct rz_dmac_desc *desc = NULL;
 > > -   unsigned long flags;
 > > +   struct rz_dmac_desc *desc;
 > >
 > > -   spin_lock_irqsave(&channel->vc.lock, flags);
 > > +   guard(spinlock_irqsave)(&channel->vc.lock);
 > >
 > > -   if (list_empty(&channel->ld_active)) {
 > > -           /* Someone might have called terminate all */
 > > -           goto out;
 > > -   }
 > > +   desc = channel->desc;
 > > +   if (!desc)
 > > +           return IRQ_HANDLED;
 > >
 > > -   desc = list_first_entry(&channel->ld_active, struct rz_dmac_desc, node);
 > >     vchan_cookie_complete(&desc->vd);
 > > -   list_move_tail(channel->ld_active.next, &channel->ld_free);
 > This issue is not introduced by this commit, but can a race condition here
 > lead to premature completion of new transfers?
 > If a transfer completes and asserts the hardirq, the threaded handler is
 > scheduled. Before the thread runs, the client could call
 > dmaengine_terminate_all() and immediately issue a new transfer. The
 > rz_dmac_issue_pending() function would start the new transfer and assign it
 > to channel->desc.
 > When the delayed IRQ thread finally runs, it takes the lock and sees
 > channel->desc pointing to the new transfer. It then unconditionally completes
 > it via vchan_cookie_complete(). This could result in a transfer being
 > prematurely reported as complete while it is still running.

I think this can happen in theory, but, as it is a behaviour not introduced by 
this commit I will keep the series as is.


