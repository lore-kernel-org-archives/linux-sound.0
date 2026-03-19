Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46773ECBDD;
	Thu, 19 Mar 2026 16:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773938157; cv=none; b=gbKMQVQ5bhyxfMCv5qGYgMEdLtsIo6+49IDqra9fiVkPDT0Lix63d2O0Tv2tJK1FwsRftRMbMxom12e0xLDLTRhcWT4tB3BPZjtJEt3drB54OKHTuDq9tAMi1uq+OhUjhYTYNdZqUQ9LCSINg5f311ibSm2kEaqDUiahf0joowU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773938157; c=relaxed/simple;
	bh=xuLyGSbyOwgdVlUCcy0q/NoLEegkx56l9Nh2++9UJ3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OQEZ4+ioZ2TYIg3Q4F3y7IP2CMCXat+xgSIHt+DO2VrWK4T/NEd9ZnX+tFnBfFtBXZc0SYTG+q5PYRlbug5+cWmGedwGrkWq0BkHsDJEidi1hJFYsjw4Ctr5NTmsEplNwK8OLwr+oXAaR9bsICcKNHNmAKvMEhQKIup+PBX01O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cENiJrgT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cENiJrgT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34BD5C19424;
	Thu, 19 Mar 2026 16:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773938157;
	bh=xuLyGSbyOwgdVlUCcy0q/NoLEegkx56l9Nh2++9UJ3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cENiJrgTFqvG/r+SZ9UjYUCN+ptcQ86gcPv3BAza99qNl9iFgp3h0lAtMSRf5J/sv
	 59ZslUc0Q5P0VRJ793g03g6qR1Xt/XjiWCkjbZBSjE0/P8q9lI94t30bQ4qbeVWPkX
	 ckFeCT5C0ybFw2+IFcsI+lqTiDzkatiEpk+Y9N3Ob0bOOYeVl/H4Skwg51cru2F48r
	 +idJ4Rz4et7YhSvkg+aC4kwNMYiynXeHV416AkEl3QOLxBI3P6+DiBD/KHZdj5K7K7
	 tnAC/8ivh+i7Flym2nyGcJWVgwqgouJqxQCrNBpVbD0jvXXnBC6EJVfYv1IsMOyNk+
	 VBT7tAQg1DYSw==
Date: Thu, 19 Mar 2026 16:35:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Hasun Park <hasunpark@gmail.com>
Cc: linux-sound@vger.kernel.org, vijendar.mukunda@amd.com,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.de,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: amd: acp: add ASUS HN7306EA quirk for legacy
 SDW machine
Message-ID: <e7de2df4-66c1-4144-8bb4-31e6bdb1491e@sirena.org.uk>
References: <20260308151654.29059-4-hasunpark@gmail.com>
 <20260319163321.30326-1-hasunpark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6jemAv3Nz3oMlycq"
Content-Disposition: inline
In-Reply-To: <20260319163321.30326-1-hasunpark@gmail.com>
X-Cookie: Given my druthers, I'd druther not.


--6jemAv3Nz3oMlycq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 20, 2026 at 01:33:21AM +0900, Hasun Park wrote:
> Add a DMI quirk entry for ASUS HN7306EA in the ACP SoundWire legacy
> machine driver.
>=20
> Set driver_data to ASOC_SDW_ACP_DMIC for this board so the
> platform-specific DMIC quirk path is selected.
>=20
> Changes in v2:
> - drop RT711_JD1 since only DMIC needs quirk

Changelogs like this should go...

> Signed-off-by: Hasun Park <hasunpark@gmail.com>
> ---

=2E..after the --- here so that they can be automatically removed by
tools.  Don't worry about it here, just something to be aware of for
future submissions.

--6jemAv3Nz3oMlycq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm8JecACgkQJNaLcl1U
h9A5ZQf9Gn380qM4DtF9SWhSUgBNoqa6nA8/98NgiDecXE6125pLM8mnfMDSgJc4
CV6iyeI9nmSzg1g4ZpbklldETfMDepYWTtkpDSicAQ2fryvnDVCO7LoIF3XPvMHQ
yMCwM4RzahYNx7LasnDfj3+o7aVGNW4QqGCmu4vAYoVKmzskTZWhdh+sCDuUuKGk
HHDrcW92UeP79OSQPHV95A/TbFUbJ0qGuA4lCC89YpUgDF8ryVS2+Le5XMlpxWnI
1G5cawp04eaqGFcC3wuvskKi85+O3ufJujxp12gKYwObLwEu9o2sSMvE/MubTfBH
SkQulC/3dO094g/Cm1cl/BIxm6374Q==
=vmG3
-----END PGP SIGNATURE-----

--6jemAv3Nz3oMlycq--
