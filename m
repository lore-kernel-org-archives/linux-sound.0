Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692832;
	b=S/a2SLpPQJCZCPS9G1BXA0x6ak0pHz4K7yvJibSKA87srxheZ2f4gkJMmCLnCxQ9O+M2
	 5EWZ2W/VQW0uJCPJnbqsp4WDuo02JjW2m93QeuJcN1DD2QSTDTyfvSIu9xh/qrkZJ365I
	 XWVziVpLTtUDWSEPmCaOnAteZuzIqy3zY5W1Tlthh9LAgz3xPaQDCU/5qMMnN5sALkfnZ
	 UUt8x0becIDmRjh4Qkr8MBw3J2YLJ3X0R1divtHgW/mZkW8JKdC3tuznTkIq22IuWuurP
	 XCOv8/8wDW5lXDhaQZLtD8Zv7vtNviyRHHIlgXp+mh7yskx6c3uWbGmdzIn87bSquHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692832;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=4pvRt4DS8iqnBCwhsgQ84O8tL7iJ/hbY2Dt1WFC1aCI=;
	b=LSUD6A34Ucfbnkm7Cd3LKbLp9jEqMEn09zPjEnu4BxL7m9aFRC00Dl98VPBuvU0I+FzS
	 N6f0Fdl4SINAxci51nbLSaMv4UTx1A1RBCvCeQE+J4OOv5Dmq5t1okax+3MvgtQtbyCX9
	 caYwogtzVQzv1HBx8zmgCs9hS03nS6L2/+wS2WpH8ZuXytijj5WyQRgpeLYPstYkKaFg3
	 dmFnLR0zEDx43iAsHcM7xaBXU0me1eKPZwSiW2LCv9OeoaOlf+UEoXiNH2IsnIxSiP6LP
	 ShTuisqfhPrTdpxTW6MhtUSRs7yKPxg0WrrlDG15PNcz6hSrVIrQs5lC6Ovsp6/e5xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HdHYAQsn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0194E606A31E
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 11:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HdHYAQsn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 515251F000CA;
	Thu, 26 Nov 2026 11:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795692831;
	bh=4pvRt4DS8iqnBCwhsgQ84O8tL7iJ/hbY2Dt1WFC1aCI=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=HdHYAQsng9vOxeguCufWCCSnGm11A6uKLZPcdgEs/Qjh4exuARPdN0plk8Mke9HcE
	 e7tCGoCa7bPN3amt5Ebc6/IZ6zLs+IfPYSRfeE1lGPTFCx0HdmW+FMGlSEbT8IjNw/
	 X8JEQM3A/b5aw5VCZ5NecQPUw+He4Te8Va7Mhvksk8wmPB/Mtvd6OCKLHf8HrhwDyL
	 QqLg0kZobOJu8BP022RrIoB7olXbOXYi1uheXTft4wV7gcerolbYi1DRngIG8olt0o
	 KWRUEExIDXQlAXAly7v7gVXgIuj3cb11FzuYqxQDitdg4zJMg02MAS3Vrk1kpJcJJL
	 iWs8xxseePZcQ==
Message-ID: <sashiko-outbox-235382@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/5] ASoC: sdw_utils: add tac5272 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Niranjan H Y" <niranjan.hy@ti.com>, linux-sound@vger.kernel.org
In-Reply-To: <20261126112023.29054-2-niranjan.hy@ti.com>
References: <20261126112023.29054-1-niranjan.hy@ti.com>
 <20261126112023.29054-2-niranjan.hy@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 11:33:50 +0000
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
- [High] ASoC: sdw_utils: missing UAJ DAPM routes in
  asoc_sdw_ti_sdca_jack_rtd_init()
--

commit ab1ea32241446e1fd526f967dff86ea035e556af
Author: Niranjan H Y <niranjan.hy@ti.com>

ASoC: sdw_utils: add tac5272 support

This commit adds a codec_info_list entry for the TI tac5272 SoundWire
codec with UAJ and DMIC DAI definitions.

> diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/so=
c_sdw_utils.c
> index b6acf7616d147..617ea88b30649 100644
> --- a/sound/soc/sdw_utils/soc_sdw_utils.c
> +++ b/sound/soc/sdw_utils/soc_sdw_utils.c
> @@ -81,6 +81,36 @@ static const struct snd_kcontrol_new rt700_controls[] =
=3D {
>  };
> =20
>  struct asoc_sdw_codec_info codec_info_list[] =3D {
> +	{
> +		.vendor_id =3D 0x0102,
> +		.part_id =3D 0x5272,
> +		.name_prefix =3D "tac5272",
> +		.dais =3D {
> +			{
> +				/* UAJ */
> +				.direction =3D {true, true},
> +				.dai_name =3D "tac5xx2-aif3",
> +				.component_name =3D "tac5272",
> +				.dai_type =3D SOC_SDW_DAI_TYPE_JACK,
> +				.dailink =3D {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
> +				.controls =3D generic_jack_controls,
> +				.num_controls =3D ARRAY_SIZE(generic_jack_controls),
> +				.widgets =3D generic_jack_widgets,
> +				.num_widgets =3D ARRAY_SIZE(generic_jack_widgets),
> +				.rtd_init =3D asoc_sdw_ti_sdca_jack_rtd_init,

[Severity: High]
Does asoc_sdw_ti_sdca_jack_rtd_init() leave the card's "Headphone" and
"Headset Mic" widgets (from generic_jack_widgets) disconnected from the
codec's UAJ widgets?

Unlike asoc_sdw_ti_tac5xx2_spk_rtd_init(), which adds DAPM routes from
"<prefix> SPK_L" and "<prefix> SPK_R" to the card speaker widgets,
asoc_sdw_ti_sdca_jack_rtd_init() binds ti_sdca_jack_pins to "Headphone"
and "Headset Mic" without calling snd_soc_dapm_add_routes() to connect
them to "tac5272 HP_L", "tac5272 HP_R", and "tac5272 UAJ_MIC" defined in
sound/soc/codecs/tac5xx2-sdw.c:tac_uaj_widgets[].  As a result, jack pin
state updates and the Headphone/Headset Mic pin switches do not gate or
power the codec's UAJ DAPM paths.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126112023.2905=
4-1-niranjan.hy@ti.com?part=3D2
