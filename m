Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01FF364949;
	Tue, 14 Jul 2026 10:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784024463; cv=none; b=W7yaviNuYjmOS1K0OpduA8CTHKJz0UeYMXbURwgfeGfqjRBH8xi4jM6p0bHhwszk+rDeBfzu5uplKYzdpTw64xd9p+orzK4xFnIbEMfJOsRlyZEYTR6iTJyM3jmyxa5OD5xhReQrkI0mGf4OcfekIUQT5disoWqbzxvHvOlgggY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784024463; c=relaxed/simple;
	bh=w0goRcsZyeEqkyOuffZiYobg4mxvOCyRv5lJz3M5s2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s89AB3FjdGC0C1iz0s69GMf8AMTji8hOqatkusLe9ecx0sfzMopy7nKBCdMVUrXFk56pfom7xuyg24v+ZBzRKjXwIwWqphdlI7xJEuABCGB2dPE1/Nr5YqXi+hqggAPb36d5/TOTqR4jiKNWnP+nt3BrP2+HgIpws1F15oEeqMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DCcDLzBU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DCcDLzBU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7234E1F000E9;
	Tue, 14 Jul 2026 10:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784024462;
	bh=9M/RXC3eOaKhkKYwY07SXTCAM7jjeRRObmHaBug2aUk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DCcDLzBUE6xt1OhcIKEHEd50/x43uoCQKKaUNbaeRbTLXui6AITrTUWLbMfK0T+xP
	 mFrAjgiEjrK8E5pMfQS9Af1+Tv+MRMU8VMyQIbhGuqF7jPx5PZkuCA2V/vsJYMtj/I
	 UeoO3uBKOfIK6hEAaPSx4AaI/fd01y3k/tK9LtPKx9mUh+BgqJaB6dJhw960bwWpbM
	 skaRQwI/nSPOzGo45rHJlEAFROmkHZJnxJURie5mo4txo35h3BscYB2+H/jf8SkNK4
	 VAgVQnpf311NaoYFCBNdqFRocJpc2O2yMHDb0ZhaPxF1plARM0UbA/xZOb6y41K3Jv
	 kgyuqa9SIBXKw==
Date: Tue, 14 Jul 2026 11:20:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	linuxppc-dev@lists.ozlabs.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Maciej Strozek <mstrozek@opensource.cirrus.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	patches@opensource.cirrus.com,
	Srinivas Kandagatla <srini@kernel.org>,
	linux-arm-msm@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH 01/14] ASoC: codecs: NeoFidelity: repair the kernel-doc
 format
Message-ID: <4eddcb03-3c2a-4ef4-8825-e750e8109476@sirena.org.uk>
References: <20260714014445.569992-1-rdunlap@infradead.org>
 <20260714014445.569992-2-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LGa1tIjMTkLV9u70"
Content-Disposition: inline
In-Reply-To: <20260714014445.569992-2-rdunlap@infradead.org>
X-Cookie: Neutrinos have bad breadth.


--LGa1tIjMTkLV9u70
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 13, 2026 at 06:44:32PM -0700, Randy Dunlap wrote:
> Don't use "/**" for a non-kernel-doc comment.
> Use kernel-doc notation to document the parameters and return value of
> ntpfw_load().

As mentioned in submitting-patches.rst when submitting a patch series
you should supply a cover letter for that patch series which describes
the overall content of the series.  This helps people understand what
they are looking at and how things fit together.

--LGa1tIjMTkLV9u70
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpWDYgACgkQJNaLcl1U
h9CVsAf8DYSsoTawAK2saA5CV7XtmqI34Bf8Nt3udzbI78JyZVSFG6QZ6KZMp8uB
OPWQixu2JlJ86SaHr3y4xPWCqDqY95ZrOW645UbdHTvaoHA9FnbnQUuaN/KM5zjF
hoL2KXnw+4WRLiwouO2TwC8OMzHT7TIxzFVv/xCLCma2qhZCHXxvnzwflJAl7mnx
yG5Nv7AVj8goa1ANV9a03TvZ4JSMk3EH5wFRiANYMIimhf6fQ0LX/CGkUr/Ogv6v
xJ5NjE9GQ4QDad2ZNtUuYUqTh8+EyGfRz/63NuqVyMah/2tph3ckFeHa4G1RCNZM
GF7nWmHmheXvdaQTs4xuyi+8yEwo6A==
=bdq4
-----END PGP SIGNATURE-----

--LGa1tIjMTkLV9u70--
