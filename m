Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED43F1917FB;
	Mon,  2 Feb 2026 12:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770036278; cv=none; b=O5Np/qIBPyHSt8F017+LqQzg7y2hsHBx1B2QjQ1Kzv0NGpdlg53FFmBZFwQYGOdZBHt5lzRpHi18gd4arhT+7mIlGktxoY16pj3sTWyFql9U/sajIY3EMXLJrXbUqWhs8yd+K215U9+hBxDuDfivRD84U9xhudOJ3UAa9NC4iSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770036278; c=relaxed/simple;
	bh=iLQeNN8IcMEsjV5bPdM892YRjlDrXIr2bXD6/BnXeyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M8DJddeEX9Zx3cO6IHbHC7yaRvJZ77F8MAK9s6D1jIH1sXG6koxVSzzbept0Z3aORzgbnBmcmGYQamlRUx88RLhEM127FLgqdQhwXtK4hs2+jWsaSLGl1R3a+PXkZKq3bZy+ip38ZrzlmMUTQ/dj1POuwmtTRIvRHxcc9kLY664=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z2ckIvrr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z2ckIvrr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53D40C116C6;
	Mon,  2 Feb 2026 12:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770036277;
	bh=iLQeNN8IcMEsjV5bPdM892YRjlDrXIr2bXD6/BnXeyA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z2ckIvrr+CFquNMzY3h0iDGdxZfFc1ayRjRnUU2pXBBgYxC2zhfZCo7CtxpBbhLMr
	 MJmERb/v8lOqwNdNS1JWRBOWLBpuB6ctYazIiMKdXPMm23TOhlOrHmNEtso8gRf1wX
	 JtBb+IFuHTLtX9VdrA+Z75cCXafu83wfmW4qnEADR7Rw5vRlVz7748/A5S598YqZWy
	 LR+hVmkyBzxBQ7Tpil8HmhqnFmpHlMPEZSvudOy8HyQB48Kcdngy+yeCzv3yI8MCWB
	 Yu1j0LPnKgjSrz0ntrzxU05i4pBapGyhODBA+WhMRRHIAwEXEHHjc/aivMdVLjPW9T
	 aPQdXwmuKpGQA==
Date: Mon, 2 Feb 2026 12:44:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Sen Wang <sen@ti.com>
Cc: peter.ujfalusi@gmail.com, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: sound: davinci-mcasp: Add optional
 properties for asynchronous mode
Message-ID: <fb52b67a-0772-4fbe-b720-6bdedcde1a6f@sirena.org.uk>
References: <20260130051045.1898892-1-sen@ti.com>
 <20260130051045.1898892-2-sen@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Tmr80pVyDyUeu6h/"
Content-Disposition: inline
In-Reply-To: <20260130051045.1898892-2-sen@ti.com>
X-Cookie: Bedfellows make strange politicians.


--Tmr80pVyDyUeu6h/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 29, 2026 at 11:10:41PM -0600, Sen Wang wrote:
> McASP supports the independent configuration of TX & RX clk and frame
> sync registers. By default, the driver is configured in synchronous mode
> where RX clock generator is disabled and it uses transmit clock signals as
> bit clock and frame sync. Therefore add optional properties needed for
> asynchronous mode.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--Tmr80pVyDyUeu6h/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmAnC8ACgkQJNaLcl1U
h9BaBQf/d+zKOLa/jXFPI/X5w8JQ+mWnE6T+IgnVst1FcJP//2o5wdbSjgN2QTTY
F6La11y2Zb8YxMY++NyT6cYJbtEpzqsd7pdtW0Fk9PsRCufOgJB3DQoP2lur8PNo
+4WVKSVsXC0WFgRLualAwPfPvtWDPpY9hja21g9F+dS7othZNIQulI8oAWYa0OH2
V9VjqcK8Kte8iBJrzIzBIW6zIayFVF/PVchxnTUSbMGTrFyZpY+axbgbqVGeOPvu
pQUued4ZV38d6UzLNPqpg+IlRdFe/aWVyMqtc5ixKnFNjrmcTfMuSyumOD6Eea/O
RXFN13F+sfeMFdBRPAeHQWKYyKkLgw==
=bxi2
-----END PGP SIGNATURE-----

--Tmr80pVyDyUeu6h/--
