Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C033F54C9;
	Wed, 17 Jun 2026 13:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781702529; cv=none; b=rkhImfuE1fnjxshJiluX2xiAMOQcuwAPonocnEh68F2nZs+gJGnsPTTEvSGQqEw9odQLCr5frEA0T5Rp0g5szgcdiandIbjlcbxl0zQUOuyxmdeMflBNcox6zM5Gp3AE74DrGyxyl1XJthN/pUmPyZxG6AH3dpM4z9LRhwlWdi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781702529; c=relaxed/simple;
	bh=XcHn+OqjLeBAX8IEau6ZDZhceXfurepXWjvJLi5A47U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DPUO3Y76OlIe38XyLjpx+8pY4jjhXiMMUJCTwdYOe5OvnJxrtvBec4hMHoMNX+39WwtXSTh1sZJ4pJo9PXTi/FLjhYMxmmKzPGFmky/6cziakBPgbxz0rrf7IukXJMTgAUEcOE6I0yyeRftNCm0aMrErv1S7BlpOQRDCGCp9T1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LS08RM8p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LS08RM8p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A86941F00A3A;
	Wed, 17 Jun 2026 13:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781702527;
	bh=XcHn+OqjLeBAX8IEau6ZDZhceXfurepXWjvJLi5A47U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LS08RM8pAhzITsYqZkoulcLPChoDgGjX48NVOyVTZKbOM+/5nELQYBIkhimKfCHE6
	 AARTUDjcNzaXKYdvu3tqG4M+e4r9wfYbi+ROyqrME6zJzyOUHEGS9sF4WC2jAc9+v3
	 SeXNHMn2zwmBMx5ZqShOmh8GH3bu30pS1dMdIDt+ftvpkFd8El4Ucf0beRuQqUDb9e
	 quA+69q2SponemBzUDeuz8NV+HVLdusTpqO6E/YCzy24lSKv3kfrfdce+JKEBeQQSM
	 7UAiamNEuCbGeLN3ErZIWXCUv4LuSDJ4yYU49tWyBVLLoujHHVUen0uX/eoendfaOm
	 tgXpR9ggwZxyw==
Date: Wed, 17 Jun 2026 14:22:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Heiko Stuebner <heiko@sntech.de>,
	bui duc phuc <phucduc.bui@gmail.com>,
	linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH] Revert "ASoC: rockchip: rockchip_sai: Use guard() for
 spin locks"
Message-ID: <f9babde8-4012-4fc4-a553-101fa94ad50b@sirena.org.uk>
References: <20260617-sai-revert-v1-1-e46adda2213b@collabora.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ESdZ8J34ZAzYqCiE"
Content-Disposition: inline
In-Reply-To: <20260617-sai-revert-v1-1-e46adda2213b@collabora.com>
X-Cookie: Absence makes the heart go wander.


--ESdZ8J34ZAzYqCiE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 17, 2026 at 01:46:04PM +0200, Nicolas Frattaroli wrote:
> This reverts commit f7fe9f7073602958d6b63cc58a144094533377fa.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

Please include human readable descriptions of things like commits and
issues being discussed in e-mail in your mails, this makes them much
easier for humans to read especially when they have no internet access.
I do frequently catch up on my mail on flights or while otherwise
travelling so this is even more pressing for me than just being about
making things a bit easier to read.

--ESdZ8J34ZAzYqCiE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoyn3oACgkQJNaLcl1U
h9CBjAgAhKORSNAME5t9lOsbE4Y5E6rTqR7dHYVslJY3f4/5X3t8jzzbRa16RPo3
CL0S9U+e3BUYT1LJ2YSoVDzwfsUmGyCE3QAU2pMqhitpJkcs8OxZOa/v4e/I88xM
8YxLphLW1o/W3Xnk5cPFOceqkB7YBfq+OzzauJNjbZJkv2k5n98/no72MN1tLBh0
ngDse4ZfUvICI9EzWQFyZ24EW2lVT6kzDIunp7iDZJBoa4IDtWhFAUG+drZLBYZ7
LdRsdbbEeRqY/CrDSxAU1Xg0HZSa3nQKQ8IR7PRyKOE7qepPRscZ2BNncrInSdHX
2a08NtpGTUfT+kMtxhQkoGRvQoOotQ==
=RJhn
-----END PGP SIGNATURE-----

--ESdZ8J34ZAzYqCiE--
