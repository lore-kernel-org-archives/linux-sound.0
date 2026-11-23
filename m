Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795429401;
	b=OdrckiUQ+fQe6jndLt1L1X2bmedDEz0/m1uytpsjDXS6tq/KzjptnHRInd+2Wk6jSy4Z
	 tXtUKh6z8GiQXzeIlg2d3t4N8sw4SKIkdnJ6XB4GO5EwBb4AL1AOQHNDrqxHQDmKC8uYz
	 9xYaWrGMSwDV/WDN87jSZRArgBO+S8U4yxBC41qKgCGVDG0lbwfQ2FB492ysb+afWca58
	 r/RjY2aIKSqZmeU4iTW6eOgz9BuNvtFwpQzDjGAusK5uNk1ZDC/RUP7WgNEKqL1ZqNDB/
	 eWdL/NJJQXDZdv7Nfu+lCKFw6n2SyRDGRlTGaiiyzTeDlig9LS9hUEftQxXNS5YZ70g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795429401;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=hKyW16TrGvtgbhZDNXbrpddgARgHnk2XQ9Yh7duTpCg=;
	b=lNwj+eVxwuLPnSWeHYudD5pZ6Bkj4MfP3d9P+mCZZ/+18Hu8dM5PNBHfV1FFWQNnSGHm
	 u9Vg0K6P+/NtCYWMPHMjhMADbrNJbc574Twgvm3DQr51NnrQlGcIL95QehDx915TL/0TD
	 fn9z3gt42hyCv0OcuA2m6gAbN5/iQntrxEtK8M0TJ4l9dGDgB9OJP2Flthd3iPxeepcfb
	 FaGSYzzrw2WZOFyFrlLXtXCUCXADJoosxXpdkuZmy8s+ggNZOGuPtUt4m3f2uLdW3RjUA
	 cvPRko2Y1BbnZSc7FkF04OBtE5xKaEp6hkuDEZwUjCU4uZX8YJ7JU/vIhpv8uZW+ORA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="mQOcOx/+";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACFB606A32C
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 10:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mQOcOx/+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C11F1F000CF;
	Mon, 23 Nov 2026 10:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795429401;
	bh=hKyW16TrGvtgbhZDNXbrpddgARgHnk2XQ9Yh7duTpCg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mQOcOx/+iII42rwT7eag/DBQtRZ7d8Ushf0sVP29iOKdhSGA8ONwAv97Y9oFUPkJC
	 FL5gsdqIllrtYwwcBlZkoD1ORAhhXukT942t7y8TWKYgyAC9QXMjx1P5s6kTBHHntf
	 EyLJ9NW6TTf2hHq+JmV7WgtaU3mKKhuycP4Fr7UoarEmO7izzCkamvC4xGvCW20faq
	 hOmgVeFEdwf7NZCF9H8ORvDgWkI1AkAJfGfx72UAJ7mcMR/0V2qZA1iPuS5KFzkYpJ
	 oCPhQ2k0SOzihz9HUf4xXWtXHHmBlxJUECAnw/DYdN4Oq0/mWJrSg7nlwnDE1uF+Z3
	 OzirV+jn0sihQ==
Message-ID: <sashiko-outbox-229034@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1] ASoC: tegra: Add support for mono channel to
 Tegra20/Tegra30 I2S DAIs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261123100228.77797-1-clamor95@gmail.com>
References: <20261123100228.77797-1-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 10:23:20 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] ASoC: tegra: mono LRCK divider halves frame rate in
  i2s_hw_params()
- [High] ASoC: tegra: I2S and APBIF CIF channel mismatch in
  tegra30_i2s_hw_params()
--

commit 7e2665c666f6776eab203c934282fc56f2dc5a17
Author: Svyatoslav Ryhel <clamor95@gmail.com>

ASoC: tegra: Add support for mono channel to Tegra20/Tegra30 I2S DAIs

This commit enables 1-channel audio on Tegra20 and Tegra30+ I2S DAIs for
non-DSP formats and updates the I2S clock, timing divider, and Tegra30 CIF
channel calculations.

> diff --git a/sound/soc/tegra/tegra20_i2s.c b/sound/soc/tegra/tegra20_i2s.c
> index 2978c9d6f4839..285923e6aeffa 100644
> --- a/sound/soc/tegra/tegra20_i2s.c
> +++ b/sound/soc/tegra/tegra20_i2s.c
> @@ -144,7 +144,12 @@ static int tegra20_i2s_hw_params(struct snd_pcm_subs=
tream *substream,
>  	struct device *dev =3D dai->dev;
>  	struct tegra20_i2s *i2s =3D snd_soc_dai_get_drvdata(dai);
>  	unsigned int mask, val;
> -	int ret, sample_size, srate, i2sclock, bitcnt;
> +	int ret, sample_size, srate, i2sclock, bitcnt, i2sclk_div, is_dsp;
> +
> +	is_dsp =3D regmap_test_bits(i2s->regmap, TEGRA20_I2S_CTRL,
> +				  TEGRA20_I2S_CTRL_BIT_FORMAT_DSP);
> +	if (is_dsp < 0)
> +		return is_dsp;
> =20
>  	mask =3D TEGRA20_I2S_CTRL_BIT_SIZE_MASK;
>  	switch (params_format(params)) {
> @@ -174,18 +179,24 @@ static int tegra20_i2s_hw_params(struct snd_pcm_sub=
stream *substream,
>  	/* Final "* 2" required by Tegra hardware */
>  	i2sclock =3D srate * params_channels(params) * sample_size * 2;
> =20
> +	/* Additional "* 2" is needed for DSP mode */
> +	if (is_dsp)
> +		i2sclock *=3D 2;
> +
>  	ret =3D clk_set_rate(i2s->clk_i2s, i2sclock);
>  	if (ret) {
>  		dev_err(dev, "Can't set I2S clock rate: %d\n", ret);
>  		return ret;
>  	}
> =20
> -	bitcnt =3D (i2sclock / (2 * srate)) - 1;
> +	i2sclk_div =3D is_dsp ? srate : params_channels(params) * srate;
> +
> +	bitcnt =3D (i2sclock / i2sclk_div) - 1;
>  	if (bitcnt < 0 || bitcnt > TEGRA20_I2S_TIMING_CHANNEL_BIT_COUNT_MASK_US)
>  		return -EINVAL;
>  	val =3D bitcnt << TEGRA20_I2S_TIMING_CHANNEL_BIT_COUNT_SHIFT;
> =20
> -	if (i2sclock % (2 * srate))
> +	if (i2sclock % i2sclk_div)
>  		val |=3D TEGRA20_I2S_TIMING_NON_SYM_ENABLE;

[Severity: High]
Does dividing i2sclock by params_channels(params) * srate in LRCK mode drive
LRCK at srate / 2 for 1-channel streams (here and in tegra30_i2s_hw_params()
below)?

In LRCK formats, each sample frame always has two LRCK half-periods (Left a=
nd
Right), and CHANNEL_BIT_COUNT (bitcnt) sets the number of clocks per half-
period minus 1 (see tegra210_i2s_set_timing_params(), which divides by
srate * 2 in I2S_CTRL_FRAME_FMT_LRCK_MODE).  When params_channels(params) is
1, scaling both i2sclock and i2sclk_div by params_channels(params) cancels
out in i2sclock / i2sclk_div, leaving bitcnt identical to 2-channel stereo
while clk_i2s is halved.  On Tegra20, TEGRA20_I2S_CTRL is also still set to
TEGRA20_I2S_CTRL_FIFO_FORMAT_PACKED with no mono configuration, so two
consecutive mono samples in each 32-bit FIFO word are unpacked and shifted
out as Left and Right stereo channels at half the requested sample rate.

[ ... ]

> diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
> index e5e648d00621b..433a7eb873b43 100644
> --- a/sound/soc/tegra/tegra30_i2s.c
> +++ b/sound/soc/tegra/tegra30_i2s.c

[ ... ]

> @@ -172,14 +183,14 @@ static int tegra30_i2s_hw_params(struct snd_pcm_sub=
stream *substream,
> =20
>  	val =3D bitcnt << TEGRA30_I2S_TIMING_CHANNEL_BIT_COUNT_SHIFT;
> =20
> -	if (i2sclock % (2 * srate))
> +	if (i2sclock % i2sclk_div)
>  		val |=3D TEGRA30_I2S_TIMING_NON_SYM_ENABLE;
> =20
>  	regmap_write(i2s->regmap, TEGRA30_I2S_TIMING, val);
> =20
>  	cif_conf.threshold =3D 0;
> -	cif_conf.audio_channels =3D 2;
> -	cif_conf.client_channels =3D 2;
> +	cif_conf.audio_channels =3D params_channels(params);
> +	cif_conf.client_channels =3D params_channels(params);
>  	cif_conf.audio_bits =3D TEGRA30_AUDIOCIF_BITS_16;
>  	cif_conf.client_bits =3D TEGRA30_AUDIOCIF_BITS_16;

[Severity: High]
Does setting audio_channels and client_channels to 1 on the I2S CIF mismatch
the paired AHUB APBIF FIFO CIF?

tegra30_ahub_allocate_tx_fifo() and tegra30_ahub_allocate_rx_fifo() configu=
re
the APBIF CIF once at probe time with audio_channels =3D 2 and
client_channels =3D 2:

sound/soc/tegra/tegra30_ahub.c:tegra30_ahub_allocate_tx_fifo() {
    ...
	cif_conf.threshold =3D 0;
	cif_conf.audio_channels =3D 2;
	cif_conf.client_channels =3D 2;
	cif_conf.audio_bits =3D TEGRA30_AUDIOCIF_BITS_16;
	cif_conf.client_bits =3D TEGRA30_AUDIOCIF_BITS_16;
    ...
}

When params_channels(params) is 1, the APBIF side of the AHUB crossbar stays
configured for 2-channel frames while the I2S CIF is programmed for 1-chann=
el
frames with mono_conv =3D 0 and stereo_conv =3D 0, misframing mono playback=
 and
capture streams across the crossbar.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123100228.7779=
7-1-clamor95@gmail.com?part=3D1
