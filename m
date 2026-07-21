Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54CD46D540;
	Tue, 21 Jul 2026 17:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784655381; cv=none; b=qxR5DWRSKRzDKUo5Vdk04uqvI5mKjkPsFVcQg18y5qpZtc+xjxknHDwdxEq8WXjXVVGyAe2NxTShfuncMa0Nctk3j/BGi2mip9mL8l2DGFJbQKLixXxF64tGsf+SAcrRBrhmo698b9SwaC/OV9443yY9WjUDNR8dvoptjlEKKYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784655381; c=relaxed/simple;
	bh=W1Wbti/eZeoH2m5F7paszjg0q59sg2jpyOAOlcXv4Rs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jqJnh2W6tKIEqUE2J+8X5i7eHHHZIrQstXz90BBGJvwtCeWRH6GYtZA4eStJuwTee05aYeESOL5NiEFQ0GWnKAx72a7TZv+1uAWwGKCDmZ9CLIjmOaQPwpCKepUxpcmy1/iRuy3ThnmTsVmzIMqUI0PrxYe+dwpnHYS5mIBtZ9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TE013IIN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TE013IIN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAAB91F000E9;
	Tue, 21 Jul 2026 17:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784655380;
	bh=W1Wbti/eZeoH2m5F7paszjg0q59sg2jpyOAOlcXv4Rs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TE013IINdy4BoqVu//qxeLt6W/JikUMmkGnvSAICVV2CFKECo1rjIsyMzCmI3vep+
	 Qi0s6bw7xDPUmcgyJJAMiu2/gBxQxCzcVKfnA8t6KlJyjXvaAuoOazSwLhe/G7burl
	 klPsVdL5JoNeaSXkGacdMvP3ig11uQ+W0lRSAKZT8ZySaO/5aEQTWyk9B+glytbFT3
	 0k9Opt56R6ldsTsjAw+poM+qmmTHw0CEBjE6QRE/LE6hplWJLJx6zPgirDOHztDSZi
	 vRzKhWv15ePGI0ZAh9sqGbJ8mwZJY33rD2YtuwUAndjE7qfo/KYEDjNG6ofOta7R9e
	 +fOnitNxM7WJA==
Date: Tue, 21 Jul 2026 18:36:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	CuerdOS Dev Team <cuerdoslinux@proton.me>
Subject: Re: [PATCH] ASoC: amd: yc: Add DMI quirk for HP Victus Laptop
 16-e1xxx
Message-ID: <0a9f07ef-cae2-4344-98be-fd14108c9455@sirena.org.uk>
References: <20260720095120.521112-1-zhangheng@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="B66ijxhjzExghBya"
Content-Disposition: inline
In-Reply-To: <20260720095120.521112-1-zhangheng@kylinos.cn>
X-Cookie: Love America -- or give it back.


--B66ijxhjzExghBya
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 20, 2026 at 05:51:20PM +0800, Zhang Heng wrote:
> From: CuerdOS Dev Team <cuerdoslinux@proton.me>

> Reviewed-by: Zhang Heng <zhangheng@kylinos.cn>
> Reported-by: CuerdOS Dev Team <cuerdoslinux@proton.me>
> Signed-off-by: CuerdOS Dev Team <cuerdoslinux@proton.me>

You've not provided a Signed-off-by for this so I can't do anything with
it, please see Documentation/process/submitting-patches.rst for details
on what this is and why it's important.

--B66ijxhjzExghBya
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpfrhAACgkQJNaLcl1U
h9DHOwf/bYZ50eQ9GrSyOQpXtnZX5OUUNbDyIs+KBS+Uq0h4EmNjRc8XMGKDmNN1
W+U4ihy4yrHOcjkZHnZ9otxIs2PZCrggKYEeP/J68If2kIXlBI2Z7CerlpX90OSV
+k/+6xOsWXST3UmFWRRnC9hkMxNoUbpx1HmrxEOS42VOl+NmrbkNPAmYBJ+kbT20
tvYFyiDnOgXDWDTxr2qX7BOFmP8B/z6+DMI5npKgD/lloa2NS6hsNhBwz6aPix52
LBOLojaunYqLi4eozU4FQc4miZ/B1LwR4ok1NXpT/NUNCa7Y0NF4i0uzwmJKhcVI
v2iMLDLvGI2QR8qq8mN9skloUS9nJw==
=kCn6
-----END PGP SIGNATURE-----

--B66ijxhjzExghBya--
