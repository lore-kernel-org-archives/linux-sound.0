Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794070106;
	b=g+ELqs/mveLwhe5ek7zpPjfsQHUzdTmaNmvJlnS/zkdBPqJLMjvhjbfzklejEQG106Nc
	 lESilcvEbNigmor5VCvkmGnUazvFuY0khKHCPnXAKqB4bh6MG/THF+JzbRbXW2KUGsdTt
	 mWnn4xxLxO/B9auS35oBxKfKGmhxAzJtewZX1RyVLFC/jeTaz3udHSbStN2fgCYF7NWws
	 TM+MOErcDLEDo4JSDvVkP/eigfj7OjR5rvJo4PbhOdzKojN9aU/9rbjkIgldMyC89Kkxp
	 c9Tig3BKB8ppK4s0KzhEZhmpu5Dm0IKTDN1X+DMBRcIzEgRGOowMTw/jlNCelE++rzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794070106;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=H/IZX/OvvpXXqAWNub6rqE5ud5cAoGtBQIfGdTk9PdI=;
	b=DUaj6XdTSSM+z1sumAevbAMvifa/4JOlmlsbqs1HAUKEiyfnKIwD51UKeklS9kQ0J1ak
	 j4IgARYrEeNqRDhxB/VgOThdSuSKoK4m9UHI19QtGJ0dXHlnogVprk0kCzTCfH9DUJfC/
	 ds+lyY1xkzQFwuDUK/IVe+ZoOJbrBeSZkJVjxqRDtWezYWhztO9xQMrOobaAKstD7ry8w
	 iWqfwiuHsIPuQaTzKJQvQ1C9WYv05M9msyu7sm/wCUHB9b2TQXcchukDwbSgPUsbDaC5J
	 bV616QV9ZUi0c3V9jIX6Lrnhi83FiqmOR1izu7MUln72dMyY/BP+SYxoIoDENvMXQ7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=idwVmLIc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904BE606A32D
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 16:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=idwVmLIc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10C601F0089F;
	Sat,  7 Nov 2026 16:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794070106;
	bh=H/IZX/OvvpXXqAWNub6rqE5ud5cAoGtBQIfGdTk9PdI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=idwVmLIc6rtzn88rHFBg9SPlQB9IWX1CZ+C7ebzYZY28DgclWtYZNzKYBNJQKClNx
	 JVsxBDySVsRYakOmBK1majAI5knBG5Eus1VsMcz+RGbA79LFEW+9+cHtzZuzMY4fgh
	 GJ2B3htK3ETr+2qyNoYR8kmgExvSnqeZMMSffJwi+j8JHEdhwqEiNzWpk2TuMY0HhN
	 eKsbdTyv22FJfzGEE/Pq2dDnOvSzS/H11xc6dBYF776Vn3svnzCroMLg4fApZNIiQ0
	 x3YfI4pZ8DzRWLrELcBGjsKqNrlDZEZYweN7CK+4li7RxuGRajkaARweBAABCYl8yy
	 VDt6w1/lakq8Q==
Message-ID: <sashiko-outbox-203074@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ASoC: rt5659: fix teardown order and stale state across
 card rebind
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tristan Madani" <tristmd@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261107162341.1494240-1-tristmd@gmail.com>
References: <20261107162341.1494240-1-tristmd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 16:48:25 +0000
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
- [Medium] ASoC: rt5659: rt5659_remove() breaks HDA header mic detect on
  rebind
- [Medium] ASoC: rt5659: rt5659_remove() desynchronizes HDA IRQ polarity
  cache
--

commit b7c86ad3bd52c1cf96525f2f34febf94cfef4a2d
Author: Tristan Madani <tristan@talencesecurity.com>

ASoC: rt5659: fix teardown order and stale state across card rebind

This commit resets component and jack state on removal, marks and resyncs
the regmap cache across card rebind, and registers a devm action to
disable the IRQ and cancel jack detection work on I2C teardown.

> diff --git a/sound/soc/codecs/rt5659.c b/sound/soc/codecs/rt5659.c
> index 68f7d5673e190..14111f40384e5 100644
> --- a/sound/soc/codecs/rt5659.c
> +++ b/sound/soc/codecs/rt5659.c

[ ... ]

> @@ -3689,17 +3701,26 @@ static int rt5659_probe(struct snd_soc_component =
*component)
>  static void rt5659_remove(struct snd_soc_component *component)
>  {
>  	struct rt5659_priv *rt5659 =3D snd_soc_component_get_drvdata(component);
> -	struct i2c_client *i2c =3D to_i2c_client(component->dev);
> =20
>  	if (rt5659->irq_acquired) {
> -		disable_irq(i2c->irq);
> +		disable_irq(rt5659->i2c->irq);
>  		rt5659->irq_disabled =3D true;
>  	}
> =20
>  	if (rt5659->jack_detect_work_inited)
>  		cancel_delayed_work_sync(&rt5659->jack_detect_work);
> =20
> +	if (rt5659->jack_type)
> +		rt5659_headset_detect(component, 0);

[Severity: Medium]
Should this call to rt5659_headset_detect() be guarded by checking that
rt5659->pdata.jd_src is RT5659_JD3?

When jd_src is RT5659_JD_HDA_HEADER, rt5659_probe() skips registering
rt5659_particular_dapm_widgets ("Mic Det Power"), and
rt5659_intel_hd_header_probe_setup() enables RT5659_4BTN_IL_EN and
RT5659_IL_IRQ_EN once during I2C probe.  If both headphone and microphone
are plugged into the HDA header on removal, rt5659->jack_type equals
SND_JACK_HEADSET, so rt5659_headset_detect(component, 0) logs an unknown
DAPM pin error for "Mic Det Power" and calls
rt5659_enable_push_button_irq(component, false), clearing
RT5659_4BTN_IL_EN and RT5659_IL_IRQ_EN in the regmap cache.  On card
rebind, regcache_sync() writes those cleared bits to the codec without
re-running rt5659_intel_hd_header_probe_setup(), leaving HDA header
microphone detection disabled.

> +
> +	rt5659->hs_jack =3D NULL;
> +	rt5659->jack_type =3D 0;
> +	rt5659->hda_hp_plugged =3D false;
> +	rt5659->hda_mic_plugged =3D false;
> +	rt5659->component =3D NULL;
> +
>  	regmap_write(rt5659->regmap, RT5659_RESET, 0);
> +	regcache_mark_dirty(rt5659->regmap);
>  }

[Severity: Medium]
Does resetting hda_hp_plugged and hda_mic_plugged to false without
updating RT5659_IRQ_CTRL_1 and RT5659_IRQ_CTRL_2 leave the cached HDA IRQ
polarity inverted after rebind?

In rt5659_jack_detect_intel_hd_header(), plugging in a jack flips the IRQ
polarity bits in RT5659_IRQ_CTRL_1 (bit 0x10 to 0x0) and
RT5659_IRQ_CTRL_2 (bit 0x2 to 0x2):

sound/soc/codecs/rt5659.c:rt5659_jack_detect_intel_hd_header() {
	...
	if (hp_flag !=3D rt5659->hda_hp_plugged) {
		rt5659->hda_hp_plugged =3D hp_flag;

		if (hp_flag) {
			regmap_update_bits(rt5659->regmap, RT5659_IRQ_CTRL_1,
				0x10, 0x0);
			rt5659->jack_type |=3D SND_JACK_HEADPHONE;
		} else {
			regmap_update_bits(rt5659->regmap, RT5659_IRQ_CTRL_1,
				0x10, 0x10);
	...
}

Because the regmap cache retains the plugged-in polarity across
RT5659_RESET, regcache_sync() in rt5659_probe() restores that plugged-in
polarity to the hardware while hda_hp_plugged and hda_mic_plugged are
false.  If a jack is unplugged while the card is unbound,
hp_flag !=3D rt5659->hda_hp_plugged (or mic_flag !=3D rt5659->hda_mic_plugg=
ed)
evaluates to false, so the polarity is never restored to the unplugged
state and subsequent plug insertions will not generate an interrupt.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107162341.1494=
240-1-tristmd@gmail.com?part=3D1
