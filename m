Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA04A1BC2F
	for <linux-sound@vger.kernel.org>; Wed, 29 May 2024 13:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716990781; cv=none; b=R3ww2uoLshnJL9I3Ccm6YHehQZjY8sJ5LWTY6KMI/whkNQDWPFhFGt10YMmPGTYLc8xbLtmV6ehcAaMFr5oeM4ra/UpHEHcXn6G0/IHPD889PFuj0Y5qg/cKSZhQnL3Q8bg3bnKjDweazb6U5vFmtO1wSFCdnjk6Eq/DNEkVlKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716990781; c=relaxed/simple;
	bh=N7RX0E2Uz0bxNfAlUMr2oeT2Rubv+nDLAPfzQVXt+n0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pD3nXrsuV1TzlKpfaeURu6OeG3/DkctbG+Ccmx2PR0R6ofR/F/aG9SzOlpZWxcLqYcZ/j1PdgX9goF+OyeZkcaN1phTfwPYNo4svgsE32uGITkEAsUAnME3l0y3dd7jIvGWeauaPl5cOMVSFYvgdeYQJmq5J1Nd65vt9NlB04Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gOF+fC6w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gOF+fC6w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3D9EC113CC;
	Wed, 29 May 2024 13:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716990781;
	bh=N7RX0E2Uz0bxNfAlUMr2oeT2Rubv+nDLAPfzQVXt+n0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gOF+fC6w3HKmbbkIQo+U+YCldpQFKudYlRHglAM+8059WMl74wRe4M9VY1JjNz2lF
	 2SO0Ji3C6lMXBcRviqEL345gpUarJPRc4l+KbE5q8eS9c+4gEjYMSysNCYrqN+R/IV
	 ciAYKAndqvyTjg/V6uNYoh7P3SOCerKNR0J/NB1YkzYmCrUCrkWpEZGqkyMf25Q7Oc
	 p9xYZ7z4tuDFvN7gCMzhPRiGER0DMZZt7Y2ztzuF/m7jsoglXXM0WXPBOw1yENZATg
	 epDX54iJPPNkL8gDowKF0KHCjBLaaPViKA0+xoNLhXO3f5tNBYo2CSs+9CUUq2cTrI
	 CNPi9mi9MwVVg==
Date: Wed, 29 May 2024 14:52:56 +0100
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com, seppo.ingalsuo@linux.intel.com
Subject: Re: [PATCH] ASoC: SOF: ipc4-topology: Add support for NHLT with
 16-bit only DMIC blob
Message-ID: <d511ac5f-8f3a-4dc0-8cd9-e2ea7a43a28e@sirena.org.uk>
References: <20240516075611.18018-1-peter.ujfalusi@linux.intel.com>
 <d4c5e7a3-710b-4ff1-95a3-395dd780fed3@linux.intel.com>
 <3a7fa9d4-dd14-4b29-b977-3ba9c5b4ade7@sirena.org.uk>
 <53897d0f-1796-4823-9090-a51320c655a4@linux.intel.com>
 <cc7fc8b7-d470-4330-8cb5-6ba85065c74d@sirena.org.uk>
 <80498cd3-609b-4ec0-aedc-3ef6d4bde408@linux.intel.com>
 <cec50849-66ac-4557-856c-a6a423c118f6@sirena.org.uk>
 <acd6b6f2-710f-43c2-8666-77ac64dee6fa@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AYicWQWXq9YXNap/"
Content-Disposition: inline
In-Reply-To: <acd6b6f2-710f-43c2-8666-77ac64dee6fa@linux.intel.com>
X-Cookie: Everybody gets free BORSCHT!


--AYicWQWXq9YXNap/
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 29, 2024 at 04:49:01PM +0300, P=E9ter Ujfalusi wrote:
> On 29/05/2024 16:36, Mark Brown wrote:

> > In any case, if you're going to send a series for 6.10 I guess I'll
> > leave it for now.

> Should I include this patch to the series for 6.10 or wait until this
> patch is available somewhere that I can base my series on?

Like I say I'll leave things for now so please resend along with
everything else.

--AYicWQWXq9YXNap/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZXMzgACgkQJNaLcl1U
h9DNCQf9FLrgIq2SP/NZMHF+WAyNHHFQhrGU/ImaxOBq4tZmLxlyJeKDW+efCYUs
0ZQ91BiPAyfoxV3q41T7pBHsxxrNRDvCmolOZ2Sr+vhJEo5nIaNByukQ6K/ysH3Z
2eN9Ksx/V1yuOvP5PupsmJS7bMw+E6lX9qoeZ41hA9VMurnNh/V8UuXHXSlRTcgY
TnUSib5yhIobeJEREmmPmybvXbo2/pSKmJTtcfVx+Bj6yevMgvR0ngCoaXh4K5gx
IZiP39OerycbuN8wRlZoFQyigPDutWLbTJ9toFHODzE3g72tptyyyNrR9iBShxGI
Lk2G+b9wdbwIz//5lhChpjvqOb43NQ==
=8arp
-----END PGP SIGNATURE-----

--AYicWQWXq9YXNap/--
