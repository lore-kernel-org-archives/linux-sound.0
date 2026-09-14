Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E12D472F9A
	for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 13:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789393059; cv=none; b=FUY5l/Q49x06Ac515RdAWQzPTeuTYWdvSaJPUF+SsnvjWPROy3xgy5YKUM3L4V+oTqHfoV3LwXZBqrbxfEB+pXsnFT2Qdr0D5zXWKfhSwFPGkt5ZOlB5iQ6KSEz4BzSeqvy6LgCpAlIb5BE6Q2l73GhpOeZL3ahn/ER9gKqm21E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789393059; c=relaxed/simple;
	bh=X/66vaaZ74peNi5iE2CRw0iwveJRlHGYiNfrwfd94GQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tTaYbR2NQo8VHv0Sh+EPEdz6Sf1y6bQ/rX06RlguoUYCpNpTfvD6ULHWqL7uXHlgcRgtLQYI6UNINCljBPkzqvTbwkSSI1aZVScYQHuudZophi/EsOfzrVpc4EFf+1dh8Csy85TeMTW/EgjsGoqQ7xrOgw9AbraDslKksRmLh9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nBlpTCRx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nBlpTCRx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C309A1F00893;
	Mon, 14 Sep 2026 13:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789393057;
	bh=mGiuCnXaf83qk/9DZvNw4tfwfuzi3NA+LPb+nXw7Rx8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nBlpTCRxBZ4M0FbYQr8YvJjc2t4h4WaLUg0ypRytG8DuctxCKIqYu34VWoJMO3v6s
	 b5r/26A2AtTRGs5yKXfCIraKsz8EFJSKrHFlgj9zKhuMWUaqShM3uLpZLDJByk5FIN
	 3t+djDCTlS5tA1Pu4X7TK4Flh9MYOuc8yJIrMrrjHks7rk9SLzQcQxB8c4kQmerFc7
	 lkyU6WGKtzymZDwaxNXC2gxzp1xKYIPhpMHiryRjxhjer6uAOrcry3GEj+pCSOUcBF
	 hceAt8jLFH2nmB6TovsmZhOA93vHZrfqrdxYVeQlJHS0JVHU9PEXbX52cCsS6byzD0
	 UX5Ck43X0BL+g==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 598C11AC52F1; Mon, 14 Sep 2026 14:37:35 +0100 (BST)
Date: Mon, 14 Sep 2026 14:37:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH 00/10] ASoC: add new DAI functions
Message-ID: <aqf4n4Fcl_4Fe-x3@sirena.co.uk>
References: <87qziwliaj.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cUScAemSGBZpzMtn"
Content-Disposition: inline
In-Reply-To: <87qziwliaj.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: My vaseline is RUNNING...


--cUScAemSGBZpzMtn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 14, 2026 at 01:43:01AM +0000, Kuninori Morimoto wrote:

> This patch-set adds new DAI functions to get dai->xxx, because each
> driver will not be access to them directly when capsuling has done.
> This patch-set just adds new functions, but no user for now.
> All user will use them at (A) timing.

There are a couple of users updated:

>  sound/soc/mediatek/mt8188/mt8188-dai-pcm.c  |  5 +-
>  sound/soc/mediatek/mt8195/mt8195-dai-pcm.c  |  5 +-
>  sound/soc/mediatek/mt8365/mt8365-dai-dmic.c | 10 ++-
>  sound/soc/mediatek/mt8365/mt8365-dai-pcm.c  |  4 +-
>  sound/soc/sdca/sdca_asoc.c                  |  4 +-

--cUScAemSGBZpzMtn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqn+J4ACgkQJNaLcl1U
h9AlBQf+LNSxg9JwdRSFgz1EPmmu59wxVY5qHJVer9UXOMwuwPdA2/yYFXuEuCQg
eiC83CYI5t7JRT1XteLVisEZbE/kJAgMSrF6THU0Sn+89JYrvTfDVjgwOHGBGCqb
OHxEuOmHs0quHbVKg+BnlJcCMq0EFqvnwICEvVYOf9uoHGG8h4sVyHo8SFdUm1Vv
XWr2q5PY4QKK0Z8c6V/Mx1+G2j2fCCl+d98rsKTuycMxqzEqtPi1C9dXaYaEk9Nn
+7WVy9/511VIUlI7JCp7kz4wTGpppTjST5qhNgeWBmtgadfahak3cn11yyM+G1lg
8KVGwvGRrepP6l+FJ5LAbz/WXK2Sjw==
=ddvV
-----END PGP SIGNATURE-----

--cUScAemSGBZpzMtn--
