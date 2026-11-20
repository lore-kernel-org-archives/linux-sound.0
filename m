Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795163127;
	b=tlrRTLvYeHAYLDagIXske6LUYg0jnUb3CQrXdhDXLWBUmF0vTpzILPzWZDM/AH/y5vbR
	 CFyJ3pj58pW7RFwp61hu9etgL/iVyygVFXHrbIbxolAK7VpUHoMxBqKhv8G6bs241b5Tj
	 uDILDmccBWX9bRIGlB2Km1M4EdgXpkL5QTyuSVuh9s5l1Ion8Jr2uSoj1Ihysz64drx39
	 4xcLvfm1wSZbjj7x+nh/VK2fejS5LMCKlvmXgL5QXz8AG7n0PmE7zHslIXecFui9M/yHi
	 WAhdKiR77tucCBH2BmMyP6yeqK/p5UoUJE6qMpjQC7gJns+MNaOsRTNYh1qxJexes6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795163127;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=FJqVNbyQkEwDTnRT0WwSb+isbgQVRuQIqmA6ctbMWZ8=;
	b=YCUkBmFQvLystocZ/unugK0+BRaRgMhifNARr8IDN1VRbyKbrm8jkBb761ArGIO5fpDT
	 XjDxBqx9ZbjupKhw2oHuFkkiyG+A7GN25/Frk2eTLpzZRzxIhdhwsLSe0FXGDwleNhowI
	 GvGv3tXT4lH+VC+SHNhPs0JUzYann6X/Ni3EPb7xLVp4Sd8Bxdtgyc7xpSPUScxUjodrN
	 kewp1Bksqj48eGfbg4TjT3Y17pnmdCGNj5ublUVOl2qAkSih5GRFHOW9bH9yC+bMeVcDX
	 ZZHlnN8itwQXFYVb3uobHP23UbwgOlmvzwTtW4lKB6riWydrxNrGyiqLWonROZbjY+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bEYVa6ty;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21949606A32C
	for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 08:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bEYVa6ty
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D45461F000CA;
	Fri, 20 Nov 2026 08:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795163127;
	bh=FJqVNbyQkEwDTnRT0WwSb+isbgQVRuQIqmA6ctbMWZ8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bEYVa6ty3RDagvaqMVHwKsNA7iwHgb2x8BfdARO0hrGlCUf/rxwa8HXkZV7q6EuiP
	 MDC3SG5ioBQMWPNbhCfIhUH2WUPIaDVrbSXc2lDtCkk4uaf0QZYHV9jGRVKWjc3FM5
	 3XTu0LR0HHNMhQKteyPfXsTZEBuuSQHD2+bwXEQEYnJ9T5xocVTZiQdKQztuUUNjXN
	 /rdwEsWjICPUxWrvnP2fwqbdvay1XS+LsMABgWNGcyCuk3cX7dDgkUIEwFYg+btAT2
	 uyYsYY7HKyc+uvyyqafG5NQUr2KGKgEnEI1ilUhdPz/l+DsYfMhTHpDRaVDE064VD8
	 gdh3woPhzj4Ug==
Message-ID: <sashiko-outbox-224726@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] ASoC: wm8731: power the converters together,
 activate the interface last
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rafael Diniz" <rafael@riseup.net>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261120080825.2078162-1-rafael@riseup.net>
References: <20261120080825.2078162-1-rafael@riseup.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 08:25:26 +0000
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
- [High] ASoC: wm8731: false -EBUSY in wm8731_hw_params() when ACTIVE
  stays set
- [High] ASoC: wm8731: wm8731_interface_event() skipped on non-stream
  DAPM updates
- [Medium] ASoC: wm8731: ACTIVE stuck on in wm8731_interface_event()
  with Line Bypass
--

commit 1764fc73f40875ea1116cd822b76a8d9be453ab5
Author: Rafael Diniz <rafael@riseup.net>

ASoC: wm8731: power the converters together, activate the interface last

This commit groups the ADC, DAC, and line input power controls under a
single Converters DAPM supply widget, activates the digital audio interface
from a DAPM post widget after powering up the converters, and rejects rate
or word-length changes in wm8731_hw_params() while the interface is active.

Link: https://github.com/raspberrypi/linux/issues/7776

> diff --git a/sound/soc/codecs/wm8731.c b/sound/soc/codecs/wm8731.c
> index f25b50919a9a5..1a983ad43f174 100644
> --- a/sound/soc/codecs/wm8731.c
> +++ b/sound/soc/codecs/wm8731.c
> @@ -167,20 +167,76 @@ SOC_DAPM_SINGLE("HiFi Playback Switch", WM8731_APAN=
A, 4, 1, 0),
>  static const struct snd_kcontrol_new wm8731_input_mux_controls =3D
>  SOC_DAPM_ENUM("Input Select", wm8731_insel_enum);
> =20
> +/*
> + * The datasheet's power-up sequence powers the converters, sets the oth=
er
> + * registers and activates the digital audio interface last.  With the
> + * codec as clock provider at 96 kHz (12 MHz crystal, USB mode), powering
> + * the ADC up while the interface was already active left it, about one
> + * time in four, delivering its DC offset and noise but no signal, until=
 the
> + * interface was deactivated and activated again.  As DAPM widgets of th=
eir
> + * own, ACTIVE (a supply) was set ahead of the ADC on every capture star=
t,
> + * and a capture starting next to a running playback powered the ADC up
> + * under an active interface.
> + *
> + * So the ADC, DAC and line input are powered together, by one supply, w=
ith
> + * the interface inactive; the interface is activated once a stream's
> + * widgets are all up and deactivated before the converters go down.  A
> + * second stream finds both converters powered and the interface left as=
 it
> + * is.
> + */
> +#define WM8731_PWR_CONVERTERS (WM8731_PWR_LINEINPD | WM8731_PWR_ADCPD | =
WM8731_PWR_DACPD)
> +
> +static int wm8731_converters_event(struct snd_soc_dapm_widget *w,
> +				   struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component =3D snd_soc_dapm_to_component(w->da=
pm);
> +
> +	snd_soc_component_update_bits(component, WM8731_ACTIVE,
> +				      WM8731_ACTIVE_ACTIVE, 0);
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_PRE_PMU:
> +		snd_soc_component_update_bits(component, WM8731_PWR,
> +					      WM8731_PWR_CONVERTERS, 0);
> +		break;
> +	case SND_SOC_DAPM_PRE_PMD:
> +		snd_soc_component_update_bits(component, WM8731_PWR,
> +					      WM8731_PWR_CONVERTERS,
> +					      WM8731_PWR_CONVERTERS);
> +		break;
> +	}
> +	return 0;
> +}
> +
> +static int wm8731_interface_event(struct snd_soc_dapm_widget *w,
> +				  struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component =3D snd_soc_dapm_to_component(w->da=
pm);
> +	unsigned int pwr =3D snd_soc_component_read(component, WM8731_PWR);
> +
> +	if (event =3D=3D SND_SOC_DAPM_POST_PMU && !(pwr & WM8731_PWR_CONVERTERS=
))
> +		snd_soc_component_update_bits(component, WM8731_ACTIVE,
> +					      WM8731_ACTIVE_ACTIVE,
> +					      WM8731_ACTIVE_ACTIVE);
> +	return 0;
> +}
> +
>  static const struct snd_soc_dapm_widget wm8731_dapm_widgets[] =3D {
> -SND_SOC_DAPM_SUPPLY("ACTIVE",WM8731_ACTIVE, 0, 0, NULL, 0),
> +SND_SOC_DAPM_POST("Interface", wm8731_interface_event),
>  SND_SOC_DAPM_SUPPLY("OSC", WM8731_PWR, 5, 1, NULL, 0),
> +SND_SOC_DAPM_SUPPLY("Converters", SND_SOC_NOPM, 0, 0, wm8731_converters_=
event,
> +		    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_PRE_PMD),

[Severity: High]
Does using SND_SOC_DAPM_POST for Interface leave WM8731_ACTIVE_ACTIVE
cleared when Converters powers up from a mixer update while a stream is
already running?

In dapm_seq_run(), snd_soc_dapm_post widgets only run when the DAPM event
is SND_SOC_DAPM_STREAM_START or SND_SOC_DAPM_STREAM_STOP:

sound/soc/soc-dapm.c:dapm_seq_run() {
    ...
		case snd_soc_dapm_post:
			if (!w->event)
				continue;

			if (event =3D=3D SND_SOC_DAPM_STREAM_START)
				ret =3D w->event(w,
					       NULL, SND_SOC_DAPM_POST_PMU);
			else if (event =3D=3D SND_SOC_DAPM_STREAM_STOP)
				ret =3D w->event(w,
					       NULL, SND_SOC_DAPM_POST_PMD);
			break;
    ...
}

Output Mixer HiFi Playback Switch defaults to off, so starting playback
before enabling that switch leaves DAC and Converters powered down during
SND_SOC_DAPM_STREAM_START.  When HiFi Playback Switch is then turned on
(or toggled off and back on during playback), dapm_mixer_update_power()
runs with SND_SOC_DAPM_STREAM_NOP: wm8731_converters_event() clears
WM8731_ACTIVE_ACTIVE and powers up Converters, but wm8731_interface_event()
is never called, leaving the digital audio interface inactive for the
running stream.

[ ... ]

> @@ -199,8 +255,9 @@ static int wm8731_check_osc(struct snd_soc_dapm_widge=
t *source,
>  static const struct snd_soc_dapm_route wm8731_intercon[] =3D {
>  	{"DAC", NULL, "OSC", wm8731_check_osc},
>  	{"ADC", NULL, "OSC", wm8731_check_osc},
> -	{"DAC", NULL, "ACTIVE"},
> -	{"ADC", NULL, "ACTIVE"},
> +	{"DAC", NULL, "Converters"},
> +	{"ADC", NULL, "Converters"},
> +	{"Line Input", NULL, "Converters"},

[Severity: Medium]
Can routing Line Input through Converters leave WM8731_ACTIVE_ACTIVE stuck
on after all PCM streams stop when Line Bypass Switch is enabled?

When Output Mixer Line Bypass Switch is on, the analog path from
LLINEIN/RLINEIN through Line Input and Output Mixer to the outputs keeps
Converters powered even without an active PCM stream.  Starting a PCM
stream sets WM8731_ACTIVE_ACTIVE in wm8731_interface_event(), but stopping
that stream does not power down Converters, and wm8731_interface_event()
does nothing on SND_SOC_DAPM_POST_PMD.  WM8731_ACTIVE_ACTIVE therefore
stays set after the stream stops, leaving the digital interface active and
causing subsequent wm8731_hw_params() calls with a different rate or bit
width to fail with -EBUSY.

> @@ -339,8 +392,25 @@ static int wm8731_hw_params(struct snd_pcm_substream=
 *substream,
>  		break;
>  	}
> =20
> -	wm8731_set_deemph(component);
> +	/*
> +	 * One sample rate and word length serve both directions.  While the
> +	 * interface is active (the other direction running) its clocking is
> +	 * not rewritten: the same settings are kept, others are refused.
> +	 */
> +	if (snd_soc_component_read(component, WM8731_ACTIVE) & WM8731_ACTIVE_AC=
TIVE) {
> +		if (snd_soc_component_read(component, WM8731_SRATE) !=3D srate ||
> +		    snd_soc_component_read(component, WM8731_IFACE) !=3D iface) {
> +			dev_err(component->dev,
> +				"interface active at other settings: %d Hz, %d bits refused\n",
> +				params_rate(params), params_width(params));
> +			return -EBUSY;
> +		}
> +		return 0;
> +	}

[Severity: High]
Will checking WM8731_ACTIVE_ACTIVE in wm8731_hw_params() reject valid rate
or bit-width changes with -EBUSY after a playback stream closes?

soc_component_dev_wm8731 sets .use_pmdown_time =3D 1, so closing a playback
stream does not run SND_SOC_DAPM_STREAM_STOP immediately; instead,
snd_soc_dapm_stream_stop() queues rtd->delayed_work for pmdown_time (5
seconds by default).  During that window, Converters stays powered and
WM8731_ACTIVE_ACTIVE remains set, so opening any playback or capture stream
with a different sample rate or format within 5 seconds fails in
wm8731_hw_params() with -EBUSY even though no stream is running.
Reconfiguring hw_params on a single prepared or stopped substream before
hw_free hits the same check against its own active state.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120080825.2078=
162-1-rafael@riseup.net?part=3D1
