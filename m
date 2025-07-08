Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6757E0FF
	for <linux-sound@vger.kernel.org>; Tue,  8 Jul 2025 14:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751983908; cv=none; b=hZNRU5PTBVtvxXOxcVd4fLpnlVeAdmaNxidwLndInolwtkFeTiHgQOfaf6PU6wBbj9PWuSnUMXbfm7oWfDYJkyCbYJRD+RApk1E4aUgjF/Pdo07IX96XtRmV91z59kRRa9hGobiz3fh+/xD1UHpfW+FFn8CkRcwvoUBd00rLD+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751983908; c=relaxed/simple;
	bh=/QDOgzYXzxDzBxnPOgUAwFpi12MVVHTqyiUCUgkJfdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=khSewaIL09YaY9ety7bj/TF8Ceeqs8uevL/TWUe3+y2QR6tbSphUORsQ9jph8G1JoRbI4h9VemF3ytYc24IiO1yvO3hDJCxD/PfWVkxiWRdgZtXyLy/ZarGo/5QY5WJ3VHAuBGcbbTj/jflnqdOqOZNLAjV0vYILt9ytdOSb8+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cqShu1z8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cqShu1z8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79612C4CEED;
	Tue,  8 Jul 2025 14:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751983907;
	bh=/QDOgzYXzxDzBxnPOgUAwFpi12MVVHTqyiUCUgkJfdE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cqShu1z8y/umTRtwbjsTyCw4pVz2PKjsZqSgpNr6JW2WDdYU/TRdJR7miaGd57nCv
	 4m7haI+xz7PdtjHxSzAXRmUcJV2wYuL3SxlaKW2Rpxn5YzpwmMAI+udt1D6tal729N
	 UaQhQN3hM4vUYxBL5Fa9bo2UqDsIIrkYb5oC8iNOLL6UpFIymnZ9sxJ0JJ6LwfWFUa
	 Y19G7gzuKgKHXRuecUxTFqLLnlE/qfOMpiAT1nOf+6zCXWWE9/gxPz03n67X3qtQcZ
	 VLD9nLa4AgYcK6PQgieL3KF3vSdLeKRJpNqqzavkZsQ5xPdbYO12REfWRsp13AWlWU
	 URsWe9MwX790g==
Date: Tue, 8 Jul 2025 15:11:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org
Subject: Re: Question: how dapm should looks like ?
Message-ID: <aG0la8cJJ3mEVUXX@finisterre.sirena.org.uk>
References: <87tt3nmork.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ho1JUzufOdJAgegg"
Content-Disposition: inline
In-Reply-To: <87tt3nmork.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Do not cut switchbacks.


--ho1JUzufOdJAgegg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 08, 2025 at 01:53:35AM +0000, Kuninori Morimoto wrote:

> "dapm" itself is hidden into soc-dapm, non-dapm can't directly access to =
it,
> but it provides access functions anyway. Should it be accessed from Card
> and Component only ? or can user driver access to it ?

It should just be cards and components I think, I can't think of an
example where you'd want a DAPM independently of those.

> Pattern-A:
> 	User driver should care about existence of "dapm".
> 	This means user driver can use snd_soc_dapm_xxx() functions directly.
>=20
> 	-- user driver --
> 	dapm =3D snd_soc_component_to_dapm(component);
>=20
> 	snd_soc_dapm_xxx(dapm, xxx);

I think we've got cases where you want to do things directly, the most
common is updating pin states based on something and then needing to
trigger a resync based on the new states.

> Pattern-C:
> 	User driver should *not* care about existence of "dapm",
> 	but can use snd_soc_dapm_xxx() functions.

It's probably easier to use A than to have two sets of identical wrapper
functions I think, less effort and a bit more direct.

--ho1JUzufOdJAgegg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhtJxYACgkQJNaLcl1U
h9CDkAf9GVAPBGb5lPDnMoLnGHfduumCMAGkurFUVTtaQUziDJR+WnPmlqn0k2yH
/tQhUIkEiKaXF8yw5zJtFb9dHhD+zoLkyIuu0u1phDK+KoLRfQ06q9kNBKmRKRdf
SUrEmSX4VS10L2kwSNLGR39yfac7zYgk/JuF/q9IGh1BOsanCxDY+66iyQHYrIBk
l4gvEYNqESHVu3LmCWaJD0292FsXdhPgCQ4z62sd3zm4onjy4h5CcGSMsPc+sK2l
WLA7W0Kf4huCWM/whXGRJpQgPCo/fI2Dl6I53ohZ9qdu1wL6y52nTDCFFRk/mEnM
afcadLHgJhSydMRKRtxv+MnSkk/4Pw==
=DvED
-----END PGP SIGNATURE-----

--ho1JUzufOdJAgegg--
