Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6D7388E60
	for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 18:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786557922; cv=none; b=D/WCaEHAbs/pQkstK9molBdPmVJk6AyhxPyCC+zKeV+JQ6U3vhuXRzPiLTJcxOmzbWE6vxiiYnJV1tNAUaB5z1YHC2SvUeGIJhc+oCg5xWVqwW6OEK114lX4EQ2fuqjzZ8BcaZcqpd95PQ0s42bHAU+bWgpXpDCo8jAzM7GdLJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786557922; c=relaxed/simple;
	bh=Wfp2Ncc5P6EsWwyVimWbPm3qVKIukfdgcc0KfP6wYJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RAh2EfCSx04LdNAXfvZHhq1Fjd+opW4tbamrFQY67bRjIIb4oY5FNDbnX4hlatXnfvI/wR8CvEKALBbT1SLjh3sECE2ShXUsjX6xcBnPzR2bpBkJWEhvylcqYWV/D8ZbDhJX64DPr9K0Ny5yhs2jODC8FmhbHGWjW86g7D6/mmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fwTtBSkl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fwTtBSkl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9777C1F00A3A;
	Wed, 12 Aug 2026 18:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786557920;
	bh=Wfp2Ncc5P6EsWwyVimWbPm3qVKIukfdgcc0KfP6wYJ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fwTtBSkld6IsVslyZztNIViSfYtdBLuIqViD7ycKxAG9DNq7uJn2rcee8v75k1z2N
	 3XT+RnQDNvWEh2KG7KHZxdZ4sp0AulUT6JL/mZDno10sWspUAiYDzE6+ffO6hgUkv6
	 IWuE0r11IH0YRy4nf/b3ggNt3Jpxbu9tTd8hExKlXGGjc1AO5v8ikQv6OYF/Eu9afu
	 djJTGa4OODwAqyNHPEreeQQpiDI6sJ8WLASYjH4Tuc1ERcl7FE47KTt/n9GPVROZ5t
	 OAc2FdFBkOivKlKnmQF1QlNGUjFa/+4aNs4aqHDE7Ysx+jfYhHMEbMDBjytN4tP6Sz
	 8M1wy/fwITKIw==
Date: Wed, 12 Aug 2026 19:05:16 +0100
From: Mark Brown <broonie@kernel.org>
To: qianghua wang <qianghua.wang@senarytech.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.dev,
	yung-chuan.liao@linux.intel.com, liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com, kai.vehmanen@linux.intel.com,
	cezary.rojewski@intel.com, bo.liu@senarytech.com
Subject: Re: [PATCH 0/3] ASoC: add Senary SN624x SoundWire SDCA support
Message-ID: <bcd3758c-c7a5-4387-9a35-c14a572a8eb8@sirena.org.uk>
References: <cover.1786511177.git.qianghua.wang@senarytech.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="InBOTYAKehVs5+FM"
Content-Disposition: inline
In-Reply-To: <cover.1786511177.git.qianghua.wang@senarytech.com>
X-Cookie: !07/11 PDP a ni deppart m'I  !pleH


--InBOTYAKehVs5+FM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 12, 2026 at 02:59:41PM +0800, qianghua wang wrote:
> From: "qianghua.wang" <qianghua.wang@senarytech.com>
>=20
> This series adds SoundWire SDCA support for Senary SN624x
> multi-function codecs (jack, speaker amp, DMIC) on Intel Panther Lake.

This doesn't apply against current code, please check and resend.

--InBOTYAKehVs5+FM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp8tdsACgkQJNaLcl1U
h9DeKgf+NA6B4NJr25mL5l9COBaMvaaWNzRY7r3us23Wpk7N+PIUaqa9QsdpntmH
VnyydyhAOeCvinJ4B2eNUGX3lTFgAJLS3AILK73Pl5dlcNaJ6e6lr8Jovts4OWs+
KzcloglQZLaNIWWKmk/sWgyylyc9Sm3x6nF+up/RxrJpWyvguKOa/Lj4g9dhFc/g
fWDQKRjJ74HXUQ0/b6baJcqyIzK6UyeeAOPukfPs6hwVAsMoNp1GP1lGE73pucN1
JsfLgDvdV6OwhyeCUfT1l8H8pCX5iS5n2N8LUdQlb/Fva7RjvG36i82x3WLiIbhX
YtghaKb/4Zh27V00cetTm7EBMqHm8A==
=0tHq
-----END PGP SIGNATURE-----

--InBOTYAKehVs5+FM--
