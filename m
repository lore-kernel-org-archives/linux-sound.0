Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05DE3AE19C
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 16:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779811374; cv=none; b=qm+PvG4DBZtMwmHkU2ioR6YnWzTEaU5bi/F13nKfOuERNc9HY+0332RadPBkeH0fC1U5qv5YigrYfmayIuzMmap2ICUJepoXMtO64L0JVILav/a+IAy1fysWn2AJXqk5HqPiHAmBrUgqnaNlC1Tnu953BH9AxS2QzyrB0z5OSh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779811374; c=relaxed/simple;
	bh=oQuYNPNVnOIxWcHjB30mTiFDwvE8+OblZE7wPMenatk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=raKl+Ifx3erEMzoJ2gdHtAQ79m3uR+B9kG/oQanMvxSzZLpEhCXBre+dvYRxVat4Ib1OtwYAfkyXPxCZs+4NkgVQvjqD1yxOXWej8a0450pNfV2C7suc6ahaAe9xAUUMxNla+2pDSEqKAZ/eQ5FHW6XWQxrrAlVOvcR04OcjAr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LEe7QdTt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LEe7QdTt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2431F1F000E9;
	Tue, 26 May 2026 16:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779811372;
	bh=EtypbAXauLDqLEflTR5Iz5BG+DNZdLfZO4j4LfW+SMU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LEe7QdTt2UrValXx9JPPUfnbaGIXnrLOoP8dHwkFFxNzYLUS7eCtBubsAelJLnHWD
	 sD2HYPJ+Emw4kCqbivXK0EPi7StGao2u4D7OXn/7nuCtD76SBEizRNBU5eGD6fBRO7
	 tlpd9rzSG5AN2kHpw4gQp7raDILN9Q34T1m0dM7GncPwbVb+tNVBisH7KND8Gs6qZX
	 GYr3Txi0xM6R69UqElBHeXUN1ftk6K5m1eGg7mUq476Q3Oj8/mf0vivVoJSLcnQxG7
	 FcQQNhDMHwkOQ3pZSKw1T7LI4AT0MkEj7dqxkktC0Rk9EFCtudeUJhrOm5L9/z6bDN
	 9u3FMZSqttBlg==
Date: Tue, 26 May 2026 17:02:47 +0100
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.com,
	perex@perex.cz, amade@asmblr.net, kuninori.morimoto.gx@renesas.com,
	linux-sound@vger.kernel.org, "Liao, Bard" <bard.liao@intel.com>,
	"Vehmanen, Kai" <kai.vehmanen@intel.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Simon Trimmer <simont@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: core: Move all users to deferrable card binding
Message-ID: <2497f30d-a14b-47d1-9b87-c892d21afdf3@sirena.org.uk>
References: <20260430140752.766130-1-cezary.rojewski@intel.com>
 <01d1d642-bf24-4ef4-a30d-56884300407f@linux.intel.com>
 <5d8cbbfb-3884-4c6b-aea8-0c9a76964b3b@intel.com>
 <85045e51-e09b-44c2-9266-3e7ee72c4eb0@sirena.org.uk>
 <b5e82c43-9da1-4a12-af0e-90d4b9feef49@linux.intel.com>
 <d82fa24d-18f9-461d-8535-3266cc92fbb9@sirena.org.uk>
 <1daaad8d-8aee-4911-a24b-26db8b694cfd@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jdqe98Ze4ImxUItF"
Content-Disposition: inline
In-Reply-To: <1daaad8d-8aee-4911-a24b-26db8b694cfd@linux.intel.com>
X-Cookie: You are fairminded, just and loving.


--jdqe98Ze4ImxUItF
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2026 at 08:45:48AM +0300, P=E9ter Ujfalusi wrote:
> On 25/05/2026 18:06, Mark Brown wrote:
> > On Mon, May 25, 2026 at 03:48:36PM +0300, P=E9ter Ujfalusi wrote:

> >> It is not really the SOF CI but the users. it looks like all codecs
> >> using SDCA infra is affected and will fail to probe audio on boot.

> > Hang on, are you saying you don't test -next or my ASoC branches at all?

> We sort of test -next audio stuff in daily bases, but this would have
> not been caught if I did not happen to be debugging something on a PTL
> system with Cirrus codecs, using SDCA infra.

> We do approximately weekly merges of -next audio branches to our sof-dev
> working tree, our pending patch deficit usually pretty shallow to allow
> testing before sending them upstream (we have sof-dev-rebase branch as
> well to see them cleanly).

I see.  I was surprised that merging into sof-dev caused issues, I
thought this was coming up in CI rather than during development.

> I also think that detaching from driver defer and use internal card
> defer is a much better approach, but when majority of new PTL designs
> will be broken with no patch in sight to prepare the SDCA class stack is
> a regression.

OK, sounds like a revert is needed for the time being.  Can you send a
patch with a changelog explaining the issue please? =20

--jdqe98Ze4ImxUItF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoVxCYACgkQJNaLcl1U
h9Ap4Qf/aDrwBr3BzppWFXbJ0C4SCV5iWfB1kMtD2Z0dvKRUqZaelrqVMRETZ+/+
BNzpItNAZKY5iReWONlaHjZtAhSvtD7VpuArlorFgSj/FrqLLivQNDUyh3JYXOTg
s9RvAzv3SAZKF8UmB9YfW7isqsTOknbwoSO8erLLLh8yhoc3in8dx35gKFRhZ1n0
MpSKKKc0OJQQCkJwpgd+xMlTAzcB7jJepLWo2YOcmwdWXPQYOwt1k4lUiBT9PPHX
AzilZMwo+YGuHF+pqiGGMXBJsqrobLHq0uOIAVXN51LAzhr8lR6/9/LUJwqu9tw1
aOVRXF/gkWpgqdein5uKd5qD1hzC0A==
=wXTu
-----END PGP SIGNATURE-----

--jdqe98Ze4ImxUItF--
