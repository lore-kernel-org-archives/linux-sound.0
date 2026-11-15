Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794775499;
	b=38atcWQ4C4v1YGuU8VErpiFWCnmg6gJElWkEGmDVHdStdhARjN0cm6HUgdLKJouoiOpy
	 IGXQhShqUaTC7WVdmamqNCat8Py3lNeJAUOvaS72VEbsekkypwHDXl6dZls8UOOPSaQxd
	 weUsIGQ1ZcxhnbqysSKCt00aKE3LbtLyvsMu+EAPRrPaRgPGdAf+BTLf87L2j3C9685ez
	 sUS7/yWi0Ju30ZwyYNKOuCYU6lFkYSXQm/MbEoSYTH7wH51FdVoEQX7SBBhHBoaMlYt+O
	 mWGnAVXmN20w1JSihfkhzeyIaHJqr2xqmGH8QR4CnWIrd+NXm1fL1bz1VfXx5DHb7ZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794775499;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=XP/GYrcE262jt9p3ns5mlsfVOF3Gy7HZ1+8oosGClOE=;
	b=GikQ7w4mAsQE5RIPW6oM/7NeQZ+HlMGbd+H9eUyhytY8ab+5eQPwSOzB1DuYadpQXogx
	 k1SspHKSAdjJnxfLxexAN+SE/UU7MUn84IElJ1bQ7CpdW35yd6cYFWOv4zFgcEi8ptX0u
	 EvgAr7YWgXQlgY0fMcOMVHuAakMaaNmX+CYcmRNsxvtCVGRcabHeYXSkPUdLLSpZxlKxF
	 EYxWVPaDj/nGaN9eb2jNtgAbKH8DXEJNiZqKs/auUmVVUQHFJoyMTVpUR02yHvOAXNVFF
	 CFU50n22CUvqj5QhUsyTcSrVuePqvEYNM1ETQOH7zWyq/cRwPHhkC9MCpkLjnSxVFlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BzuR8YAf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB94606A333;
	Sun, 15 Nov 2026 20:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BzuR8YAf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F5ED1F000C6;
	Sun, 15 Nov 2026 20:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794775499;
	bh=XP/GYrcE262jt9p3ns5mlsfVOF3Gy7HZ1+8oosGClOE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BzuR8YAf9LYurbMQObrD+KIzgARzNB79Te4ywJmeCNWkxffrnwYzaxaNB0+O0bONU
	 LhAxLUtJ1pDuMDWim8U9k3byvNc4+Cz+Y16rRVirCQsiisoWpTvIXpNJj9IeKIX4yo
	 2jWfgmCAo1wMVMYhoPGZ7kU3ffOEe7GavPNcgyMYVOg81Sv8LmnSukKyggDKdKxY+j
	 KZ6q+4J88TNgmMqePdfgO1NTWvrub2UYcj9FcEvWIXfwfDInlNCCyLS1e+2HLbesMT
	 pPZY81E64ugMkRQObZ1ndeVU1txy/yqNJ+6G2Jzwk4Wn037B/1zSu82ur6SgWHRykl
	 wRQ2xm7YsKGpA==
Message-ID: <sashiko-outbox-215853@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] ASoC: codecs: Add NXP TFA9865 amplifier driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Venkat Yadlapati" <venkat.yadlapati@yahoo.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261116-vantage-tfa9865-v1-2-e88f0dccc427@yahoo.com>
References: <20261116-vantage-tfa9865-v1-0-e88f0dccc427@yahoo.com>
 <20261116-vantage-tfa9865-v1-2-e88f0dccc427@yahoo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 20:44:58 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [High] ASoC: tfa9865: sleeping in atomic trigger context in
  tfa9865_mute_stream()
- [Medium] ASoC: tfa9865: AMPE state desync on Amp Switch toggle in
  tfa9865_mute_stream()
- [Medium] ASoC: tfa9865: missing software reset or MANSCONF clear in
  tfa9865_init()
--

commit 9362aea049536ac41ce721fb8b374074a607c998
Author: Venkat Yadlapati <venkat.yadlapati@yahoo.com>

ASoC: codecs: Add NXP TFA9865 amplifier driver

This commit adds an ASoC codec driver for the NXP/Goodix TFA9865 mono
class-D speaker amplifier, supporting the B0 revision with 32-bit I2S
slots.

> diff --git a/sound/soc/codecs/tfa9865.c b/sound/soc/codecs/tfa9865.c
> new file mode 100644
> index 0000000000000..7467b8b21eda7
> --- /dev/null
> +++ b/sound/soc/codecs/tfa9865.c

[ ... ]

> +static const struct snd_soc_dapm_widget tfa9865_dapm_widgets[] =3D {
> +	SND_SOC_DAPM_OUTPUT("OUT"),
> +	SND_SOC_DAPM_SUPPLY("POWER", TFA9865_SYS_CTRL0, TFA9865_SYS_CTRL0_PWDN,=
 1, NULL, 0),
> +	SND_SOC_DAPM_SUPPLY("BOOST", TFA9865_SYS_CTRL0, TFA9865_SYS_CTRL0_DCA, =
0, NULL, 0),
> +	SND_SOC_DAPM_OUT_DRV("AMPE", SND_SOC_NOPM, 0, 0, NULL, 0),
> +	SND_SOC_DAPM_SWITCH("Amp", SND_SOC_NOPM, 0, 0, &amp_switch),

[ ... ]

> +static int tfa9865_mute_stream(struct snd_soc_dai *dai, int mute, int st=
ream)
> +{
> +	struct snd_soc_component *component =3D dai->component;
> +	unsigned int val;
> +
> +	/*
> +	 * Enable the amplifier only once the I2S clocks run, enabling it
> +	 * earlier makes it pop when the clocks start. Leave it off if the
> +	 * output is not powered.
> +	 */
> +	if (!mute) {
> +		val =3D snd_soc_component_read(component, TFA9865_SYS_CTRL0);
> +		if (val & BIT(TFA9865_SYS_CTRL0_PWDN))
> +			return 0;
> +	}
> +
> +	return snd_soc_component_update_bits(component, TFA9865_SYS_CTRL0,
> +					     BIT(TFA9865_SYS_CTRL0_AMPE),
> +					     mute ? 0 : BIT(TFA9865_SYS_CTRL0_AMPE));
> +}

[Severity: Medium]
Does toggling the virtual "Amp Switch" control during playback leave the
amplifier enable bit out of sync with the dapm power state?

The "AMPE" widget is configured with no register control and no dapm
event callback, so the amplifier enable bit is only updated in
tfa9865_mute_stream().  If playback starts while "Amp Switch" is off (its
initial state), the power supply widget is off, so tfa9865_mute_stream()
sees the power-down bit set and returns 0 without enabling the amplifier.
When userspace later turns "Amp Switch" on while the stream is active,
dapm powers up the supply and boost widgets, but tfa9865_mute_stream() is
not called again, leaving the speaker silent for the rest of the stream.
Conversely, turning "Amp Switch" off mid-stream powers down the boost and
supply widgets while leaving the amplifier enable bit set.

Also, snd_soc_component_read() returns a negative error code cast to
unsigned int on failure, so testing val without checking for errors first
misinterprets failed reads.

> +
> +static const struct snd_soc_dai_ops tfa9865_dai_ops =3D {
> +	.hw_params =3D tfa9865_hw_params,
> +	.mute_stream =3D tfa9865_mute_stream,
> +	.no_capture_mute =3D 1,
> +	.mute_unmute_on_trigger =3D 1,
> +};

[Severity: High]
Does setting .mute_unmute_on_trigger sleep in atomic context when a stream
starts or stops?

With .mute_unmute_on_trigger set, snd_soc_pcm_dai_trigger() calls
snd_soc_dai_digital_mute() -> tfa9865_mute_stream() directly from the pcm
trigger callback while holding the pcm substream spinlock with interrupts
disabled.  tfa9865_mute_stream() then calls snd_soc_component_read() and
snd_soc_component_update_bits(), which lock component->io_mutex and
regmap->mutex and perform sleeping i2c transfers.

[ ... ]

> +static int tfa9865_init(struct tfa9865 *tfa9865)
> +{
> +	struct regmap *regmap =3D tfa9865->regmap;
> +	unsigned int seed;
> +	int ret;
> +
> +	/* Leave power down to make the protected registers accessible */
> +	regmap_clear_bits(regmap, TFA9865_SYS_CTRL0, BIT(TFA9865_SYS_CTRL0_PWDN=
));
> +	regmap_clear_bits(regmap, TFA9865_CLK_GATING_CTRL, TFA9865_CLK_GATING_C=
TRL_MANAOOSC);
> +	ret =3D tfa9865_wait_manstate(tfa9865, TFA9865_MANSTATE_WAIT_SRC);
> +	if (ret)
> +		return ret;

[ ... ]

> +	/* Configuration done, let the device manager start on power up */
> +	return regmap_set_bits(regmap, TFA9865_SYS_CTRL1, TFA9865_SYS_CTRL1_MAN=
SCONF);
> +}

[Severity: Medium]
Can tfa9865_wait_manstate() time out on driver rebind or warm reboot when
no reset gpio is wired?

tfa9865_init() sets the configuration-done bit at the end of probe so the
device manager advances past the wait-for-source state on later power-ups.
Because reset_gpiod is optional and tfa9865_init() does not issue a
software reset or clear the configuration-done bit before clearing the
power-down bit, re-probing the driver while vddd stays powered lets the
device manager advance past the wait-for-source state and causes
tfa9865_wait_manstate() to fail with -ETIMEDOUT.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-vantage-tf=
a9865-v1-0-e88f0dccc427@yahoo.com?part=3D2
