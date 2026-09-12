Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55F73C1D67
	for <linux-sound@vger.kernel.org>; Sat, 12 Sep 2026 11:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789211155; cv=none; b=uZK6r5HSS2CxMTVbCYZbu8neM4Jfdxc8uUtXRGtVrpS7i3S/UXZD7AZ1jQcv8rmItk2u5oAwK6SsSOoCdnaWI3GMXGIaOO+wzP3ipMwCy3JND05ZiIc64d2IUYaZdbUsML9npLYX1jCqCYFHcOM/BhEPmulkn3jwSE6AqYzvXSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789211155; c=relaxed/simple;
	bh=YQl84G0IH/ipWrLXr/HLCmI6wCWZgdA8KpDO/OQ3U/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gqYxZ7vP4eqjdeFDib2NtjcClgau1D0Ge69yH7JTJLPf1cPN7l9HRq/s0BXv/+Sgdq6RF/JuNIRqOplq6rX3j+oIs7yPkUWswKG5Utv2Lx0KmHL2GtR9i+fGResFAfassqcW9T8STupc0/WNYBnizZDU2veq+o5UUvChv1b+zYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kezq2kIT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kezq2kIT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DE6C1F00899;
	Sat, 12 Sep 2026 11:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789211153;
	bh=cpDEkC2F0OwDZabi+y4aSdRSlXwbG+A/e0wjLXj3Kb8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Kezq2kITcE/gGHeF93KYi1q0ssdejvWWQpt63f1xNqbTTwbXkCxpCy6V24E9sydHx
	 GaCAkbFWaNQid80BlKU1YnCKzOF3SDOofTOZrG6SSZ0bQxCP4y+TT9lBdKybE29Eka
	 uvX1en8ssBLuqgdHka4YcILgySpQCsFpwuLtxN5VTQ8FYM5cAaAS4tguQjoCDi/Yve
	 /bMHpnxs42H4hpJ1tUQvyBIizWKLFO4r3DpGYnzx0td4uAa2kdI9I0UBuKc3/QA1WM
	 dY59syW/VNpxUVQO/Y/2kHTA9HNHvUVvwuTxK/QKs5SluQG4NRI39u1Svn/YpYJlzw
	 mkaR/bDmQjylg==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 52EAAE06C68; Sat, 12 Sep 2026 12:05:51 +0100 (BST)
Date: Sat, 12 Sep 2026 12:05:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: tiwai@suse.de, 13916275206@139.com, perex@perex.cz, lgirdwood@gmail.com,
	linux-sound@vger.kernel.org, baojun.xu@ti.com, k-lu@ti.com
Subject: Re: [PATCH v1] ASoC: tas2781: Add TAS2573 calibration support
Message-ID: <aqUyD2pQIS1JUXmF@sirena.org.uk>
References: <20260912051538.1052-1-shenghao-ding@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kG2Leb5iNJZKUW9v"
Content-Disposition: inline
In-Reply-To: <20260912051538.1052-1-shenghao-ding@ti.com>
X-Cookie: Orders subject to approval.


--kG2Leb5iNJZKUW9v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 01:15:38PM +0800, Shenghao Ding wrote:
> This patch adds complete calibration workflow support for TAS2573.

> @@ -210,6 +211,7 @@ struct tasdevice_rca {
>          * capture.
>          */
>         int capture_profile_id;
> +       int calibration_profile_id;

This should be initialised to -1 like the profile ID so that we don't
get false matches on unitialised values.

> --- a/include/sound/tas2781.h
> +++ b/include/sound/tas2781.h
> @@ -17,6 +17,8 @@
>  #ifndef __TAS2781_H__
>  #define __TAS2781_H__
> =20
> +#define CONFIG_SND_SOC_TAS2781_ACOUST_I2C
> +
>  #ifdef CONFIG_SND_SOC_TAS2781_ACOUST_I2C
>  #include <linux/debugfs.h>
>  #endif

This looks like it was committed by mistake?

> +		/*
> +		 * If in the coef bin file are several configs with the
> +		 * keyword "calib", calibration_config_id only store the last
> +		 * calibration profile id.
> +		 */
> +		if (strnstr(config->name, "calib", 64)) {
> +			tas_fmw->calibration_config_id =3D i;
> +			dev_dbg(tas_priv->dev, "%s: calib cofig id =3D %d\n",

config.

> +static int tas2573_calib_start_put(struct snd_kcontrol *kcontrol,
> +	struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *comp =3D snd_kcontrol_chip(kcontrol);
> +	struct tasdevice_priv *tas_priv =3D snd_soc_component_get_drvdata(comp);
> +	int cal_prof_id =3D tas_priv->rcabin.calibration_profile_id;
> +	int cal_conf_id =3D tas_priv->fmw->calibration_config_id;
> +
> +	guard(mutex)(&tas_priv->codec_lock);
> +	if (tas_priv->chip_id !=3D TAS2573)
> +		return -1;

Should be a kernel error code, possibily with a WARN_ON_ONCE - we should
only register these controls for devices where they are supported so
this should be unreachable otherwise.

--kG2Leb5iNJZKUW9v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqlMg4ACgkQJNaLcl1U
h9AeMAf/bLG5FgQC36g43pdVzD0wJZont41p0qN8dWi54jrC57gxTWYmIA43QL3P
U0hGw4RjrO9UC20hqPWuSgEmqayTPhzeo4uaVRun1qwqOTHE1Cd0RpVqIp8IWAQU
hvCysehf8drlqYK82X1JC6Teh/mQrYg0ud1horUaS+jQNnPPsLF5t+8dlDdJsMoh
fNZoIhL5HhaN0XDNV9L7jMvFD7EKIAubojaQCwas1PE+JG9wS+VHJFpgBgBIMV7I
P19Jw8xfQqZ2VLxHDQ6UEoFSYHui5h1M7KMfjFmyhzMrw7WkYLhVqOad5M/YeIcL
HUZW0zEzhOHPEG/kBH7w9a5T5E9wjg==
=q/Vx
-----END PGP SIGNATURE-----

--kG2Leb5iNJZKUW9v--
