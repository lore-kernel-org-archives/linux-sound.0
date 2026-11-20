Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795136525;
	b=bsdJzXxc+X+UFeRCVfPYhgNNol5wPcLo8Mryy2napKUJ8jGfmVTdkLIye8BrwBHszZzw
	 Uzf/cR4y4D6ME3fpW77AwdauHH+hh9ATX7L66PQl0ACDTUvBb2WHAXR2ecrpA2mua4foE
	 aA4J1Sp0u/0m68N/cxodcBQMYawOyPBT0nB4meOlxhONnfo8aL6cvzEpU+oTV7FTspPn4
	 ypcZeLHWLk+BtipXCtiO0NVXtXMyzYyt3uQrHU7SRMfW5oBCjGgU0eRCrJEnYOdU+94HL
	 Q+cJAKZIHW+CuU3NjD/wURDxMPwTbfTVW1Bsye6BOE1yas9zD4SJpljZ/JvqmMCra/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795136525;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/tdEX8rylVykmHr6S1EU1bYPERjT+t46e1UnLYqAt70=;
	b=IOOk6/9we5TBgXPTMYs5lCPwyKGjkMtUfjl+Y3lGuB/2LGHrbYM6Px1ihB+BQfC8+n4/
	 U7vZRUl9OtD+qD14wvblZ8DEAyDb5QWkzzeGNzITXPmHTC/BVBwdB0elSpim71GIv6ru9
	 dOvk1lm4Sd/HLNNwZJ/Wfn+8nMXktRHq2jHX4raLAzQ4lcmNtzn8E+YeC0QS4gPBxqMqI
	 /7SssrFHJfxKuEIm7AdW3WzzxfHcBDD4ENPg+PqwrDoTTcP19wQDIZB7O5lEuFAYl8Pq+
	 oqAEHF5eI9nZhIxtrr2nIN5J62lmTpxLZvym3FxDGhUXpz/DIfyyHrfHrNXGUnAS7aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bqqgBzmZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D216606A325;
	Fri, 20 Nov 2026 01:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bqqgBzmZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 326F21F000C4;
	Fri, 20 Nov 2026 01:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795136525;
	bh=/tdEX8rylVykmHr6S1EU1bYPERjT+t46e1UnLYqAt70=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bqqgBzmZZ7hSLh04CExRHXpBGiE8G4hCy0iw/jD74mJfEEBg/pfhYaLFLm6t/vovS
	 b3XXIcWLWh8J1Udq5XNgMWjXOmSmBnVQZeeEDokAlNQslUJIm8yWP/wxE94MztrTFh
	 JZBrN4foR8LrHTRchjrOnwgSxNN8l9sIJfBZR2Y8NSmX8AcBp8bV/5uUQ0FHoJkcGa
	 tPcHwsK1FvCrwoETXPjdAuydNX2tdPjTyNwExsltDfZvsuMbauEskJN4rpx2JFHe0z
	 JELJs8GOw7tjSg0AvesBZKPBv0gCC+OOh50VmIQeG4ZOHvLhb7cFXZVtxqIW8A5Ea1
	 Al6nDJn4YFeag==
Message-ID: <sashiko-outbox-224281@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] ASoC: codecs: add TAS2557 mono smart amplifier
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gianluca Boiano" <morf3089@gmail.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261120004414.1686884-3-morf3089@gmail.com>
References: <20261120004414.1686884-1-morf3089@gmail.com>
 <20261120004414.1686884-3-morf3089@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 01:02:04 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [Medium] ASoC: tas2557: tas2557_power_up_locked() clobbers unmuted
  state on reload
- [Medium] ASoC: tas2557: tas2557_startup_sequence() powers PLL and
  clk-err before ASI
- [Low] ASoC: tas2557: missing offset check for bulk write in
  tas2557_load_block()
- [Low] ASoC: tas2557: tas2557_parse_dt() fails probe with -ENOSYS when
  !CONFIG_OF
--

commit b6c7726849d63f604c14fd11d9de768bf9364c52
Author: Gianluca Boiano <morf3089@gmail.com>

ASoC: codecs: add TAS2557 mono smart amplifier driver

This commit adds an ASoC codec driver for the Texas Instruments TAS2557
mono Class-D smart amplifier, supporting single and dual-chip groups, DSP
firmware loading, and fault recovery.

> diff --git a/sound/soc/codecs/tas2557.c b/sound/soc/codecs/tas2557.c
> new file mode 100644
> index 0000000000000..c49917149c863
> --- /dev/null
> +++ b/sound/soc/codecs/tas2557.c
[ ... ]
> +static const unsigned int tas2557_startup_common_data[] =3D {
> +	TAS2557_GPI_PIN_REG,      0x15,	/* enable DIN, MCLK, CCI */
> +	/* Power sequencing: Class-D + Boost first, then DSP/PLL */
> +	TAS2557_POWER_CTRL2_REG, 0xA0,		/* Class-D, Boost power up */
> +	TAS2557_POWER_CTRL2_REG, 0xA3,		/* Class-D, Boost, IV-sense power up */
> +	TAS2557_POWER_CTRL1_REG, 0xF8,		/* PLL, DSP, clock dividers power up */
> +	TAS2557_UDELAY, 2000,			/* 2 ms stabilisation */
> +	/* CE1_IC =3D ASI1; TI's ASI2 build writes the same value */
> +	TAS2557_CLK_ERR_CTRL, 0x2b,		/* enable clock error detection */
> +	TAS2557_DBOOST_CFG_REG, 0x0b,		/* reduce full-band noise */
> +	0xFFFFFFFF, 0xFFFFFFFF
> +};
[ ... ]
> +static int tas2557_startup_sequence(struct tas2557_priv *tas2557)
> +{
> +	const unsigned int *asi =3D tas2557->asi_port =3D=3D TAS2557_ASI_PORT1 ?
> +				  tas2557_startup_asi1_data :
> +				  tas2557_startup_asi2_data;
> +	unsigned int dout_reg =3D tas2557_asi_reg(tas2557, TAS2557_GPIO3_PIN_RE=
G,
> +						TAS2557_GPIO7_PIN_REG);
> +	unsigned int chn;
> +	int ret;
> +
> +	ret =3D tas2557_load_data_all(tas2557, tas2557_startup_common_data);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D tas2557_load_data_all(tas2557, asi);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Only chip 0 drives DOUT of the shared ASI */
> +	for (chn =3D 1; chn < tas2557->tas_priv->ndev; chn++) {
> +		ret =3D tas2557_dev_write(tas2557, chn, dout_reg, 0x00);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	return 0;
> +}

[Severity: Medium]
Does tas2557_startup_sequence() power up the PLL and arm clock-error
detection before the ASI clock pins and dividers are enabled?

tas2557_startup_common_data powers up the PLL/DSP, waits 2 ms, and writes
0x2b to TAS2557_CLK_ERR_CTRL while the ASI BCLK/WCLK GPIO muxes and ASI2
dividers in the asi table are still disabled.  In a two-chip group, chip 0
sits with clock-error detection armed and its clock inputs disabled for
over 2 ms while chip 1 runs tas2557_startup_common_data, exceeding the
0.34 ms hysteresis in TAS2557_CLK_ERR_CTRL2 and tripping a clock fault
before chip 0's ASI pins are configured.  Writing TAS2557_CLK_ERR_CTRL in
tas2557_startup_common_data also arms detection when dac_muted is true and
the host has not started the I2S clocks, until tas2557_apply_mute_state()
clears it later.  In addition, tas2557_load_data_all(tas2557, asi)
enables DOUT on every chip before the loop zeroes dout_reg on chn >=3D 1,
briefly driving the shared DOUT line from both chips at once.

[ ... ]

> +static int tas2557_load_block(struct tas2557_priv *tas2557,
> +			      struct tas2557_block *block, unsigned int chn)
> +{
> +	const u8 *data =3D block->data;
> +	unsigned int i;
> +	u8 book, page, offset, value;
> +	u16 sleep_time, bulk_len;
> +	int ret;
> +
> +	dev_dbg(tas2557->tas_priv->dev, "chn %u: load block type=3D0x%x cmds=3D=
%u\n",
> +		chn, block->type, block->num_commands);
> +
> +	for (i =3D 0; i < block->num_commands; ) {
> +		book   =3D data[i * 4];
> +		page   =3D data[i * 4 + 1];
> +		offset =3D data[i * 4 + 2];
> +		value  =3D data[i * 4 + 3];
> +		i++;
> +
> +		if (offset <=3D 0x7f) {
> +			ret =3D tas2557_dev_write(tas2557, chn,
> +						TAS2557_REG(book, page, offset),
> +						value);
> +			if (ret < 0)
> +				return ret;
> +		} else if (offset =3D=3D 0x81) {
> +			sleep_time =3D ((u16)book << 8) | page;
> +			msleep(sleep_time);
> +		} else if (offset =3D=3D 0x85) {
> +			bulk_len =3D ((u16)book << 8) | page;
> +
> +			if (bulk_len =3D=3D 0)
> +				return -EINVAL;
> +
> +			if (i >=3D block->num_commands)
> +				return -EINVAL;
> +			/* Verify bulk payload stays within block->data */
> +			if ((size_t)i * 4 + 3 + bulk_len >
> +			    (size_t)block->num_commands * 4)
> +				return -EINVAL;
> +
> +			book   =3D data[i * 4];
> +			page   =3D data[i * 4 + 1];
> +			offset =3D data[i * 4 + 2];
> +
> +			if (bulk_len > 1)
> +				ret =3D tas2557_dev_bulk_write(tas2557, chn,
> +							     TAS2557_REG(book, page, offset),
> +							     &data[i * 4 + 3], bulk_len);
> +			else
> +				ret =3D tas2557_dev_write(tas2557, chn,
> +							TAS2557_REG(book, page, offset),
> +							data[i * 4 + 3]);

[Severity: Low]
Can a bulk write command (0x85) with offset > 0x7f overflow into the next
page in TAS2557_REG(book, page, offset)?

Unlike the single-write branch, the 0x85 branch does not check that the
target register offset is <=3D 0x7f.  Because TASDEVICE_REG() computes
(book * 256 * 128) + (page * 128) + reg and TASDEVICE_PAGE_REG() reduces
reg modulo 128, an offset >=3D 0x80 increments the encoded page (or book)
and wraps TASDEVICE_PAGE_REG(reg) to offset - 128, bypassing the
TASDEVICE_PAGE_REG(reg) + len > 128 check in tas2557_dev_bulk_write().

[ ... ]

> +static int tas2557_power_up_locked(struct tas2557_priv *tas2557,
> +				   unsigned int prog_idx)
> +{
> +	int cfg_idx, ret;
> +
> +	lockdep_assert_held(&tas2557->tas_priv->codec_lock);
> +
> +	cfg_idx =3D tas2557_find_config(tas2557->fw, prog_idx, tas2557->sample_=
rate);
> +	if (cfg_idx < 0) {
> +		dev_err(tas2557->tas_priv->dev, "no config for program %u at %u Hz\n",
> +			prog_idx, tas2557->sample_rate);
> +		return cfg_idx;
> +	}
> +
> +	if (tas2557->powered || !tas2557->prog_valid ||
> +	    tas2557->devs[0].current_program !=3D prog_idx ||
> +	    tas2557->devs[0].current_config !=3D cfg_idx) {
> +		if (tas2557->powered) {
> +			ret =3D tas2557_shutdown_sequence(tas2557);
> +			if (ret < 0)
> +				return ret;
> +			/* Callers set powered again on success */
> +			tas2557->powered =3D false;
> +			tas2557->dac_muted =3D true;
> +		}
> +
> +		ret =3D tas2557_set_program(tas2557, prog_idx, cfg_idx);
> +		if (ret < 0) {
> +			dev_err(tas2557->tas_priv->dev,
> +				"firmware program load failed on power-up: %d\n",
> +				ret);
> +			return ret;
> +		}
> +	}
[ ... ]
> +	ret =3D tas2557_apply_mute_state(tas2557);
> +	if (ret < 0)
> +		goto err_shutdown;

[Severity: Medium]
Does setting tas2557->dac_muted =3D true when shutting down an
already-powered group prevent tas2557_apply_mute_state() from restoring an
unmuted state?

When tas2557_hw_params() calls tas2557_power_up_locked() for a live
rate_changed reload while the amplifier is powered and unmuted,
tas2557->dac_muted is overwritten with true before tas2557_set_program()
runs.  tas2557_apply_mute_state() then sees dac_muted =3D=3D true (and
tas2557_hw_params() skips remute when rate_changed is true), leaving the
amplifier muted and clock-error detection disabled.

[ ... ]

> +static int tas2557_parse_dt(struct tas2557_priv *tas2557, struct i2c_cli=
ent *client)
> +{
[ ... ]
> +	/* Which ASI's pins/dividers/format registers to program */
> +	tas2557->asi_port =3D TAS2557_ASI_PORT_DEFAULT;
> +	ret =3D of_property_read_u32(np, "ti,asi-port", &tas2557->asi_port);
> +	if (ret && ret !=3D -EINVAL)
> +		return dev_err_probe(dev, ret, "failed to read ti,asi-port\n");

[Severity: Low]
Does of_property_read_u32() fail probe with -ENOSYS when CONFIG_OF is
disabled?

Earlier in tas2557_parse_dt(), of_property_read_reg() is guarded with
if (np) so non-OF instantiation falls back to client->addr and
client->irq, and SND_SOC_TAS2557 does not depend on OF.  When CONFIG_OF=3Dn,
the of_property_read_u32() stub returns -ENOSYS rather than -EINVAL, which
causes this check to abort probe.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120004414.1686=
884-1-morf3089@gmail.com?part=3D2
