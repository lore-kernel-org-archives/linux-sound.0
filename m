Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239D11D130E;
	Mon, 16 Mar 2026 17:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773683126; cv=none; b=YNnoBsBP7vpREqp8c6bYCblDSOvGEklD7J9QjcgkBC9i5MCDv94e4wagR6J3DpWnMEQ513iWGbFG4VXtr3/fKrhHdMnG1TTIR6B58xDaikCUAi38Jqo8I6jlTQs4dPPR+4dOAogdvpP4oaLRViNyam9sGbl0Hzpk4yzQPFZoA2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773683126; c=relaxed/simple;
	bh=3Qr+G42F1ECv+Aokg2/Vit8bmFN7FflVegBlr1yVsiY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hSPvZmVUgvlF9F0YPovVfceY6iDrzFDvnLAIMWl4mTwjI8J0RMN+zBuloP9k4LrtneLDEn+cFD1GZjqtNA0OYfmgQM5WdcpcM4wOhV90qAlVkaG737CMqCaV10xhwk0CF1R+sTBDA3g22WjAOrcNe74BQexQRkqcJEm0YEyFfk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IVeQ2pPr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IVeQ2pPr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BF55C19421;
	Mon, 16 Mar 2026 17:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773683126;
	bh=3Qr+G42F1ECv+Aokg2/Vit8bmFN7FflVegBlr1yVsiY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IVeQ2pPr9G9krz3UbyX//PwpAHKCDLCxed/8+vyLAR1v+wQwsd1FHPWGjiGqxTLpJ
	 cIOusiRmwctRDG6g6Mnd9w0znCsQic+YCGV/baBtApL+JFLxv55N77WNaH9XbpF0Rw
	 lbvajBBrjsFSF8ZJkQQ6nBT6ZScQqwiJBEUHSTqjW+rKoAL0nA1ftaygjJw54+psXz
	 9M3kIDkJH6ZCjefOnEoZGqnRPjgqzVX5R+6sLVj3wSU43+LbvIKkGqY2fWZ9mzTqmx
	 vCWxl/kaLaJyKbu90Saw/aecmalCnUOG3MOilgaDH9ToyttgdY1VUMuOji0wq5Vyie
	 MAwr8B7sR44Sw==
Date: Mon, 16 Mar 2026 17:45:21 +0000
From: Mark Brown <broonie@kernel.org>
To: Hasun Park <hasunpark@gmail.com>
Cc: Vijendar.Mukunda@amd.com, lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	perex@perex.cz, tiwai@suse.com, venkataprasad.potturu@amd.com
Subject: Re: (subset) [PATCH 0/3] ASoC: amd: acp: PX13 ACP70 config and
 machine quirks
Message-ID: <ee5a4686-b558-4803-a4d3-87df144611d4@sirena.org.uk>
References: <177362009337.162791.6622780298534018366.b4-ty@kernel.org>
 <20260316164731.18720-1-hasunpark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="F5ihdAbjQHqW8x/O"
Content-Disposition: inline
In-Reply-To: <20260316164731.18720-1-hasunpark@gmail.com>
X-Cookie: Not a flying toy.


--F5ihdAbjQHqW8x/O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 17, 2026 at 01:47:31AM +0900, Hasun Park wrote:

> I'm not sure what should i prefer, send this v2 patch or
> since this change is just for cleaning up and doesn't cause problem at function
> so submit another patch for cleaning up.

Please send an incremental patch (or patches) on top of what's applied
that does your cleanups.

--F5ihdAbjQHqW8x/O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm4QbAACgkQJNaLcl1U
h9CqNAf/cVNsQJ74P3RbwenRvzbpYc1LqhSE++YFYVqLnQUTj4Bl6SKBluEjxUwq
dhhrPIy6ua+xOsb5plN1scGpE3NmTXvK4PLVCFK5xSm8KvF43aCeBS+VQwhGx4YG
8YcD9X291VEnnCd6c+SwP2gwUNPCZ6Sj9IM81JPu2oq4dIQtWhdVbQzbeewOxqKN
dlJkZhCp+0D7e1PbfX0xmGu6/+4rAvEp5dGdcU/FIQNiDj/p/xgqjvYVHqZdQAYb
P2znjcPScCg8ybCQEDkJ6g8reGhXYeRwH3rWICmpOyo5kiB4nw09Rzh9grqnE9Nw
UPdhEa5RaiLK4Qg2qtxw5s/QFjaD+g==
=0bO0
-----END PGP SIGNATURE-----

--F5ihdAbjQHqW8x/O--
