Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F462C17A0
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 12:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749559619; cv=none; b=fxH6Ixi8XTjtG+MNn/V+AOivigHxshhdpTEVDXezogbgvSClcvjGM7UCZlaX03vE0hNQby0Jkhu/pXWa98w0lCPEYDsaSGeGAoNXvsk6vPbKBktnO5tZAg66hITWsvLbMNb0feDkdmyK6UL5nnbk5tiYElAEFPXg6mMAjIbpays=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749559619; c=relaxed/simple;
	bh=0Ao78xTvYcp2mX0VpMvQFffsRbSnXFb/4TqPYor1H3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hncXM8kNi4lewzZABgI4i1eMGkVm7dC5amuo7PUj1YaGoMBfY+EAmrWt7gk6T7xb+VuDZsHCG7lJNYqn2JQlJLJ8rH12zy+moiMVm1wJJawyxNQ3OY5voMYExuJvcHWWC0q9ZNQVsSPioQeK56RIJnRh9G/UTGQSFEYhJXYnyOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ltC1SiRY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ltC1SiRY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2C5EC4CEF1;
	Tue, 10 Jun 2025 12:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749559618;
	bh=0Ao78xTvYcp2mX0VpMvQFffsRbSnXFb/4TqPYor1H3s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ltC1SiRYAJONvzBbQzJhGPQgInf2fNY0OSCHEwcMU6nOdjsUSg1rnw1HO65lc/e7a
	 jUqJNt4mpfrXesu+zPZT11AODHhmrcYM5GtZ0VfAbqBcn2oo3yLreRRNZOrLUBIXt4
	 Thhmr4IlHXYyZ8+q5+kEmc6X0ostU9IEScwOIYArAFBMMv+RWcGiejemj7/3LeOtw8
	 lBHuOuApLr7rcqWuWZWvznZYZfgRMd0mcWrxls2VsawrFp3WrE/7FUqexpMZOkurq1
	 6JgMsyAHtJmU4gLQTeXMWGHL2mwahQsu7AEY18OuOvfTiDOwSETuDLqi4jbg3yra40
	 OPmbavApJj9Dw==
Date: Tue, 10 Jun 2025 13:46:54 +0100
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 00/37] ASoC: Standardize ASoC menu
Message-ID: <08c118aa-5aee-4eac-8d9f-2821fc2bb970@sirena.org.uk>
References: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
 <5835adae-5dc6-4896-ae04-690ac6893f02@linux.intel.com>
 <cbef2f84-9f83-4cf0-87b3-39173099d136@sirena.org.uk>
 <11029ccf-5128-4fe8-bef8-9fd6de316e37@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HP2fFSGJn+YyxZH5"
Content-Disposition: inline
In-Reply-To: <11029ccf-5128-4fe8-bef8-9fd6de316e37@linux.intel.com>
X-Cookie: When in doubt, follow your heart.


--HP2fFSGJn+YyxZH5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 03:35:09PM +0300, P=E9ter Ujfalusi wrote:
> On 10/06/2025 14:07, Mark Brown wrote:
> > On Tue, Jun 10, 2025 at 11:51:41AM +0300, P=E9ter Ujfalusi wrote:

> >> The other awkward thing with this change (which was awkward before, but
> >> going to be double awkwarded) is that the Intel Machine drivers will be
> >> quite detached from SOF, not visible of hinted that they are now under
> >> "ASoC support for Intel"

> > That does make things in line with other platforms, though (as you
> > mention later).  The issue I guess is to an extent that people might not
> > know that SOF is important for a given platform, prehaps it should be
> > selected by platforms that need it similarly to what we do with CODEC
> > drivers?

> At least the match modules are selected from SOF stack and if I'm not
> mistaken some or most machine driver will be selected as well, likely no
> need for users to hunt down the needed one.

> But this is the reverse I guess than what you suggest, The platform
> selects the machine driver and not the machine driver the platform(s).

Yes, that - I know I've got whatever machine sitting in front of me.

> We have generic machine drivers for SOF, used on several platforms (HDA,
> SDW as main examples).

Those are a bit different (like the generic DT cards).

> Probably this can be reversed, but touching Kconfing never goes without
> regression ;)

Indeed, it's error prone.

> >> The title already tells that this menu is for ASoC.

> > I don't have a strong opinion on that one.

> I'm not sure about this now, probably it is better to keep the 'ASoC
> support for' in case one searches for symbols? But that will show t*he
> path to the menu entry, indicating that it is ASoC.
> GPIO for example adds a postfix, some subsystems do not add the
> subsystem name in entries.

> I guess whichever looks better?

Yeah, the reason I don't have a strong opinion is that I mostly edit
=2Econfig with 'vi .config', people who actually use the UIs will have
a relevant opinion here but I don't really.

--HP2fFSGJn+YyxZH5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhIKT4ACgkQJNaLcl1U
h9DnwQf/fAKRLYqUJ+BYPdlKueTJGmgAHSM43z5ZiEo16jTai5l+OeQfdZPGwj9r
5GeDHtiBfTrO6tNXlyLfihVfoTacasE+0hR7hSV8hqAF67WT8AU5bymiFpxgekqU
mMqmK4TBGW3k3RrUqGI+p7/SCiVj9ruBuToGoN6CpRn34XcHjkMHPJqmdP1FmkVa
/OdgYfFzNC5t9PNzsKzu0u2goBMSFlaTOGTDkuOeU5n+sDnBSMN/f4V1s7YyzoGY
CiKnnsLJvlFr7ApXALEnqlOBd9EJGKrwTkkh2GOE+DbmizKm2UMsE3+uv56Q9eAR
JCVEzZyazSz65QWRHhAFbaW119Ty9A==
=Puan
-----END PGP SIGNATURE-----

--HP2fFSGJn+YyxZH5--
