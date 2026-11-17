Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794945881;
	b=bMHAvxAgUlC2vOAHV94ms4UneNhoNX/7G2SDjAwCMa3m5TPVaQKdb9Cy7lYfBj+O7er1
	 Nz7mlY8GyCfv7zl7s/aXEuyYW6Yax2SbrzFdZUxWwHZLH/vVY2gO9vJ2rLeLCFHuXVkNB
	 6JTTtzc2b7n7hTYblNWbJZh869MZd5cA9/W+f3+JmRYrVT3s7DQwKJzRJrYleFHJQVLZB
	 atYqtoe4t91k55Y5CbB9lHzZpgD1SafR740ZK8z/rEZmQDqg1KkFI0ieuu5gNKKrRh0us
	 u08OZxrkVGCGyxSxhkzP5/V6YoqFpoX7f6fwc8cxcXMDBgOe+e5NoSPBmVVt5YQZmNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794945881;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=P2jcdT+phngXsT9+WKGq91CiGSUfr3T6ZRZFAW3cZH0=;
	b=g3qUEwJsDvym2DB1qHud30ain2zXYLHzUlpDvqojKfOl5mm9KSlPOkBb2eEULznllUSK
	 Hp+GwQorrFGBatyCawAVdJ+sTFZ57E40cPaUxBbjOJmW3SMM4o5RYl/z7j/K6MX+DaIRm
	 6iwHEsS5TH86pnL3MNYLsw/eUIq4E9Cpo+TkhEIDEUrBZcubzk0W9rRp/UEQI4GbCpqN+
	 AOyYnDz9REXVZqedo4adtlFG7z0AKTNsh6plMFVHcF4PdMwXxWrZ45CTfPXqE/Z92VEAi
	 NnAylH4TvipbDYpCJGzbRVJBTQ09cWnWEa4EjIh1vWFYEU8v10+S1oL/IZygv1GDHdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SZqZ6pH9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F79606A333;
	Tue, 17 Nov 2026 20:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SZqZ6pH9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB3621F000C5;
	Tue, 17 Nov 2026 20:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794945881;
	bh=P2jcdT+phngXsT9+WKGq91CiGSUfr3T6ZRZFAW3cZH0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SZqZ6pH92p+Vn8BVtRFSTFdK1+WquAmaTyiHTfTG3FvEGaQzmf44lKKXqyu8zIU5a
	 IZXJvUsX++FKI/Pw8PV8zbP52k4LZyLS7q8M/D4mHI/Vc4lDdxDbj25VwHDaQPFaO2
	 +9AIbDklH0b7cVH/tLwSGw8qGwvAlvctaGvFkBw4SKRzFG6DiO9R1DBmDivLvvutm5
	 dXFfaxgu2wvQRKrsZjK4idN6WPeGrHjnnJPHr9ZTJDB92xW/psLqbShjCVHnZZwktL
	 4JLjeLZlFL3IFiitJAR3COahW4RROSewwwhZg/EkPRE5/Uh8158tjmP0W4NLGzW0gA
	 YglTO1RJLNsmQ==
Message-ID: <sashiko-outbox-219553@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/2] ASoC: airoha: Add support for AN7581 PCM driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261117193851.235272-3-ansuelsmth@gmail.com>
References: <20261117193851.235272-1-ansuelsmth@gmail.com>
 <20261117193851.235272-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 20:04:40 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 10 potential
issues to consider:
- [High] ASoC: airoha: broken full-duplex state tracking in
  an7581_pcm_hw_params()
- [High] ASoC: airoha: broken hw_avail check and DMA polling in
  an7581_pcm_irq_handler()
- [High] ASoC: airoha: premature devm_request_irq() ordering in
  an7581_pcm_probe()
- [High] ASoC: airoha: unsynchronized substream lifetime in
  an7581_pcm_irq_handler()
- [Medium] ASoC: airoha: uninitialized ret and IRQ_NONE return in
  an7581_pcm_irq_handler()
- [Medium] ASoC: airoha: tx_pos and rx_pos overflow and wrap jump in
  an7581_pcm_pointer()
- [Medium] ASoC: airoha: positive return from an7581_pcm_startup()
  breaks rollback
- [Medium] ASoC: airoha: missing check for 0 from of_irq_get() in
  an7581_pcm_probe()
- [Medium] ASoC: airoha: unlocked descriptor and ring updates in
  an7581_pcm_irq_handler()
- [Low] ASoC: airoha: unsorted MAINTAINERS entry and wrong BCLK unit in
  commit message
--

commit 09235bd500296f2b66ed726582858bf27dd4183c
Author: Christian Marangi <ansuelsmth@gmail.com>

ASoC: airoha: Add support for AN7581 PCM driver

This commit adds an ASoC platform driver for the Airoha AN7581 SoC PCM
controller supporting up to 32 channels at 8 kHz and 16 kHz.

> diff --git a/MAINTAINERS b/MAINTAINERS
> index ccbcdc0799b9f..dfeefad6597e6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -796,6 +796,13 @@ F:	Documentation/devicetree/bindings/sound/airoha,an=
7581-afe.yaml
>  F:	Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
>  F:	sound/soc/mediatek/an7581/*
> =20
> +AIROHA PCM CONTROLLER DRIVER
> +M:	Christian Marangi <ansuelsmth@gmail.com>
> +L:	linux-sound@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/sound/airoha,an7581-pcm.yaml
> +F:	sound/soc/airoha/*
> +
>  AIROHA SPI SNFI DRIVER
>  M:	Lorenzo Bianconi <lorenzo@kernel.org>
>  M:	Ray Liu <ray.liu@airoha.com>

[Severity: Low]
This isn't a bug, but AIROHA PCM CONTROLLER DRIVER is placed after AIROHA
SOUND DRIVER instead of in alphabetical order after AIROHA PCIE PHY DRIVER.
Also, the commit message says the bit clock is configured to "2.048 KHz",
whereas an7581_pcm_hw_params() sets AN7581_PCM_BIT_CLK_2048KHZ (2048 kHz /
2.048 MHz).

> diff --git a/sound/soc/airoha/an7581-pcm.c b/sound/soc/airoha/an7581-pcm.c
> new file mode 100644
> index 0000000000000..23007d3ee33e0
> --- /dev/null
> +++ b/sound/soc/airoha/an7581-pcm.c

[ ... ]

> +static int an7581_pcm_startup(struct snd_pcm_substream *substream,
> +			      struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_pcm_runtime *rtd =3D snd_soc_substream_to_rtd(substream);
> +	struct an7581_pcm_priv *priv =3D snd_soc_card_get_drvdata(rtd->card);
> +	struct snd_pcm_runtime *runtime =3D substream->runtime;
> +	int ret;
> +
> +	snd_soc_set_runtime_hwparams(substream, &an7581_pcm_hardware);
> +
> +	ret =3D snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_PERIOD=
_SIZE,
> +					   AN7581_PCM_FRAMES_PER_DESC,
> +					   AN7581_PCM_FRAMES_PER_DESC);
> +	if (ret < 0) {
> +		dev_err(rtd->card->dev, "failed to constrain period to 80 frames\n");
> +		return ret;
> +	}
> +
> +	ret =3D snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIO=
DS);
> +	if (ret < 0) {
> +		dev_err(rtd->card->dev, "snd_pcm_hw_constraint_integer failed\n");
> +		return ret;
> +	}
> +
> +	/* Cache stream substream for IRQ handling */
> +	priv->stream[substream->stream] =3D substream;
> +
> +	/* On open mask interrupt and disable DMA */
> +	if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK) {
> +		regmap_clear_bits(priv->map, AN7581_PCM_IMR,
> +				  AN7581_PCM_IMR_TDESC_UPDATE_INT);
> +		regmap_clear_bits(priv->map, AN7581_PCM_TRDCR,
> +				  AN7581_PCM_TXDMA_ENABLE);
> +	} else {
> +		regmap_clear_bits(priv->map, AN7581_PCM_IMR,
> +				  AN7581_PCM_IMR_RDESC_UPDATE_INT);
> +		regmap_clear_bits(priv->map, AN7581_PCM_TRDCR,
> +				  AN7581_PCM_RXDMA_ENABLE);
> +	}
> +
> +	usleep_range(10000, 20000);
> +
> +	mutex_lock(&priv->user_lock);
> +
> +	if (!priv->users) {
> +		regmap_clear_bits(priv->map, AN7581_PCM_PICR,
> +				  AN7581_PCM_CFG_VALID);
> +
> +		usleep_range(5000, 10000);
> +	}
> +
> +	priv->users++;
> +
> +	mutex_unlock(&priv->user_lock);
> +
> +	return ret;
> +}

[Severity: Medium]
Does an7581_pcm_startup() return 1 instead of 0 on success?

snd_pcm_hw_constraint_integer() returns positive 1 when it modifies the
SNDRV_PCM_HW_PARAM_PERIODS interval, and snd_soc_dai_startup() only marks t=
he
DAI as started when the callback returns 0:

sound/soc/soc-dai.c:snd_soc_dai_startup() {
    ...
	/* mark substream if succeeded */
	if (ret =3D=3D 0)
		soc_dai_mark_push(dai, substream, startup);
    ...
}

If a later step in __soc_pcm_open() fails, snd_soc_dai_shutdown() skips
calling an7581_pcm_shutdown() on rollback, leaking priv->users and leaving
priv->stream[substream->stream] pointing to a freed substream.

> +static void an7581_pcm_shutdown(struct snd_pcm_substream *substream,
> +				struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_pcm_runtime *rtd =3D snd_soc_substream_to_rtd(substream);
> +	struct an7581_pcm_priv *priv =3D snd_soc_card_get_drvdata(rtd->card);
> +
> +	/* On close mask interrupt and disable DMA */
> +	if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK) {
> +		regmap_clear_bits(priv->map, AN7581_PCM_IMR,
> +				  AN7581_PCM_IMR_TDESC_UPDATE_INT);
> +		regmap_clear_bits(priv->map, AN7581_PCM_TRDCR,
> +				  AN7581_PCM_TXDMA_ENABLE);
> +	} else {
> +		regmap_clear_bits(priv->map, AN7581_PCM_IMR,
> +				  AN7581_PCM_IMR_RDESC_UPDATE_INT);
> +		regmap_clear_bits(priv->map, AN7581_PCM_TRDCR,
> +				  AN7581_PCM_RXDMA_ENABLE);
> +	}
> +
> +	priv->stream[substream->stream] =3D NULL;
> +
> +	usleep_range(10000, 20000);
> +
> +	mutex_lock(&priv->user_lock);
> +
> +	if (priv->users)
> +		priv->users--;
> +
> +	if (!priv->users)
> +		regmap_clear_bits(priv->map, AN7581_PCM_PICR,
> +				  AN7581_PCM_CFG_VALID);
> +
> +	mutex_unlock(&priv->user_lock);
> +}

[Severity: High]
Can an7581_pcm_irq_handler() race with an7581_pcm_shutdown() and dereference
a freed substream->runtime?

CPU0                              CPU1
an7581_pcm_irq_handler()
  substream =3D priv->stream[...]
                                  snd_pcm_release_substream()
                                    ...
                                      an7581_pcm_shutdown()
                                        priv->stream[...] =3D NULL
                                    snd_pcm_detach_substream()
                                      substream->runtime =3D NULL
                                      kfree(runtime)
  runtime =3D substream->runtime
  frames_to_bytes(runtime, ...)   <-- NULL deref / use-after-free

The driver neither sets card->snd_card->sync_irq nor synchronizes with the
IRQ handler before clearing priv->stream[].  Similarly, on SNDRV_PCM_IOCTL_=
DROP
an in-flight IRQ waiting on pcm_stream_lock inside snd_pcm_period_elapsed()
can resume after an7581_pcm_trigger(SNDRV_PCM_TRIGGER_STOP) finishes and
write AN7581_PCM_TPDR or AN7581_PCM_RPDR to re-trigger DMA polling on the
stopped stream.  In addition, an7581_pcm_startup() publishes priv->stream[]
before hw_params() and prepare() initialize runtime and descriptors, while
an7581_pcm_irq_handler() does not mask AN7581_PCM_ISR with AN7581_PCM_IMR.

> +/*
> + * Hardware position is always reset to the start when a TX/RX polling is
> + * triggered. This is handled in trigger.
> + */
> +static int an7581_pcm_prepare(struct snd_pcm_substream *substream,
> +			      struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_pcm_runtime *rtd =3D snd_soc_substream_to_rtd(substream);
> +	struct an7581_pcm_priv *priv =3D snd_soc_card_get_drvdata(rtd->card);
> +	struct snd_pcm_runtime *runtime =3D substream->runtime;
> +	struct an7581_pcm_desc *desc;
> +	unsigned int period_bytes;
> +	unsigned long flags;
> +	int num_desc, i;
> +
> +	spin_lock_irqsave(&priv->desc_lock, flags);
> +	if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK) {
> +		priv->tx_pos =3D 0;
> +		priv->tx_desc_idx =3D 0;
> +		desc =3D priv->tx_descs;
> +		num_desc =3D AN7581_PCM_TX_DESCRIPTORS;
> +	} else {
> +		priv->rx_pos =3D 0;
> +		priv->rx_desc_idx =3D 0;
> +		desc =3D priv->rx_descs;
> +		num_desc =3D AN7581_PCM_RX_DESCRIPTORS;
> +	}
> +	spin_unlock_irqrestore(&priv->desc_lock, flags);
> +
> +	period_bytes =3D frames_to_bytes(runtime, AN7581_PCM_FRAMES_PER_DESC);
> +	for (i =3D 0; i < num_desc; i++) {
> +		desc->status |=3D AN7581_PCM_DESC_STATUS_OWNERSHIP_DMA;
> +		desc->dma_addr =3D runtime->dma_addr + i * period_bytes;
> +		desc++;
> +	}
> +
> +	return 0;
> +}

[Severity: Medium]
Can an in-flight an7581_pcm_irq_handler() race with an7581_pcm_prepare() or
an7581_pcm_hw_params() on descriptor state?

CPU0                              CPU1
an7581_pcm_irq_handler()
  spin_unlock_irqrestore(&priv->desc_lock, ...)
  snd_pcm_period_elapsed(substream)
                                  an7581_pcm_hw_params()
                                    desc[0].status =3D ... /* OWNERSHIP_CPU=
 */
                                  an7581_pcm_prepare()
                                    spin_lock_irqsave(&priv->desc_lock, ...)
                                    priv->tx_pos =3D 0
                                    priv->tx_desc_idx =3D 0
                                    spin_unlock_irqrestore(&priv->desc_lock=
, ...)
  /* next loop iteration i =3D 1 */
  spin_lock_irqsave(&priv->desc_lock, ...)
  desc =3D &priv->tx_descs[priv->tx_desc_idx]
  /* sees OWNERSHIP_CPU from hw_params */
  priv->tx_pos +=3D ...
  priv->tx_desc_idx++             <-- corrupts reset ring state

an7581_pcm_irq_handler() drops priv->desc_lock before calling
snd_pcm_period_elapsed() and setting AN7581_PCM_DESC_STATUS_OWNERSHIP_DMA,
and both an7581_pcm_prepare() and an7581_pcm_hw_params() modify desc->status
outside priv->desc_lock without IRQ synchronization.  In addition,
an7581_pcm_irq_handler() calls snd_pcm_capture_hw_avail() and
snd_pcm_playback_hw_avail() without holding the PCM substream lock.

> +static int an7581_pcm_hw_params(struct snd_pcm_substream *substream,
> +				struct snd_pcm_hw_params *params,
> +				struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_pcm_runtime *rtd =3D snd_soc_substream_to_rtd(substream);
> +	struct an7581_pcm_priv *priv =3D snd_soc_card_get_drvdata(rtd->card);
> +	unsigned int channels =3D params_channels(params);
> +	unsigned int rate =3D params_rate(params);
> +	int bit_width =3D params_width(params);
> +	struct an7581_pcm_desc *desc;
> +	int num_desc, i;
> +
> +	if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK) {
> +		desc =3D priv->tx_descs;
> +		num_desc =3D AN7581_PCM_TX_DESCRIPTORS;
> +	} else {
> +		desc =3D priv->rx_descs;
> +		num_desc =3D AN7581_PCM_RX_DESCRIPTORS;
> +	}
> +
> +	mutex_lock(&priv->user_lock);
> +	if (priv->users > 1 &&
> +	    (priv->current_rate !=3D rate ||
> +	     priv->current_channels !=3D channels)) {
> +		dev_err(rtd->card->dev, "playback/capture rates/channels must match in=
 full-duplex mode\n");
> +		mutex_unlock(&priv->user_lock);
> +		return -EBUSY;
> +	}

[ ... ]

> +	if (priv->users <=3D 1) {
> +		/* Enable channels */
> +		regmap_update_bits(priv->map, AN7581_PCM_DCHENR,
> +				   AN7581_PCM_CHAN_EN,
> +				   FIELD_PREP(AN7581_PCM_CHAN_EN, GENMASK(channels - 1, 0)));
> +
> +		/* Signal PCM configuration is now valid */
> +		regmap_set_bits(priv->map, AN7581_PCM_PICR,
> +				AN7581_PCM_CFG_VALID);
> +	}
> +
> +	priv->current_rate =3D rate;
> +	priv->current_channels =3D channels;
> +
> +	mutex_unlock(&priv->user_lock);
> +
> +	return 0;
> +}

[Severity: High]
Does opening both playback and capture substreams before calling hw_params()
break full-duplex setup?

an7581_pcm_startup() increments priv->users on open, so priv->users is
already 2 when a full-duplex application opens both streams before configur=
ing
them.  On the first call to an7581_pcm_hw_params(), priv->current_rate and
priv->current_channels are still 0 (or stale from an earlier session), caus=
ing
the priv->users > 1 check to reject hw_params() with -EBUSY; even if the
values match a prior session, all shared register writes (AN7581_PCM_PICR
including AN7581_PCM_CFG_VALID, AN7581_PCM_TRDRSR, AN7581_PCM_CHBFOSR and
AN7581_PCM_DCHENR) are guarded by priv->users <=3D 1 and get skipped on both
streams.  Also, AN7581_PCM_CHBFOSR is a single shared register programmed f=
rom
bit_width, but full-duplex compatibility does not check that bit_width matc=
hes
between playback and capture.

[ ... ]

> +static snd_pcm_uframes_t an7581_pcm_pointer(struct snd_soc_component *co=
mponent,
> +					    struct snd_pcm_substream *substream)
> +{
> +	struct snd_soc_card *card =3D component->card;
> +	struct snd_pcm_runtime *runtime =3D substream->runtime;
> +	struct an7581_pcm_priv *priv;
> +	unsigned long flags;
> +	unsigned int pos;
> +
> +	priv =3D snd_soc_card_get_drvdata(card);
> +
> +	spin_lock_irqsave(&priv->desc_lock, flags);
> +	if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK)
> +		pos =3D bytes_to_frames(runtime, priv->tx_pos);
> +	else
> +		pos =3D bytes_to_frames(runtime, priv->rx_pos);
> +	spin_unlock_irqrestore(&priv->desc_lock, flags);
> +
> +	return pos % runtime->buffer_size;
> +}

[Severity: Medium]
Can priv->tx_pos and priv->rx_pos overflow in an7581_pcm_pointer() during
sustained streaming?

an7581_pcm_irq_handler() increments priv->tx_pos and priv->rx_pos without
wrapping at the buffer byte size.  On 32-bit builds, bytes_to_frames()
computes size * 8 / runtime->frame_bits in signed 32-bit ssize_t, which
overflows once 256 MiB is transferred; and when the 32-bit unsigned int
counter wraps at 4 GiB, pos % runtime->buffer_size (1200 frames) jumps
discontinuously because 2^32 is not a multiple of 1200.  Wrapping tx_pos and
rx_pos modulo snd_pcm_lib_buffer_bytes(substream) when updating them avoids
both issues.

[ ... ]

> +static irqreturn_t an7581_pcm_irq_handler(int irq, void *data)
> +{
> +	struct snd_pcm_substream *substream;
> +	struct an7581_pcm_priv *priv =3D data;
> +	unsigned long flags;
> +	u32 status, isr =3D 0;
> +	int ret;
> +
> +	regmap_read(priv->map, AN7581_PCM_ISR, &isr);
> +
> +	/* Scan descriptor on receiving RX desc update interrupt */
> +	if (isr & AN7581_PCM_IMR_RDESC_UPDATE_INT) {
> +		struct snd_pcm_runtime *runtime;
> +		struct an7581_pcm_desc *desc;
> +		unsigned int sample_size;
> +		bool rx_poll =3D false;
> +		int i;
> +
> +		ret =3D IRQ_HANDLED;
> +
> +		substream =3D priv->stream[SNDRV_PCM_STREAM_CAPTURE];
> +		if (!substream) {
> +			ret =3D IRQ_NONE;
> +			goto handle_tx;
> +		}
> +
> +		runtime =3D substream->runtime;
> +
> +		for (i =3D 0; i < AN7581_PCM_RX_DESCRIPTORS; i++) {
> +			spin_lock_irqsave(&priv->desc_lock, flags);
> +
> +			desc =3D &priv->rx_descs[priv->rx_desc_idx];
> +			status =3D desc->status;
> +			if ((status & AN7581_PCM_DESC_STATUS_OWNERSHIP) =3D=3D
> +			    AN7581_PCM_DESC_STATUS_OWNERSHIP_DMA) {
> +				spin_unlock_irqrestore(&priv->desc_lock,
> +						       flags);
> +				break;
> +			}
> +
> +			sample_size =3D FIELD_GET(AN7581_PCM_DESC_STATUS_SAMPLE_SIZE,
> +						status);
> +
> +			priv->rx_pos +=3D frames_to_bytes(runtime, sample_size);
> +			priv->rx_desc_idx++;
> +			if (priv->rx_desc_idx =3D=3D AN7581_PCM_RX_DESCRIPTORS)
> +				priv->rx_desc_idx =3D 0;
> +
> +			spin_unlock_irqrestore(&priv->desc_lock, flags);
> +
> +			snd_pcm_period_elapsed(substream);
> +
> +			desc->status |=3D AN7581_PCM_DESC_STATUS_OWNERSHIP_DMA;
> +
> +			if (snd_pcm_capture_hw_avail(runtime) < runtime->period_size)
> +				goto handle_tx;
> +
> +			rx_poll =3D true;
> +		}
> +
> +		if (rx_poll)
> +			regmap_write(priv->map, AN7581_PCM_RPDR, AN7581_PCM_RX_POLLING);
> +	}
> +
> +handle_tx:
> +	/* Scan descriptor on receiving TX desc update interrupt */
> +	if (isr & AN7581_PCM_IMR_TDESC_UPDATE_INT) {
> +		struct snd_pcm_runtime *runtime;
> +		struct an7581_pcm_desc *desc;
> +		unsigned int sample_size;
> +		bool tx_poll =3D false;
> +		int i;
> +
> +		ret =3D IRQ_HANDLED;
> +
> +		substream =3D priv->stream[SNDRV_PCM_STREAM_PLAYBACK];
> +		if (!substream)
> +			return IRQ_NONE;
> +
> +		runtime =3D substream->runtime;
> +
> +		for (i =3D 0; i < AN7581_PCM_TX_DESCRIPTORS; i++) {
> +			spin_lock_irqsave(&priv->desc_lock, flags);
> +
> +			desc =3D &priv->tx_descs[priv->tx_desc_idx];
> +			status =3D desc->status;
> +			if ((status & AN7581_PCM_DESC_STATUS_OWNERSHIP) =3D=3D
> +			    AN7581_PCM_DESC_STATUS_OWNERSHIP_DMA) {
> +				spin_unlock_irqrestore(&priv->desc_lock,
> +						       flags);
> +				break;
> +			}
> +
> +			sample_size =3D FIELD_GET(AN7581_PCM_DESC_STATUS_SAMPLE_SIZE,
> +						status);
> +
> +			priv->tx_pos +=3D frames_to_bytes(runtime, sample_size);
> +			priv->tx_desc_idx++;
> +			if (priv->tx_desc_idx =3D=3D AN7581_PCM_TX_DESCRIPTORS)
> +				priv->tx_desc_idx =3D 0;
> +
> +			spin_unlock_irqrestore(&priv->desc_lock, flags);
> +
> +			snd_pcm_period_elapsed(substream);
> +
> +			desc->status |=3D AN7581_PCM_DESC_STATUS_OWNERSHIP_DMA;
> +
> +			if (snd_pcm_playback_hw_avail(runtime) < runtime->period_size)
> +				return IRQ_HANDLED;
> +
> +			tx_poll =3D true;
> +		}
> +
> +		if (tx_poll)
> +			regmap_write(priv->map, AN7581_PCM_TPDR,
> +				     AN7581_PCM_TX_POLLING);
> +	}
> +
> +	return ret;
> +}

[Severity: Medium]
As reported by Mark Brown on v5 [1], can an7581_pcm_irq_handler() return an
uninitialized ret or clobber IRQ_HANDLED with IRQ_NONE?

If neither AN7581_PCM_IMR_RDESC_UPDATE_INT nor AN7581_PCM_IMR_TDESC_UPDATE_=
INT
is set in isr, an7581_pcm_irq_handler() returns ret without initializing it.
Also, if the RX path handles an interrupt (setting ret =3D IRQ_HANDLED) and
AN7581_PCM_IMR_TDESC_UPDATE_INT is also set while the playback substream is
NULL, the TX path returns IRQ_NONE instead of preserving IRQ_HANDLED.

[Severity: High]
Does jumping out of the descriptor loops when hw_avail < runtime->period_si=
ze
stall DMA polling and mishandle XRUNs?

If an earlier descriptor in the same interrupt set rx_poll or tx_poll and t=
he
next descriptor sees hw_avail < runtime->period_size, jumping to handle_tx =
or
returning IRQ_HANDLED skips the AN7581_PCM_RPDR / AN7581_PCM_TPDR write and
leaves any remaining completed descriptors unexamined; even on the first
descriptor, skipping the poll write while the stream is still running stalls
DMA because there is no .ack callback to restart polling.  In addition,
snd_pcm_capture_hw_avail() and snd_pcm_playback_hw_avail() return signed
snd_pcm_sframes_t whereas runtime->period_size is unsigned snd_pcm_uframes_=
t,
so negative values on overrun or underrun promote to large unsigned values
and re-trigger DMA polling after snd_pcm_period_elapsed() has stopped the
stream.

[ ... ]

> +static int an7581_pcm_probe(struct platform_device *pdev)
> +{
> +	struct snd_soc_card *card =3D &an7581_pcm_card;
> +	struct snd_soc_dai_link *dai_link;
> +	struct device *dev =3D &pdev->dev;
> +	struct an7581_pcm_priv *priv;
> +	struct reset_control *reset;
> +	void __iomem *base;
> +	int irq;
> +	int ret;
> +	int i;

[ ... ]

> +	irq =3D of_irq_get(dev_of_node(dev), 0);
> +	if (irq < 0)
> +		return irq;

[Severity: Medium]
Does this miss IRQ mapping failures when of_irq_get() returns 0?

of_irq_get() returns 0 on mapping failure (or when CONFIG_OF_IRQ is disable=
d),
so checking only irq < 0 passes irq =3D=3D 0 to devm_request_irq().  Using
platform_get_irq(pdev, 0) handles this and returns a negative errno.

> +
> +	ret =3D devm_request_irq(dev, irq, an7581_pcm_irq_handler,
> +			       0, dev_name(dev), priv);
> +	if (ret)
> +		return ret;
> +
> +	spin_lock_init(&priv->desc_lock);
> +	mutex_init(&priv->user_lock);
> +
> +	/* Reset the PCM interface */
> +	reset_control_assert(reset);
> +	usleep_range(5000, 10000);
> +	reset_control_deassert(reset);
> +	usleep_range(5000, 10000);
> +
> +	ret =3D dma_set_coherent_mask(dev, DMA_BIT_MASK(32));
> +	if (ret)
> +		return ret;
> +
> +	priv->tx_descs =3D dmam_alloc_coherent(dev, sizeof(struct an7581_pcm_de=
sc) *
> +					     AN7581_PCM_TX_DESCRIPTORS, &priv->tx_dma,
> +					     GFP_KERNEL);
> +	if (!priv->tx_descs)
> +		return -ENOMEM;
> +
> +	priv->rx_descs =3D dmam_alloc_coherent(dev, sizeof(struct an7581_pcm_de=
sc) *
> +					     AN7581_PCM_RX_DESCRIPTORS, &priv->rx_dma,
> +					     GFP_KERNEL);
> +	if (!priv->rx_descs)
> +		return -ENOMEM;

[ ... ]

> +	ret =3D devm_snd_soc_register_card(dev, card);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "%s snd_soc_register_card fail\n", __fu=
nc__);
> +
> +	return 0;
> +}
> +
> +static void an7581_pcm_remove(struct platform_device *pdev)
> +{
> +	struct snd_soc_card *card =3D &an7581_pcm_card;
> +	struct an7581_pcm_priv *priv;
> +
> +	priv =3D snd_soc_card_get_drvdata(card);
> +	regmap_clear_bits(priv->map, AN7581_PCM_IMR,
> +			  AN7581_PCM_IMR_TDESC_UPDATE_INT |
> +			  AN7581_PCM_IMR_RDESC_UPDATE_INT);
> +	regmap_clear_bits(priv->map, AN7581_PCM_TRDCR,
> +			  AN7581_PCM_TXDMA_ENABLE |
> +			  AN7581_PCM_RXDMA_ENABLE);
> +}

[Severity: High]
Can requesting the IRQ before initializing locks, resetting the hardware, a=
nd
allocating descriptors cause an7581_pcm_irq_handler() to run against
uninitialized state or during reset?

devm_request_irq() enables the interrupt before priv->desc_lock is
initialized, before reset_control_assert() holds the PCM block in reset acr=
oss
a 5-10 ms sleep, and before priv->tx_descs and priv->rx_descs are allocated.
Because devres tears down resources in reverse registration order, this also
causes dmam_alloc_coherent() to free priv->rx_descs and priv->tx_descs befo=
re
devm_request_irq() frees and synchronizes the IRQ, while an7581_pcm_remove()
runs before devm_snd_soc_register_card() unregisters the card.

[1] https://lore.kernel.org/r/179425987829.3711751.2911706702501919873.b4-r=
eview@b4

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117193851.2352=
72-1-ansuelsmth@gmail.com?part=3D2
