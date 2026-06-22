Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D686233149
	for <linux-sound@vger.kernel.org>; Mon, 22 Jun 2026 07:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782112080; cv=none; b=iDoIlP/yEEvRaDXYvFX96PGj93gDgugQEBNZ9D45iEHILo+3x0vTdZZFPiT0sT7HCGJTfwBnV51xBIeYXpdsJjDS05I5PhdnPo20gSH52gbRhvC+dk5Ngkt5+JHEsvNJu+snhZANtyJlC9FvumaJIkjlCiqzQRimOQslNE0Ju74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782112080; c=relaxed/simple;
	bh=T8XHpR4O9qo/8UZKnJiYIo7hOh15kt3WD9Bv0g1L8Eo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=COkwHhNbadyA0JuaapAqo/tv1ozez3d9H+/ofC5AqOvcVDJIItS7V5KnRKPbLJELV2WSn+SxkHWzSWIXs+IQk+jYz6wcfjFXA75+DYsPVDmCooSJKfIcmIWqDGUqTwzqnZ5QTBSR+sHbFPjqvqO6FSB3A8/yzLe/WWjVIFaH+FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=YyV40JE3; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="YyV40JE3"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260622070750euoutp026c8ea1cf2d39671e2a2c4cbceefadd05~7VXx2Ahtf0188301883euoutp02O
	for <linux-sound@vger.kernel.org>; Mon, 22 Jun 2026 07:07:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260622070750euoutp026c8ea1cf2d39671e2a2c4cbceefadd05~7VXx2Ahtf0188301883euoutp02O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1782112070;
	bh=wjSkA+tgNuqnUWQPrYW/+seLw15Sc6cdIaX0VmEpBGI=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=YyV40JE3oC9jb7ex398wkk9G7QBoV4IEUppM/pqok1G9kAtzdnK/haCe1liNcip0v
	 Y92Yku77KccvX4aqBLYUQuVsRtMFdPv6OMNqnTrRRILFu0yUBGJXvQhSvOMaujNkkp
	 iXBDB1rXIDVoNDlT/ujpgD2vhmntlldRtLE5E3X0=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260622070750eucas1p254905d1dc5ce7bb2a7857d39e856ea13~7VXxYiGSI1996119961eucas1p2E;
	Mon, 22 Jun 2026 07:07:50 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260622070749eusmtip2c5dcd07ce12fa6b3e8db9362444c83a2~7VXwyQ43I2738827388eusmtip2b;
	Mon, 22 Jun 2026 07:07:49 +0000 (GMT)
Message-ID: <9298fa2f-a635-4055-a5ba-8b4971ecd5b1@samsung.com>
Date: Mon, 22 Jun 2026 09:07:48 +0200
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
In-Reply-To: <274c6e32-4571-4e74-8e70-53c780cc7e24@opensource.cirrus.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260622070750eucas1p254905d1dc5ce7bb2a7857d39e856ea13
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260617141046eucas1p2e85629d57bfc17449b135b16f9230d57
X-EPHeader: CA
X-CMS-RootMailID: 20260617141046eucas1p2e85629d57bfc17449b135b16f9230d57
References: <20260611110856.1088110-1-rf@opensource.cirrus.com>
	<CGME20260617141046eucas1p2e85629d57bfc17449b135b16f9230d57@eucas1p2.samsung.com>
	<4c9156cb-6508-4fda-8e36-7edc4eb7d6f9@samsung.com>
	<274c6e32-4571-4e74-8e70-53c780cc7e24@opensource.cirrus.com>

On 20.06.2026 17:57, Richard Fitzgerald wrote:
> On 17/6/26 15:10, Marek Szyprowski wrote:
>> On 11.06.2026 13:08, Richard Fitzgerald wrote:
>>> In snd_soc_bind_card() create a device_link from card to all components
>>> to ensure correct order of system_suspend. The card is the consumer and
>>> the components are the supplier, so that the card will system_suspend
>>> before any of the components.
>>>
>
> <SNIP>
>
>> This patch landed recently in linux-next as commit 0f54ce994b23 ("ASoC:
>> soc-core: Create device_link to ensure correct suspend order"). In my
>> tests I found that it breaks probing of VC4 DRM subsystem on Raspberry Pi
>> 3 and 4 boards due to an issue with hdmi-audio-codec:
>>
>> # dmesg | grep vc4
>> vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops [vc4])
>> vc4_hdmi fef00700.hdmi: Failed to create device link to hdmi-audio-codec.1.auto
>> vc4_hdmi fef00700.hdmi: error -EINVAL: Could not register sound card
>> vc4-drm gpu: failed to bind fef00700.hdmi (ops vc4_hdmi_ops [vc4]): -22
>> vc4-drm gpu: adev bind failed: -22
>> vc4-drm gpu: probe with driver vc4-drm failed with error -22
>>
> Marek,
>
> Can you try the patch below?
>
> If this works for you, and passes our tests, and nobody has any
> objections, I can send it as a proper patch submission.


The patch was completely malformed (broken lines, tabs vs. spaces), I had to apply
it manually line by line, but it fixed the issue I've observed:

# dmesg | grep vc4
vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops [vc4])
vc4_hdmi fef00700.hdmi: Could not create device link to hdmi-audio-codec.1.auto
input: vc4-hdmi-0 HDMI Jack as /devices/platform/soc/fef00700.hdmi/sound/card1/input0
vc4-drm gpu: bound fef00700.hdmi (ops vc4_hdmi_ops [vc4])
vc4_hdmi fef05700.hdmi: Could not create device link to hdmi-audio-codec.3.auto
input: vc4-hdmi-1 HDMI Jack as /devices/platform/soc/fef05700.hdmi/sound/card2/input1
vc4-drm gpu: bound fef05700.hdmi (ops vc4_hdmi_ops [vc4])
vc4-drm gpu: bound fe004000.txp (ops vc4_txp_ops [vc4])
vc4-drm gpu: bound fe206000.pixelvalve (ops vc4_crtc_ops [vc4])
vc4-drm gpu: bound fe207000.pixelvalve (ops vc4_crtc_ops [vc4])
vc4-drm gpu: bound fe20a000.pixelvalve (ops vc4_crtc_ops [vc4])
vc4-drm gpu: bound fe216000.pixelvalve (ops vc4_crtc_ops [vc4])
[drm] Initialized vc4 0.0.0 for gpu on minor 1


Feel free to add:

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>



> ---
>
> From 08de5810ef813c9945d01a2ce23cd9dd71cf3d99 Mon Sep 17 00:00:00 2001
> From: Richard Fitzgerald <rf@opensource.cirrus.com>
> Date: Sat, 20 Jun 2026 14:33:18 +0100
> Subject: [PATCH] ASoC: soc-core: Don't fail if device_link could not be
>  created
>
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> ---
>  include/sound/soc-component.h |  4 ++++
>  sound/soc/soc-core.c          | 32 ++++++++++++--------------------
>  2 files changed, 16 insertions(+), 20 deletions(-)
>
> diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
> index 11bc9527653f..aa423865dbe7 100644
> --- a/include/sound/soc-component.h
> +++ b/include/sound/soc-component.h
> @@ -10,6 +10,8 @@
>
>  #include <sound/soc.h>
>
> +struct device_link;
> +
>  /*
>   * Component probe and remove ordering levels for components with runtime
>   * dependencies.
> @@ -216,6 +218,8 @@ struct snd_soc_component {
>         struct list_head card_aux_list; /* for auxiliary bound components */
>         struct list_head card_list;
>
> +       struct device_link *card_device_link;
> +
>         const struct snd_soc_component_driver *driver;
>
>         struct list_head dai_list;
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index 86b6c752a56b..8c24049d44d3 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -1980,19 +1980,15 @@ static void soc_cleanup_card_resources(struct snd_soc_card *card)
>         }
>  }
>
> -static void snd_soc_remove_device_links(struct snd_soc_card *card,
> -                                       struct snd_soc_component *stop_at)
> +static void snd_soc_remove_device_links(struct snd_soc_card *card)
>  {
>         struct snd_soc_component *component;
>
>         for_each_card_components(card, component) {
> -               if (card->dev == component->dev)
> -                       continue;
> -
> -               device_link_remove(card->dev, component->dev);
> -
> -               if (component == stop_at)
> -                       return;
> +               if (component->card_device_link) {
> +                       device_link_del(component->card_device_link);
> +                       component->card_device_link = NULL;
> +               }
>         }
>  }
>
> @@ -2001,7 +1997,7 @@ static void snd_soc_unbind_card(struct snd_soc_card *card)
>         if (snd_soc_card_is_instantiated(card)) {
>                 card->instantiated = false;
>
> -               snd_soc_remove_device_links(card, NULL);
> +               snd_soc_remove_device_links(card);
>
>                 soc_cleanup_card_resources(card);
>         }
> @@ -2012,7 +2008,6 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
>         struct snd_soc_pcm_runtime *rtd;
>         struct snd_soc_component *component;
>         struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
> -       struct snd_soc_component *last_devlinked_component = NULL;
>         int ret;
>
>         snd_soc_card_mutex_lock_root(card);
> @@ -2146,14 +2141,13 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
>                 if (card->dev == component->dev)
>                         continue;
>
> -               if (!device_link_add(card->dev, component->dev, DL_FLAG_STATELESS)) {
> -                       dev_warn(card->dev, "Failed to create device link to %s\n",
> +               component->card_device_link = device_link_add(card->dev,
> + component->dev,
> + DL_FLAG_STATELESS);
> +               if (!component->card_device_link) {
> +                       dev_warn(card->dev, "Could not create device link to %s\n",
>                                  dev_name(component->dev));
> -                       ret = -EINVAL;
> -                       goto probe_end;
>                 }
> -
> -               last_devlinked_component = component;
>         }
>
>         ret = snd_soc_card_late_probe(card);
> @@ -2185,9 +2179,7 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
>
>  probe_end:
>         if (ret < 0) {
> -               if (last_devlinked_component)
> -                       snd_soc_remove_device_links(card, last_devlinked_component);
> -
> +               snd_soc_remove_device_links(card);
>                 soc_cleanup_card_resources(card);
>         }
>
> -- 
> 2.47.3
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

