Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795219460;
	b=drnidUUr9rj6D5vnDlzP+fd2Miygyfxtpt0K77Oo6gzRizkrQRUhArD+6ahv+BUrVKe+
	 ZmvYebL3+bs6H0+hoouOKGkxrJjLuVo1dSElvMBtfdqSBWurkCraMLeqgdGiy6pzTb5kQ
	 mBbAcvxfSz4/xCmL9zf1l0KHuiyP/LnvArGab26nszx0FPO6gE6S9E0Iha8bqsmkEuQ0A
	 dMGucRxeHFOx7xT0jNJnfwhwgDeHWkU6FKB7rddfZZEhEmu1ZPOPxCIaqQ+7c+Jgho7Q5
	 aieTpzjgSmD5X1ZHAyrU4KuzohjQKfpDNJ1p06uSxI51yPu/SzWNiSjqQfT/xygR+fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795219460;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wLBJPqzp3hhL0jJYUyxTQpDld57SHEKXkjqMklAPM7Q=;
	b=aSe1Hda9byScksq2+fakyCydfqpJpuUyukE3/2hMPQytrRSiHblI9jeUzzRNoQ3u839t
	 LYSKOPigaKUFRfZcFaKrFdTZzPkhlac45TxA3xzOHDERIIHaoFj2UVrAyw4K1Mp8fjI/s
	 vMYiPDgcHUQFw/C9ONhgByh6fjyUVbUxuXSzdypCDVPrMRpgXjCPcmQCK2tNV21RfiEay
	 VnU2/eWwx5GgizvyfFV6Ycfx3DeCSV2FXchamowvio5pt3WN/arCsv8X56mTD+1x6uiqD
	 oxPTSDvYK4ze+WovwtWTnCmx9fs0lz5+3Stm9BUkw2/f9MeL9JbQbkfZTape8yUrV8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DTRyrfrL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873E9606A69E;
	Sat, 21 Nov 2026 00:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DTRyrfrL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C12951F000CA;
	Sat, 21 Nov 2026 00:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795219460;
	bh=wLBJPqzp3hhL0jJYUyxTQpDld57SHEKXkjqMklAPM7Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DTRyrfrLhU1J+h8nCQVPP16Wi4kH6qIUZEqgfF4Koz6En6Sj5fjk3hUpg+sKsx4+4
	 giS9UgyAhchI8616v6JN3aANgv2n89NPUYYY+aAAr9MX+tbqURIJRHC0tBcHrwaF0k
	 QZzlksrrr7APlQD8TPkpUFKK/2+9KxCSQ63LgGsoFERnRJth39fXcgqhSSOCvMrze1
	 5XYOLUdpo0sdNkdckYFlk/qLQTooG3bpaCkZpUtn7Q9vlL3oLWcEv9vx2TCueMF8+8
	 IJQMI5GR0wLC9zB4twGTAvOhAYrP60T1wC/YExHoKOYWHpkDTJroKXY5ZtbcE3yoQB
	 /EkMwAzYNMzrw==
Message-ID: <sashiko-outbox-226370@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/2] ASoC: airoha: Add support for AN7581 PCM driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261120234640.169279-3-ansuelsmth@gmail.com>
References: <20261120234640.169279-1-ansuelsmth@gmail.com>
 <20261120234640.169279-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 00:04:19 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 9 potential
issues to consider:
- [High] ASoC: airoha: broken full-duplex state tracking in
  an7581_pcm_hw_params()
- [High] ASoC: airoha: premature IRQ setup and irq 0 handling in
  an7581_pcm_probe()
- [High] ASoC: airoha: unsynchronized substream lifetime in
  an7581_pcm_irq_handler()
- [High] ASoC: airoha: broken hw_avail check and DMA polling in
  an7581_pcm_irq_handler()
- [Medium] ASoC: airoha: positive return from an7581_pcm_startup()
  breaks rollback
- [Medium] ASoC: airoha: missing check for 0 from of_irq_get() in
  an7581_pcm_probe()
- [Medium] ASoC: airoha: unlocked descriptor and ring updates in
  an7581_pcm_irq_handler()
- [Medium] ASoC: airoha: tx_pos and rx_pos overflow and wrap in
  an7581_pcm_pointer()
- [Low] ASoC: airoha: unsorted MAINTAINERS entry and wrong BCLK unit in
  commit message
--

commit e3a59a91e98ded8c2ff7394400843258603f867e
Author: Christian Marangi <ansuelsmth@gmail.com>

ASoC: airoha: Add support for AN7581 PCM driver

This commit adds an ASoC platform driver for the Airoha AN7581 PCM
controller supporting VoIP playback and capture with up to 32 channels.

> The driver configures the PCM bit clock to 2.048 KHz and supports
> 8-bit and 16-bit samples, with up to 32 channels.

> diff --git a/MAINTAINERS b/MAINTAINERS
> index d37ed235d5141..ca6853f7eb9fe 100644
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

[Severity: Low]
This isn't a bug, but AIROHA PCM CONTROLLER DRIVER is placed after AIROHA
SOUND DRIVER instead of in alphabetical order after AIROHA PCIE PHY
DRIVER.  Also, the commit message says the bit clock is 2.048 KHz, whereas
an7581_pcm_hw_params() configures AN7581_PCM_BIT_CLK_2048KHZ (2.048 MHz).

> diff --git a/sound/soc/airoha/an7581-pcm.c b/sound/soc/airoha/an7581-pcm.c
> new file mode 100644
> index 0000000000000..8e06527c741e3
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
Should an7581_pcm_startup() return 0 instead of ret?

snd_pcm_hw_constraint_integer() returns positive 1 when it modifies the
SNDRV_PCM_HW_PARAM_PERIODS interval.  In snd_soc_dai_startup(), the DAI is
only marked as started for error rollback when the startup callback
returns 0:

sound/soc/soc-dai.c:snd_soc_dai_startup() {
	...
	/* mark substream if succeeded */
	if (ret =3D=3D 0)
		soc_dai_mark_push(dai, substream, startup);
	...
}

If a subsequent step in __soc_pcm_open() fails, snd_soc_dai_shutdown()
skips an7581_pcm_shutdown() during rollback, leaking priv->users and
leaving priv->stream[substream->stream] pointing to a closed substream.

> +
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
> +
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
> +
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
> +
> +	if ((unsigned long)rate * channels * bit_width > AN7581_PCM_DEFAULT_BCL=
K * HZ_PER_KHZ) {
> +		dev_err(rtd->card->dev,
> +			"%u channels at %u Hz and %d-bit exceed %u KHz BCLK\n",
> +			channels, rate, bit_width,
> +			AN7581_PCM_DEFAULT_BCLK);
> +		mutex_unlock(&priv->user_lock);
> +		return -EINVAL;
> +	}
> +
> +	if (priv->users <=3D 1) {
> +		/* one bit delay for ZSI */
> +		regmap_set_bits(priv->map, AN7581_PCM_PICR, AN7581_PCM_ONE_BIT_DELAY);
> +
> +		regmap_update_bits(priv->map, AN7581_PCM_PICR,
> +				   AN7581_PCM_BIT_MSTSLV_MODE,
> +				   AN7581_PCM_BIT_MSTSLV_MODE_MASTER);
> +
> +		regmap_update_bits(priv->map, AN7581_PCM_PICR,
> +				   AN7581_PCM_BIT_CLK,
> +				   AN7581_PCM_BIT_CLK_2048KHZ);
> +
> +		regmap_update_bits(priv->map, AN7581_PCM_PICR,
> +				   AN7581_PCM_SAMPLE_CLK,
> +				   (rate =3D=3D 16000 ? AN7581_PCM_SAMPLE_CLK_16KHZ :
> +				   AN7581_PCM_SAMPLE_CLK_8KHZ));
> +
> +		regmap_update_bits(priv->map, AN7581_PCM_PICR,
> +				   AN7581_PCM_FS_LEN,
> +				   AN7581_PCM_FS_LEN_16);
> +
> +		regmap_set_bits(priv->map, AN7581_PCM_PICR, AN7581_PCM_BIT_ORDER);
> +
> +		regmap_clear_bits(priv->map, AN7581_PCM_PICR, AN7581_PCM_FS_EDGE);
> +	}
> +
> +	/* Setup timeslot */
> +	an7581_pcm_setup_time_slot(priv, substream->stream, bit_width);
> +
> +	if (priv->users <=3D 1) {
> +		/* Setup Descriptor size and number */
> +		regmap_update_bits(priv->map, AN7581_PCM_TRDRSR,
> +				   AN7581_DESC_OFFSET | AN7581_DESC_SIZE,
> +				   FIELD_PREP(AN7581_DESC_OFFSET, sizeof(*desc) / sizeof(u32)) |
> +				   FIELD_PREP(AN7581_DESC_SIZE, num_desc));
> +
> +		/*
> +		 * The usage of this register is not entirely clear, it should tell
> +		 * DMA the size of the channel buffer. HW Loopback enabled with a
> +		 * playback and capture with a 2 channel test audio file, verified
> +		 * that channel handling is interleaved and recorded a similar
> +		 * audio file compared to the one provided with playback.
> +		 */
> +		regmap_update_bits(priv->map, AN7581_PCM_CHBFOSR,
> +				   AN7581_PCM_DESC_CHBF_OFFSET,
> +				   FIELD_PREP(AN7581_PCM_DESC_CHBF_OFFSET,
> +					      AN7581_PCM_FRAMES_PER_DESC * bit_width / 8));
> +	}
> +
> +	if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK)
> +		regmap_write(priv->map, AN7581_PCM_TDRBAR, priv->tx_dma);
> +	else
> +		regmap_write(priv->map, AN7581_PCM_RDRBAR, priv->rx_dma);
> +
> +	/* Configure descriptors for DMA ownership and sample size */
> +	for (i =3D 0; i < num_desc; i++) {
> +		/* Assign to each descriptor the dma_addr + offset of period bytes */
> +		desc[i].status =3D FIELD_PREP(AN7581_PCM_DESC_STATUS_SAMPLE_SIZE,
> +					    AN7581_PCM_FRAMES_PER_DESC);
> +
> +		desc[i].channel_mask =3D GENMASK(channels - 1, 0);
> +	}
> +
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
Does tracking priv->users in an7581_pcm_startup() and
an7581_pcm_shutdown() break full-duplex operation in
an7581_pcm_hw_params()?

When a full-duplex application opens both playback and capture substreams
before calling SNDRV_PCM_IOCTL_HW_PARAMS on either, priv->users is already
2 on the first an7581_pcm_hw_params() call.  At that point
priv->current_rate and priv->current_channels are either 0 (on first use)
or hold stale values from a previous session (because an7581_pcm_shutdown()
never resets them), causing the priv->users > 1 check to fail with -EBUSY.
Even if the rate and channel count happen to match stale values from a
closed session, all three if (priv->users <=3D 1) blocks are skipped for
both substreams, so AN7581_PCM_PICR (including AN7581_PCM_CFG_VALID),
AN7581_PCM_TRDRSR, AN7581_PCM_CHBFOSR, and AN7581_PCM_DCHENR are never
programmed.

Also, AN7581_PCM_CHBFOSR is a single shared register configured from
bit_width, but an7581_pcm_hw_params() does not check that bit_width
matches between playback and capture in full-duplex mode.

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
Can accumulating priv->tx_pos and priv->rx_pos without wrapping at the
buffer byte size overflow bytes_to_frames() or jump discontinuously on
32-bit wrap?

In an7581_pcm_irq_handler(), priv->tx_pos and priv->rx_pos are incremented
forever without modulo reduction.  On 32-bit builds (enabled by
COMPILE_TEST), bytes_to_frames() computes size * 8 / runtime->frame_bits
using a signed 32-bit ssize_t, which overflows once tx_pos or rx_pos
reaches 256 MiB.  On 64-bit builds, when the 32-bit unsigned int counter
wraps at 2^32 bytes, 2^32 is not a multiple of the 1200-frame buffer size,
so pos % runtime->buffer_size jumps discontinuously and corrupts ALSA
hw_ptr tracking.  Wrapping tx_pos and rx_pos modulo runtime->dma_bytes
when advancing them avoids both issues.

[ ... ]

> +static irqreturn_t an7581_pcm_irq_handler(int irq, void *data)
> +{
> +	struct snd_pcm_substream *substream;
> +	struct an7581_pcm_priv *priv =3D data;
> +	irqreturn_t ret =3D IRQ_NONE;
> +	unsigned long flags;
> +	u32 status, isr =3D 0;
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
> +		substream =3D priv->stream[SNDRV_PCM_STREAM_CAPTURE];
> +		if (!substream)
> +			goto handle_tx;
> +
> +		ret =3D IRQ_HANDLED;
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
> +		substream =3D priv->stream[SNDRV_PCM_STREAM_PLAYBACK];
> +		if (!substream)
> +			goto exit;
> +
> +		ret =3D IRQ_HANDLED;
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
> +exit:
> +	return ret;
> +}

[Severity: High]
Can an7581_pcm_irq_handler() race with an7581_pcm_shutdown(),
an7581_pcm_trigger(), and an7581_pcm_startup() on priv->stream[]?

CPU0                                  CPU1
an7581_pcm_irq_handler()
  substream =3D priv->stream[...];
  runtime =3D substream->runtime;
                                      snd_pcm_release_substream()
                                        ...
                                          an7581_pcm_shutdown()
                                            priv->stream[...] =3D NULL;
                                        snd_pcm_detach_substream()
                                          kfree(runtime);
  frames_to_bytes(runtime, ...)
                                      <-- use-after-free

The driver does not set card->snd_card->sync_irq or implement .sync_stop,
and an7581_pcm_shutdown() clears priv->stream[substream->stream] without
lock serialization or synchronize_irq().  An in-flight IRQ handler (or
threaded handler under IRQF_COND_ONESHOT) that already loaded substream
can dereference runtime after snd_pcm_detach_substream() frees it.

Similarly, when SNDRV_PCM_TRIGGER_STOP clears AN7581_PCM_IMR and
AN7581_PCM_TRDCR under pcm_stream_lock_irq(), a concurrent
an7581_pcm_irq_handler() waiting on that lock in snd_pcm_period_elapsed()
will resume and write AN7581_PCM_RPDR or AN7581_PCM_TPDR to re-trigger DMA
polling on the stopped stream.

In addition, an7581_pcm_startup() publishes priv->stream[substream->stream]
at open time before hw_params() or prepare() initializes
runtime->frame_bits or sets OWNERSHIP_DMA on the descriptors, and
an7581_pcm_irq_handler() checks AN7581_PCM_ISR without masking against
AN7581_PCM_IMR.  If an interrupt from the opposite active stream sees a
stale ISR bit for the newly opened stream, it will process the
zero-initialized (OWNERSHIP_CPU) descriptors against an unconfigured
runtime where runtime->frame_bits is 0, causing a division by zero in
bytes_to_frames().

[Severity: Medium]
Can dropping priv->desc_lock before updating desc->status in
an7581_pcm_irq_handler() race with an7581_pcm_prepare() or
an7581_pcm_hw_params()?

CPU0                                  CPU1
an7581_pcm_irq_handler()
  spin_lock_irqsave(&priv->desc_lock)
  desc =3D &priv->tx_descs[0];
  priv->tx_desc_idx++;
  spin_unlock_irqrestore(&priv->desc_lock)
  snd_pcm_period_elapsed(substream)
    /* stops stream on XRUN */
                                      an7581_pcm_hw_params()
                                        desc[0].status =3D ...; /* CPU */
                                        desc[1].status =3D ...; /* CPU */
  desc->status |=3D ...OWNERSHIP_DMA;
  /* next iteration: */
  desc =3D &priv->tx_descs[1];
  /* sees OWNERSHIP_CPU, advances
   * tx_pos and tx_desc_idx */

an7581_pcm_prepare() also modifies desc->status and desc->dma_addr outside
priv->desc_lock (setting OWNERSHIP_DMA before writing dma_addr), and
snd_pcm_capture_hw_avail() / snd_pcm_playback_hw_avail() are read in
an7581_pcm_irq_handler() without holding the PCM substream lock.

[Severity: High]
Does jumping out of the descriptor loop when snd_pcm_*_hw_avail(runtime) <
runtime->period_size stall DMA polling or re-poll after an XRUN stop?

In both the RX and TX loops of an7581_pcm_irq_handler():

1. If descriptor 0 sets rx_poll =3D true (or tx_poll =3D true) and descript=
or
   1 sees hw_avail < runtime->period_size, jumping to handle_tx or
   returning IRQ_HANDLED skips the regmap_write() to AN7581_PCM_RPDR or
   AN7581_PCM_TPDR even though earlier descriptors were returned to DMA,
   and abandons any remaining completed descriptors in the ring.
2. Even on the first descriptor, if 0 <=3D hw_avail < runtime->period_size
   while the stream remains in SNDRV_PCM_STATE_RUNNING, returning without
   writing RPDR/TPDR permanently stalls DMA polling because the driver has
   no .ack callback to re-trigger polling when userspace later supplies or
   consumes frames.
3. snd_pcm_capture_hw_avail() and snd_pcm_playback_hw_avail() return a
   signed snd_pcm_sframes_t (negative on overrun/underrun), while
   runtime->period_size is an unsigned snd_pcm_uframes_t.  On XRUN, the
   negative value is promoted to a large unsigned value, so hw_avail <
   runtime->period_size evaluates to false and the handler writes
   RPDR/TPDR after snd_pcm_period_elapsed() has already stopped the
   stream.
4. Calling snd_pcm_period_elapsed() inside the loop on every descriptor
   rather than once after harvesting all completed descriptors acquires
   the stream lock and wakes userspace up to 15 times per interrupt.

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
> +
> +	card->dev =3D dev;
> +
> +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +	snd_soc_card_set_drvdata(card, priv);
> +
> +	base =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	priv->map =3D devm_regmap_init_mmio(dev, base,
> +					  &an7581_pcm_regmap_config);
> +	if (IS_ERR(priv->map))
> +		return PTR_ERR(priv->map);
> +
> +	reset =3D devm_reset_control_get_exclusive(dev, "pcm1");
> +	if (IS_ERR(reset))
> +		return PTR_ERR(reset);
> +
> +	irq =3D of_irq_get(dev_of_node(dev), 0);
> +	if (irq < 0)
> +		return irq;

[Severity: Medium]
Does if (irq < 0) miss IRQ mapping failures from of_irq_get()?

of_irq_get() returns 0 on mapping failure (and when CONFIG_OF_IRQ is
disabled under COMPILE_TEST), which passes irq =3D=3D 0 to devm_request_irq=
().
Using platform_get_irq(pdev, 0) handles this and returns a negative errno
on failure.

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
> +
> +	for_each_card_prelinks(card, i, dai_link)
> +		dai_link->platforms->of_node =3D dev->of_node;
> +
> +	ret =3D devm_snd_soc_register_component(dev,
> +					      &an7581_pcm_platform,
> +					      NULL, 0);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Cannot register PCM component\n");
> +
> +	ret =3D devm_snd_soc_register_component(dev,
> +					      &an7581_pcm_dai_component,
> +					      an7581_pcm_dai_driver,
> +					      ARRAY_SIZE(an7581_pcm_dai_driver));
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Cannot register PCM DAI component\n");
> +
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
Is devm_request_irq() called too early in an7581_pcm_probe()?

Requesting the IRQ before spin_lock_init(), reset_control_assert(), and
dmam_alloc_coherent() means a pending interrupt can fire while the PCM
block is held in reset or before priv->desc_lock and the descriptor rings
are initialized.  It also reverses devres teardown order on unbind:
an7581_pcm_remove() runs while the sound card is still registered, and
devres then frees priv->rx_descs and priv->tx_descs before freeing and
synchronizing the IRQ.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120234640.1692=
79-1-ansuelsmth@gmail.com?part=3D2
