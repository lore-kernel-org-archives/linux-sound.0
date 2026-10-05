Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F0C48A8AC
	for <linux-sound@vger.kernel.org>; Mon,  5 Oct 2026 13:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791207012; cv=none; b=WbHFe9X8KhUAs5nGWO2qYe9dA545ZVPN62jqraW26Y27QubMvHjOUXeh6A4Z8+kNtWZpOBzNic4pgMbtd65zHIe9/os5Ctb1gUy/u7QThn0gBF/gO+ghFJyhjpuiM1322iNReUVee59VSpMqGvaCBqDrMpqonwu1MyKcMzObCF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791207012; c=relaxed/simple;
	bh=vS14B8EZi+7YDjL18Ia4bCgwUN1oNL82xVZTzdjs0Kw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CnaCGStTNzAiiZcV17Wr3sAKNQK/CsWFNByCDdacsKSKIwk8Vo4iH47Wria3FNHwMFFn9bbRV2VUykQfWt6WkNVhimNxdQERWEDHlJFoUrL+/61MCWpaB0lmbQYtPRw8FZpr5Bs2nOAzUjYnp0ytJqmIS33CeFVJRfe/DWwZnKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EVASh7ec; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EVASh7ec"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 089F11F0089A;
	Mon,  5 Oct 2026 13:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791207010;
	bh=DtLfgCUs3mCWzz0PW+yBivZvG4YY71l7ZQTtSa3cJC0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EVASh7ecGMG1XvBh/7fvAzEWoW4pWT4K1rmv4zGnTLvCQE6758mxoke7+81C2zSy9
	 WWCM2py+DV61J+0S7rOmvydDgKJF8s6wRQmKhVTXe96Z3F8Ono+rK/u3cKQ3nFtqfu
	 fd1Pm4Rb+6VXlqzouAP9/EFuzqT6w0lZW1GMM+rm0TTSPglJs+1rM7iCkHNfDH8f2U
	 X4VhCT6H0H9/i9TWnO+zRzceZVb1Trrcz8QD+o2Nlct6wYFgrKYzYypB7RrCOPdoZ2
	 nMinUjAtqKrj4sBaVb/jbNhXC+A+G1L4RaoK+FewAHU1hSaGtyL+5guu8TozLc9U8H
	 YrDr3CrD496zA==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id C2DA216147E5; Mon, 05 Oct 2026 14:30:06 +0100 (BST)
Date: Mon, 5 Oct 2026 15:30:06 +0200
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, Arun Raghavan <arun@accosted.net>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Vinod Koul <vkoul@kernel.org>
Subject: Re: Linux-audio BoF at Linux Plumbers Conference?
Message-ID: <asOmXmcvVsd7H9XW@sirena.org.uk>
References: <871pbsnce8.wl-tiwai@suse.de>
 <5f459099-4364-46f9-a3b4-1c629aa91209@perex.cz>
 <87se48lv6z.wl-tiwai@suse.de>
 <8733uoys02.wl-tiwai@suse.de>
 <87ik3gs37v.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uet2Z4KSFVbfp0es"
Content-Disposition: inline
In-Reply-To: <87ik3gs37v.wl-tiwai@suse.de>
X-Cookie: Use the Force, Luke.


--uet2Z4KSFVbfp0es
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 05, 2026 at 03:10:12PM +0200, Takashi Iwai wrote:

> How about Wednesday's lunch?  Does anyone have a conflict?

Works for me.

--uet2Z4KSFVbfp0es
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrDpl0ACgkQJNaLcl1U
h9CD2Qf/QKUu5CnJTr50YEZd23kqAq4qbQgRmcdHBXMNM60B+0CqIeon+Awj4A9a
vewg5SzBJOlLgKh4AXzOgH7fex3VOm5zsINyg7l4c1M1E5FEZzx0qhuz/mrXG8dH
t1E0YhQojA+C+WtehnW6iICI9rabxxmKnjjvpQ+qow5bu2o94X4Os4IzgbiKeo8O
wCAOEIpjYJ3D08Uw4DDECmI0FUQixvZdTTtCTit8/1tUNLNgvYBFWJGea9c8xTuB
C9oOZEbucSvVRP1lhlNdXS3D7hS6aUdPUMeh2ktan3o1iW5lz7zAQrF3HbUe98ky
CWcH+j4luI2ys1kLikEPgYbNlyYJ0g==
=AeAy
-----END PGP SIGNATURE-----

--uet2Z4KSFVbfp0es--
