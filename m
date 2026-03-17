Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4772C2FFDE3;
	Tue, 17 Mar 2026 15:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773761877; cv=none; b=uGR74dEtqxSiNeqjh56MWrOcYdyUnz3vy8AKTReXWAghMNbgLvR1QZqH4HvWoW02VOiUq+3xJlkiILfDQHQOrtvnkMN5nGRO/t9eDzoglxYXMBjL2uR/Lrj3r5jKfL1eIRl5aY5NXktNk2c2inmQCLoRIntbHW32T5WdeIhl2To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773761877; c=relaxed/simple;
	bh=DcWDoPOQi8OWycAsnbaXUva+OhLKC9WXzF54eDNcDtM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tijVTIDP5CgLxLaXkMdBHufjPy7clqyEExRXUiNw7vrm9CfzSkvx9m2R0kaMkl65xcbhOehYxBhCkGuaj496et+AEOqR/tjwwhJgFFb0oIWZbRsUrOifFKX95r11vUfugJqZKQW2vdj0pxcYUWEv494NHjw98m7Hq7YGJEKBZE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EBRsMi4S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EBRsMi4S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 312E5C4CEF7;
	Tue, 17 Mar 2026 15:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773761877;
	bh=DcWDoPOQi8OWycAsnbaXUva+OhLKC9WXzF54eDNcDtM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EBRsMi4SUpUIVymolaQ7bAUTc58oEIWATPG3W8IDnunWYD2p/O4mmZLarUC1gORun
	 hUjrM8garSrRxUvPdhnpE35VxwC7UAs0kLDzoNbt5h5REhUMlXSN0wWMHmj/fTWNXh
	 aRtwlsgdp+312YCC0xbTIjyw4Ue5VfL48V6qzCvMZAJQRdkgz9SaWN3oQIbmJ9zmye
	 shERz/LRLPNmtaEtMJmVyOgSIJNE29KKllYpXlYmrSvp1aJoYtpL5v57u4aAs2m+QQ
	 xEseqTgQl6r9MkMZJue+g2KQzCpWFeNvqAOlalmXToGpdqNexfe5oWlP9xjigiCnFr
	 jvKmU/Nuet+GA==
Date: Tue, 17 Mar 2026 15:37:53 +0000
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH 00/10] ASoC: wm_adsp: Some improvements to firmware file
 search
Message-ID: <e9fc894a-4183-4d22-a9d7-6ad05167abe0@sirena.org.uk>
References: <20260310141817.1871794-1-rf@opensource.cirrus.com>
 <70c45f75-7ccb-476b-8646-3896181a2569@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sa945wqYn6aK3Hx1"
Content-Disposition: inline
In-Reply-To: <70c45f75-7ccb-476b-8646-3896181a2569@sirena.org.uk>
X-Cookie: 98% lean.


--sa945wqYn6aK3Hx1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 13, 2026 at 02:58:13PM +0000, Mark Brown wrote:
> On Tue, Mar 10, 2026 at 02:18:07PM +0000, Richard Fitzgerald wrote:

> > This series makes some improvements to the code that searches for firmware
> > files.

> > Patch 1 is a trivial patch to remove an unused function argument, before
> >    adding any new code that uses this API.

> > Patches 2..4 add KUnit testing to prove that the subsequent changes don't
> >    break anything.

> > The remaining patches remove duplicated code and clean up some of the
> > implementation.

> Actually I'm seeing failures with this running on arm64, they were
> missed by my testing due to issues with KUnit in -rc1, looking at this
> clearly a lot of the problems are knock on results of an initial failure:

Any updates on getting this fixed?

--sa945wqYn6aK3Hx1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm5dVAACgkQJNaLcl1U
h9D+rAf/eJtQdR4ksbkEhNm3Mmj3Cr10Zo5uT/3gXH9vxOjQvq61AxSlWIQgnDTX
y+pyQeOzD4R3q8IBC/aRAfmG9BV1wmwjph8aI1a3pRX3ogFwWBfHV8Zp9WhKMBb6
cyUd4FvdI9RnJbkUPscMH4QtxWd0pAHphW0pLDAdHMkB5LtbD8XEoJocYvtNyaOG
RWWgSLz6A+Z9rAHBc906FTZ5BfqxCNPLpuVNSxSfjRGGP35YEFIYBtBGobxFoso7
5nRUbkyPXnbIerv3tTBk0D68QK+l+jdQ0STbA0rYdtqOu0kV8q46VuNlmE03L04l
q5Ch9GscnDIqINuaO7Ea64m/hgKhXw==
=7SVC
-----END PGP SIGNATURE-----

--sa945wqYn6aK3Hx1--
