Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2005F18D
	for <linux-sound@vger.kernel.org>; Sun,  4 May 2025 00:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746317356; cv=none; b=qq3QQiI9t6o+Ba58ckEKpjhOqaRuEQlTmrNpbqweYFl8sKyaqKStU9DLH/nua0hJTPBclNux0WqCWRe9cBpakyGlDI0Zn01j2PEvwByWJxTqcOSJYhPtrH8pGobfi/15rYtNkW36HYBmszCRCjVVMhp66GbIRjCm/2IgTDJqDFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746317356; c=relaxed/simple;
	bh=c/dTQfZNDjF0Jx+hHNgXbO6ij3o7HMvb1phzNKAs7M0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j4jebZwl5IcSRNZHqhg3bZgSQe4iBbs/39eLoIsesqf+ZGPJbLDZYrcyzhPS4x1TdmHgJLx8NNiCatjbove61AoLUcLGvrUTNggqjZgzm/dtZXsObFF1sPd6OhsFR+cE1wt9k9lAXd/ymt8Y0YXjRXl+3N0A8S2WCXXO/NARheg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S/e20Z5p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S/e20Z5p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 324BFC4CEE3;
	Sun,  4 May 2025 00:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746317355;
	bh=c/dTQfZNDjF0Jx+hHNgXbO6ij3o7HMvb1phzNKAs7M0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S/e20Z5pyRuNGWOw0mrFLNg4wewlUVxz1Pcbz/KOe9zTo+DOVBJEMpsKggRAAapvi
	 0EP+o8Gsbmm7jkLIPL4wfns/C5Edhem9wjs59otY3qgKileFoMeQFwOwy6AMyfdyRo
	 +S5ukTZgJzxTAVG75SfxszD+xsGOe/AEOSqxcSF39WArk8msvcMQFfNGEEr1bCLPxF
	 1SbEkSK0svReBQLDZLDgL6ubPfjo+OR0MQtjW9naDZZd3O710uki6t4JiYXP8zw9EO
	 X/uanfbcoC9pIa2RG0RFXMLiSu75ES6Td04oVcMQHeadbowsPpKmTglzBVfJVhn/Xe
	 8TNy9/Cff0r4A==
Date: Sun, 4 May 2025 09:09:11 +0900
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
	peter.ujfalusi@linux.intel.com, ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.dev,
	Vijendar.Mukunda@amd.com, linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH 2/2] ASoC: Intel: sof_sdw: Don't bother to set platform
 string
Message-ID: <aBawJxaiReagn596@finisterre.sirena.org.uk>
References: <20250429093931.343725-1-ckeepax@opensource.cirrus.com>
 <20250429093931.343725-2-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RhYHfH+vd+mQbLGA"
Content-Disposition: inline
In-Reply-To: <20250429093931.343725-2-ckeepax@opensource.cirrus.com>
X-Cookie: Well begun is half done.


--RhYHfH+vd+mQbLGA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 10:39:31AM +0100, Charles Keepax wrote:
> The static platform_component name string is overwritten on card tear
> down which will cause a NULL check on it to fail when the driver is
> reprobed. However, it turns out that the ASoC core sets this string for
> all topology systems anyway (after the aforementioned NULL check). So
> there is no need for the machine driver to set the platform at all,
> replace all the platform_component stuff with some simple place holders.
>=20
> Fixes: 52db12d193d4 ("ASoC: Intel: boards: add sof_sdw machine driver")

Similarly here, this seems like more of a cleanup?

--RhYHfH+vd+mQbLGA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgWsCYACgkQJNaLcl1U
h9BU5wf+O5G7+tVktKKgaMA9qfi8def2T9w36Vz9QdRbIiC8GxTUszwVuHuuYGOn
9jf8W9QwyX8dTDUFhl/2W0eqZkFJaX8jQbnoh+qY15/TTQ15ovehD8m6ys5iQGMh
a/fLMlkeOnKOg6dRLAiDSG3i4CqKbpuFoqhFzNcU20+UJejFaZaqyaoRH0vYmh4V
E1Wd5iYmxcsNynFYtJR9fifqQG0wXeB8NSJ0BeUoVK00B4x5TpQfMbAAk7kJStSs
/hZaKTVN9YEAQxz8R3VyzpvFAHndqu6FWIakXC3Tt0F/5kPFCbfk+h3EMotqLz3A
SBGaP1v0aOAh9jWF6BG42lEW9nHSlw==
=MYgD
-----END PGP SIGNATURE-----

--RhYHfH+vd+mQbLGA--
