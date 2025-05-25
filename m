Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A011A0711
	for <linux-sound@vger.kernel.org>; Sun, 25 May 2025 11:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748173523; cv=none; b=N+dfi2fBhrCBcboD188Y86ZA8dnksm1/CyC+RlprQk3m1hMgoZ22DoGt2VvCGZidymPpXhZT/xYVion1G9YuqrKc6sb+1BMbZi3qOR+yonuZi2UDdHOQ0ZCHvYBOwu7JuuG6UB8hFkbbZccAiT2zt23NKGevNCsC6U4oylN2zbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748173523; c=relaxed/simple;
	bh=SY0ftbZFIobDoHJn8g3WdAz8girb0mDRFyHZJZYNNa8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rb57bv50cpDu/ABNR4LNjLkCxqoVIAW7QGOCymBnnV9zZA37wUM/lVaw0By3gmH/B21xURvbMNOvshW9Iyx1o5nDePEVTsAkLABuNTsN0KGgMFs5Fp2CMNj2aScxRjlImWlTLofTfuHFb0chVERQxho1q+1Be0kjEr3nYfyNVC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WSQBkozX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WSQBkozX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2902AC4CEEA;
	Sun, 25 May 2025 11:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748173522;
	bh=SY0ftbZFIobDoHJn8g3WdAz8girb0mDRFyHZJZYNNa8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WSQBkozXBmx4OUlP27Xdi4oLqFntruZzztD/S/q35AKi+1BSZ3EMa0nPrSHTmsAxk
	 oF/O5VFaT5kpF/NStUDpXOShmcp7GrvzidNJzTUREzdylwMl4jL06DeFqbWD7fo8Ih
	 jRdCeoTPhyODL5DBnI/zZLu4u30FJBgvomTdqWlLpnNMm/CzM+d9mspmzTcB25wVYu
	 G8d6UJjCo5iZUuQOHvqclCpLHC02VH2VcsL+LS62OEcscpv0bCGQXTrm6PxGaPzIoY
	 E0dYcHEldiflxKyEYcxN+e/ouPGaaZYqqHXlJtDlY1fKKXn3tumdVh0IBVWL3t+12j
	 P3zre/dak0wfA==
Date: Sun, 25 May 2025 12:45:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.15-rc7
Message-ID: <aDMCzg09v7yCE_uo@finisterre.sirena.org.uk>
References: <c5f1dacf2885ff4eb1c04fa0faadd0b9.broonie@kernel.org>
 <874ix9rva3.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QGQA6oF+gPs2XJMM"
Content-Disposition: inline
In-Reply-To: <874ix9rva3.wl-tiwai@suse.de>
X-Cookie: Well begun is half done.


--QGQA6oF+gPs2XJMM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, May 25, 2025 at 09:42:28AM +0200, Takashi Iwai wrote:
> Mark Brown wrote:

> > A couple more small fixes for v6.15, both of which could also easily
> > wait until the merge window.

> This was already pulled.

Yes, sorry - my tooling doesn't deal well with me moving between
computers with pending pulls that didn't land in Linus' tree yet it
turns out.

--QGQA6oF+gPs2XJMM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgzAs0ACgkQJNaLcl1U
h9ACjAf/VKsYGGmhBuUsX/u4haU0Ji6iCWqi4CEK3thu4Qtswpz6S8F5Y6pP/Cnu
oZZNQQAi7nJ2jH2PhyEp19IGfDeN3ofng3U0EI0KnckOSRrvamLeJFaHpCDYXKhL
XHTGItOEw9tPOF0lPLfp9ZcA5cC1RKB0BXCt+RaKWa2p4kC19I6nqCYrW5nFsAo9
OAHtnnM8dzk0Q5zkI6wIwmBVloSkwwf3HLKt/0xZMzFUqL56NJtj+ZWJ0h1C1Lg3
Y3uf2iWihXLuRIf40Wk4bXkc7qnp0gQqOvsfaqV7SL4KVrYqRXkLRBAjAooobIbr
4VPgjCLJjIFf/xTStz0xXQb9JGamTA==
=xevk
-----END PGP SIGNATURE-----

--QGQA6oF+gPs2XJMM--
