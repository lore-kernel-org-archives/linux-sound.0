Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA1A380FF2;
	Thu, 13 Aug 2026 16:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786638047; cv=none; b=Wi0uc3GPouOvWIAtH/YN0t27ox3f6OKptA/ju6NnG07c9pZ4qeZ8wRzNR0XokQdPMWs4y1YUsPAK+2aR4MpaXYW0RoikxV/6NOflhHUjy24e2ZC7G13x4XeYCDHwjfGPA8aKl3NF2QSL+nDYejdNIJvTf8zQkf4fQFv5nd837mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786638047; c=relaxed/simple;
	bh=ZiQrxzhJDHJSEu+NKhIl4bDxMSm4cQOhwSoDUghs2XE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oxtCLu4tmwm0FWZJhwqripRAzkWj1f7DcHDZaA7Zp/DLCkNeivUlLw9OjBerL5rl0XXDJ41NMuEVTzJ1UXyEtEs25JLnZgHoeLljO5r24GK/UVM57virMLQZQtC+CAEHICF7qfOL5BKgbajIu47vOsGUUcabWRNoRPxhJ+7TvZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fVeWJ+ad; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fVeWJ+ad"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 470C31F000E9;
	Thu, 13 Aug 2026 16:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786638045;
	bh=C2tF7MoVfhoVhR6e4oKHQaLxMK9zEigM8IPLfjfRXiQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fVeWJ+adS5+OpDGgw2Y1+tgyDlJryWpXw96QUDMxsXTzd9g82ssbztul+g7eAESGs
	 NI6IrvAtPTDF5B0H+uTyMuvetKfH2ZGHosCUUV9dEqUrGziav5Nsh2owQk8dmpWwxo
	 //XUYMUyqivdZW6PrRpC77Bd9uHsMQHtlU702vBbGlpRN7E9CDCZezNuYgMbHa+HS8
	 licP8p8isAv9yitknJCgXSTZKInykr9/Mp2Eq544jV2Uki5Wtc48aTRxlVLKpXCqHR
	 YVu0zaSwMhDRmH7t2YJyDp3v1ZuJrpmH+LksU83bBaksemW9LpaO6Wqni1MFmu1U6b
	 0eYQsiylD8xqA==
Date: Thu, 13 Aug 2026 17:20:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Neo Chang <YLCHANG2@nuvoton.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, robh@kernel.org,
	krzk+dt@kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
	neo.chang70@gmail.com, kchsu0@nuvoton.com, sjlin0@nuvoton.com
Subject: Re: [PATCH v8 2/2] ASoC: codecs: nau8360: Add support for NAU83G60
 amplifier
Message-ID: <d57c05ce-929e-441f-b02a-2e1598a06ee7@sirena.org.uk>
References: <20260813064327.1127236-1-YLCHANG2@nuvoton.com>
 <20260813064327.1127236-3-YLCHANG2@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AgQO6F8dSbRgE6Yy"
Content-Disposition: inline
In-Reply-To: <20260813064327.1127236-3-YLCHANG2@nuvoton.com>
X-Cookie: Immanuel doesn't pun, he Kant.


--AgQO6F8dSbRgE6Yy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 13, 2026 at 02:43:27PM +0800, Neo Chang wrote:
> Add support for the Nuvoton NAU83G60 audio codec. The NAU83G60 is a
> stereo 30W+30W smart amplifier with an integrated low-latency
> Advanced Audio DSP.

> +int nau8360_dsp_init(struct snd_soc_component *cp)
> +{
> +	struct nau8360 *nau8360 = snd_soc_component_get_drvdata(cp);
> +	int i, ret;
> +
> +	for (i = 0; i < NAU8360_DSP_FW_NUM; i++) {
> +		ret = nau8360_dsp_chan_kcs_setup(cp, nau8360->dsp_firmware[i], nau8360_dsp_addr[i]);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}

Should this or the binding parsing code do something about PBTL mode,
the binding says that the left DSP firmware is ignored in PBTL mode but
this looks like it will still try to load the firmware.

> +static int nau8360_peq_coeff_get(struct snd_kcontrol *kcontrol,
> +	struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
> +	struct snd_soc_component *cp = snd_kcontrol_chip(kcontrol);

This is registered as a regular kcontrol so should get the DAPM context
with snd_soc_component_to_dapm().  Same for _put().

> +	if (snd_soc_dapm_get_bias_level(dapm) > SND_SOC_BIAS_STANDBY) {
> +		dev_dbg(nau8360->dev, "PEQ access is not allowed during playback");
> +		return 0;
> +	}

What happens if something starts playback simultaneously with this?
Nothing stops playback starting before we start accessing the registers.
The check will also fail if we've got an active capture stream, IIUC
we shouldn't have one without playback since it's an amplifier and
that's presumably for DSP feedback but at least the docs should be
clearer.

> +static int nau8360_hv_pre_event(struct snd_soc_dapm_widget *w,
> +	struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
> +
> +	if (SND_SOC_DAPM_EVENT_OFF(event)) {
> +		snd_soc_component_update_bits(component, NAU8360_R9C_HW1_CTL2,
> +			NAU8360_HW1_CH_MUTE, NAU8360_HW1_CH_MUTE);
> +		snd_soc_component_update_bits(component, NAU8360_R99_HW2_CTL9,
> +			NAU8360_HW2_CH_MUTE, NAU8360_HW2_CH_MUTE);
> +	}
> +
> +	return 0;
> +}

This is registered as a SND_SOC_DAPM_PRE() so it'll run for capture
streams too.  That's probably not the end of the world since IIUC that's
only used for speaker protection data but it's still fun?

--AgQO6F8dSbRgE6Yy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp97tcACgkQJNaLcl1U
h9BF7wf8D5dBFlj7AiQei8Nr98NDLQy9SjP8QVGdtbBgyPzpU4E5K6gWD//63TtY
Nfe2LSIB5czpaFkGVc8AC/tdR3pw5g4612qt6MtdTikckdcieso7aVcx//9S08Ny
iP+15/jWA4E+NoszxkkuIWdt0BZDcYGkkgRpt4/cAtidJ9rqwxfUs8k+4rcGOKIS
kHEuIgDl9MUL79Az4vLSCdAyheq3E7hVc8bTxeSPBx/A0l4DeFA2+FyixsORBEvu
ojJndnYP0Jkal+RnQKt/fCUY3lf6pyocc6XQ9RehabJ6JuMJSwmIGeI7EENHq7I7
Xxz5xK5XX0NKRzTMVFUjllzGA/udYg==
=7G6m
-----END PGP SIGNATURE-----

--AgQO6F8dSbRgE6Yy--
