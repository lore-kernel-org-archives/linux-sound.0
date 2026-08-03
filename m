Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD4230B53F
	for <linux-sound@vger.kernel.org>; Mon,  3 Aug 2026 21:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785792249; cv=none; b=frRcehljYnxz6fmJI0oypd4nGmhbmI+lKqmFk76B824Apfd1ebk4zNoKvZ0pUWE4qOKW04Yo0oR/nyM7GhXKUMRJZ/E2Gw1hrSWm2H0kjFuJzkyCeAN4k0n9DneqLFwpyjoxzmxhJ7QgBGT83QBgCT2scNh5BrW+eYog4hbJSSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785792249; c=relaxed/simple;
	bh=Oiz4l1yP/a0t+I4z0/3hxC9SvnI1V2wkjz166XN0JFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q5/q4ewgp6BCMec8GOA9bIrnqY3RfOU0qQaU2CxPp4ONEXGUaSn8pQvTFerKmrw597zF91wQ4cl8vKio0xbY4yrchZ078QiQizAEcSy7HQEtJtas5TOot+3cHZ29fF8++a1Nln7QxkShcmmm8Xl6i0A7pwez8mbrQsxQYZWbFzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FFeNvqMs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FFeNvqMs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96EB41F000E9;
	Mon,  3 Aug 2026 21:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785792248;
	bh=yx97KOk0DnuIcHd+qXUxvw/QQnYpLp8FQRrPfT7qE/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FFeNvqMsqoRrzk0tuayPKuCzOlgzOV33ZkSG+F3MKoK8MPebmUAqEyrZCYisUCJOo
	 mgA/MSiUAEXF14q79ra5ePXhkxAK/6SA2wIghStXDMsMSmen0vrIhhy4Gmlt/sFqgu
	 /CGddHtmkMVRal4KYZ7f18HrmQBkt++sHxeFzDHMdNteLP3w0FqH07G9i/Ly5Kl6D1
	 WvBxW78YE/XtqQ85IxVjE8ET2BxtG0fjpsKGzI49vB2NrlshzAuCDcP04pzePQFilq
	 1wSxZQUu8QIoZH/OsOYUCUKj9MZR76mAQYXDQ8KIn4VxJoZ+50LDnpUox3d3zq8oSA
	 0KkxEwcp1ik6w==
Date: Mon, 3 Aug 2026 22:24:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: tiwai@suse.de, 13916275206@139.com, perex@perex.cz, lgirdwood@gmail.com,
	linux-sound@vger.kernel.org, baojun.xu@ti.com, k-lu@ti.com
Subject: Re: [PATCH v1 2/3] ASoC: tas2781: add capture profile control and
 capture dapm event
Message-ID: <175d8fb6-cb5e-4c2c-85c7-c24355c549ac@sirena.org.uk>
References: <20260801020821.2016-1-shenghao-ding@ti.com>
 <20260801020821.2016-2-shenghao-ding@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Bmb7TreN5Dz3Mj3P"
Content-Disposition: inline
In-Reply-To: <20260801020821.2016-2-shenghao-ding@ti.com>
X-Cookie: Prunes give you a run for your money.


--Bmb7TreN5Dz3Mj3P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Aug 01, 2026 at 10:08:20AM +0800, Shenghao Ding wrote:
> Expose a new mixer control "Speaker Capture Profile Id" to user space,
> so that applications can configure which profile ID should be used
> for capture paths.

> +static int tasdevice_set_capture_profile_id(struct snd_kcontrol *kcontrol,
> +		struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
> +	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(codec);
> +	int ret = 0;
> +
> +	if (tas_priv->rcabin.capture_profile_id !=
> +		ucontrol->value.integer.value[0]) {
> +		tas_priv->rcabin.capture_profile_id =
> +			ucontrol->value.integer.value[0];
> +		ret = 1;
> +	}

This is not doing any validation of the input from userspace so we can
happily end up specifying a profile that doesn't exist, and also read
back an invalid value from the control.

--Bmb7TreN5Dz3Mj3P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpxBvMACgkQJNaLcl1U
h9CHzgf+OLXg5bP6Z1cwjUPe151LWUOe2DWtEbyU6UNRLbhu2EJtVNFfqj/G7ela
ChQ26g70MSAHUEWQ/Pouq2SNjuSQC6voJs8UhuWi7JxdiDxMYAxzOiocE34/2+2n
b+9E8O4VgrvneR8m4WvYMgu+gtaiCis8tiT+lv8FCCuogXvlfOGpslFJcqcBPJ/u
bprJkLvrB3f37zKR2phFjmN4mBGmHfcX3Tywed791jY4SfYAIlObyanMCKAr4+j2
TTyrN8hlYhFP5jYjCiVy6IMLxXPNyUebCRb2MknNX3pJ0uf6ZMjnNchWNlZrAyjr
z+SvS14C3RLNFazun73f84VoUvtdUQ==
=sTxI
-----END PGP SIGNATURE-----

--Bmb7TreN5Dz3Mj3P--
