Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3623F48A8AC;
	Fri, 21 Aug 2026 15:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787325882; cv=none; b=Aix3lTuEDNwyM+A4zBEY/ipbOSKI5Fl+UWIT0+1dCvF4QiBp6200z8g2D5kkTaBDlOzzRtmLzDRjNbNT6jc+7ScfLO/1OYI0WU6NyZ+NS6yN+hmWQnZmtCjvLq5jJ5O458gC2S/02j0Zfg8wG/n1wHJ9PFCqZsH09Ze7l8c4rxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787325882; c=relaxed/simple;
	bh=SBGml8hrQ2aFRGNL2p+ZCGxmIsUl/78d5Et7UrK0FMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DOIV2XFGUq6iqUSykv6Jyrr89/S9myKSFsEj72x6+YB9ONtsJ5ly77Mp+J+o7L2gYa8X/CqdaVBMiRKNk8wXRuSAYuezhRBAWqkWJ6NO//HX1GIg+4qHHb9xvuMJNZ2jU8tHBFmu2DW+18ETpdKbzJ3gGO1sAmB8ELx1o9wdTWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VWsTPTjF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VWsTPTjF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBCB01F000E9;
	Fri, 21 Aug 2026 15:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787325880;
	bh=dnL5vbj5IlrgthDUXFHTUoJ8e1RoFREik7AkKfQotBU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VWsTPTjFck2IV5MzjnjvlEZBKFtNtr6UK41cxwdBCwKDSEtRJNhn68AGM9VYnrIEB
	 MKH+8eHrVZiztyqudfUZP1eDnusyNgkJ4CeS3oWD3kgVC9dmA0cuqFIh3yO4giZHeE
	 eklKneFSNty/eOOT8CLXBi8Ha9ECzg1WOpSCO81Nb08enxxhCY+DteS07YbezzXyx5
	 QdMySiIZuwghX3UrEBTyMSYJSmSfsxTGObMbGd1vXkKec+elDUGNQSDMcdww0QjBnO
	 neb1rL/qmTbkhV9p/yGnbNHCbY2Gdm3abxaFXmY7QKsRwQZAdEybzW96LCy1ZfEDZG
	 y801IxSjrscbA==
Date: Fri, 21 Aug 2026 16:24:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Neo Chang <YLCHANG2@nuvoton.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, robh@kernel.org,
	krzk+dt@kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
	neo.chang70@gmail.com, kchsu0@nuvoton.com, sjlin0@nuvoton.com
Subject: Re: [PATCH v9 2/2] ASoC: codecs: nau8360: Add support for NAU83G60
 amplifier
Message-ID: <7e7b8329-23d3-495d-ad48-9ea70189c46c@sirena.org.uk>
References: <20260820022925.1174132-1-YLCHANG2@nuvoton.com>
 <20260820022925.1174132-3-YLCHANG2@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FbvYG0boBekWO757"
Content-Disposition: inline
In-Reply-To: <20260820022925.1174132-3-YLCHANG2@nuvoton.com>
X-Cookie: Package sold by weight, not volume.


--FbvYG0boBekWO757
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 20, 2026 at 10:29:25AM +0800, Neo Chang wrote:
> Add support for the Nuvoton NAU83G60 audio codec. The NAU83G60 is a
> stereo 30W+30W smart amplifier with an integrated low-latency
> Advanced Audio DSP.

A couple of issues here, mostly this looks fine.

> +static int nau8360_peq_coeff_put(struct snd_kcontrol *kcontrol,
> +	struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *cp = snd_kcontrol_chip(kcontrol);
> +	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(cp);
> +	struct nau8360 *nau8360 = snd_soc_component_get_drvdata(cp);
> +	struct soc_bytes_ext *params = (void *)kcontrol->private_value;
> +	int i, reg, ret = 0;
> +	__be16 *data = NULL;
> +	bool changed = false;
> +
> +	/* Use the DAPM lock to prevent race conditions during DAPM power-up
> +	 * state transitions, and check component active status to prohibit
> +	 * PEQ access during active audio streams (playback and capture).
> +	 */
> +	snd_soc_dapm_mutex_lock(dapm);
> +	if (snd_soc_component_active(cp)) {
> +		dev_dbg(nau8360->dev,
> +			"PEQ coefficient access is ignored during audio is active");
> +		goto unlock_dapm;

This should probably be -EBUSY or something, though that will upset
mixer-test.  As things stand since the values change when a stream
starts and stops there should be an event when that happens, and since
we report success some value ought to be filled in for the read.

> +static void nau8360_dsp_fw_load(struct nau8360 *nau8360)
> +{
> +	nau8360->load_fw_done = false;
> +	schedule_work(&nau8360->load_fw_work);
> +}

> +static int __maybe_unused nau8360_resume(struct snd_soc_component *component)
> +{
> +	struct nau8360 *nau8360 = snd_soc_component_get_drvdata(component);
> +	struct regmap *regmap = nau8360->regmap;

> +	nau8360_dsp_fw_load(nau8360);

This only kicks off the firmware load, it doesn't wait for it to
complete.  That means that if a stream restarts quickly after resume we
will run into issues - I see that the normal playback path just errors
if we try to start without the firmware.  We should wait, either here or
in the startup path.

> +	if (NAU8360_IS_DSP_REG(reg))
> +		*value = nau8360->i2c_read_buf[0] |
> +			(nau8360->i2c_read_buf[1] << 8) |
> +			(nau8360->i2c_read_buf[2] << 16) |
> +			(nau8360->i2c_read_buf[3] << 24);

get_unaligned_le32()?

--FbvYG0boBekWO757
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqIbbMACgkQJNaLcl1U
h9ARoQf/Vm6uj3Mw8pW8Ni5unT/J30hjetyZ2zxoIepaS5lXsLB5W34wxwhZhTQq
D3wbdzK1JJnvXXivIoyoJjY8EZZlXCp7si6f89XtOokkQ8Mvw21EgUetKaDBrNfw
j91Nw8GBQnY5B+jM4qSvgmHi0nE3lujSpcKm6WQyUrGO2iMJpanztxuv8Py6DCDI
ojPbtfNA8mCWtiA3gLJC4R3O1DbJZRuKJLpgCyp35NMnttJDaajjdAhIgPAfK/jV
thzBU72FrQpI4JsDNgT7j9aXXFQBT1k62EKBOEfAB+CFvAz2sgdkd5l/70FCEnRV
65SCV405IUFuSECXuVpFIzRAJ57p6w==
=NzXF
-----END PGP SIGNATURE-----

--FbvYG0boBekWO757--
