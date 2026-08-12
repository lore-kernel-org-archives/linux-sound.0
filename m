Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD372236FA;
	Wed, 12 Aug 2026 16:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786553468; cv=none; b=PBhX06FoLJcU8uviiW3rD025K61cGJPLqZPMhFaHuNsWHTrusQ1+kAOAa1Kk9OR6FagTdMo1fWAYz7SCjAohsS9xH2klR2kopqZUVj7UpRiW6e4NIZIWd2LjkatPtoNnOdMC0rzjOTztojJ7IG1gK+0HKN7Xr52jLHug//nMbtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786553468; c=relaxed/simple;
	bh=nR3ojYdSPg4b7MsuvJBgCbeiuiB3ulP91gPDR9T1B+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eEQ5JmqUQ1JaFsgY12v0pSiiOfShUYV1fNGfhk7ypXgjqt5pyjsl4pXbbUROPLN/Vdr928HAMg988wfPriZ7W8hkJ+poNQ7bnDEjUdvCc04Kaw2xK2MSjeFRNWH6iRwO3BPY8xLs/71rMVKWsq0PuWXuvS++aguarPePEFI+1/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=erEPONZt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="erEPONZt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ADB91F000E9;
	Wed, 12 Aug 2026 16:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786553467;
	bh=nR3ojYdSPg4b7MsuvJBgCbeiuiB3ulP91gPDR9T1B+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=erEPONZtisQIa+BkHupU2lDb30DtmnKQQuSKV5yRScXDGDqGWX8CQbB3HsIAQbN8K
	 HKjuk6Zheu0WoydJDeqPeL6RfhVUWHNb0CGutrWnVXBQDJWwjs93HnfHjC/sc0T6ol
	 ia5NZuBmebNNJP8hZxcjl/pCQP+6rqyT8kclaVGiz2Rzqe372hz2tmM+DZkK6dc3Qu
	 1L2FLRi5VJMDyKUS+g97d7t6aiSO99SP7PPXbMdBoeeD5GRxyv84rvubA+o5mf5hGp
	 tLhQd9Zo4IA/KA68aLHRGUJMnlJaasJ66IP4Wb9WNKsK2B+qlGMSC+SpMJrqf+BldN
	 1tmJG0ImWzJ2g==
Date: Wed, 12 Aug 2026 17:51:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-sound@vger.kernel.org,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Michal Simek <michal.simek@amd.com>,
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv2] ASoC: xilinx: formatter_pcm: use more devm in probe
Message-ID: <8817636e-fd2c-4482-b892-db47aa839aaa@sirena.org.uk>
References: <20260811185013.26960-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PC+YJE+FBRevnzcf"
Content-Disposition: inline
In-Reply-To: <20260811185013.26960-1-rosenp@gmail.com>
X-Cookie: Revenge is a form of nostalgia.


--PC+YJE+FBRevnzcf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 11, 2026 at 11:50:13AM -0700, Rosen Penev wrote:
> Use devm_clk_get_enabled() to let the clock be enabled automatically
> and cleaned up on unbind, dropping the manual clk_prepare_enable() and
> clk_disable_unprepare() calls in probe and remove. As a result, move the
> clk struct member into probe, which is the only place it's used.

This doesn't apply against current code, please check and resend.

--PC+YJE+FBRevnzcf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp8pHUACgkQJNaLcl1U
h9B5VAf9EWJCXVNl8MzibMG8K2UgWDBQWdPGWmdONI6B2OjkH2eO+OhfjO2j9biO
j35r1nTL4zU3wRvt/NPu9+T3Sy0tpzhdxFSSilnvF0t87hofQfdjClWWcxTGnwrF
P5dXovRb970jFZQkk2mkcjMDLUf580jUf/yXjFZc8x7epjgzPrgKQrQ8Ny5lsdiU
+SgsIZcPn5kiLkm0qyA3i4xgd3PD8aYyklcXEtTdTqwDKiOfm3elO9hN4ta81aZS
1N+pJLnU8IS0mdlfT33RhUZUmD8g0ywb7/CdjBMIeiisJbfH2/p8SbEAy40b7SxO
Ppq9r4o7UYPD6s7vkRsvjIf5Mv/udQ==
=ZZT6
-----END PGP SIGNATURE-----

--PC+YJE+FBRevnzcf--
