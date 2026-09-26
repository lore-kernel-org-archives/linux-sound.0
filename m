Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C67754706B
	for <linux-sound@vger.kernel.org>; Sat, 26 Sep 2026 01:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790384776; cv=none; b=ULdyRfkEnIldktSJbjK/4uN/TuQlRUUULHYueSmfhIJFaUp6OBq1v1JZVZJXYl0qSYnDvg041OxAAIUTOMpdiRIpeUC0JyRhnYOKlEXIwTa4ya670Ii0V/wXSaoF3+FbFdABrFu0CRv/xW9g5eL1xZ2m0QKjRuUrCgfbgLrZIPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790384776; c=relaxed/simple;
	bh=mhu7VQi5nbBAN9Zn9j1l1cfmqS/PN4mzd61KAU5Q0HA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aNaSbuootYty/dDprHuwjlHkxeT4/iWJTdItTOCLFNe/FTi2PrPqWndAZ287puGEd+ar+e7jApy1/nZAuAcBxoL7Nb6EWUZtjd8oNJtr5iH2CRBpWAepdQ2gZQrqXnrexPz8UDTZpIelfw33615FpiESfuCfxXdLJb2cTx1hDDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kQLr3/lv; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kQLr3/lv"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d91c22d27dso4739865ad.1
        for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 18:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790384775; x=1790989575; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uPh7h4QVBO0+zLyzuNTJsDnUZi453ATtVOhNG9pw0Zg=;
        b=kQLr3/lvce7B9RMhulTxDJu5Ss1ukjOChx4GuHCABc+yu3OVnORqpIKLjgNk8crqUB
         ODiuhomWNrPDvJ4LK9Rgiuhq3iEd2Mqwsu9qooe8jNbKnOYnVlIFUXETavvgUwruHklo
         ffqyFAFBCMMCaK743h85dm931JORUN4QdNKpjB4YIArAO0Jdi3BbV9o/VK9cZaU4uF+g
         hCxHuF+KJ+3RCbMZhhoc/KejzxX4DtPR6b6PiW4+RvmoA+Rw8TOy/pytFDxY2VArRh7i
         5G2n7t3VB+ff3eCKjiWdw2+GnV2GdBG5lq4lSwyjice0cMu1woqUOQPNCXCQV9GGC/ln
         MdyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790384775; x=1790989575;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uPh7h4QVBO0+zLyzuNTJsDnUZi453ATtVOhNG9pw0Zg=;
        b=z+bW8VQwWjiUuMbxy7QS3Zn1NiZzXVVWxYRfIqeB7ugpy83oHd0+hcmhfbc1RhxEXy
         kp1jWh01hFFRNhu6Tccat7V0stKxWHjYtYIvT8rpCgrn/9mJPZa/dmqUmBzDMTeTJLNA
         bw2NdYSshwVAeZj6cKR5z4NF7+hsX/VDfzoWzW19Tj3cDcWOxVtlM0HaBbfXQWdtBYvp
         K6wspuzOlQHG5QjdHapfJyFrns8O3NgRhnl3SRyhl/e1lc83HAgicTQDuuH/XctLMATf
         pZx/3vPGFsnO+RXkGYhbBhk5bndGPMYP/BFjnXbB8kF+YBo/RQ1LqDN2+7fa07PoSwQ0
         eOdQ==
X-Forwarded-Encrypted: i=1; AKwUvBw1C20oTqTexLFIVWa3qUtMmN79tCiYuNj5T7eLXveLzsmvXTjh/wlGNcJlQDhU/0m5+mYuygjse+6TkQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nUFwpB3ISTCp8F+324G9g0IL3LQ5qW9bQ8a2hcOrddxLCwuis/
	4+UMrIV0AOeI5FXmMZ5VRJIQoH2Af7Gj8xSrgtV/LCr6EqafD6PKSgSs
X-Gm-Gg: AYBFou29woN+DjTyhYlg7IsH825ZuH1eBVCFekA2ViCV+bQ/cFOzYOD1hbN7+1O6YaQ
	qIPqvdAKx/XCYyMokgeAPlXw6E1lt3nDXMiLtsgmKiBcFcqYhXdN0fJrWtc+7lfvpRGlzWWGGc/
	rLm/bncSFH+3b+y0wArkpOpa6My/EDSGwIDo+ANwWrV1LaUbzKWxGcu+kLiQ48C9Une4Vz5ITtA
	8C+pR/S8VfUhdrng6IWaZAtUXZe6YNDTV/L2BZMdPpNbEZpxWOpg85vqqHS/Zj5zP5LayJt27ir
	chwVRhytW+EzX2Rlc5p1bmpIG6XqHxBwqZp+0p0MaSAThwjfMNsBBm+YnjHVrQfGQZ+VRIfGlnX
	RlQu218ixDSmzABti/eJ8Z3oj9SuOgWpTw8qQ3DQ+ab6nsneglibjzBUWh75foL1CVT7lXwkAI3
	zRb7T9NJytWreiSZR369XdGUqrk28A13oUs49b+GF+hBHpqR0UPKt1K5/aRNF+ArTuYy8D+k60v
	dnlC20SFMrsuxDfNsGB5zkaaTBe1Vy97UTDuf/59jZhh1a8ezx4l2DO8cYXrSJ2db32ahpDP3kA
	h8/+0hxMw42L+/YPHfrwBrn0mcvGQxtuqHOLW5cPWh8G4uy+hWE=
X-Received: by 2002:a17:903:245:b0:2dd:8e7d:90f7 with SMTP id d9443c01a7336-2df7da6101cmr56469765ad.9.1790384774750;
        Fri, 25 Sep 2026 18:06:14 -0700 (PDT)
Received: from setsuna.localnet ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913e032bsm17424215ad.27.2026.09.25.18.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 18:06:13 -0700 (PDT)
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
Date: Sat, 26 Sep 2026 11:06:02 +1000
Message-ID: <6dv6M3LAS9mol5fvC8Ie-w@gmail.com>
In-Reply-To: <arJMrsl45g2_bLPB@sirena.co.uk>
References:
 <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
 <20260920-macaudio-v1-16-741cc20a74e5@gmail.com>
 <arJMrsl45g2_bLPB@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Mark,

On Tuesday, 22 September 2026 7:38:54=E2=80=AFpm Australian Eastern Standar=
d Time Mark Brown wrote:
> > +static void macaudio_vlimit_update(struct macaudio_snd_data *ma)
> > +{
> >=20
> > +
> > +	/* Check that *every* limited control is locked by the same owner */
> > +	list_for_each_entry(kctl, &ma->card.snd_card->controls, list) {
> > +		if (!snd_soc_control_matches(kctl, volume_control_names[ma->cfg->amp=
]))
> > +			continue;
>=20
> This is used from the volume limit timeout work which doesn't hold the
> controls_rwsem, userspace can add or remove user controls which would
> change the list so the work needs to lock the controls list.
>=20

Would it be sufficient to scoped_guard the controls_rwsem wherever we
use this pattern?

> > +static int macaudio_dpcm_hw_params(struct snd_pcm_substream *substream,
> > +				   struct snd_pcm_hw_params *params)
> > +{
> > +	struct snd_soc_pcm_runtime *rtd =3D snd_soc_substream_to_rtd(substrea=
m);
> > +	struct macaudio_snd_data *ma =3D snd_soc_card_get_drvdata(rtd->card);
> > +	struct macaudio_link_props *props =3D &ma->link_props[rtd->dai_link->=
id];
> > +	struct snd_soc_dai *cpu_dai =3D snd_soc_rtd_to_cpu(rtd, 0);
> > +	struct snd_interval *rate =3D hw_param_interval(params,
> > +						      SNDRV_PCM_HW_PARAM_RATE);
> > +	int bclk_ratio =3D macaudio_get_runtime_bclk_ratio(substream);
> > +	int i;
> > +
> > +	if (props->is_sense) {
> > +		rate->min =3D rate->max =3D cpu_dai->symmetric_rate;
> > +		return 0;
> > +	}
>=20
> It feels like this DAI ought to have separate ops...  Also, for the
> sense link will we definitely already have a rate set up?

AIUI, the cpu rate should always be set up by the time we hit
this path as it is only taken when setting up the VISENSE FE (after the
playback stuff is already set up).




