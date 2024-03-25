Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A2F8836
	for <linux-sound@vger.kernel.org>; Mon, 25 Mar 2024 22:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711406953; cv=none; b=gic1pVnopTg2j05IKKB0n/xKY/FXrFx/iMbGy1ltoSUlVvPek5xOWmyaz/ckOkuhg3uGD8y+fWUqQZgHMZ2eN2vTqt2OG7d5FoQ3z0vYvKDLqebFUiXYMtESSyx1lxlqz1tUQFu1gdwS5++RSpTLa4TTSeiyxaBVPNWC/dWQo7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711406953; c=relaxed/simple;
	bh=j5QIHPHRdNPGCUAt2I/D/pju3UaGGamlyiXm1vob6Vo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gasrKegv39kHRjwR0U8N51FMWSnipGLOvymITmZFwAZN+ejsM2uGNjrV41LBoD38N0BjkLhyA6d9t1mIOnHkkmEOZagAJcXQ863Cx7ZLrVTdVCV6RflzhJ7ib+S9mvWHBEtbvUIyVx3Rejru3cHY46x5Y29K/mHdfxoajIgf4pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZO8UcII5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZO8UcII5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C889CC433C7;
	Mon, 25 Mar 2024 22:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711406953;
	bh=j5QIHPHRdNPGCUAt2I/D/pju3UaGGamlyiXm1vob6Vo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZO8UcII5wtl7nM5TdOwMLKgNWkRgDYHyvG8nUZVCFhWNTzEV4cKEFYGIfxbdamrhR
	 qjri35hpItnkYqurAER9RUQDTpfzbfelz5NIRhpu9AemBkuciNItfQJFW0gdCiQVLv
	 dufWifWKbgY3qwc73DXBQw5T9KAFx4T1mQgLN5j3BWfAsgwG4AVayH9omqFosFPMvE
	 Z9iMaYRiJeYfIteFBEhvo7flqIqxlYV9D1VRRjxqoQP5mGzpv32qPWZJAAiFPJPGO1
	 wqy+4Rsi9EPcRSE+nxQ6hWDPVn+bMN84e/4wlPVPxX7AuZOLYQdB4BBjHaD2S5TK8/
	 5M8VS/uxCWf0A==
Date: Mon, 25 Mar 2024 22:49:09 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.de,
	Shuming Fan <shumingf@realtek.com>,
	Derek Fang <derek.fang@realtek.com>, Jack Yu <jack.yu@realtek.com>
Subject: Re: [PATCH 0/6] ASoC: rt-sdw: fix locking and improve error logs
Message-ID: <5f39e69c-00ce-4436-ad4c-3edcfcc00e62@sirena.org.uk>
References: <20240325221817.206465-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Sy8oTdvmjq+l7VNK"
Content-Disposition: inline
In-Reply-To: <20240325221817.206465-1-pierre-louis.bossart@linux.intel.com>
X-Cookie: Evil isn't all bad.


--Sy8oTdvmjq+l7VNK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 25, 2024 at 05:18:11PM -0500, Pierre-Louis Bossart wrote:
> Fix a set of problematic locking sequences and update error messages,
> tested on SOF/SoundWire platforms.
>=20
> Pierre-Louis Bossart (6):
>   ASoC: rt5682-sdw: fix locking sequence
>   ASoC: rt711-sdca: fix locking sequence
>   ASoC: rt711-sdw: fix locking sequence
>   ASoC: rt712-sdca-sdw: fix locking sequence
>   ASoC: rt722-sdca-sdw: fix locking sequence
>   ASoC: rt-sdw*: add __func__ to all error logs

Copying some of the Realtek people for review.

--Sy8oTdvmjq+l7VNK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmYB/2QACgkQJNaLcl1U
h9BbdAf/Rlmx+L1L98ocIYTDmFklZGo9WLJH92hXP3EDW6n41XfRAqsJoBKfpZ59
h8FLDtUYchrMGqWiHnuEU/1fE+4+OzcBM2R5zxTucMMdR2e9N9PmaVQVW25pVBQH
nSX9wA5qogWzXzbAdjGeO7/r5woUiTDTvMayBY+MrP35cWRD21ymlT95iV+2y4mv
o0Zj3pul3PD4D4X1+T4+f5lGUVHr3VYse0AuiR/WniO8+lBoXtJZzsnQWXYvHgaP
79G/RjYt/03/VErhyV9sG7W0ge0sPAlrSh86vvfomVx8Jd+3jR+gjXORIGk1AmRc
hrcF0UKzAiDqIOt3M6jXpXPvTiW9gA==
=Zgpw
-----END PGP SIGNATURE-----

--Sy8oTdvmjq+l7VNK--
