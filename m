Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692994;
	b=XL5d8dHqehdRAoUlkXOPxtcyXh188QH+F57JOJxMLPcPpIrOxPDgpGPzL185bL+XxJRX
	 Pj41A3LmQptaXjDc/tGbrVOJq59RQre06/lFdr4HaQzSoTH/zlNUYnRST0griWZgoWwEH
	 xW0BE21jxjnS2JFWkt9kDhPBgt3qnoooqttDYesyWHc4y/IebSYt9LOCvq3K8O+ZlHFqI
	 vZSjyXEWsHPZ+Lc/Xn4t5tosUmuobg8uMZYiw6YqlEFGywUp2svAwQ28H28GX6Yq1SHs1
	 p7icoDu737Rtgl8vLd6o6RlwwxWJAymXY0lX51T3gvmrgoCvusFR5/YdlZX5oJ3Rd9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692994;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=y8GWKjPOZm2T1wgFUJLhVUphNuwxMNBqS8hRfotybog=;
	b=AtndpBs9EM7dW4YOHW28uCcbpSLmW3D7oWrjgRrKgSwjWL36R/Op2LSxXJl3F0ftyyBM
	 5DIPg4Rof5DuTEMymaaN3KR0Umiztw+uF1bHXq+p7xZopB0C1xcXKfASH8g2ftESPxTsV
	 jIbRpI+qZUkdMF7ZlkZ7EQJMd11tTItj3jnXypA+wcH42bcmMp8lbyPbbykIkoJhV6rBT
	 5OlRuruJAb1qojfzEn1F/lcvIaK+HaMncDVzeE8LnElq7vCSZGbSSB/EOgLMy8Gjs6Da1
	 iShDT1hhxsleNBjZTqyOk77sGD43rvoY4W3miFYGqcPTmnsJLn3psuP/CBWB3U5bwZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EtXwJN0+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AC6606A31C
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 11:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EtXwJN0+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B89EE1F000C6;
	Thu, 26 Nov 2026 11:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795692993;
	bh=y8GWKjPOZm2T1wgFUJLhVUphNuwxMNBqS8hRfotybog=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=EtXwJN0+3rPBTDKMR8z8vsbL98MFess+Cs1Dq9cUZgkKk9yEvXdVGxQ5hbAiAqRTs
	 ef1+uu30Ll/0O/wDZi7zZeWGj3iESgSyP3406oCWeCpe68cHUp1iCD1bReBJVCxCjp
	 1dt9gnzhAG5PL+0Eow4WCAR0NYfTu3OMKCEBToymqHsbojDEK+4xLrEhFojhT2p61E
	 AxQZPV1UoHe9aOSQMAEOXba98Y+g+LmRKN2c9z802lJR9rGxWmZh+QRzXTa1RzyBrA
	 yEnVec5QLAq2tyKkgWrPvGTxATHC6qDxqQvZ1JKzB5fcgonlrZ0hp184vjDpTrRO43
	 IV6LttNnroR0A==
Message-ID: <sashiko-outbox-235383@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/5] ASoC: tac5xx2-sdw: add tac5272 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Niranjan H Y" <niranjan.hy@ti.com>, linux-sound@vger.kernel.org
In-Reply-To: <20261126112023.29054-1-niranjan.hy@ti.com>
References: <20261126112023.29054-1-niranjan.hy@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 11:36:33 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] ASoC: tac5xx2-sdw: tac_component_probe() registers speaker
  path on tac5272
--

commit fd04f2d835d7450161d1e9e240c16a2e7cecb8a0
Author: Niranjan H Y <niranjan.hy@ti.com>

ASoC: tac5xx2-sdw: add tac5272 support

This commit adds support for the tac5272 SoundWire codec variant and
refactors tac_component_probe() to dynamically register common and UAJ
DAPM widgets, routes, and controls based on the part ID.

> diff --git a/sound/soc/codecs/tac5xx2-sdw.c b/sound/soc/codecs/tac5xx2-sd=
w.c
> index 43584bebdafee..a541f95e4cc5b 100644
> --- a/sound/soc/codecs/tac5xx2-sdw.c
> +++ b/sound/soc/codecs/tac5xx2-sdw.c

[ ... ]

> @@ -1353,40 +1387,78 @@ static struct snd_soc_dai_driver tas2883_dai_driv=
er[] =3D {
>  static s32 tac_component_probe(struct snd_soc_component *component)
>  {
>  	struct tac5xx2_prv *tac_dev =3D snd_soc_component_get_drvdata(component=
);
> +	u32 part_id =3D tac_dev->part_id;
>  	int ret;
> =20
>  	ret =3D pm_runtime_resume(component->dev);
>  	if (ret < 0 && ret !=3D -EACCES)
>  		return ret;
> =20
> -	if (!tac_has_uaj_support(tac_dev))
> -		goto done_comp_probe;
> +	switch (part_id) {
> +	case 0x2883:
> +	case 0x5272:
> +	case 0x5572:
> +	case 0x5672:
> +	case 0x5682:
> +		ret =3D snd_soc_dapm_new_controls(snd_soc_component_to_dapm(component),
> +						tac5xx2_common_widgets,
> +					ARRAY_SIZE(tac5xx2_common_widgets));
> +		if (ret) {
> +			dev_err(component->dev, "Failed to add common widgets: %d\n", ret);
> +			break;
> +		}
> =20
> -	ret =3D snd_soc_dapm_new_controls(snd_soc_component_to_dapm(component),
> -					tac_uaj_widgets,
> -					ARRAY_SIZE(tac_uaj_widgets));
> -	if (ret) {
> -		dev_err(component->dev, "Failed to add UAJ widgets: %d\n", ret);
> -		return ret;
> -	}
> +		ret =3D snd_soc_dapm_add_routes(snd_soc_component_to_dapm(component),
> +					      tac5xx2_common_routes,
> +					      ARRAY_SIZE(tac5xx2_common_routes));
> +		if (ret) {
> +			dev_err(component->dev, "Failed to add common routes: %d\n", ret);
> +			break;
> +		}
> =20
> -	ret =3D snd_soc_dapm_add_routes(snd_soc_component_to_dapm(component),
> -				      tac_uaj_routes, ARRAY_SIZE(tac_uaj_routes));
> -	if (ret) {
> -		dev_err(component->dev, "Failed to add UAJ routes: %d\n", ret);
> -		return ret;
> -	}
> +		ret =3D snd_soc_add_component_controls(component, tac5xx2_snd_controls,
> +						     ARRAY_SIZE(tac5xx2_snd_controls));

[Severity: Medium]
Does registering tac5xx2_common_widgets, tac5xx2_common_routes, and
tac5xx2_snd_controls for case 0x5272 still register the speaker path on
tac5272?

Although tac5272_dai_driver omits tac5xx2-aif1 ("DP1 Speaker Playback"),
those three tables still bundle the Port 1 speaker widgets, routes, and
SmartAmp controls alongside the DMIC definitions:

sound/soc/codecs/tac5xx2-sdw.c:
static const struct snd_kcontrol_new tac5xx2_snd_controls[] =3D {
	SOC_DOUBLE_R_RANGE_TLV("Amp Volume", TAC_AMP_LVL_CFG0, TAC_AMP_LVL_CFG1,
			       2, 0, 44, 1, tac5xx2_amp_tlv),
	TAC_DOUBLE_Q78_TLV("DMIC Capture Volume", SM, FU113),
	TAC_DOUBLE_Q78_TLV("Speaker Volume", SA, FU21),
};
...
static const struct snd_soc_dapm_widget tac5xx2_common_widgets[] =3D {
	/* Port 1: Speaker Playback Path */
	SND_SOC_DAPM_AIF_IN("AIF1 Playback", "DP1 Speaker Playback", 0,
			    SND_SOC_NOPM, 0, 0),
	SND_SOC_DAPM_PGA("FU21_L", FU21_L_MUTE_REG, 0, 1, NULL, 0),
	SND_SOC_DAPM_PGA("FU21_R", FU21_R_MUTE_REG, 0, 1, NULL, 0),
	SND_SOC_DAPM_PGA("FU23_L", FU23_L_MUTE_REG, 0, 1, NULL, 0),
	SND_SOC_DAPM_PGA("FU23_R", FU23_R_MUTE_REG, 0, 1, NULL, 0),
	SND_SOC_DAPM_OUTPUT("SPK_L"),
	SND_SOC_DAPM_OUTPUT("SPK_R"),

On tac5272, this exposes dangling speaker DAPM widgets/routes and
non-existent "Amp Volume" and "Speaker Volume" mixer controls that access
unimplemented SmartAmp SDCA registers when read or written from userspace.

Should the speaker widgets, routes, and controls be split out from the
DMIC entries so that 0x5272 only registers the DMIC and UAJ paths?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126112023.2905=
4-1-niranjan.hy@ti.com?part=3D1
