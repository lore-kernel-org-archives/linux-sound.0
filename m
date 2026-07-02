Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AC22580F2;
	Thu,  2 Jul 2026 15:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783005329; cv=none; b=Bztm1SRK4nljafCelvKBSM2QU+aXbV+iYJ/GDEJbJjpNUlWd7e7R+5uB2KED6R/q9XH0fxQVut0JLHDZ3wx4uPmVcV7p09DTjG3vkXoPOSZTbZlCbpTP+W3L5ng4QSwnaM5pD4AJu6m6VqejgV3ONzlmttAitTrOiD6D882W9Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783005329; c=relaxed/simple;
	bh=cvQYSD2ruGb1LOqO+He73WuZdMCY7pLYDaGYm3RyVOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IGx4Z/C+sRkYnfmZJN0IWI2R+XfqPqVvYFMNm07eF1xEuy0pbPTCuR22MpWDZVLS7thV96eNwXtskmS73rtCS9isyPCnbG50aNH2k4EcQx6tYfrdh09dG7ouR5DHp+0tTQJd2WrfpJqtMTKHb2ZdaJxpEGn4MLV9vqNg4/N0aWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lWzfJRVK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lWzfJRVK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1D0F1F00A3A;
	Thu,  2 Jul 2026 15:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783005328;
	bh=KrJNDv7MRfChraFB+59N59wiEXryhLetWz61hTOEUWU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lWzfJRVKKtY5UA1tw309oGY11dc4lH476PDkJv0aBDXV+cybqT13SXxSa8QkRiyMB
	 YElIwkGkGPXhJgIzuPPLbJFwJihjj6VQqReQS2maWkfZy5H2QYjBht6glss+IEmWur
	 Tv+Au6qOvgdDV+1wqNO4pu0yP8XLecazJ0lc/glPZ+kdlq2dNIp09Gu21C5UN43ey4
	 T0NWuuyVVK2237mTYba4bH9HpENPk5nvoWTH20eLo4Bz4gV/Ww8aujKLjJSEJchH7g
	 ccInlcRBgZrGph4r/p0Vo0LDkV4iRaxOlWHnlifVUUwLOaHbt/xv/uf8lHYyu7NdhL
	 A5V4OLc5c534w==
Date: Thu, 2 Jul 2026 16:15:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Neo Chang <YLCHANG2@nuvoton.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, robh@kernel.org,
	krzk+dt@kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
	neo.chang70@gmail.com, kchsu0@nuvoton.com, sjlin0@nuvoton.com
Subject: Re: [PATCH v5 2/2] ASoC: codecs: nau8360: Add support for NAU83G60
 amplifier
Message-ID: <66ce56eb-95b9-4915-8658-a1e4d1eacd7f@sirena.org.uk>
References: <20260630021510.821919-1-YLCHANG2@nuvoton.com>
 <20260630021510.821919-3-YLCHANG2@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mQW7vruDQ/SLpDT9"
Content-Disposition: inline
In-Reply-To: <20260630021510.821919-3-YLCHANG2@nuvoton.com>
X-Cookie: Reactor error - core dumped!


--mQW7vruDQ/SLpDT9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 30, 2026 at 10:15:10AM +0800, Neo Chang wrote:
> Add support for the Nuvoton NAU83G60 audio codec. The NAU83G60 is a
> stereo 30W+30W smart amplifier with an integrated low-latency
> Advanced Audio DSP.

> +static const char *const tdm_data_length[] = { "16", "32" };
> +
> +static const char *const tdm_pdm_length[] = { "16", "32" };
> +
> +static const char *const tdm_data_n_length[] = { "8", "16" };

I would expect TDM to be configured by set_tdm_slot() from the machine
driver, not from userspace.  I see the driver does actually have a
set_tdm_slot() operation...

> +static int nau8360_read_device_properties(struct nau8360 *nau8360)
> +{

> +	ret = device_property_string_array_count(dev, "firmware-name");
> +	if (ret != NAU8360_DSP_FW_NUM) {
> +		dev_err(dev, "Missing or invalid firmware-name property in DT\n");
> +		return -EINVAL;
> +	}

> +static int nau8360_i2c_probe(struct i2c_client *i2c)
> +{

> +	ret = nau8360_read_device_properties(nau8360);
> +	if (ret)
> +		return ret;

This will fail the probe if we fail to read firmware-name from the DT so
the firmware name is a required property in DT (and ACPI systems will
have fun) even though it is not marked as such.  Either the driver needs
to tolerate not having the name configured one way or another or the
property needs to be mandatory in the bindings.

--mQW7vruDQ/SLpDT9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpGgIoACgkQJNaLcl1U
h9BtWgf/QSDMFRpRqoSYBjr7BcwBumFKqGVUqarsVAQTF/nbjDmHEnlq3F1IaFMm
jzPTQb50/VIMYe+VqQDzWFwQSwN0CiE4u7G5MoACeuxbOlQeHY1updgnQt/qkZtw
VM0Dntgb/AlusMlFld4FgXLiQzGMcpUSLc3Ek+4oNyEwDJk8ti1fX9W0nQ9Ja3xA
1lsCtJ8aSVGt0TwkT5Qe0XbxetmuNz6WkJArRVfAK3rH+p0TGp3K7uABjr6vjXG5
AizWn+pU/bcBm/D+wYl26SUg4RgnScGE2aEqQjkT1xl7JDrfuIup+b0r4fxrOZyR
le7/6mDUyoTfGv8BTTMMbj929UdUTA==
=1M6t
-----END PGP SIGNATURE-----

--mQW7vruDQ/SLpDT9--
