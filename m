Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793509905;
	b=P8E5l1q4FeJYB8gg/wHC27Y54DmkNJRdYtzOl4PC/wsYxRtrw+A18//6QMTBrF207tsv
	 KhiCIRvt3HmrCwvFnVTuUofQT79bS6atx0m1kfzT3fPji+NFBgPZmje4hwrfSII6Z1mXg
	 GjzON+O3iVJb1ZfyuuJKlgIZcABVU04aDC9j8bw45pepqcEnfsJyogh9MoB55UqQN0me6
	 zkHlECzjfV7HogUkJlyx+KI8A6lzGcmvQ8gz6MoLF5mVsVY3FHql0q3ZQ9lQDx13HYpij
	 oabPW1bWfmnL6cEKzgA1ISvbLkA4oTDRJIbNx08VB++ha+T9XiaeYIEotPCwt28aPrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793509905;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=IhnynMi1oh3x01RYcpJplbhD+IWEDLvcAbuhHa/UHO4=;
	b=GU5hixhJ3HUPWZKb/ZELZhbgfERsaCZmYa1NHms02U0HMhfLf0KqCec0atqCMjGyoNhI
	 odp5SYRB9YqckEqFk0yAsBqdDIpAtKuY6NF0ns3peV9gQiUA23WirX2zddbl4biT6r5Di
	 hDut3T/agytZ4v29woDQziDyyZd3KJxLDE8CQICc0X7rHVr0MfIth21aptgZtcowUbFjB
	 yY5aBz9MVsT1P1/Y6lgNzUeav4rs3fqDXnAQmFzEuEiKkHiPpZKIXfn9X76tzRz6JgDQX
	 zgtu2hKGKrw5qLyqPHqsjtasOAiPQLx2WrSwqKjnDWVfQLDVrM77zq9R9fL200b3C7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gjRtdJtE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DA1606A324;
	Sun,  1 Nov 2026 05:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gjRtdJtE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B898F1F000C1;
	Sun,  1 Nov 2026 05:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793509904;
	bh=IhnynMi1oh3x01RYcpJplbhD+IWEDLvcAbuhHa/UHO4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gjRtdJtE6PhpqkkaGmQuI/XMD6DBVlKEx6V6Py5WjApCGqvLEjQdVAVJ0s8M1Kt5g
	 4gnxfRSrQhspwt8gJKNrIdXdF1X2t0dkW/KrbTcu4Dg4wKiigUKvmVcn2phA9YDIWp
	 iHI5Un1CXKn2OnENUPI+KNs3Ri1jYjfH8pNldeRWYf1pjXK8+uFfEVSXg/JcevRTun
	 QazjXOwVPLZzZpj0uR35dhqVAGI6OA93Bs4nxAM5BwS/xRqVMxrDQTjB3F+q39sPAA
	 r82dgIxOOtnMriFKaBKj0Viymhdf8WhAfAU0r5sVt852DZimJplXarjpKo6u3bUS37
	 PDkbH4x9KLURQ==
Message-ID: <sashiko-outbox-192279@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] ASoC: codecs: rk3308: restore audio and
 headphone support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xing Zheng" <zhengxing@rock-chips.com>, linux-sound@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261101044149.2018744-3-zhengxing@rock-chips.com>
References: <20261101040125.1864141-1-zhengxing@rock-chips.com>
 <20261101044149.2018744-1-zhengxing@rock-chips.com>
 <20261101044149.2018744-3-zhengxing@rock-chips.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 01 Nov 2026 05:11:43 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 11 potential issue=
(s) to consider:
- [Medium] ASoC: rk3308: rk3308_codec_adc_event() clobbers MIC Capture Swit=
ch state
- [Medium] ASoC: rk3308: broken mute and HPMIX_WORK sequencing in rk3308_co=
dec_dac_event()
- [Medium] ASoC: rk3308: redundant PMU and invalid POP_SOUND in rk3308_code=
c_output_event()
- [Medium] ASoC: rk3308: zero-cross detection disabled in rk3308_codec_init=
ialize()
- [Medium] ASoC: rk3308: rk3308_codec_dac_event() enables inactive DAPM out=
puts
- [Medium] ASoC: rk3308: HPOUT subseq inverts power order against machine H=
P widget
- [Medium] ASoC: rk3308: CH1_IN_SEL and CH2_IN_SEL not converted to SND_SOC=
_NOPM
- [Medium] ASoC: rk3308: leak of devm_kmemdup() widgets in rk3308_codec_add=
_widgets()
- [Medium] ASoC: rk3308: non-atomic route and dac_output update in rk3308_c=
odec_set_output()
- [Medium] ASoC: rk3308: race on mixer registers in rk3308_codec_dac_event()
- [Medium] ASoC: rk3308: lock inversion on io_lock in rk3308_codec_mute_str=
eam()
--

commit a099049aa9bf21b04f0558d74e37572e81c21ec8
Author: Xing Zheng <zhengxing@rock-chips.com>

ASoC: codecs: rk3308: restore audio and headphone support

This commit restores the vendor analog enable and disable sequencing,
settling delays, gain ramps, and ADC resynchronization across codec
revisions A, B, and C using DAPM supply events and virtual intermediate
widgets. It also adds per-channel microphone boost controls, ADC stereo
group routing, selectable DAC output routing, and headphone jack detection.

> diff --git a/sound/soc/codecs/rk3308_codec.c b/sound/soc/codecs/rk3308_co=
dec.c
> index a3d41cd8150d0..1894e1a93fbf8 100644
> --- a/sound/soc/codecs/rk3308_codec.c
> +++ b/sound/soc/codecs/rk3308_codec.c

[ ... ]

> @@ -78,7 +184,288 @@ static SOC_ENUM_SINGLE_DECL(rk3308_codec_hpf_cutoff_=
enum56, RK3308_ADC_DIG_CON04
>  static SOC_ENUM_SINGLE_DECL(rk3308_codec_hpf_cutoff_enum78, RK3308_ADC_D=
IG_CON04(3), 0,
>  			    rk3308_codec_hpf_cutoff_text);
> =20
> +static int rk3308_codec_output_routes(struct rk3308_codec_priv *rk3308)
> +{
> +	static const struct snd_soc_dapm_route routes[][2] =3D {
> +		{
> +			{ "L_LINEOUT_EN", NULL, "DAC_L_HPMIX_SEL" },
> +			{ "R_LINEOUT_EN", NULL, "DAC_R_HPMIX_SEL" },
> +		}, {
> +			{ "L_HPOUT_EN", NULL, "DAC_L_HPMIX_SEL" },
> +			{ "R_HPOUT_EN", NULL, "DAC_R_HPMIX_SEL" },
> +		},
> +	};
> +	struct snd_soc_dapm_context *dapm =3D snd_soc_component_to_dapm(rk3308-=
>component);
> +	u32 mask =3D rk3308->dac_output =3D=3D 11 ? 3 :
> +		rk3308->dac_output =3D=3D 0 ? 1 : 2;
> +	int i, ret;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(routes); i++) {
> +		if (!((mask ^ rk3308->output_routes_mask) & BIT(i)))
> +			continue;
> +		if (mask & BIT(i))
> +			ret =3D snd_soc_dapm_add_routes(dapm, routes[i], ARRAY_SIZE(routes[i]=
));
> +		else
> +			ret =3D snd_soc_dapm_del_routes(dapm, routes[i], ARRAY_SIZE(routes[i]=
));
> +		if (ret)
> +			return ret;
> +		rk3308->output_routes_mask ^=3D BIT(i);
> +	}
> +
> +	return 0;
> +}
> +
> +static int rk3308_codec_set_output(struct rk3308_codec_priv *rk3308, uns=
igned int output)
> +{
> +	unsigned int saved =3D rk3308->dac_output;
> +	int ret;
> +
> +	rk3308->dac_output =3D output;
> +	ret =3D rk3308_codec_output_routes(rk3308);
> +	if (ret) {
> +		rk3308->dac_output =3D saved;
> +		rk3308_codec_output_routes(rk3308);
> +	}
> +	if (!ret && rk3308->hpdet_jack)
> +		snd_soc_jack_report(rk3308->hpdet_jack,
> +				    output ? SND_JACK_HEADPHONE : 0, SND_JACK_HEADPHONE);
> +	if (!ret)
> +		ret =3D snd_soc_dapm_sync(snd_soc_component_to_dapm(rk3308->component)=
);
> +	return ret;
> +}

[Severity: Medium]
Can updating rk3308->dac_output and the DAPM routes in
rk3308_codec_set_output() race with concurrent DAPM power sequencing?

In rk3308_codec_set_output(), rk3308->dac_output is modified under
rk3308->io_lock before card->dapm_mutex is acquired in
rk3308_codec_output_routes() and snd_soc_dapm_sync(). Meanwhile,
rk3308_codec_dac_event() reads rk3308->dac_output while holding
card->dapm_mutex (without holding rk3308->io_lock):

    bool lineout =3D rk3308->dac_output !=3D 1;
    bool headphone =3D rk3308->dac_output !=3D 0;

Because dapm_power_widgets() holds card->dapm_mutex across
rk3308_codec_set_bias_level() and the delays in rk3308_codec_dac_event(), a
concurrent call to rk3308_codec_set_output() via rk3308_codec_output_put()
or rk3308_codec_hpdet_work() can overwrite rk3308->dac_output and block on
card->dapm_mutex in rk3308_codec_output_routes(), causing
rk3308_codec_dac_event() to execute with the new rk3308->dac_output value
while DAPM is still powering up the widget list computed from the old route
graph.

In addition, each call to snd_soc_dapm_del_routes() and
snd_soc_dapm_add_routes() in rk3308_codec_output_routes() acquires and
releases card->dapm_mutex separately. When switching from Line Out
(dac_output =3D=3D 0, mask =3D=3D 1) to Headphone (dac_output =3D=3D 1, mas=
k =3D=3D 2),
routes[0] is deleted in the first iteration and card->dapm_mutex is dropped
before routes[1] is added in the second iteration. If another thread runs a
DAPM sync in that window, DAPM sees no connected output routes from
DAC_L_HPMIX_SEL and DAC_R_HPMIX_SEL and powers down the active DAC.

[ ... ]

> @@ -175,107 +562,350 @@ static const struct snd_kcontrol_new rk3308_codec=
_controls[] =3D {

[ ... ]

> +/* DAPM calls this before the machine driver enables either output ampli=
fier. */
> +static int rk3308_codec_dac_event(struct snd_soc_dapm_widget *w,
> +				  struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component =3D snd_soc_dapm_to_component(w->da=
pm);
> +	struct rk3308_codec_priv *rk3308 =3D snd_soc_component_get_drvdata(comp=
onent);
> +	unsigned int line, hp, aif1, aif2, digital_gain =3D 0, gain_l, gain_r;
> +	int gain;
> +	unsigned int line_unmute =3D BIT(RK3308_DAC_L_LINEOUT_MUTE_SFT) |
> +				   BIT(RK3308_DAC_R_LINEOUT_MUTE_SFT);
> +	bool lineout =3D rk3308->dac_output !=3D 1;
> +	bool headphone =3D rk3308->dac_output !=3D 0;

[Severity: Medium]
Does deriving lineout and headphone from rk3308->dac_output instead of the
DAPM widget power states cause rk3308_codec_dac_event() to enable inactive
outputs?

rk3308_codec_probe() initializes rk3308->dac_output to 11 (Both). On boards
that only route LINEOUT or HPOUT in Device Tree audio-routing (or when
headphone detection is not used, such as on revision A), the unconnected
output widgets have new_power =3D=3D 0, but rk3308_codec_dac_event() still =
sees
both lineout and headphone as true and enables both RK3308_DAC_L/R_LINEOUT_=
EN
and RK3308_DAC_L/R_HPOUT_EN while ramping the headphone gain.

> +
> +	rk3308->dac_analog =3D w;
> +	regmap_read(rk3308->regmap, RK3308_DAC_ANA_CON04, &line);
> +	regmap_read(rk3308->regmap, RK3308_DAC_ANA_CON03, &hp);
> +	regmap_read(rk3308->regmap, RK3308_DAC_ANA_CON05, &gain_l);
> +	regmap_read(rk3308->regmap, RK3308_DAC_ANA_CON06, &gain_r);
> +	gain_l &=3D RK3308_DAC_x_HPOUT_GAIN_MSK;
> +	gain_r &=3D RK3308_DAC_x_HPOUT_GAIN_MSK;
> +	if (event =3D=3D SND_SOC_DAPM_PRE_PMU) {
> +		if (headphone) {
> +			regmap_update_bits(rk3308->regmap, RK3308_DAC_ANA_CON05,
> +					   RK3308_DAC_x_HPOUT_GAIN_MSK, 0);
> +			regmap_update_bits(rk3308->regmap, RK3308_DAC_ANA_CON06,
> +					   RK3308_DAC_x_HPOUT_GAIN_MSK, 0);
> +		}

[Severity: Medium]
What happens if userspace reads or writes the Headphone Playback Volume,
Headphone Playback Switch, or Line Out Playback Switch controls while
rk3308_codec_dac_event() is running?

rk3308_codec_dac_event() runs under card->dapm_mutex and snapshots
RK3308_DAC_ANA_CON03..06 into hp, line, gain_l, and gain_r, then zeroes or
ramps RK3308_DAC_ANA_CON05/06 and clears the unmute bits in
RK3308_DAC_ANA_CON03/04 across multiple sleeps (~10-14 ms) before writing t=
he
snapshots back. Because snd_soc_get_volsw() and snd_soc_put_volsw() run
under card->controls_rwsem without acquiring card->dapm_mutex, concurrent
mixer reads can observe transient zeroed/muted register values and
concurrent mixer writes to RK3308_DAC_ANA_CON03..06 will be overwritten when
rk3308_codec_dac_event() restores its initial snapshots.

[ ... ]

> +		/* Steps 15-21: select I2S and restore the user mute/gain settings. */
> +		rk3308_codec_analog_update(rk3308, RK3308_DAC_ANA_CON12,
> +					   RK3308_DAC_L_HPMIX_SEL_MSK | RK3308_DAC_R_HPMIX_SEL_MSK,
> +			RK3308_DAC_L_HPMIX_I2S | RK3308_DAC_R_HPMIX_I2S);
> +		rk3308_codec_analog_update(rk3308, RK3308_DAC_ANA_CON13,
> +					   (RK3308_DAC_L_HPMIX_UNMUTE | RK3308_DAC_R_HPMIX_UNMUTE),
> +			(RK3308_DAC_L_HPMIX_UNMUTE | RK3308_DAC_R_HPMIX_UNMUTE));
> +		if (headphone)
> +			for (gain =3D 0; gain <=3D max(gain_l, gain_r); gain++) {
> +				regmap_update_bits(rk3308->regmap, RK3308_DAC_ANA_CON05,
> +						   RK3308_DAC_x_HPOUT_GAIN_MSK,
> +					min_t(unsigned int, gain, gain_l));
> +				regmap_update_bits(rk3308->regmap, RK3308_DAC_ANA_CON06,
> +						   RK3308_DAC_x_HPOUT_GAIN_MSK,
> +					min_t(unsigned int, gain, gain_r));
> +			}
> +		rk3308_codec_resync_adcs(rk3308);
> +	} else {
> +		/* Vendor DAC disable steps 3-19, after the external amps are off. */
> +		if (hp & (RK3308_DAC_L_HPOUT_EN | RK3308_DAC_R_HPOUT_EN))
> +			for (gain =3D max(gain_l, gain_r); gain >=3D 0; gain--) {
> +				regmap_update_bits(rk3308->regmap, RK3308_DAC_ANA_CON05,
> +						   RK3308_DAC_x_HPOUT_GAIN_MSK,
> +					min_t(unsigned int, gain, gain_l));
> +				regmap_update_bits(rk3308->regmap, RK3308_DAC_ANA_CON06,
> +						   RK3308_DAC_x_HPOUT_GAIN_MSK,
> +					min_t(unsigned int, gain, gain_r));
> +				usleep_range(200, 300);
> +			}
> +		rk3308_codec_analog_update(rk3308, RK3308_DAC_ANA_CON12,
> +					   RK3308_DAC_L_HPMIX_SEL_MSK | RK3308_DAC_R_HPMIX_SEL_MSK,
> +			RK3308_DAC_L_HPMIX_NONE | RK3308_DAC_R_HPMIX_NONE);
> +		rk3308_codec_analog_update(rk3308, RK3308_DAC_ANA_CON03,
> +					   RK3308_DAC_L_HPOUT_UNMUTE |
> +					   RK3308_DAC_R_HPOUT_UNMUTE, 0);
> +		rk3308_codec_analog_update(rk3308, RK3308_DAC_ANA_CON02,
> +					   (RK3308_DAC_L_DAC_WORK | RK3308_DAC_R_DAC_WORK), 0);
> +		rk3308_codec_analog_update(rk3308, RK3308_DAC_ANA_CON03,
> +					   (RK3308_DAC_L_HPOUT_EN | RK3308_DAC_R_HPOUT_EN), 0);
> +		rk3308_codec_analog_update(rk3308, RK3308_DAC_ANA_CON04, line_unmute, =
0);
> +		rk3308_codec_analog_update(rk3308, RK3308_DAC_ANA_CON04,
> +					   (RK3308_DAC_L_LINEOUT_EN | RK3308_DAC_R_LINEOUT_EN), 0);
> +		rk3308_codec_analog_update(rk3308, RK3308_DAC_ANA_CON13,
> +					   (RK3308_DAC_L_HPMIX_EN | RK3308_DAC_R_HPMIX_EN), 0);
> +		rk3308_codec_analog_update(rk3308, RK3308_DAC_ANA_CON02,
> +					   (RK3308_DAC_L_DAC_EN | RK3308_DAC_R_DAC_EN), 0);
> +		rk3308_codec_analog_update(rk3308, RK3308_DAC_ANA_CON02,
> +					   (RK3308_DAC_L_CLK_EN | RK3308_DAC_R_CLK_EN), 0);
> +		rk3308_codec_analog_update(rk3308, RK3308_DAC_ANA_CON02,
> +					   (RK3308_DAC_L_REF_EN | RK3308_DAC_R_REF_EN), 0);
> +		rk3308_codec_analog_update(rk3308, RK3308_DAC_ANA_CON01,
> +					   RK3308_DAC_HPOUT_POP_SOUND_L_MSK |
> +					   RK3308_DAC_HPOUT_POP_SOUND_R_MSK,
> +			RK3308_DAC_HPOUT_POP_SOUND_L_INIT | RK3308_DAC_HPOUT_POP_SOUND_R_INIT=
);
> +		if (rk3308->codec_ver >=3D ACODEC_VERSION_B)
> +			rk3308_codec_analog_update(rk3308, RK3308_DAC_ANA_CON15,
> +						   RK3308_DAC_LINEOUT_POP_SOUND_L_MSK |
> +						   RK3308_DAC_LINEOUT_POP_SOUND_R_MSK,
> +			RK3308_DAC_L_SEL_DC_FROM_VCM | RK3308_DAC_R_SEL_DC_FROM_VCM);
> +		rk3308_codec_analog_update(rk3308, RK3308_DAC_ANA_CON01,
> +					   (RK3308_DAC_BUF_REF_L_EN | RK3308_DAC_BUF_REF_R_EN), 0);
> +		rk3308_codec_analog_update(rk3308, RK3308_DAC_ANA_CON00,
> +					   RK3308_DAC_CURRENT_EN, 0);
> +		rk3308_codec_analog_update(rk3308, RK3308_DAC_ANA_CON03,
> +					   (RK3308_DAC_L_HPOUT_WORK | RK3308_DAC_R_HPOUT_WORK), 0);
> +		rk3308_codec_analog_update(rk3308, RK3308_DAC_ANA_CON13,
> +					   (RK3308_DAC_L_HPMIX_WORK | RK3308_DAC_R_HPMIX_WORK),
> +			(RK3308_DAC_L_HPMIX_WORK | RK3308_DAC_R_HPMIX_WORK));

[Severity: Medium]
Should the SND_SOC_DAPM_PRE_PMU and SND_SOC_DAPM_POST_PMD branches in
rk3308_codec_dac_event() be muting the outputs during power-up and clearing
RK3308_DAC_L/R_HPMIX_WORK and RK3308_DAC_L/R_HPMIX_UNMUTE on power-down?

In rk3308_codec_initialize() and at the end of SND_SOC_DAPM_POST_PMD, the
driver sets the unmute bits in RK3308_DAC_ANA_CON03 and RK3308_DAC_ANA_CON04
so the ALSA switches remain readable while the DAC is off. At the start of
rk3308_codec_dac_event(), line and hp are read from RK3308_DAC_ANA_CON04 and
RK3308_DAC_ANA_CON03, and the comment at steps 15-21 says "select I2S and
restore the user mute/gain settings". However, SND_SOC_DAPM_PRE_PMU never
clears the unmute bits in RK3308_DAC_ANA_CON03 or RK3308_DAC_ANA_CON04
before enabling the outputs, and never uses line or hp to restore them at
steps 15-21. As a result, LINEOUT_EN and HPOUT_EN/HPOUT_WORK are powered on
while already unmuted before DAC_REF_EN, DAC_CLK_EN, DAC_EN, DAC_WORK, and
HPMIX_SEL are configured.

Additionally, in the SND_SOC_DAPM_POST_PMD branch,
RK3308_DAC_L_HPMIX_UNMUTE | RK3308_DAC_R_HPMIX_UNMUTE in
RK3308_DAC_ANA_CON13 is never cleared, and the update to
RK3308_DAC_L_HPMIX_WORK | RK3308_DAC_R_HPMIX_WORK passes
(RK3308_DAC_L_HPMIX_WORK | RK3308_DAC_R_HPMIX_WORK) instead of 0 as the
value argument, leaving HPMIX unmuted and in WORK state across power-down.

> +		regmap_update_bits(rk3308->regmap, RK3308_DAC_ANA_CON05,
> +				   RK3308_DAC_x_HPOUT_GAIN_MSK, gain_l);
> +		regmap_update_bits(rk3308->regmap, RK3308_DAC_ANA_CON06,
> +				   RK3308_DAC_x_HPOUT_GAIN_MSK, gain_r);
> +		rk3308_codec_resync_adcs(rk3308);
> +		/* Preserve ALSA switches while the analog output stages are off. */
> +		regmap_update_bits(rk3308->regmap, RK3308_DAC_ANA_CON03,
> +				   RK3308_DAC_L_HPOUT_UNMUTE | RK3308_DAC_R_HPOUT_UNMUTE,
> +			hp & (RK3308_DAC_L_HPOUT_UNMUTE | RK3308_DAC_R_HPOUT_UNMUTE));
> +		regmap_update_bits(rk3308->regmap, RK3308_DAC_ANA_CON04,
> +				   line_unmute, line & line_unmute);
> +	}
> =20
>  	return 0;
>  }
> =20
> +static int rk3308_codec_adc_event(struct snd_soc_dapm_widget *w,
> +				  struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component =3D snd_soc_dapm_to_component(w->da=
pm);
> +	struct rk3308_codec_priv *rk3308 =3D snd_soc_component_get_drvdata(comp=
onent);
> +	unsigned int grp =3D w->shift;
> +	unsigned int zerocross;
> +
> +	if (event =3D=3D SND_SOC_DAPM_PRE_PMU) {
> +		regmap_update_bits(rk3308->regmap, RK3308_ADC_ANA_CON07(grp),
> +				   RK3308_ADC_CH1_IN_SEL_MSK | RK3308_ADC_CH2_IN_SEL_MSK,
> +				   RK3308_ADC_CH1_IN_MIC | RK3308_ADC_CH2_IN_MIC);
> +		regmap_set_bits(rk3308->regmap, RK3308_ADC_ANA_CON00(grp),
> +				RK3308_ADC_CH1_MIC_UNMUTE | RK3308_ADC_CH2_MIC_UNMUTE);

[Severity: Medium]
Doesn't setting RK3308_ADC_CH1_MIC_UNMUTE | RK3308_ADC_CH2_MIC_UNMUTE in
rk3308_codec_adc_event() on SND_SOC_DAPM_PRE_PMU overwrite the user's
MIC1..MIC8 Capture Switch settings?

In rk3308_codec_controls[], MIC1 Capture Switch through MIC8 Capture Switch
are backed by bits 3 (RK3308_ADC_CH1_MIC_UNMUTE) and 7
(RK3308_ADC_CH2_MIC_UNMUTE) of RK3308_ADC_ANA_CON00(0..3), and
rk3308_codec_initialize() already sets BIT(3) | BIT(7) once after reset so
those controls remain adjustable. Unconditionally setting those bits on eve=
ry
SND_SOC_DAPM_PRE_PMU in rk3308_codec_adc_event() forces any muted microphone
channels back to unmuted whenever capture starts.

[ ... ]

> +/* Output-only route changes must not restart the shared DAC analog supp=
ly. */
> +static int rk3308_codec_output_event(struct snd_soc_dapm_widget *w,
> +				     bool hp, int event)
> +{
> +	struct snd_soc_component *component =3D snd_soc_dapm_to_component(w->da=
pm);
> +	struct rk3308_codec_priv *rk3308 =3D snd_soc_component_get_drvdata(comp=
onent);
> +	unsigned int shift =3D hp ? w->shift - 1 : w->shift;
> +	unsigned int reg =3D hp ? RK3308_DAC_ANA_CON03 : RK3308_DAC_ANA_CON04;
> +	unsigned int mask =3D (hp ? (RK3308_DAC_L_HPOUT_EN | RK3308_DAC_L_HPOUT=
_WORK) :
> +			     RK3308_DAC_L_LINEOUT_EN) << shift;
> =20
> -	if (rk3308->codec_ver !=3D ACODEC_VERSION_B)
> +	if (!rk3308->dac_analog)
>  		return 0;
> =20
> -	switch (event) {
> -	case SND_SOC_DAPM_POST_PMU:
> -		val =3D RK3308_DAC_L_SEL_LINEOUT_FROM_INTERNAL << w->shift;
> -		break;
> -	case SND_SOC_DAPM_POST_PMD:
> -		val =3D RK3308_DAC_L_SEL_DC_FROM_INTERNAL << w->shift;
> -		break;
> -	default:
> +	/*
> +	 * ASoC computes widget new_power before running DAPM events.
> +	 * If the shared supply is also going down, its shutdown event runs
> +	 * the complete vendor disable sequence. Recheck this ordering when
> +	 * updating the ASoC core.
> +	 */
> +	if (event =3D=3D SND_SOC_DAPM_PRE_PMD && !rk3308->dac_analog->new_power)
>  		return 0;
> +	if (event =3D=3D SND_SOC_DAPM_PRE_PMU) {
> +		if (hp) {
> +			rk3308_codec_analog_update(rk3308, RK3308_DAC_ANA_CON01,
> +						   RK3308_DAC_HPOUT_POP_SOUND_x_MSK << shift,
> +						   RK3308_DAC_HPOUT_POP_SOUND_x_WORK << shift);
> +			rk3308_codec_analog_update(rk3308, reg,
> +						   RK3308_DAC_L_HPOUT_EN << shift,
> +				RK3308_DAC_L_HPOUT_EN << shift);
> +		}
> +		rk3308_codec_analog_update(rk3308, reg,
> +					   hp ? RK3308_DAC_L_HPOUT_WORK << shift : mask,
> +					   hp ? RK3308_DAC_L_HPOUT_WORK << shift : mask);
> +	} else {
> +		if (hp)
> +			rk3308_codec_analog_update(rk3308, reg, RK3308_DAC_L_HPOUT_EN << shif=
t, 0);
> +		rk3308_codec_analog_update(rk3308, reg,
> +					   hp ? RK3308_DAC_L_HPOUT_WORK << shift : mask, 0);
> +		if (hp)
> +			rk3308_codec_analog_update(rk3308, RK3308_DAC_ANA_CON01,
> +						   RK3308_DAC_HPOUT_POP_SOUND_x_MSK << shift, 0);
>  	}

[Severity: Medium]
In rk3308_codec_output_event(), why is 0 written to
RK3308_DAC_HPOUT_POP_SOUND_x_MSK << shift on SND_SOC_DAPM_PRE_PMD instead of
RK3308_DAC_HPOUT_POP_SOUND_x_INIT << shift (0x1 << shift) as in
rk3308_codec_dac_event() and rk3308_codec_set_bias_level()?

Also, on playback power-up, DAC_CURRENT_EN (snd_soc_dapm_supply) runs
rk3308_codec_dac_event(SND_SOC_DAPM_PRE_PMU) and sets rk3308->dac_analog =
=3D w
before the L/R_HPOUT_EN and L/R_LINEOUT_EN (snd_soc_dapm_out_drv) widgets
run rk3308_codec_output_event(SND_SOC_DAPM_PRE_PMU). Because there is no
SND_SOC_DAPM_PRE_PMU check corresponding to the SND_SOC_DAPM_PRE_PMD check,
rk3308_codec_output_event() re-executes these output register writes and
delays after rk3308_codec_dac_event() has already completed the full enable
sequence and headphone gain ramp.

[ ... ]

> @@ -400,33 +1027,116 @@ static const struct snd_soc_dapm_widget rk3308_co=
dec_dapm_widgets[] =3D {
> =20
>  	SND_SOC_DAPM_SUPPLY("DAC_BUF_REF_L", RK3308_DAC_ANA_CON01, 2, 0, NULL, =
0),
>  	SND_SOC_DAPM_SUPPLY("DAC_BUF_REF_R", RK3308_DAC_ANA_CON01, 6, 0, NULL, =
0),
> -	SND_SOC_DAPM_OUT_DRV_E("HPOUT_POP_SOUND_L", SND_SOC_NOPM, 0, 0, NULL, 0,
> -			       rk3308_codec_pop_sound_set,
> -			       SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
> -	SND_SOC_DAPM_OUT_DRV_E("HPOUT_POP_SOUND_R", SND_SOC_NOPM, 4, 0, NULL, 0,
> -			       rk3308_codec_pop_sound_set,
> -			       SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
> -	SND_SOC_DAPM_SUPPLY("DAC_OUTPUT_VCM", SND_SOC_NOPM, 0, 0,
> -			    rk3308_codec_dac_output_vcm_event,
> -			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
> -			    SND_SOC_DAPM_POST_PMD),
> -	SND_SOC_DAPM_OUT_DRV("L_HPOUT_EN", RK3308_DAC_ANA_CON03, 1, 0, NULL, 0),
> -	SND_SOC_DAPM_OUT_DRV("R_HPOUT_EN", RK3308_DAC_ANA_CON03, 5, 0, NULL, 0),
> -	SND_SOC_DAPM_OUT_DRV("L_HPOUT_WORK", RK3308_DAC_ANA_CON03, 2, 0, NULL, =
0),
> -	SND_SOC_DAPM_OUT_DRV("R_HPOUT_WORK", RK3308_DAC_ANA_CON03, 6, 0, NULL, =
0),
> +	{
> +		.id =3D snd_soc_dapm_out_drv, .name =3D "L_HPOUT_EN",
> +		SND_SOC_DAPM_INIT_REG_VAL(SND_SOC_NOPM, 1, 0),
> +		.subseq =3D 1, /* Enable HPOUT after the HPMIX output drivers. */
> +		.event =3D rk3308_codec_hpout_event,
> +		.event_flags =3D SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_PRE_PMD,
> +	},
> +	{
> +		.id =3D snd_soc_dapm_out_drv, .name =3D "R_HPOUT_EN",
> +		SND_SOC_DAPM_INIT_REG_VAL(SND_SOC_NOPM, 5, 0),
> +		.subseq =3D 1, /* Enable HPOUT after the HPMIX output drivers. */
> +		.event =3D rk3308_codec_hpout_event,
> +		.event_flags =3D SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_PRE_PMD,
> +	},

[Severity: Medium]
Does setting .subseq =3D 1 on L_HPOUT_EN and R_HPOUT_EN invert the power
ordering relative to machine SND_SOC_DAPM_HP widgets?

In sound/soc/soc-dapm.c, snd_soc_dapm_out_drv and snd_soc_dapm_hp have the
same sequence priority in both dapm_up_seq and dapm_down_seq, so
dapm_seq_compare() orders them by subseq (ascending on power-up, descending
on power-down). Meanwhile, rk3308_codec_add_widgets() converts the HPMIX
output drivers into SND_SOC_NOPM widgets with no events.

With .subseq =3D 1 on L_HPOUT_EN and R_HPOUT_EN, a machine SND_SOC_DAPM_HP
widget (subseq 0) powers up before rk3308_codec_hpout_event() enables the
codec HPOUT stage, and powers down after rk3308_codec_hpout_event() disables
the codec HPOUT stage when switching output routes.

[ ... ]

> +static int rk3308_codec_add_widgets(struct snd_soc_component *component)
> +{
> +	struct snd_soc_dapm_widget *widgets;
> +	int i, grp, ret;
> +
> +	widgets =3D devm_kmemdup(component->dev, rk3308_codec_dapm_widgets,
> +			       sizeof(rk3308_codec_dapm_widgets), GFP_KERNEL);
> +	if (!widgets)
> +		return -ENOMEM;

[Severity: Medium]
Does rk3308_codec_add_widgets() leak the widgets array allocated with
devm_kmemdup()?

snd_soc_dapm_new_controls() duplicates each widget via dapm_cnew_widget() a=
nd
does not keep the caller's template array. Because rk3308_codec_add_widgets=
()
is called from rk3308_codec_probe() (the ASoC component probe callback) and
allocates widgets on component->dev with devm_kmemdup(), the temporary array
is kept for the lifetime of the platform device and an additional copy is
allocated on every card unbind/rebind or probe retry cycle.

> +	for (i =3D 0; i < ARRAY_SIZE(rk3308_codec_dapm_widgets); i++) {
> +		struct snd_soc_dapm_widget *w =3D &widgets[i];
> +		unsigned int reg =3D w->reg;
> +
> +		if (reg >=3D RK3308_DAC_ANA_CON00 && reg <=3D RK3308_DAC_ANA_CON13) {
> +			w->reg =3D SND_SOC_NOPM;
> +			if (reg =3D=3D RK3308_DAC_ANA_CON04)
> +				w->event_flags =3D SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_PRE_PMD;
> +			if (reg =3D=3D RK3308_DAC_ANA_CON00) {
> +				w->subseq =3D 1;
> +				w->event =3D rk3308_codec_dac_event;
> +				w->event_flags =3D SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD;
> +			}
> +		}
> +		for (grp =3D 0; grp < ADC_LR_GROUP_MAX; grp++) {
> +			if (reg =3D=3D RK3308_ADC_ANA_CON00(grp) ||
> +			    reg =3D=3D RK3308_ADC_ANA_CON02(grp) ||
> +			    reg =3D=3D RK3308_ADC_ANA_CON05(grp))
> +				w->reg =3D SND_SOC_NOPM;

[Severity: Medium]
Should RK3308_ADC_ANA_CON07(0) (used by CH1_IN_SEL and CH2_IN_SEL) also be
converted to SND_SOC_NOPM here?

CH1_IN_SEL and CH2_IN_SEL are defined in rk3308_codec_dapm_widgets[] as
SND_SOC_DAPM_PGA widgets backed by RK3308_ADC_ANA_CON07(0) shifts 4 and 6,
while rk3308_codec_initialize() and rk3308_codec_adc_event() also program
RK3308_ADC_CH1_IN_MIC | RK3308_ADC_CH2_IN_MIC in RK3308_ADC_ANA_CON07(grp).

Because CH1_IN_SEL and CH2_IN_SEL keep w->reg =3D RK3308_ADC_ANA_CON07(0):
1. During card instantiation, snd_soc_dapm_new_widgets() sees bits 4 and 6
   set by rk3308_codec_initialize() on the unpowered PGA widgets and clears
   them back to 0.
2. On capture stop, CH1_IN_SEL and CH2_IN_SEL (snd_soc_dapm_pga,
   dapm_down_seq =3D 6) clear bits 4 and 6 in RK3308_ADC_ANA_CON07(0) while=
 the
   ADC, ALC, and MIC stages are still enabled and in WORK mode, before
   ADC_CURRENT_EN12 (snd_soc_dapm_supply, dapm_down_seq =3D 14) runs
   rk3308_codec_adc_event(SND_SOC_DAPM_POST_PMD).

[ ... ]

> @@ -775,6 +1480,24 @@ static int rk3308_codec_hw_params(struct snd_pcm_su=
bstream *substream,
>  		rk3308_codec_adc_dig_config(rk3308, params);
>  }
> =20
> +static int rk3308_codec_mute_stream(struct snd_soc_dai *dai, int mute, i=
nt stream)
> +{
> +	struct rk3308_codec_priv *rk3308 =3D snd_soc_component_get_drvdata(dai-=
>component);
> +	int gain;
> +
> +	if (rk3308->codec_ver > ACODEC_VERSION_B || stream !=3D SNDRV_PCM_STREA=
M_PLAYBACK)
> +		return 0;
> +	mutex_lock(&rk3308->io_lock);
> +	for (gain =3D mute ? 2 : 7; mute ? gain <=3D 7 : gain >=3D 2; gain +=3D=
 mute ? 1 : -1) {
> +		regmap_update_bits(rk3308->regmap, RK3308_DAC_DIG_CON04,
> +				   RK3308_DAC_CIC_IF_GAIN_MSK, gain);
> +		usleep_range(200, 300);
> +	}
> +	mutex_unlock(&rk3308->io_lock);
> +
> +	return 0;
> +}

[Severity: Medium]
Can acquiring rk3308->io_lock in rk3308_codec_mute_stream() cause a lock
inversion against card->dapm_mutex?

rk3308_codec_output_put(), rk3308_codec_hpdet_work(), and
rk3308_codec_set_jack() acquire rk3308->io_lock and then acquire
card->dapm_mutex via snd_soc_dapm_add_routes(), snd_soc_dapm_del_routes(),
snd_soc_jack_report(), snd_soc_dapm_sync(), and snd_soc_dapm_mutex_lock().
However, ASoC can invoke .mute_stream() via dapm_dai_link_event() ->
snd_soc_dai_digital_mute() while card->dapm_mutex is already held, inverting
the lock order to dapm_mutex -> io_lock.

[ ... ]

> @@ -853,89 +1577,143 @@ static int rk3308_codec_initialize(struct rk3308_=
codec_priv *rk3308)

[ ... ]

>  	/* recover DAC digital gain to 0 dB (reset value is 0xff, undocumented)=
 */
>  	if (rk3308->codec_ver =3D=3D ACODEC_VERSION_C)
>  		regmap_write(rk3308->regmap, RK3308_DAC_DIG_CON04,
>  			     RK3308BS_DAC_DIG_GAIN_0DB);
> =20
> -	/*
> -	 * Unconditionally enable zero-cross detection (needed for AGC,
> -	 * harmless without AGC)
> -	 */
> -	for (grp =3D 0; grp < ADC_LR_GROUP_MAX; grp++)
> -		regmap_set_bits(rk3308->regmap, RK3308_ADC_ANA_CON02(grp),
> -				RK3308_ADC_CH1_ZEROCROSS_DET_EN |
> -				RK3308_ADC_CH2_ZEROCROSS_DET_EN);
> -
>  	return 0;
>  }

[Severity: Medium]
Was removing the RK3308_ADC_CH1_ZEROCROSS_DET_EN |
RK3308_ADC_CH2_ZEROCROSS_DET_EN initialization from rk3308_codec_initialize=
()
intentional?

Nothing else in the driver sets RK3308_ADC_CH1_ZEROCROSS_DET_EN or
RK3308_ADC_CH2_ZEROCROSS_DET_EN after rk3308_codec_reset() zeroes
RK3308_ADC_ANA_CON02(grp). Consequently, zero-cross detection remains
disabled on all ADC channels, and the code in rk3308_codec_adc_event() that
saves, clears, and restores those bits during SND_SOC_DAPM_POST_PMD always
reads and restores 0.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261101044149.2018=
744-1-zhengxing@rock-chips.com?part=3D2
