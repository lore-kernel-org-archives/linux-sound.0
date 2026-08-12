Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8DB2931DE;
	Wed, 12 Aug 2026 16:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786550426; cv=none; b=bXZ4lszkZpYFDeuQJ2IEYvRJeD4ptVYYWOolX2IHDmdN4qQ/n3ZP/Oxvj2iTX3eLspen1JWLk6wRnDNqJt8y0IcX7CFC5FS3TsiG37YxTBXBNIqDcALaxWRhuRBOrwPoMZTb6efHhq2cxNy5Fl+c4WEns/E9+C097KBwB/UM4QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786550426; c=relaxed/simple;
	bh=VInwIXZeneChOmpgwSAQu6NGBKqoR0QovL9vQUm1oL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AbrHQlp2y8K8iGAZFESXMOt9bT8PDqUYc9148oS4JZVpNEPAXiz+5AGwTW+zlfHllhwjM8Jke/rD4C8iu/17JsphJGmpZ2CPfbLv6gg093wFIkNHsVjx1T18JNMcRe/9E6wLOGCOn6SL8jblFK3RlQioqc3hiHnFaZG9KcrJr4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kZtE0YPp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kZtE0YPp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E60A51F000E9;
	Wed, 12 Aug 2026 16:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786550424;
	bh=AnM5hs9FlU5v7SuFbE9pl67y2MZ9opEc0+D8ijJ/D68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kZtE0YPpkIcO4l0q2BQHb9PWBaO+v5moGJ+S9Ng0nvSGpHVSKqoP0NUZM7Q7U0vWW
	 m2lf5i1ApZ78MfWpgYul+JE+rANKtPaG2eSISSfSKu3+BllkVY0K6AufaAUN2+iWsc
	 K6wB52JAtWymZCIPsI8mVUAsy7cAkMCbmJKH4023f/XuWY4uxdhi2eI2vsKoJQTdC8
	 tToj41xk3k2jDL2f5F6Z5kS8vrnWg9Oczddxo0F8qOXtzwqlSD4z6FS6yeWcKDm29e
	 dNWKajT9PThs6HUiNpQ0bPAYbtx/UHVZNCkcZASivi/tqYvi5a5p9nHl7xiOYvc9sR
	 bAvBohxO3Vnyw==
Date: Wed, 12 Aug 2026 17:00:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Michal Simek <michal.simek@amd.com>
Cc: Rosen Penev <rosenp@gmail.com>, linux-sound@vger.kernel.org,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv2] ASoC: xilinx: formatter_pcm: use more devm in probe
Message-ID: <d56927e9-6679-460a-a452-161614fec0bf@sirena.org.uk>
References: <20260811185013.26960-1-rosenp@gmail.com>
 <647a44e4-babe-4858-84de-ad26b6711ba2@amd.com>
 <c22c308d-ce38-4327-a9d9-19ea995584e5@sirena.org.uk>
 <8ef668c5-e66b-4750-9fb9-54d8025a9c90@amd.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3VE6C5Dw+QpIeR15"
Content-Disposition: inline
In-Reply-To: <8ef668c5-e66b-4750-9fb9-54d8025a9c90@amd.com>
X-Cookie: !07/11 PDP a ni deppart m'I  !pleH


--3VE6C5Dw+QpIeR15
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 12, 2026 at 01:22:33PM +0200, Michal Simek wrote:
> On 8/12/26 12:16, Mark Brown wrote:

> > Please delete unneeded context from mails when replying.  Doing this
> > makes it much easier to find your reply in the message, helping ensure
> > it won't be missed by people scrolling through the irrelevant quoted
> > material.

> Do you mean patch content in this case?

Yes, we don't need the entire patch (especially not with the only
comment being added at the very end of the mail).

--3VE6C5Dw+QpIeR15
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp8mJMACgkQJNaLcl1U
h9BKlgf/Sx8cq+KhhJUMDgpwEmcOgSSqbMMGpyMyeQGAJvINHGZnkNxeJuoKCvQp
IC+g/vcbsAlD25/y4bPSL/e35PODdVE7ZvwsQgxZNojLNpOdyYKZVRrL1ugwB0pb
g9qGb67+u/T2CbufqheV4hVz+07z3ueKyH6MaR8mq4Hl0P2St1xBQVQvuhCrKIGa
jplhxYyiMmL42IYU50CZsXjRPJDWZcOieV4o40XWFnTaVMVLwFGoR5uFFRUpjAbJ
OIzF70tpA0gyfnfR3hSCCQHhRVCsXPxp9JWu6N5k9jUfHaNvUh+fjUFn89SARi2C
+rMEk14Afl60Swcmv2O0/04V8LlJ/Q==
=0E6j
-----END PGP SIGNATURE-----

--3VE6C5Dw+QpIeR15--
