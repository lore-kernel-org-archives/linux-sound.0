Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B1F2AE90
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 08:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752135342; cv=none; b=Rj2TU+uNgNkl2HKJ9AXrMueNU/ETyKv39LzMda+B89JyTXvuu7hxHCeyFh2TZXjXPN8LV/hkBUQmDi6bGJeVpz60x0vIBqLBVwaLuOmg9rDrHTdG99FoTFO+wfCJaNQ8aJXzlxncdAy1tGfYTtqjOM5F/IJbMryMHWH2fBJ0TFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752135342; c=relaxed/simple;
	bh=kS2HsRQdlTqP2HLk5X1XbLJJ6aT0UfqEfCtvUDkEKr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EavZCgGPsVctvVOzYGqJsrWRcm9i7WecaRzbiLcZFgb8YCBuXLWNXQm2sYeFhcSceWrNJuEmwcOcxgZ+S/a5UJwVFanttU6sTBiScGYFPiTlHbk/afuKB7vW48s8eYubL9+3Og6INlNjaUopXtaximqik13th+lk79d3QBVeYrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BvJmla0K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BvJmla0K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B90FC4CEF4;
	Thu, 10 Jul 2025 08:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752135341;
	bh=kS2HsRQdlTqP2HLk5X1XbLJJ6aT0UfqEfCtvUDkEKr4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BvJmla0KF2YRB5OLnr77hcG3nS6zNCkptVnD7rScXNg61LJK0N7J/uBFx3/9u0aIj
	 wDYTKPZzSPgQC6AinX974XoMnl0+TGe0KWa5j+OAz4iRrcIe4FHq+AYMparDME8WjY
	 6/7lPCea6/VPbQNicYg+/6It5R0Et2oS7Pk3Dr5vrm0ORq+k5k7CR0cHMDUN5NMnkK
	 zBFeRkccZhJZ9w7GOyo6gAD5O3Khl5ZkPnHZwVQ5jMSa3M43IusKb5POtRzHRZR3BU
	 9xbpkhAMhyP9U3rNXaeY9SSUlEQr93HjoyvaR+e7et0WjBepCSUGrmkj23K901iwo9
	 2GHOe8i8lGGEA==
Date: Thu, 10 Jul 2025 09:15:38 +0100
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>, tiwai@suse.de,
	linux-sound@vger.kernel.org, pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: Re: [PATCH] ASoC: sdw_utils: Add missed component_name strings for
 speaker amps
Message-ID: <aG92qly54Xx2j82I@finisterre.sirena.org.uk>
References: <20250709025745.1285788-1-yung-chuan.liao@linux.intel.com>
 <aG5vmbWvHyKllpdQ@finisterre.sirena.org.uk>
 <831a87a8-1244-4f21-83d1-29d7dd8ea9cc@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6rTibncybc0n+Z61"
Content-Disposition: inline
In-Reply-To: <831a87a8-1244-4f21-83d1-29d7dd8ea9cc@linux.intel.com>
X-Cookie: Do not cut switchbacks.


--6rTibncybc0n+Z61
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 09, 2025 at 07:22:42PM +0300, P=E9ter Ujfalusi wrote:
> On 09/07/2025 16:33, Mark Brown wrote:

> > Why is this tagged as a stable fix when the fixed commit is in for-6.17
> > rather than Linus' tree?

> Sorry, my bad, I assumed that the original patch is already for 6.16 and
> forgot to confirm this.

> Should we re-send w/o the Fixes tag?

No, it's fine.

--6rTibncybc0n+Z61
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhvdqkACgkQJNaLcl1U
h9B7jgf9HU/IsippzodNJbx/JeU+hvFfe9sG/3aXsQftf3Jol/ldzsq6S55MByTK
SLO4Lo7WMQtt2kPIXmDLGLZ7D0Ok2Q1eKKqbMhNgivuffafwulqOd2BV0Lz/gONc
Nd3V1TD94xyWj88He8EQTLG+KK5K5muSc0+DZxcqCFG0L1QnGkCTK/aB7SssSuDr
JN4F1PCodQHZCKaTvb3Vg9ZULcMMVhilE5rpGvEW0hhsiYLggRADBW8eFZbO3x3L
eDIfViVb8zxXCeYneSj+m1k3YWTLWuhb5hvOQu3hPYayp4yMbWGIJe5Tmiix8gE0
KI41J+D4JE/f5yzQpCHr5fYlJymkfA==
=FPVG
-----END PGP SIGNATURE-----

--6rTibncybc0n+Z61--
