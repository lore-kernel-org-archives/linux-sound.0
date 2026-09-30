Received: from mail-pz2-f36.google.com (mail-pz2-f36.google.com [74.125.228.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875A13B3C17
	for <linux-sound@vger.kernel.org>; Wed, 30 Sep 2026 07:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790753794; cv=none; b=uJLNp09O6VMB44Jl9C4JIWCjhPlume+QIVLjOtiV1WpIHH3JQJy2Gbxzgtb/TGbUUdTgHieDBN6vWGCXj6IUBmyzjJTerU4MCwP3QSTaJyNa8wU8i72JS/2X2HhX2KcK9I/2wuAXlzC10Mb+ZnjiF8mLberAb2L0qqaIYqPaMWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790753794; c=relaxed/simple;
	bh=IdSAxfgzIsA5UVG0b3AAedLhYXOcEtjTR/fFSjPyySs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fhcSffLW+8WaAq5Iu0G+zoGxktgsqJiCJIJJbQhbry4ovm+zWTIKNUW+MMPT8mjkxt+B6meBJKVGxYl/M/rgeCdjbx+TeCYqYjdKrMt11V9/4NEfJGKt2REdJsMFMtwRXovoVOB1xLqS39I0bbWH1RY3MPttW4GZ7ZH78CvvRz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DN1EFrqp; arc=none smtp.client-ip=74.125.228.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DN1EFrqp"
Received: by mail-pz2-f36.google.com with SMTP id 41be03b00d2f7-cc7c058617aso951615a12.2
        for <linux-sound@vger.kernel.org>; Wed, 30 Sep 2026 00:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790753792; x=1791358592; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PRNSLRyn2N1iTesBby/+rq6D8yhyFSP+EyakI7q9A6g=;
        b=DN1EFrqplFpRoIjDJS4zRJd9E8RcFOOxpxoevIVs0ZvzSPQ5YDdAiK0rW+J5+H6u6q
         0x8slN1cFIbtpVK5UyfidqUuhJq8h6/Jv/3PmMa3VJkKoOzOEHPtSOFJ0vE/abZyJvNy
         P6NZs1Uwg0V1WSGAhLLlR9Kb3doE4CB8xetGoRB61Pgi58ODQiyKF+xjBR3Av6zYY95U
         K4rzGXXKW/Iy2KGZ13Es7/aMDUyeLz8ERVBsNxIeeU06we02FK/y8+ijifVMEufLyD7C
         a8bmTmLbwmSIF9HV81RyIaYQYoOnrrWJyr8Uiql9Q7YXILlxvn0nwGPl2tlolJRkGIaT
         M54Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790753792; x=1791358592;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PRNSLRyn2N1iTesBby/+rq6D8yhyFSP+EyakI7q9A6g=;
        b=2qn0zEsrNjk8sKpV1N9ad+6ix1thjt6mjf1qbPKAtAszLgrxjMNOJluWXOG6QQ0wxw
         Xa5tIs8cljLtI3C5tEgjcL1K7mMO5D+JU5z/KBJENcpSXRa6QeZQbooobfShDoqrvpw5
         TZseC6p2yTWetD1NXJo8hhPLSL4IbPjcc1u0qYbLbQ3Eq1nQfOFOBxKoq0KR+d/2uBaN
         JNVymIR51J8fj/K6Dd/pVm/0yVzEVLlZD0riaG9v4ayl8Kd7Pigzw+m3aFSDx5Spyav2
         vD//4tdxd3iR1gBCH2vYs/Kg4Jrz3weUMJh06Fka1/LyeOYN6mHiHt7vin52MOy0HnSV
         LDaQ==
X-Forwarded-Encrypted: i=1; AKwUvBzwNUdSJNg+BbrifqHVIch7Eo74fxAyTTpNIgfcCKZJDnTmtFpnaBea0HsgbQARnEAxHbrmYWUPycC9LA==@vger.kernel.org
X-Gm-Message-State: AFuF++lePkaiFGqZWZKfYbZ0sGLUYVn3Pp2EIojlkKosO258CO8/Ckph
	LMqCvyajHfgEGBRd87XFzAjiEupFj40L5NTYaoaPw2C1dWjyFi+m65Dc
X-Gm-Gg: AYBFou0BUv3kMzK9rbWELaJg3d3tD6Bz94K8RoMzNUizsedsdqJ3rZqwgDu+90uqKKH
	rNYP3NoYVeXn5Y5YfRvCc4e95guQh+f7LQBzQJcBOh7bTKfEQ9rzfiHxDX6b6unHDTUJGuc/QHK
	FbLnHaOUVIwnEWMCsj6QFFWCoAWEjs7cBNPQS4Oqz5CetMu22oSv3F4yTXMpAHrm/4rX1mCICuI
	l/l4iXN0kA1nDD0GAq/gY1N9bNFyP17zCIFmKa8hf69T1GgfKH8G66jZwm4Z5D4bpvDSyzJe7yR
	HYzloU/ScYO67LQYDSpFfKSieF7wwu3sKTzP1ME6qRMYQlkMCEuYKJKeQIRikGFp15q6bv7IAir
	PEOoQlwvy0Ii6ixujn39a378IJPpYTlOi/oXbcu8ezjRYcAyJcsQz8sWbd54TX8gLTDe/KNZ5K6
	TwcK6KQBCO9n0+hVgbL0yhopiKjLckE0T92EvbS6d7CwB6TDyYiSvZWgD4o9KzexQ+Xi7s/MFb1
	6md6WJ1+CjK6GWYjlEJ8DseV4OcQb+dmW7iSbogKw5msea0viNayJJOIh5KMiZvKJkktihc+HAw
	4TOnr360W4gZ/49h3q+I6mOzbDpEyfMMR0+WSvSuiMfIIBbJQg==
X-Received: by 2002:a05:6a20:d492:b0:3dd:a196:3095 with SMTP id adf61e73a8af0-3de9ebb39c1mr589504637.69.1790753791652;
        Wed, 30 Sep 2026 00:36:31 -0700 (PDT)
Received: from minako.localnet ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7dab202f1sm367179a12.27.2026.09.30.00.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:36:31 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Martin =?UTF-8?B?UG92acWhZXI=?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Ulf Hansson <ulfh@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 James Schulman <james.schulman@cirrus.com>, asahi@lists.linux.dev,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.de>,
 linux-mediatek@lists.infradead.org, Hector Martin <marcan@marcan.st>,
 Sasha Finkelstein <k@chaosmail.tech>
Subject: Re: [PATCH 16/28] ASoC: apple: Add macaudio machine driver
Date: Wed, 30 Sep 2026 17:36:21 +1000
Message-ID: <ItQHm5ZKQ4Wltp6qbCRkSA@gmail.com>
In-Reply-To: <0ae94fbe-cd41-4d49-b073-e65ab8eff724@sirena.org.uk>
References:
 <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
 <6dv6M3LAS9mol5fvC8Ie-w@gmail.com>
 <0ae94fbe-cd41-4d49-b073-e65ab8eff724@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Monday, 28 September 2026 9:03:13=E2=80=AFpm Australian Eastern Standard=
 Time Mark=20
Brown wrote:
> On Sat, Sep 26, 2026 at 11:06:02AM +1000, James Calligeros wrote:
> > On Tuesday, 22 September 2026 7:38:54=E2=80=AFpm Australian Eastern Sta=
ndard Time=20
Mark Brown wrote:
> > > > +	list_for_each_entry(kctl, &ma->card.snd_card->controls, list) {
> > > > +		if (!snd_soc_control_matches(kctl,
> > > > volume_control_names[ma->cfg->amp]))
> > > > +			continue;
> > >=20
> > > This is used from the volume limit timeout work which doesn't hold the
> > > controls_rwsem, userspace can add or remove user controls which would
> > > change the list so the work needs to lock the controls list.
> >=20
> > Would it be sufficient to scoped_guard the controls_rwsem wherever we
> > use this pattern?
>=20
> I think so, but I didn't properly check.
>=20

I did some testing of this and it causes deadlocks if we try to take the
semaphore from inside the workqueue. I believe it is related to the fact
that speakersafetyd has a blocking handle to the controls open at all times.
This may be fixable by simply having speakersafetyd take a nonblocking
handle instead. I will do some more testing before submitting v2.

> > > > +static int macaudio_dpcm_hw_params(struct snd_pcm_substream
> > > > *substream,
> > > > +				   struct snd_pcm_hw_params *params)
> > > > +{
> > > > +	struct snd_soc_pcm_runtime *rtd =3D
> > > > snd_soc_substream_to_rtd(substream);
> > > > +	struct macaudio_snd_data *ma =3D snd_soc_card_get_drvdata(rtd->ca=
rd);
> > > > +	struct macaudio_link_props *props =3D
> > > > &ma->link_props[rtd->dai_link->id];
> > > > +	struct snd_soc_dai *cpu_dai =3D snd_soc_rtd_to_cpu(rtd, 0);
> > > > +	struct snd_interval *rate =3D hw_param_interval(params,
> > > > +						     =20
SNDRV_PCM_HW_PARAM_RATE);
> > > > +	int bclk_ratio =3D macaudio_get_runtime_bclk_ratio(substream);
> > > > +	int i;
> > > > +
> > > > +	if (props->is_sense) {
> > > > +		rate->min =3D rate->max =3D cpu_dai->symmetric_rate;
> > > > +		return 0;
> > > > +	}
> > >=20
> > > It feels like this DAI ought to have separate ops...  Also, for the
> > > sense link will we definitely already have a rate set up?
> >=20
> > AIUI, the cpu rate should always be set up by the time we hit
> > this path as it is only taken when setting up the VISENSE FE (after the
> > playback stuff is already set up).
>=20
> Is that something we actually enforce or is that just a thing a sensible
> userspace should do?  I can see something racing.

We don't really enforce it. speakersafetyd is the only thing that opens the
VISENSE PCM and does a blocking read of samples
which only starts and subsequently completes after the "real" PCM
is configured and playback begins. The sample rate is reliably
reflected to speakersafetyd via the kcontrol on the VISENSE PCM. We
have not experienced any race issues with this arrangement in ~5 years
nor has anyone reported any to us. I'm happy to take pointers on
how we should be doing this if the current approach won't fly.


