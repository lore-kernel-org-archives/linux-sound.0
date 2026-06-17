Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4392F7F06
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 14:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781705451; cv=none; b=bZcGZCH3XXiO6UiF4ZGFszuDhwsLAsDKrx88B1A4AQBvUIZi5/d8HlpY3H9VxS1mu2YDUSbVrdD+unxoAs1mt+rLLDRiBTCKWj9oyp/+tXE03ommtrDZzCRdrWgDZAdJFnqO+V+QcKNtiVbP/A0+MQNUneR3Jk8IXophzMCUY98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781705451; c=relaxed/simple;
	bh=/cOdNw4eHe8hTYxNQrqeEq+7Oeowg6ZIAicBHSyrAF4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=OFrXkKOAejAhssjbGik7N+NpQeIO6X8sDdfT4eTqWa7L8S4wxEAtwYW+cZgYDZdMld8ofqJeljD9JTcwK+9r4CMb4EVkB24idhaxfqWKlFoYidf2l6GAhX3fHZyHdeXZbOjNiisWKROHd9DPtW35Gs9FsimhVirFs7OwXRJLew0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=PmnfSjkI; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="PmnfSjkI"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260617141046euoutp01cc3a54df04e949d8010654d91ee1c877~546nnrl1A3027730277euoutp01B
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 14:10:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260617141046euoutp01cc3a54df04e949d8010654d91ee1c877~546nnrl1A3027730277euoutp01B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1781705446;
	bh=FEhFpQov56YDvvLyOY6YCOwk7YKS2ggS9Wv7b/nZaqE=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=PmnfSjkIQb3Wo2TVbJS7+tulPouOP6Eh/oqWIrbRgdtkuOlvLGoXlLaDQdV8ZxPff
	 OKu64pJrl3VRoN4X6j4IS0YPPrSE+DRgdFWod3p7cYPx9wYapn2HQlssCS6P2TrBQZ
	 0zErQ9QVUQ3S3zvA4EXcN5cEpP0kY9nWtw1ww3TQ=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260617141046eucas1p2e85629d57bfc17449b135b16f9230d57~546nYkL4f2913829138eucas1p2j;
	Wed, 17 Jun 2026 14:10:46 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260617141045eusmtip240cc92e101531af7555730beac375b86~546m9QbwB1007910079eusmtip2A;
	Wed, 17 Jun 2026 14:10:45 +0000 (GMT)
Message-ID: <4c9156cb-6508-4fda-8e36-7edc4eb7d6f9@samsung.com>
Date: Wed, 17 Jun 2026 16:10:44 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v2] ASoC: soc-core: Create device_link to ensure correct
 suspend order
To: Richard Fitzgerald <rf@opensource.cirrus.com>, broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com, Maxime Ripard <mripard@kernel.org>, Dave
	Stevenson <dave.stevenson@raspberrypi.com>, linux-rpi-kernel
	<linux-rpi-kernel@lists.infradead.org>, Florian Fainelli
	<florian.fainelli@broadcom.com>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260611110856.1088110-1-rf@opensource.cirrus.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260617141046eucas1p2e85629d57bfc17449b135b16f9230d57
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260617141046eucas1p2e85629d57bfc17449b135b16f9230d57
X-EPHeader: CA
X-CMS-RootMailID: 20260617141046eucas1p2e85629d57bfc17449b135b16f9230d57
References: <20260611110856.1088110-1-rf@opensource.cirrus.com>
	<CGME20260617141046eucas1p2e85629d57bfc17449b135b16f9230d57@eucas1p2.samsung.com>

Dear All,

On 11.06.2026 13:08, Richard Fitzgerald wrote:
> In snd_soc_bind_card() create a device_link from card to all components
> to ensure correct order of system_suspend. The card is the consumer and
> the components are the supplier, so that the card will system_suspend
> before any of the components.
>
> The PM core will normally system_suspend drivers in the opposite order
> that they registered. This ensures children are suspended before their
> parents, for example users of a bus driver should suspend before the bus
> driver suspends.
>
> For ASoC, snd_soc_suspend() shuts down any active audio, which requires
> that the components are still able to communicate with their hardware.
> Previously there was nothing to ensure this ordering, because there is
> (usually) no relationship between a machine driver and component drivers.
> If the machine driver registered before the codec drivers, the codec
> drivers would be suspended before the machine driver snd_soc_suspend()
> runs, so that ASoC is attempting to stop audio on a driver that has
> already suspended.
>
> Creating a device_link is safe if there is already a device_link between
> those devices because of multiple components sharing the same dev.
> device_link_add() kernel doc says:
>
>  "if a device link between the given @consumer and @supplier pair
>   exists already when this function is called for them, the existing link
>   will be returned regardless of its current type and status ...
>   The caller of this function is then expected to treat
>   the link as though it has just been created, so (in particular) if
>   DL_FLAG_STATELESS was passed in @flags, the link needs to be released
>   explicitly when not needed any more"
>
> For the same reason it is safe if the codec driver or machine driver
> later call device_link_add() to create a link between the same two
> devices.
>
> (I have tested creating multiple links between the card->dev and a
> component->dev and did not encounter any problems with suspend/resume or
> module unloading.)
>
> The DL_FLAG_AUTOREMOVE_* flags assume that they are being called from
> the probe() function of that device. This isn't guaranteed in ASoC card
> binding because of deferred binding. The exact behavior and consequences
> of the DL_FLAG_AUTOREMOVE_* are also unclear from the documentation.
> So DL_FLAG_STATELESS is used for safety, and the links are removed
> explicitly when the card unbinds or if the bind fails.
>
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> ---


This patch landed recently in linux-next as commit 0f54ce994b23 ("ASoC:
soc-core: Create device_link to ensure correct suspend order"). In my
tests I found that it breaks probing of VC4 DRM subsystem on Raspberry Pi
3 and 4 boards due to an issue with hdmi-audio-codec:

# dmesg | grep vc4
vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops [vc4])
vc4_hdmi fef00700.hdmi: Failed to create device link to hdmi-audio-codec.1.auto
vc4_hdmi fef00700.hdmi: error -EINVAL: Could not register sound card
vc4-drm gpu: failed to bind fef00700.hdmi (ops vc4_hdmi_ops [vc4]): -22
vc4-drm gpu: adev bind failed: -22
vc4-drm gpu: probe with driver vc4-drm failed with error -22


> for-next
>
> Changes in V2:
> - Use DL_FLAG_STATELESS to avoid unclear/unstated behavior of the
>   DL_FLAG_AUTOREMOVE_* flags.
>
> - Skip creating a device link for a component that is the same device
>   as the card.
>
>  sound/soc/soc-core.c | 46 +++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 45 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index b8c9ddfc4490..ac9b2269c26e 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -2138,10 +2138,29 @@ static void soc_cleanup_card_resources(struct snd_soc_card *card)
>  	}
>  }
>  
> +static void snd_soc_remove_device_links(struct snd_soc_card *card,
> +					struct snd_soc_component *stop_at)
> +{
> +	struct snd_soc_component *component;
> +
> +	for_each_card_components(card, component) {
> +		if (card->dev == component->dev)
> +			continue;
> +
> +		device_link_remove(card->dev, component->dev);
> +
> +		if (component == stop_at)
> +			return;
> +	}
> +}
> +
>  static void snd_soc_unbind_card(struct snd_soc_card *card)
>  {
>  	if (snd_soc_card_is_instantiated(card)) {
>  		card->instantiated = false;
> +
> +		snd_soc_remove_device_links(card, NULL);
> +
>  		soc_cleanup_card_resources(card);
>  	}
>  }
> @@ -2151,6 +2170,7 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
>  	struct snd_soc_pcm_runtime *rtd;
>  	struct snd_soc_component *component;
>  	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
> +	struct snd_soc_component *last_devlinked_component = NULL;
>  	int ret;
>  
>  	snd_soc_card_mutex_lock_root(card);
> @@ -2275,6 +2295,25 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
>  		}
>  	}
>  
> +	/*
> +	 * Add device_link from card to component so that system_suspend
> +	 * will be done in the correct order. The card must suspend first
> +	 * to stop audio activity before the components suspend.
> +	 */
> +	for_each_card_components(card, component) {
> +		if (card->dev == component->dev)
> +			continue;
> +
> +		if (!device_link_add(card->dev, component->dev, DL_FLAG_STATELESS)) {
> +			dev_warn(card->dev, "Failed to create device link to %s\n",
> +				 dev_name(component->dev));
> +			ret = -EINVAL;
> +			goto probe_end;
> +		}
> +
> +		last_devlinked_component = component;
> +	}
> +
>  	ret = snd_soc_card_late_probe(card);
>  	if (ret < 0)
>  		goto probe_end;
> @@ -2303,8 +2342,13 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
>  			pinctrl_pm_select_sleep_state(component->dev);
>  
>  probe_end:
> -	if (ret < 0)
> +	if (ret < 0) {
> +		if (last_devlinked_component)
> +			snd_soc_remove_device_links(card, last_devlinked_component);
> +
>  		soc_cleanup_card_resources(card);
> +	}
> +
>  	if (ret == -EPROBE_DEFER) {
>  		list_add(&card->list, &unbind_card_list);
>  		ret = 0;

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

