Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD193CB54B;
	Wed,  5 Aug 2026 17:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785950620; cv=none; b=oJkTtrpIKVljA1sMSwtd3FEnINtHhjYJhEHnkpKPdJHD5a3FNOjwVIcuwAuq2IOC5WwGhd+Dv9p3eZRdt70cPnMoTPxcqn3KSRpEqVAY7cz+Ddhwj/kiT0OOqYpYzZBxauXCHbt4gGLpkyg/4LtlrY1uGVGCF6gZFV4ey8ks09w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785950620; c=relaxed/simple;
	bh=dVwcVE7szZQBGbeecBIbTkbI1LleS/kLOF76X5s63WI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cccpc2A6xFSXPqtHDRM8Xuacs+9O7Yz+zKc1MYLDY56vwdiL92THWX/2DJ480NeZbQUyX6LH2+W7WE7j7KPi/kfTVI7KXj+7fMkAYrFlzD9ahvuuzKUBGPeygflkc+ephdgoa2wvp5FEQVvWob9YmJ+5TIYsY0jQncB55T7D/WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mfID6vC8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mfID6vC8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6090F1F000E9;
	Wed,  5 Aug 2026 17:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785950618;
	bh=dVwcVE7szZQBGbeecBIbTkbI1LleS/kLOF76X5s63WI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mfID6vC8yagXOa00vQ8c75D0UAT+9BwBfhVSTWJ0rV50QGB+M/2pe1M+/aHH7kzPG
	 //Jgv5XsfroagF5l3jYP4SeP+Ij20vmHwnV6yo772US2IFG46/iFCRLPSvnqYU0YIs
	 wrmPUPiJt78vsCVvZ5d3cMlUeUzjfahY1sSF+G9czOvU8Pem6wFoyV7dIVV2tqi6S1
	 dYYoXpUpUlk8H9AHnYgwfIsWQRTslEPHuXl/wlIzK5hVQIt+SsVhto16t2oekvFUNg
	 h/vkM1Z5autAviJGE7s2SnSehDx+h+M9OlES5/h+XipkMnDa7B/FAPSpDsJeKliRMt
	 l7VAijpNcVs9A==
Date: Wed, 5 Aug 2026 18:23:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: core: Support INPUT and OUTPUT DAPM widgets in DT
Message-ID: <f2b01744-69d1-429d-bffc-db0e571665f9@sirena.org.uk>
References: <20260805145625.1290628-1-ivo.g.dimitrov.75@gmail.com>
 <1cddd05b-804b-4d91-a5ff-7c5e07903610@sirena.org.uk>
 <ec5b015a-30b7-4e59-80af-f18da69e4240@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UKitRZz/VKM9NN4z"
Content-Disposition: inline
In-Reply-To: <ec5b015a-30b7-4e59-80af-f18da69e4240@gmail.com>
X-Cookie: Stop ahead.


--UKitRZz/VKM9NN4z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 05, 2026 at 08:16:10PM +0300, Ivaylo Dimitrov wrote:

> I have an out-of-tree audio-graph-card2 based machine description for
> Motorola OMAP4 devices using the CPCAP codec together with an external modem
> codec. Without modelling the remote endpoint as a DAPM INPUT/OUTPUT widget,
> the DAPM graph is incomplete and one side of the codec-to-codec link does
> not become active as expected, so runtime PM does not resume one of the
> devices in the link during a call.

Why is it appropriate that the remote endpoint be a raw widget of this
non-specific type?

> I used INPUT/OUTPUT because they appear to be the generic DAPM endpoint
> widgets for this type of digital connection. If there is a more appropriate
> existing widget type for modelling such a remote DAI endpoint, I'd be happy
> to use that instead.

If it's a DAI to DAI link you need a custom machine driver, we don't
have anything like the infrastructure to put DAI<->DAI links in DT.
These should be using AIF widgets.

--UKitRZz/VKM9NN4z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpzcZMACgkQJNaLcl1U
h9Awugf/W5JAYcXnVniwCko0L3e/FgNuAID2y0N0pgiV0f+r423U7XOKKrBpxV6/
wN6zWfExPL9C0LiZQGAQ8Rk4GPG0pDiJ9Rg576Vuq9vSTiNPp5T/AEAVXlW3noBF
qlNXIqvAuSsUBDV5k9cX54S+x9lZXpvdTAu8cYQMGAwSveDMFcyRWi+GXZGHg4f/
WDFDKXiAM3UyXdmuM/NgBNLmZFQ1ZHAv8I89UMkH13a3s7rM4DQqgLtWIne5lXnM
g+U60wiQAaiwXnp2pt6Nzx7bMZr2tjo5mMfY7IyK6kCygJtoIHjgKIYWNgo6AzXc
KY2F7AqwVT4yM8w4QylIIsHYI+rFzA==
=6hPv
-----END PGP SIGNATURE-----

--UKitRZz/VKM9NN4z--
