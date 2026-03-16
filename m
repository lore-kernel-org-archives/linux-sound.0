Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94EF839B95F
	for <linux-sound@vger.kernel.org>; Mon, 16 Mar 2026 14:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773669732; cv=none; b=R5YiAi5dNumXVaptFQdUb+FRn2nx0OvWQ9IYOVu5VvDpt/DgMT+zePMYmWevEZiOWfvlbUmK+RMuDroMRcGFw5J3S7qKnFFLZJI8oaFWKoRQX/iHteTrWGhy1MQaF7mJywU3Nunp+vIWbkj0Pd9hBy5Z7xTbaNPU/+EI0y6hMWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773669732; c=relaxed/simple;
	bh=PZ0J6PzQQlFB79MggTtpj7KejTL/7iuZbV9ZGwEnoFc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CnQGqLchcpYqanomPKF1BUrwoYop/pG3+WrMbOylD31U2FaHbqQP9epGcuRAINFgOZtlD5rpttcNy7UVknbZ5SuUDs1KtBJbwC0z2faPhWPoob5PRFPpwzLK7cO3glxCStngRz1wcO9Lycdpm5W24qV4XTfDKhHkB82ZeuAuxMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=VkOx88Ng; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="VkOx88Ng"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43a03cb1df9so4551056f8f.1
        for <linux-sound@vger.kernel.org>; Mon, 16 Mar 2026 07:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1773669729; x=1774274529; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dmbI3WtmHgbU8oxdywIQFrT/S/wwrbUfPeX2aJLJT48=;
        b=VkOx88NgHPAER2EPI/XAlr5y+MMm9qzE5BNH4zQ3LD5Lp36jPQIAC20cYXflLFp7S+
         NZdwvU0Pq6AdB7GgjgDkCE/hXyPV4U7ZcNfpXMD4/RX5tCVwjlEKExd8mqzU6+lVsFKg
         1JZfx49oBBdY9/nBh2bApxsc/RB8diAZlJxCal1jUD6eEV9Z5gCcgpT6SK1Uo+BzmqbX
         jxldTDIDBDS4XoXBWgpN8C7hb4OXbmdLP6aOVJWe483d/y4hBSydiyV6aljyqJqanXMF
         aXTzPIJbgxsfHEKB+wotUVOYn4AFFQDOp/47+r6mHUe97mMh8qi7A8SkOvTmihhIHdlg
         nSuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773669729; x=1774274529;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dmbI3WtmHgbU8oxdywIQFrT/S/wwrbUfPeX2aJLJT48=;
        b=TcBH+fLCWH3OaXWp3VuOY2SLcWJkb4yMoasfYWKf8MkiOabangh+uXJ6EcFJW996ld
         bOj4ZMvpi3hh6zD86p0yEVs9POQutBadLdnrOdQSfjG+vh+EMVjweqc2HUN6sag7uWZi
         SzeTnNd26HZmoWXxjAu1kPHsJwLc7e+QrDoQeKIglirFYeAYL4NErEaFDDuSr5sIpTjy
         1jmv6T6EAKiTveVMQkb+Qsmsw6SSZDEWRd93l0bR0Evfr9l9vSJVPcalXAoH1UBhOJQv
         MHaAF3lUOChPZMIXsSFKPabZ39POEC7gjTU800smzydkL4jpaqBlVu9exF8y6CSi+Vwn
         Ne3A==
X-Forwarded-Encrypted: i=1; AJvYcCUyoSc/kvfbSIiiZ66WVosx+rbG5fGY3TjmPgnkPh9w4yL5h0AeDihkJitOj0i7CVL5Y7AcqQ58kTM0PQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy34Nb2/pbLER0/W95p93VFU8g945DlnMivh+uxXm0MIDKEn/+
	f7bpVOQDaIo9snpU5TScCDrmqxcDbQ8x2BqxqoKwFOGXAArRSRzuxa3nWO9gM7lSt7HR3aBvxJF
	QMoBb
X-Gm-Gg: ATEYQzzbvjgKRdT2KZufLZXqsw+vUtwhl6fYvjKG7b7InFiqTY7SbeXunAdBfEwkPUZ
	deDmlyRtoukjdJ4bed9b6UcnKrPSWY9DEHjy4jmFd1VI8/aSTvFIt5uM5iO7Cf0miJwCWINZ+lV
	4O0blF45OaxpYXvfl8GLdXoxk3nVoyGSHiecodTTIsIf16JF/dDETvBMeAyQ/Bpa8dG9nmx14s1
	12YG8D9dX10B/UAyQC344YDUmm423IFPeX4Ag4TReZk9gCQb/htqO3v1jNRsczqU+228oUwyGmq
	BzYhhlK5h5QdIz7bLVSZNZCl9FSHw8SVavoueDaL9WvJdgpQxjG8S/RyUolQSXMvJvHwCSoqyMA
	7acfLYOPzlv9xCiJlyyX3b128MPwUlaZstAHgL2OZWkHjNS6t4fFWu/wEigBzqYTmxt411rWdXy
	GNir89l/2woxllXiU+PVgFVFAd3RhnCJUTSwpEkoRqFaLFCH4CXP1KY9K0+76UKb6rvnbV
X-Received: by 2002:a05:6000:2c08:b0:439:cd10:aaf1 with SMTP id ffacd0b85a97d-43a04dcbbb0mr24617391f8f.53.1773669728802;
        Mon, 16 Mar 2026 07:02:08 -0700 (PDT)
Received: from ?IPV6:2a02:2f04:6208:0:c5e3:3624:ad1c:6b4? ([2a02:2f04:6208:0:c5e3:3624:ad1c:6b4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe22529csm42738759f8f.31.2026.03.16.07.02.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 07:02:08 -0700 (PDT)
Message-ID: <513dec51-b417-41f2-bcbe-015ad99d6034@tuxon.dev>
Date: Mon, 16 Mar 2026 16:02:05 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] dmaengine: sh: rz-dmac: Add suspend to RAM support
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: vkoul@kernel.org, biju.das.jz@bp.renesas.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com, p.zabel@pengutronix.de,
 geert+renesas@glider.be, fabrizio.castro.jz@renesas.com,
 dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20260126103155.2644586-1-claudiu.beznea.uj@bp.renesas.com>
 <20260126103155.2644586-6-claudiu.beznea.uj@bp.renesas.com>
 <abKw8GKjaWHR5RtU@tom-desktop>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <abKw8GKjaWHR5RtU@tom-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Tommaso,

On 3/12/26 14:26, Tommaso Merciai wrote:
> Hi Claudiu,
> Thanks for your patch.
> 
> On Mon, Jan 26, 2026 at 12:31:53PM +0200, Claudiu wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> The Renesas RZ/G3S SoC supports a power saving mode in which power to most
>> SoC components is turned off, including the DMA IP. Add suspend to RAM
>> support to save and restore the DMA IP registers.
>>
>> Cyclic DMA channels require special handling. Since they can be paused and
>> resumed during system suspend and resume, the driver restores additional
>> registers for these channels during the resume phase. If a channel was not
>> explicitly paused during suspend, the driver ensures that it is paused and
>> resumed as part of the system suspend/resume flow. This might be the
>> case of a serial device being used with no_console_suspend.
>>
>> For non-cyclic channels, the dev_pm_ops::prepare callback waits for all
>> ongoing transfers to complete before allowing suspend-to-RAM to proceed.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---

[ ... ]

>> +static int rz_dmac_suspend(struct device *dev)
>> +{
>> +	struct rz_dmac *dmac = dev_get_drvdata(dev);
>> +	int ret;
>> +
>> +	for (unsigned int i = 0; i < dmac->n_channels; i++) {
>> +		struct rz_dmac_chan *channel = &dmac->channels[i];
>> +
>> +		guard(spinlock_irqsave)(&channel->vc.lock);
>> +
>> +		if (!(channel->status & BIT(RZ_DMAC_CHAN_STATUS_CYCLIC)))
>> +			continue;
>> +
>> +		if (!(channel->status & BIT(RZ_DMAC_CHAN_STATUS_PAUSED))) {
>> +			ret = rz_dmac_device_pause_internal(channel);
>> +			if (ret) {
>> +				dev_err(dev, "Failed to suspend channel %s\n",
>> +					dma_chan_name(&channel->vc.chan));
>> +				continue;
>> +			}
>> +		}
>> +
>> +		channel->pm_state.nxla = rz_dmac_ch_readl(channel, NXLA, 1);
>> +		channel->status |= BIT(RZ_DMAC_CHAN_STATUS_SYS_SUSPENDED);
>> +	}
>> +
>> +	pm_runtime_put_sync(dmac->dev);
>> +
>> +	ret = reset_control_assert(dmac->rstc);
>> +	if (ret) {
>> +		pm_runtime_resume_and_get(dmac->dev);
>> +		rz_dmac_suspend_recover(dmac);
>> +	}
>> +
>> +	return ret;
>> +}
> 
> Testing suspend/resume support on RZ/G3E (DMAC + RSPI) I'm seeing the
> following when suspending:
> 
> rz_dmac_suspend()
> 
>      [   50.657802] rz-dmac 11400000.dma-controller: PM: device_prepare(): genpd_prepare returns -11
>      [   50.667577] rz-dmac 11400000.dma-controller: PM: device_prepare(): genpd_prepare returns -11
>      [   50.675984] rz-dmac 11400000.dma-controller: PM: device_prepare(): genpd_prepare returns -11
>      [   50.684394] rz-dmac 11400000.dma-controller: PM: device_prepare(): genpd_prepare returns -11
>      [   50.692804] rz-dmac 11400000.dma-controller: PM: device_prepare(): genpd_prepare returns -11
>      [   50.701221] rz-dmac 11400000.dma-controller: PM: device_prepare(): genpd_prepare returns -11
>      [   50.709642] rz-dmac 11400000.dma-controller: PM: device_prepare(): genpd_prepare returns -11
>      [   50.718062] rz-dmac 11400000.dma-controller: PM: device_prepare(): genpd_prepare returns -11
>      [   50.726480] rz-dmac 11400000.dma-controller: PM: device_prepare(): genpd_prepare returns -11
>      [   50.734900] rz-dmac 11400000.dma-controller: PM: device_prepare(): genpd_prepare returns -11
> 
> I found out that this issue can be solved by:
> 
> When the IRQ handler thread completes a non-cyclic transfer and there
> are no more descriptors queued (ld_queue is empty), invalidate all
> link-mode descriptor headers and clear the RZ_DMAC_CHAN_STATUS_ENABLED
> bit into the rz_dmac_irq_handler_thread():
> 
> static irqreturn_t rz_dmac_irq_handler_thread(int irq, void *dev_id)
> {
> 	struct rz_dmac_chan *channel = dev_id;
> 	struct rz_dmac_desc *desc = NULL;
> 	unsigned long flags;
> 
> 	spin_lock_irqsave(&channel->vc.lock, flags);
> 
> 	if (list_empty(&channel->ld_active)) {
> 		/* Someone might have called terminate all */
> 		goto out;
> 	}
> 
> 	desc = list_first_entry(&channel->ld_active, struct rz_dmac_desc, node);
> 
> 	if (channel->status & BIT(RZ_DMAC_CHAN_STATUS_CYCLIC)) {
> 		desc = channel->desc;
> 		vchan_cyclic_callback(&desc->vd);
> 		goto out;
> 	} else {
> 		vchan_cookie_complete(&desc->vd);
> 	}
> 
> 	list_move_tail(channel->ld_active.next, &channel->ld_free);
> 	if (!list_empty(&channel->ld_queue)) {
> 		desc = list_first_entry(&channel->ld_queue, struct rz_dmac_desc,
> 					node);
> 		channel->desc = desc;
> 		if (rz_dmac_xfer_desc(channel) == 0)
> 			list_move_tail(channel->ld_queue.next, &channel->ld_active);
> +	} else {
> +		rz_dmac_invalidate_lmdesc(channel);
> +		channel->status &= ~BIT(RZ_DMAC_CHAN_STATUS_ENABLED);
> 	}
> out:
> 	spin_unlock_irqrestore(&channel->vc.lock, flags);
> 
> 	return IRQ_HANDLED;
> }
> 
> 
> 
>> +
>> +static int rz_dmac_resume(struct device *dev)
>> +{
>> +	struct rz_dmac *dmac = dev_get_drvdata(dev);
>> +	int ret;
>> +
>> +	ret = reset_control_deassert(dmac->rstc);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = pm_runtime_resume_and_get(dmac->dev);
>> +	if (ret) {
>> +		reset_control_assert(dmac->rstc);
>> +		return ret;
>> +	}
>> +
>> +	rz_dmac_writel(dmac, DCTRL_DEFAULT, CHANNEL_0_7_COMMON_BASE + DCTRL);
>> +	rz_dmac_writel(dmac, DCTRL_DEFAULT, CHANNEL_8_15_COMMON_BASE + DCTRL);
>> +
>> +	for (unsigned int i = 0; i < dmac->n_channels; i++) {
>> +		struct rz_dmac_chan *channel = &dmac->channels[i];
>> +
>> +		guard(spinlock_irqsave)(&channel->vc.lock);
>> +
>> +		rz_dmac_set_dma_req_no(dmac, channel->index, channel->mid_rid);
>> +
>> +		if (!(channel->status & BIT(RZ_DMAC_CHAN_STATUS_CYCLIC))) {
>> +			rz_dmac_ch_writel(&dmac->channels[i], CHCTRL_DEFAULT, CHCTRL, 1);
>> +			continue;
>> +		}
>> +
>> +		rz_dmac_ch_writel(channel, channel->pm_state.nxla, NXLA, 1);
>> +		rz_dmac_ch_writel(channel, channel->chcfg, CHCFG, 1);
>> +		rz_dmac_ch_writel(channel, CHCTRL_SWRST, CHCTRL, 1);
>> +		rz_dmac_ch_writel(channel, channel->chctrl, CHCTRL, 1);
>> +
>> +		if (channel->status & BIT(RZ_DMAC_CHAN_STATUS_PAUSED_INTERNAL)) {
>> +			ret = rz_dmac_device_resume_internal(channel);
>> +			if (ret) {
>> +				dev_err(dev, "Failed to resume channel %s\n",
>> +					dma_chan_name(&channel->vc.chan));
>> +				continue;
>> +			}
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
> 
> Then on resume I'm seeing the following when testing DMAC + RSPI:
> 
> [   52.831840] spi-nor spi0.0: SPI transfer failed: -110
> [   52.836950] spi_master spi0: failed to transfer one message from queue
> [   52.843474] spi_master spi0: noqueue transfer failed
> 
> Which I found out that can be solved by moving:
> 
> 	rz_dmac_set_dma_req_no(dmac, channel->index, channel->mid_rid);
> 
> after the cyclic check:
> 
> 	if (!(channel->status & BIT(RZ_DMAC_CHAN_STATUS_CYCLIC))) {
> 		rz_dmac_ch_writel(&dmac->channels[i], CHCTRL_DEFAULT, CHCTRL, 1);
> 		continue;
> 	}
> 
> +	rz_dmac_set_dma_req_no(dmac, channel->index, channel->mid_rid);
> 	rz_dmac_ch_writel(channel, channel->pm_state.nxla, NXLA, 1);
> 	rz_dmac_ch_writel(channel, channel->chcfg, CHCFG, 1);
> 	rz_dmac_ch_writel(channel, CHCTRL_SWRST, CHCTRL, 1);
> 
> In this way
> 	
> 	rz_dmac_set_dma_req_no()
> 
> Is only called for cyclic channels
> 
> What do you think?

Thank you for trying this series and looking to provide fixes. Unfortunatelly, I 
currently don't have at hand a platform with SPI enabled to check it. I'm going 
to investigate the fixes you provided and integrate them in the next version.

Thank you,
Claudiu
