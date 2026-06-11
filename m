Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984B6287246;
	Thu, 11 Jun 2026 19:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781206068; cv=none; b=KPP1klI+yGAJrh4jbcKW5/YYxaYO+kK2XEBLpYJiGJB6n5km9eFipwunVlGCZDV8R2HGM3zxwoaRgo91iJonVjXJgi0wyBwJyy6Vb/iiIsj9D9EhY4rJ4ZYSBdO6fVptp7aJa2SFhTetOZTfXSkkXUfVO5BhnmIHwz+ywwNOj/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781206068; c=relaxed/simple;
	bh=wgDfhN4OaNCVmhLaMEKlh6qv1FEUuaKMop9pJhJlML4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fVv+9IPtErxH9slCmZFV5T4lr4S538Ny7Ywg711AtcBqubyspz/MnORhKobDZ1CEtIz2z7fFDvPJgF6WM+xXNLvra+/uqBNPJKxHSDvNJZ2nv6RIm2M4gLRCxDvmVXzRyf+UI3UppNxMkQQgbdB/7MjDuY4Ylal4LlfahPjhzWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qo1E864n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qo1E864n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B10A51F000E9;
	Thu, 11 Jun 2026 19:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781206067;
	bh=nWNnEK1f37dYbYQr/TcH3+rLjAE7k0Aw8wHyvnWk+r8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Qo1E864nE2muUSDGGwWYr1KQz8IGx8fuvCF7bpiK4iYV6khcuIJwbkn2+p35PeStp
	 0d+lrzIg14fN+0xb8BXdpsg2orggD+Oc6TX5RQrqVdmaXWRRKNmJvRv5wXbkZGb1Is
	 uIHm0DQcthBnzSdI431V1XP+xU5iBdqMZiOA7dQ2T7VSMsR6+ROEpzUshPpe80REAT
	 3SUQ2EWj4hkVtAMVwf5P4M82ZXBjEM0FzWim5LRPpR0lutWg8jh9mL/0uYQdNgisiL
	 TQvwp8O/uUP2O9BVRKQ2WQaRRPO74rInVIuj4CVNfJNd8binth+yseDf9qHMYBgbac
	 r+ZAWNDQHJi3A==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 860C21AC56C9; Thu, 11 Jun 2026 20:20:05 +0100 (BST)
Date: Thu, 11 Jun 2026 20:20:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: SOF: Intel: select SND_SOC_SDW_UTILS=y from
 SND_SOC_SOF_HDA_GENERIC=y
Message-ID: <aisKZSMIFRkfsE4I@sirena.co.uk>
References: <20260611132310.137688-1-arnd@kernel.org>
 <airEQ7ER7jUF3SQ_@sirena.co.uk>
 <c216893d-0548-42ac-8a3b-4be397a79fc7@app.fastmail.com>
 <aisEr9qmav5i23CY@sirena.co.uk>
 <f6da5fc4-31cb-439c-8416-b47627ad45ce@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FXfPzlKUjP5kuVqX"
Content-Disposition: inline
In-Reply-To: <f6da5fc4-31cb-439c-8416-b47627ad45ce@app.fastmail.com>
X-Cookie: Leave no stone unturned.


--FXfPzlKUjP5kuVqX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 11, 2026 at 09:18:08PM +0200, Arnd Bergmann wrote:
> On Thu, Jun 11, 2026, at 20:55, Mark Brown wrote:

> > I think

> >   SND_SOC_SOF_SKYLAKE=y
> >   SND_SOC_SOF_LUNARLAKE=m
> >   SOUNDWIRE=m

> > Skylake doesn't have Soundwire but does select the Intel stuff.  I
> > didn't test though.

> I can't get that to enable SND_SOC_SDW_UTILS, that would
> require SND_SOC_SOF_INTEL_SOUNDWIRE to be enabled, but that in
> turn has

>       depends on !(SOUNDWIRE=m && SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE=y)

> which seems sufficient to prevent the link failure.

Oh, good.  In any case I already queued the patches for CI, I guess if
other stuff comes up before there's a bigger change we can fix that
incrementally.

--FXfPzlKUjP5kuVqX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmorCmQACgkQJNaLcl1U
h9CswAf/Roa3Gk3FqHEI9JZanTouy3TCHVRTVQBblpHAhKk93JYM57WMRHvlX4LC
WRcj+P6yCQ6zB2kJ2eUytDaFFq5P9eA2p5LXq41kejDkZvxjJGmLUxrRobpadc9m
vpVDacBtapCfUYq6DTnsQpHQW7P3gbSbvr+YUVvbK97rao5X56c2t7urRIyb9SMx
YXZH60Ixsz6lZJ40qvJC2rLA3gJYbn0LmP+djXst0IAp8zZEu30ox12bOlQP3n8q
KipN5TlVbGhhzdLardaH/GnJ2yeb4ehhUQhWgqvkQSMFxJ3xBwtKBwmc6FzVkV5e
dOzKVksCSS2fVFQmzqcFOzlIxK42Wg==
=4oJ+
-----END PGP SIGNATURE-----

--FXfPzlKUjP5kuVqX--
