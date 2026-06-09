Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7152047DF9D;
	Tue,  9 Jun 2026 17:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781026160; cv=none; b=Qscmh+fIVCj9V26C5+32Y063YDSkn5Jgwn1YNXh2yo2Rw8h7mdDINhlSLhtxKgZ4JOsRahtPFUe0IzUcUaOYUmK22mTrLJGAQ/0ndTkljPUHM5IvzT4gpT2GGeTX0qyNK5drvGahXPOuBnVoB6OyAziU6HcANLDfmQG6ABauCPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781026160; c=relaxed/simple;
	bh=PAfT0LQGhFOTF5uNcD/t+kOX6r9lWlh/fUwr8g3Csh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lfyDFfFMF8io/7TYIvy3Jea0e/glZlhYrpzIn7a8fHVPSk0f1EIF0sPTW+NXnVsGNjnuCDh8Xrk8yLvLozOHs+xc8TLJTQzMFzA0M5IxjRI7ytuOYcT9H085b5Ly1fCkhMW1qQb1RbbKR0CIVVoedmmDfLGr6oZTzyPy6SIAF5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SvboXlrG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SvboXlrG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECE3E1F00893;
	Tue,  9 Jun 2026 17:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781026159;
	bh=PAfT0LQGhFOTF5uNcD/t+kOX6r9lWlh/fUwr8g3Csh4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SvboXlrGZuruN6PxedZ7iLSJorYCP6LFPiL9xSsPKpAC5TlBHBzAAH9hTmOmpYeI7
	 Bhf2/pQgvYDBbCSzOA0JhjiT0bG73BlbiVaJn9d/nlUdDnMZCMXRof9DtmIApLu7du
	 AnLvoFdic8DLhjiYIMFVj8+4Lebswhl0SAH2tsi9upeTO+W1cEj8H87luQPWatOZsQ
	 FTiJ74sEkmTUm3vrlDU8THDE6/1Ig8fXNkx9sZe/V5RbVjBtblnRqFx2DqK3wHELg/
	 qt2yRbJFCqlRmxzJ0PjCsAgEPJpmof59dK7ymQb8wpG+UYvtj1L1iy9ekLXQag0dhw
	 V/eEBIVq8EWvA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 833C41AC56B3; Tue, 09 Jun 2026 18:29:16 +0100 (BST)
Date: Tue, 9 Jun 2026 18:29:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH 0/2] ASoC: cs35l56: Fix some cleanup memory leaks
Message-ID: <aihNbERb1gjlWrtB@sirena.co.uk>
References: <20260609120738.284770-1-rf@opensource.cirrus.com>
 <f8866e44-b1a5-4bd5-afbe-5e7615794850@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="O1JLGotq/KsV8uTc"
Content-Disposition: inline
In-Reply-To: <f8866e44-b1a5-4bd5-afbe-5e7615794850@opensource.cirrus.com>
X-Cookie: Leave no stone unturned.


--O1JLGotq/KsV8uTc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 09, 2026 at 02:02:51PM +0100, Richard Fitzgerald wrote:

> Sashiko doesn't like these, so ignore them and I'll look at its
> complaints and do a V2.

FWIW it's not gospel, and in particular if it's a preexisting issue
while it's obviously good to fix them I'm not going to block something
for it unless there's some really special reason.

--O1JLGotq/KsV8uTc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmooTWsACgkQJNaLcl1U
h9CdQAf8DZ36qRaToAvnMufVPVz1ynZ/BFKGo9jeSGYqFxpv75xi3dijEd2ZqaqO
xYzerchJ83CorUjo7Q0ZYAOZPiu0ojc8oNv4wL1CS+5HWXALUdoDpxSYbtrqkmXL
kDq0eT1vEg2xR8JArwzruTMs47hRTaBZTVYUmPgdDHd3Cyn3eT7oscWivJoBcAym
BWeP5PGQRGre09NGO8vOTBHS6ZERpbhb46PvwlJ3w3pd9k8EZ+7rfBC7B8G1DH6K
Up78VP9qV9wBqjjIYPeu1rXLiRo6R/g9EKx7qEEYQTml3ZJ9nSJ5G+9AI0bOgY6D
X2n+PYZKLgcrq2NAyqPiFMTyZAXpPQ==
=4/zM
-----END PGP SIGNATURE-----

--O1JLGotq/KsV8uTc--
