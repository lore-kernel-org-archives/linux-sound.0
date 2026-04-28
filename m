Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855BC32695F;
	Tue, 28 Apr 2026 03:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777348714; cv=none; b=MBLtNOqxYxMwu2VIR+dNoX0IkzDq7L9aFCt1pFHNtdqrY/mAWR6lv4Kqd5I0dZo3bVOpd1pw2W8DUXxl162IU+aPHiOhfvIAIKE24BQz6ZCA1ozkYUclzNs9xvMXJySqGEvhfkfetGMJSbVmCHBovAY1W2XXRr+a3kTXlHg8+Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777348714; c=relaxed/simple;
	bh=WSQNKpKPUfsopcajlmy6X2JZTFiiYvMWYuPsQ2w0Th8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uYungEQZ3ETlsCavO4VqoX8nKMqmITCI8lCExvmfZVAhNIZHhfa6B2GuIg6hQv7JFZNWdwwyGoPQriQKoNNsmYiOMxhBlccXAmGeIP7/ue9hiDguMDXzzGRdfGKI13fJw0/IR1y0pw1Lyh+bH8OWvqPH3YGkIqy8cK4HF7X8WOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r3ku9uFC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r3ku9uFC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0090CC2BCAF;
	Tue, 28 Apr 2026 03:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777348714;
	bh=WSQNKpKPUfsopcajlmy6X2JZTFiiYvMWYuPsQ2w0Th8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r3ku9uFCyp8Qh9KWkPcZiLB6mR9sNYFY9RsglIuxwVPillleufBvz0jiu/itTPuyB
	 0b5BhfhdtTDBTLrfqTDwXFnbqS/jVsuF+py4Ohg/5k3sfFahylRJ2D9fy9HnbmfPcS
	 nVXqbP0nPpG3kK64SJd0qI4HMDC3P2vc3fnWFlLWnKWEe9Pn/8Z+7IXja0QZW0LZhK
	 ujkl5tWHzA2KRPXc80rgSNMXQXxx08gWN+CTQdAck9iYLsam1dfrrLqnX6wfzlv5Rb
	 unHFwzsHzCHvFXfDO6E/Jb6X4veoMZWOxYMGQAfBWWN5my0jowmGwIEhwuDHueZNzz
	 qzcmb8rX/OZYA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 57FD21AC5840; Tue, 28 Apr 2026 04:58:31 +0100 (BST)
Date: Tue, 28 Apr 2026 12:58:31 +0900
From: Mark Brown <broonie@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-sound@vger.kernel.org, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ASoC: ti: j721e-evm: allocate dai_links with priv
Message-ID: <afAwZ7vl9bRtmLsa@sirena.co.uk>
References: <20260427051953.956372-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0sP8pHpvFPwMdoFd"
Content-Disposition: inline
In-Reply-To: <20260427051953.956372-1-rosenp@gmail.com>
X-Cookie: Victory uber allies!


--0sP8pHpvFPwMdoFd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Apr 26, 2026 at 10:19:53PM -0700, Rosen Penev wrote:

> Remove open coding of of_device_get_match_data as well as unnecessary
> NULL checks. of_device_get_match_data cannot fail. All compatible
> entries have a corresponding data section.

of_device_get_match_data() can fail if there is no match data, for
example because someone is using sysfs to try to instantiate rather than
instantiating from device tree.  There is no reason to take out the
error handling here, it just makes things less robust.

--0sP8pHpvFPwMdoFd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnwMGYACgkQJNaLcl1U
h9CxNQf/RYR+wmtsCFI3e/xgwfqFt/FMG7tApuA2D9jUfoA/oJor9ReVAgZBcIbd
gf4lidxebacuyXCc1k6akk2VTbXUhR662q/91Zu4/AuSpgym88wfflg1HC+rv76U
gUPJiLQwZcCRsFF47X6Vl6W7QKQr2K+9JLOlXCM+u2wLrtut0FX9fAARowRIK+mf
9qAWeyM8T6m5ZtLR5igeIhqO0EoOzrVaHT8FttFPSM8iP+Liu+mHM9J/6+8caXo0
0DUaO47a6XeztSxRNH5MCeG00tP6A6mu0yB9F36Ozl+cXNv2nbWNFcMxx7R2Wc8j
f1VBJgNLGRNjkMJ/r6a8mwrMSDvnBQ==
=a+nf
-----END PGP SIGNATURE-----

--0sP8pHpvFPwMdoFd--
