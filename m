Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4C132D0C8;
	Fri, 31 Oct 2025 09:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761901506; cv=none; b=tgHAhSlGh+FSGpMMQ3DqI3u3P2g1DdWTCROlp5qWljZS9gw2BXoUNXglqGeDnntIO2Zh7gDuaullSsir3AVr1m45LGUq9Sn5sgu5mDB5AYrcm4F2x95GxGBm5qeqcqt6jH2wBVHkrRVgoTReCeOpZyOEMRqbVVpeQctVlhSzBHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761901506; c=relaxed/simple;
	bh=t1yPBt3wKIirk+I7tp/5sx23TScNBqUUkY/35N7mLDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jPmhQ7LlH4bjDuKMxRYXGfcFOipggLmFQU36K5+4rSI8iHDUnWdBG6Sle3eyVznvNvXwwN7FmtLRNcEpEhwL9FWUecesvqScb7gE0FuKwtLjcvhj2zSwMruA+g6HYRjS7nIdWPuPdysvZ2ZYfJmAkqT4gxYYgkbJY2QBRzPCe3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=no6mksqh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="no6mksqh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A87F0C4CEE7;
	Fri, 31 Oct 2025 09:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761901504;
	bh=t1yPBt3wKIirk+I7tp/5sx23TScNBqUUkY/35N7mLDw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=no6mksqh/S1EaPZ5OsJKHqAeifo34+krzM81EBHspbhhxcpg0ngazy8sgwOtoBtTJ
	 BodYEqlON1TMhrrB94Hmekkkh3BEOR00wDQ6cSkBQp1PUAMrbca3tgkTMVsof8vZEX
	 FXnbTg7rqvae+BmAnj3qghK3jroTNgIqi/84EBCMWPYYcj9BvcD+N7qapli8MasAi9
	 BcKynsLIhDvbNIqYJWq4k/VzaVQnEHCvevS8W9x23zCC2UCoHIoP3LKG20RLF29+vZ
	 89MVUfudzgZiX4ot3WBtrqlQ/dhH+mKj02OpKdk1QXMW7b/rcN6UeOpJT5zwNH6iYc
	 uLbVmSNLBTB9A==
Date: Fri, 31 Oct 2025 10:05:01 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: joakim.zhang@cixtech.com
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH V1 3/3] ALSA: hda: add CIX IPBLOQ HDA controller support
Message-ID: <20251031-wise-cassowary-of-foundation-a2a094@kuoka>
References: <20251030110928.1572703-1-joakim.zhang@cixtech.com>
 <20251030110928.1572703-4-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251030110928.1572703-4-joakim.zhang@cixtech.com>

On Thu, Oct 30, 2025 at 07:09:28PM +0800, joakim.zhang@cixtech.com wrote:
> From: Joakim Zhang <joakim.zhang@cixtech.com>
> 
> This patch adds support for CIX IPBLOQ HDA controller

Please do not use "This commit/patch/change", but imperative mood. See
longer explanation here:
https://elixir.bootlin.com/linux/v6.16/source/Documentation/process/submitting-patches.rst#L94

> 
> Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
> ---
>  sound/hda/controllers/Kconfig      |  13 +
>  sound/hda/controllers/Makefile     |   2 +
>  sound/hda/controllers/cix-ipbloq.c | 470 +++++++++++++++++++++++++++++
>  3 files changed, 485 insertions(+)
>  create mode 100644 sound/hda/controllers/cix-ipbloq.c
> 
> diff --git a/sound/hda/controllers/Kconfig b/sound/hda/controllers/Kconfig
> index 34721f50b055..c6b0666ef18c 100644
> --- a/sound/hda/controllers/Kconfig
> +++ b/sound/hda/controllers/Kconfig
> @@ -30,6 +30,19 @@ config SND_HDA_TEGRA
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called snd-hda-tegra.
>  
> +config SND_HDA_CIX_IPBLOQ
> +	tristate "CIX IPBLOQ HD Audio"
> +	select SND_HDA
> +	select SND_HDA_ALIGNED_MMIO

If this is not usable outside of ARCH CIX then add dependency with
COMPIEL_TEST

> +	help
> +	  Say Y here to support the HDA controller present in CIX SoCs
> +

...

> +static int cix_ipbloq_hda_init(struct azx *chip, struct platform_device *pdev)
> +{
> +	struct hdac_bus *bus = azx_bus(chip);
> +	struct snd_card *card = chip->card;
> +	const char *sname = NULL, *drv_name = "cix-ipbloq-hda";
> +	unsigned short gcap;
> +	int irq_id, err;
> +
> +	err = cix_ipbloq_hda_init_chip(chip, pdev);
> +	if (err)
> +		return err;
> +
> +	irq_id = platform_get_irq(pdev, 0);
> +	if (irq_id < 0) {
> +		dev_err(&pdev->dev, "failed to get the irq\n");
> +		return irq_id;
> +	}
> +
> +	err = devm_request_irq(chip->card->dev, irq_id, azx_interrupt,
> +			     IRQF_SHARED, KBUILD_MODNAME, chip);

You request shared interrupt with devm, which is known patrern for bugs.
You need to carefully investigate it, e.g. provide rationale why this is
safe, or drop devm or shared.

> +	if (err) {
> +		dev_err(chip->card->dev,
> +			"unable to request IRQ %d, disabling device\n",

Why are you requesting resources outside of probe, in work item? You
cannot handle here deferred probe.

How is it supposed to work? How deferred probe would work?

> +			irq_id);
> +		return err;
> +	}
> +
> +	bus->irq = irq_id;
> +	bus->dma_stop_delay = 100;
> +	card->sync_irq = bus->irq;
> +
> +	gcap = azx_readw(chip, GCAP);
> +
> +	chip->capture_streams = (gcap >> 8) & 0x0f;
> +	chip->playback_streams = (gcap >> 12) & 0x0f;
> +	chip->capture_index_offset = 0;
> +	chip->playback_index_offset = chip->capture_streams;
> +	chip->num_streams = chip->playback_streams + chip->capture_streams;
> +
> +	/* initialize streams */
> +	err = azx_init_streams(chip);
> +	if (err < 0) {
> +		dev_err(card->dev, "failed to initialize streams: %d\n", err);
> +		return err;
> +	}
> +
> +	err = azx_alloc_stream_pages(chip);
> +	if (err < 0) {
> +		dev_err(card->dev, "failed to allocate stream pages: %d\n", err);
> +		return err;
> +	}
> +
> +	/* initialize chip */
> +	azx_init_chip(chip, 1);
> +
> +	/* codec detection */
> +	if (!bus->codec_mask) {
> +		dev_err(card->dev, "no codecs found\n");
> +		return -ENODEV;
> +	}
> +	dev_info(card->dev, "codec detection mask = 0x%lx\n", bus->codec_mask);

I guess dev_dbg. Although see Coding style and driver debugging guides.

https://elixir.bootlin.com/linux/v6.15-rc7/source/Documentation/process/coding-style.rst#L913

https://elixir.bootlin.com/linux/v6.15-rc7/source/Documentation/process/debugging/driver_development_debugging_guide.rst#L79

> +
> +	/* driver name */
> +	strscpy(card->driver, drv_name, sizeof(card->driver));
> +
> +	/* shortname for card */
> +	sname = of_get_property(pdev->dev.of_node, "cix,model", NULL);
> +	if (!sname)
> +		sname = drv_name;
> +	if (strlen(sname) > sizeof(card->shortname))
> +		dev_info(card->dev, "truncating shortname for card\n");
> +	strscpy(card->shortname, sname, sizeof(card->shortname));
> +
> +	/* longname for card */
> +	snprintf(card->longname, sizeof(card->longname),
> +		 "%s at 0x%lx irq %i",
> +		 card->shortname, bus->addr, bus->irq);
> +
> +	return 0;
> +}
> +
> +static void cix_ipbloq_hda_probe_work(struct work_struct *work)
> +{
> +	struct cix_ipbloq_hda *hda = container_of(work, struct cix_ipbloq_hda, probe_work);
> +	struct platform_device *pdev = to_platform_device(hda->dev);
> +	struct azx *chip = &hda->chip;
> +	struct hdac_bus *bus = azx_bus(chip);
> +	int err;
> +
> +	err = pm_runtime_resume_and_get(hda->dev);
> +	if (err < 0) {
> +		dev_err(hda->dev, "pm_runtime_resume_and_get failed, err = %d\n", err);
> +		return;
> +	}
> +
> +	to_hda_bus(bus)->bus_probing = 1;
> +
> +	err = cix_ipbloq_hda_init(chip, pdev);
> +	if (err < 0)
> +		goto out_free;
> +
> +	/* create codec instances */
> +	err = azx_probe_codecs(chip, 8);
> +	if (err < 0)
> +		goto out_free;
> +
> +	err = azx_codec_configure(chip);
> +	if (err < 0)
> +		goto out_free;
> +
> +	err = snd_card_register(chip->card);
> +	if (err < 0)
> +		goto out_free;
> +
> +	chip->running = 1;
> +
> +	to_hda_bus(bus)->bus_probing = 0;
> +
> +	snd_hda_set_power_save(&chip->bus, CIX_IPBLOQ_POWER_SAVE_DEFAULT_TIME_MS);
> +
> +	dev_info(hda->dev, "cix ipbloq hda probed\n");

Drop, drivers should be silent on success. Linux kernel already provides
you facilities to know if this probed.


> +
> + out_free:
> +	pm_runtime_put(hda->dev);
> +	return; /* no error return from async probe */
> +}
> +
> +static int cix_ipbloq_hda_create(struct snd_card *card,
> +				 unsigned int driver_caps,
> +				 struct cix_ipbloq_hda *hda)
> +{
> +	static const struct snd_device_ops ops = {
> +		.dev_disconnect = cix_ipbloq_hda_dev_disconnect,
> +		.dev_free = cix_ipbloq_hda_dev_free,
> +	};
> +	struct azx *chip;
> +	int err;
> +
> +	chip = &hda->chip;
> +
> +	mutex_init(&chip->open_mutex);
> +	chip->card = card;
> +	chip->ops = &cix_ipbloq_hda_ops;
> +	chip->driver_caps = driver_caps;
> +	chip->driver_type = driver_caps & 0xff;
> +	chip->dev_index = 0;
> +	chip->single_cmd = 0;
> +	chip->codec_probe_mask = -1;
> +	chip->align_buffer_size = 1;
> +	chip->jackpoll_interval = msecs_to_jiffies(CIX_IPBLOQ_JACKPOLL_DEFAULT_TIME_MS);
> +	INIT_LIST_HEAD(&chip->pcm_list);
> +
> +	/*
> +	 * HD-audio controllers appear pretty inaccurate about the update-IRQ timing.
> +	 * The IRQ is issued before actually the data is processed. So use stream
> +	 * link position by default instead of dma position buffer.
> +	 */
> +	chip->get_position[0] = chip->get_position[1] = azx_get_pos_lpib;
> +
> +	INIT_WORK(&hda->probe_work, cix_ipbloq_hda_probe_work);
> +
> +	err = azx_bus_init(chip, NULL);
> +	if (err < 0) {
> +		dev_err(hda->dev, "failed to init bus, err = %d\n", err);
> +		return err;
> +	}
> +
> +	/* RIRBSTS.RINTFL cannot be cleared, cause interrupt storm */
> +	chip->bus.core.polling_mode = 1;
> +	chip->bus.core.not_use_interrupts = 1;
> +
> +	chip->bus.core.aligned_mmio = 1;
> +	chip->bus.jackpoll_in_suspend = 1;
> +
> +	/* host and hdac has different memory view */
> +	chip->bus.core.addr_host_to_hdac = cix_ipbloq_hda_addr_host_to_hdac;
> +
> +	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
> +	if (err < 0) {
> +		dev_err(card->dev, "failed to create device, err = %d\n", err);
> +		return err;
> +	}
> +
> +	return 0;
> +}
> +
> +static int cix_ipbloq_hda_probe(struct platform_device *pdev)
> +{
> +	const unsigned int driver_flags = AZX_DCAPS_PM_RUNTIME;
> +	struct snd_card *card;
> +	struct azx *chip;
> +	struct cix_ipbloq_hda *hda;
> +	int err;
> +
> +	hda = devm_kzalloc(&pdev->dev, sizeof(*hda), GFP_KERNEL);
> +	if (!hda)
> +		return -ENOMEM;
> +
> +	hda->dev = &pdev->dev;
> +	chip = &hda->chip;
> +
> +	err = snd_card_new(&pdev->dev, SNDRV_DEFAULT_IDX1, SNDRV_DEFAULT_STR1,
> +			   THIS_MODULE, 0, &card);
> +	if (err < 0) {
> +		dev_err(&pdev->dev, "failed to crate card, err = %d\n", err);

No, syntax is return dev_err_probe.

> +		return err;
> +	}
> +
> +	dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
> +
> +	err = of_reserved_mem_device_init(&pdev->dev);
> +	if (err && err != -ENODEV) {
> +		dev_err(&pdev->dev,
> +			"failed to init reserved mem for DMA, err = %d\n", err);
> +		goto out_free;
> +	}
> +
> +	hda->resets[hda->nresets++].id = "hda";
> +	err = devm_reset_control_bulk_get_exclusive(&pdev->dev, hda->nresets,
> +						    hda->resets);
> +	if (err) {
> +		dev_err(&pdev->dev, "failed to get reset, err = %d\n", err);

Use dev_err_probe, so you will not spam logs on defer.

> +		goto out_free;
> +	}
> +
> +	hda->clocks[hda->nclocks++].id = "sysclk";
> +	hda->clocks[hda->nclocks++].id = "clk48m";
> +	err = devm_clk_bulk_get(&pdev->dev, hda->nclocks, hda->clocks);
> +	if (err < 0) {
> +		dev_err(&pdev->dev, "failed to get clk, err = %d\n", err);

Same here. Please look at recent Linux kernel drivers how they do it.

> +		goto out_free;
> +	}

Best regards,
Krzysztof

