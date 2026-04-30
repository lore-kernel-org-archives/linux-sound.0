Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CE740243D;
	Thu, 30 Apr 2026 12:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777550706; cv=none; b=t6ExlMnAoK7SJfjTTpBG/lMG00E3zjiK2GkoWB1wfqVIFu1QScrs66orCgWqlcRVb4ykKtZqSgB2aiZ+j7J1b+aCvWsXLTfsoOVtV6qOryRQ+L4ka0gyEDj6hSm2ujG+xnP1cuvWzCBRJJnPZDAQdRujHP4p/DeLUc7hW0xhlaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777550706; c=relaxed/simple;
	bh=I0Oq0dU5jJ+UppyowHKAPu+eaXgi/MmNRyNn9m2b0no=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ia8DxFtP+8ilTpYVJ39A3GI8Jx/CB3Nuj2LtE+tRQZQoMvXG4BUAlkVB0JAjEvUITJz2Ttzopirh/IRm2UuXrFVbuUnkCbvPf9+UK8hRh20gqlnPeH0s1zP32bDBTYtSrVbO1z3q9q1M6Oa6+YEPrTS+eG2rBQlmlrAwWfNMYBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E2ts0IbG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E2ts0IbG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C906C2BCB3;
	Thu, 30 Apr 2026 12:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777550705;
	bh=I0Oq0dU5jJ+UppyowHKAPu+eaXgi/MmNRyNn9m2b0no=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E2ts0IbG7QQ49QnqZq9Cp13PZISVMFeTKl5ubX4tNjMMCLlGYLRdNtk3I0XcQYTrb
	 Q8hcQnev89dkEwBLyQSpAttSfTOU7wbnbWedxpGHtAbi9Rqd4TF4btT5OHcrxx7E5o
	 AVJr4AEbZYlAvan68XZrmkp/Ap7UQlOmzQ1mLVwzf9LovCdNKbEQNl2Ul3JPvvDG9j
	 0g6COzNIMSk8ief7P0XEiy6raqcb3y6vJcesKg7bCyPIqJbgEaFj2WjrN2GNmR25xB
	 0jDbsu0ACq2P3VNDwwWd8IUQ2xuEumnXlqyn8HCBRvnUAV7NEEegnDKy6dF0kkdOUQ
	 blKSvwJ9vFtog==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 2AC5F1AC585F; Thu, 30 Apr 2026 13:05:03 +0100 (BST)
Date: Thu, 30 Apr 2026 21:05:02 +0900
From: Mark Brown <broonie@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Yixun Lan <dlan@kernel.org>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	jinmei.wei@spacemit.com
Subject: Re: [PATCH 2/3] ASoC: soc-pcm: constrain hw_params when DAIs share
 the same BCLK
Message-ID: <afNFbsk3mg1KVOpF@sirena.co.uk>
References: <20260430-i2s-same-blk-v1-0-3a1f04eb6159@linux.spacemit.com>
 <20260430-i2s-same-blk-v1-2-3a1f04eb6159@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WlK7fYYf5jmaqu86"
Content-Disposition: inline
In-Reply-To: <20260430-i2s-same-blk-v1-2-3a1f04eb6159@linux.spacemit.com>
X-Cookie: 667:


--WlK7fYYf5jmaqu86
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 30, 2026 at 03:46:02PM +0800, Troy Mitchell wrote:

> +	/* Scan all DAIs on the card for an active peer sharing the same BCLK */
> +	for_each_card_rtds(card, rtd) {
> +		for_each_rtd_cpu_dais(rtd, i, other_dai) {

We need card->mutex here.

--WlK7fYYf5jmaqu86
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnzRW4ACgkQJNaLcl1U
h9CK5gf9Gj5JC8A8JSaCvNquVF+8OacEiVe5EC5OzF6wRRqZr4PgCv7ZnzJ6tLbn
tjvfrAGLZgckx8Jw9ymX+VZGlhU1mtQ1a1UsoOq7UjgTxrx+1LmGeuDkQgWph2WS
VycRRJbyVdenywyuyvHjXZK8Cy3QWRX4SM1ZFj7hKenPTFDxw7bw/U7ihAV8SnHq
KNRnE9fts7PcBxUjQ5VS3meIEyECxhUsxUSJyVxjr3fzuRtN3tPnJOMoAEUSWbH9
WN6TcFSL3nxYw0HP0L7MAhFDuvo9EpWRGWqmLnsgBFSKYn7UhKV52GCp77y2Ihb+
B9SHhsPaRiwHgzL9aDT2TORyBxVU/A==
=a6r/
-----END PGP SIGNATURE-----

--WlK7fYYf5jmaqu86--
