Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE57B72634
	for <linux-sound@vger.kernel.org>; Thu, 21 Aug 2025 19:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755804647; cv=none; b=GNXCieWV0conguXl8qXz96N7HrhJa8uGDkl8r0+KboQTeE+TGK5FvmRB2AIiaYf0viSqXOkBJg3qSievr7XY90zNjXtG1gOXjqzxK+VDziI6zrx+3eu+x0LhSITjw2ocxm/cE9cift7lLlTO6uUL+B8p78kfZDmgdGLqFC1HeXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755804647; c=relaxed/simple;
	bh=qOtYYU5DnAi3h88Dlu/1yK7RrxeKt61Hb/3IUjxfT0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mbWAcUDK2rSQCbCKUNe7D/DCHxSibugWLEEy4o146VcR/tTZsFx/TeWXq39mMXS5Hr25qEN0keR9ghJFSvnsy3f5O8nX+jhVDdh0fCp7Ep3aO+/hEFrx7AKZjPjdEfxTeWV5QQAcUp4i3MZ+mBfvTaocqGbSgJ+1HX4ePRro/OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cnd6mGVF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cnd6mGVF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D2D1C4CEEB;
	Thu, 21 Aug 2025 19:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755804647;
	bh=qOtYYU5DnAi3h88Dlu/1yK7RrxeKt61Hb/3IUjxfT0Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cnd6mGVFk3u84kJXHaYjH24LBU+FPVKixLsLue89ZEi10BTu+3geQBLmXdDRe89rP
	 epSGFwk+kWzZi40lBJ885bbP6DYpZlbWdrDozzbNl/VAqeSAT6XVvz/WYaPc1ck2Jz
	 otSZH/0vE7+qm/nt/JqkhQalEX/Sa8gqTWuASNTvcuF72yyUSsYZ3hL5KhL6hvXhsp
	 xoHuKo6cN0UM9UiS2M/ON3UMr/720ysQttQHtcKgvadMsm0CIDc95xbSJmEof5GFvI
	 3n5RNCawStKEOgQO64RQu8VV2vB20whSX4qT9s43QGgyX9k6o4MGUcXYEj5ZhEoEOE
	 dncoOLnLmfpqQ==
Date: Thu, 21 Aug 2025 20:30:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.17-rc2
Message-ID: <7bf6bc8a-ffb9-464e-9fbd-b06030af9044@sirena.org.uk>
References: <66897958e77c5e8fe5cdbbad27fcc725.broonie@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OwmDKqVDnAtZDGGn"
Content-Disposition: inline
In-Reply-To: <66897958e77c5e8fe5cdbbad27fcc725.broonie@kernel.org>
X-Cookie: Warp 7 -- It's a law we can live with.


--OwmDKqVDnAtZDGGn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 08:20:41PM +0100, Mark Brown wrote:
> The following changes since commit c17b750b3ad9f45f2b6f7e6f7f4679844244f0=
b9:
>=20
>   Linux 6.17-rc2 (2025-08-17 15:22:10 -0700)
>=20
> are available in the Git repository at:

Sorry, my script didn't cope with me sending this to you on a different
machine to my usual one - it only checked for things being in Linus'
tree, not yours.  I've fixed that now.

--OwmDKqVDnAtZDGGn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAminc+IACgkQJNaLcl1U
h9DHHAf+NELq5rzM8HbA0RKsccJE2WtEYWuLLxRlLQckq367hddxVx1suj/2lrpw
JBCwpqW25D0bZWLBtt0oLwDk5qdCBJ00BuiQNlAtZH1AbocJ8D2sQZZhgUatBoOT
fmW4u6MrnvXcxjOG8bPsl/FSuebobUjSQW27je9biv25AbHGVr0uJVHmhOeCNvj3
e7JXKGDwKpZS/WFYKCteQid+fPuIqPBKtpM5cvlL+F+129Uot2rxMAMrunB7x0T9
FDOtKc6y5kI/diy0FsHuDrxpilk5clf5qrI+4g7QC6wqdt35++xvu9SUOkfvP4VL
+hrn9XzbAzNlyQhGlqWYWo9hVKUAjQ==
=JTUE
-----END PGP SIGNATURE-----

--OwmDKqVDnAtZDGGn--
