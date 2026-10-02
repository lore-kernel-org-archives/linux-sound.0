Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342FD3749F7
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 12:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790944531; cv=none; b=TpmrkQ2mJAusB5r/0wc1aYGC2WRLjxfl0rGBQ4Coj0soVbouyfA68/UsPu9F5T0y+anvbRmaUzClD4NJgR3VM5lKzqog9oN5MPI7GOEyUwDakovZTvukETgOou+fFWdtB/ouv4K2Yb/ie0ueiJC4v5J8JcqQL0aDQcJ8/pskkto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790944531; c=relaxed/simple;
	bh=eOogGp3OqzGyGsPyK4VzxRn/p3N4zRGZpeC+y3xZ1yE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h4IEx1GduFtIlTSzVfbMgWwTgBY+1sSpccmdn4vMCjqDKSZaPWXLAFat85Qj0eBbY1VxKa8lQrIo9WwfmZtgRydgoFncPyRIYD0U47DjEaROJbR9eYAM1x+jtTZfDvOThmGT6mMjj5+I6Ag0Q/XELAcDdRbZYfhzEMfQOFXZiGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m9uZK4nO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m9uZK4nO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B83801F00893;
	Fri,  2 Oct 2026 12:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790944529;
	bh=r9riRWp2jVzTJJm6AucA/1g5MVf4YA77Zu+vPY+Ol6E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m9uZK4nOdBG1/vobUCCDTtgrEZO6ABSW0TonOaLZlCh2whSClGodW1t+/+kClLr0X
	 k4KiU9uw0CwhM2ajhOCAF50HkSsOfmCiR+6ivcKourIM7lsn4NaMHWq4/Q8dCbwLC/
	 kGpnr736+NQWFkwtVeE8PVMMGH7aQUlrNSWsed+bVbEBATkXRUbw2zLpfJlN2nGe+u
	 8Gw7PFnBnMVAqG1uyG1kialz6ijS/PXALUWzzF67n+bBBzhAkKDyt33H0Mn5YGTst+
	 rNmh4e4CKfnyw9MGqAza5pBDIQftV1fr3skHVjOMWVuhfcsmYr59KZ6NkVfyrTolIq
	 ac3IbRSU0PCsQ==
Date: Fri, 2 Oct 2026 13:35:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v7.3-rc5
Message-ID: <9f499530-3b86-4c14-8245-d27507213234@sirena.org.uk>
References: <20261002115438.DD6341AC57CB@finisterre.sirena.org.uk>
 <877bk01fii.wl-tiwai@suse.de>
 <68deab21-b10e-47d5-b0f3-f533c995a87e@sirena.org.uk>
 <874if41eee.wl-tiwai@suse.de>
 <871pa81e9f.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oMsUp/GSpAoVqPRg"
Content-Disposition: inline
In-Reply-To: <871pa81e9f.wl-tiwai@suse.de>
X-Cookie: Expedience is the best teacher.


--oMsUp/GSpAoVqPRg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 02, 2026 at 02:24:44PM +0200, Takashi Iwai wrote:

> It contains lots of Morimoto-san's refactoring changes, for example.
> So they look really rather for 7.4.

Huh, something changed branches on me - that explains where the version
number update came from I think.  Resending with the correct thing
tagged.

--oMsUp/GSpAoVqPRg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq/pQ0ACgkQJNaLcl1U
h9BD4Qf/Sg2qr0BsnF2aGXrdRINtdPIxEXoBJ0lRRm5tUfEOvdpcxYgdF8Yhne43
g7vzQgPXSdV90MnFFsLT9zrNAQFI5gOqtf5ptsi2Ivijehqk5+hM3JD1ogfK7glk
6kpth46KWQ0CNVP8Dwpnel2WLny9B7yXK+vVNZyjE/r2bGglO27xFZi41A4MFEYv
zQKaSBTA8JAv5UOQEnxRVPm6WTiFm8K/bHdmg4V7mnZuO5GGaatzAPdccNg2Kwmd
LLno1VReFh+YCS4KgmleWTppM2cyQoUv9Xvn2cxPXUrl/SwY+uZirRD+XaTCmpP4
+PC8B/UCzrSYAofqyIbG6GzMvMWR2A==
=GD2/
-----END PGP SIGNATURE-----

--oMsUp/GSpAoVqPRg--
